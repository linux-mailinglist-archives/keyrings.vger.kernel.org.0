Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA29E8B32
	for <lists+keyrings@lfdr.de>; Tue, 29 Oct 2019 15:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389398AbfJ2OvP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Oct 2019 10:51:15 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:32768 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfJ2OvP (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 29 Oct 2019 10:51:15 -0400
X-Greylist: delayed 976 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Oct 2019 10:51:14 EDT
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92.3)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1iPSaG-0005VB-Oo; Tue, 29 Oct 2019 15:34:56 +0100
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org
Subject: [PATCH] keyctl: try to wipe keys from memory after use
Date:   Tue, 29 Oct 2019 15:34:51 +0100
Message-Id: <20191029143451.327761-1-mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The key being added or updated likely contains secrets so it would be best
not to leave it in memory or in a core dump when no longer needed.

Glibc 2.25+ provides the explicit_bzero() function that can be used for
this purpose, let's utilize it if it is present.

Tested by redefining exit(n) to abort() and inspecting the resulting core
file for key data.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 keyctl.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/keyctl.c b/keyctl.c
index 769e5eebd9b8..b17ceb4a1099 100644
--- a/keyctl.c
+++ b/keyctl.c
@@ -26,6 +26,15 @@
 #include <limits.h>
 #include "keyctl.h"
 
+static void try_wipe_memory(void *s, size_t n)
+{
+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+#if __GLIBC_PREREQ(2,25)
+	explicit_bzero(s, n);
+#endif
+#endif
+}
+
 static nr void act_keyctl___version(int argc, char *argv[]);
 static nr void act_keyctl_id(int argc, char *argv[]);
 static nr void act_keyctl_show(int argc, char *argv[]);
@@ -302,8 +311,10 @@ void hex2bin(void **_data, size_t *_datalen, bool as_hex)
 		return;
 
 	q = buf = malloc(*_datalen / 2 + 2);
-	if (!buf)
+	if (!buf) {
+		try_wipe_memory(*_data, *_datalen);
 		error("malloc");
+	}
 
 	p = *_data;
 	end = p + *_datalen;
@@ -315,11 +326,11 @@ void hex2bin(void **_data, size_t *_datalen, bool as_hex)
 		}
 		if (end - p < 2) {
 			fprintf(stderr, "Short hex doublet\n");
-			exit(1);
+			goto ret_exit;
 		}
 		if (!isxdigit(p[0]) || !isxdigit(p[1])) {
 			fprintf(stderr, "Bad hex doublet\n");
-			exit(1);
+			goto ret_exit;
 		}
 
 		h = isdigit(p[0]) ? p[0] - '0' : tolower(p[0]) - 'a' + 0xa;
@@ -328,9 +339,17 @@ void hex2bin(void **_data, size_t *_datalen, bool as_hex)
 		*q++ = (h << 4) | l;
 	}
 
+	try_wipe_memory(*_data, *_datalen);
+
 	*q = 0;
 	*_data = buf;
 	*_datalen = q - buf;
+	return;
+
+ret_exit:
+	try_wipe_memory(*_data, *_datalen);
+	try_wipe_memory(buf, q - buf);
+	exit(1);
 }
 
 /*
@@ -484,6 +503,7 @@ static void act_keyctl_add(int argc, char *argv[])
 	dest = get_key_id(argv[4]);
 
 	ret = add_key(argv[1], argv[2], data, datalen, dest);
+	try_wipe_memory(data, datalen);
 	if (ret < 0)
 		error("add_key");
 
@@ -520,6 +540,7 @@ static void act_keyctl_padd(int argc, char *argv[])
 	dest = get_key_id(argv[3]);
 
 	ret = add_key(argv[1], argv[2], data, datalen, dest);
+	try_wipe_memory(data, datalen);
 	if (ret < 0)
 		error("add_key");
 
@@ -615,6 +636,7 @@ static void act_keyctl_update(int argc, char *argv[])
 	size_t datalen;
 	void *data;
 	bool as_hex = false;
+	int ret;
 
 	if (argc > 1 && strcmp(argv[1], "-x") == 0) {
 		as_hex = true;
@@ -631,7 +653,9 @@ static void act_keyctl_update(int argc, char *argv[])
 
 	key = get_key_id(argv[1]);
 
-	if (keyctl_update(key, data, datalen) < 0)
+	ret = keyctl_update(key, data, datalen);
+	try_wipe_memory(data, datalen);
+	if (ret < 0)
 		error("keyctl_update");
 
 	exit(0);
@@ -648,6 +672,7 @@ static void act_keyctl_pupdate(int argc, char *argv[])
 	size_t datalen;
 	void *data;
 	bool as_hex = false;
+	int ret;
 
 	if (argc > 1 && strcmp(argv[1], "-x") == 0) {
 		as_hex = true;
@@ -662,7 +687,9 @@ static void act_keyctl_pupdate(int argc, char *argv[])
 	data = grab_stdin(&datalen);
 	hex2bin(&data, &datalen, as_hex);
 
-	if (keyctl_update(key, data, datalen) < 0)
+	ret = keyctl_update(key, data, datalen);
+	try_wipe_memory(data, datalen);
+	if (ret < 0)
 		error("keyctl_update");
 
 	exit(0);
@@ -1311,6 +1338,7 @@ static void act_keyctl_instantiate(int argc, char *argv[])
 	size_t datalen;
 	void *data;
 	bool as_hex = false;
+	int ret;
 
 	if (argc > 1 && strcmp(argv[1], "-x") == 0) {
 		as_hex = true;
@@ -1327,7 +1355,9 @@ static void act_keyctl_instantiate(int argc, char *argv[])
 	datalen = strlen(argv[2]);
 	hex2bin(&data, &datalen, as_hex);
 
-	if (keyctl_instantiate(key, data, datalen, dest) < 0)
+	ret = keyctl_instantiate(key, data, datalen, dest);
+	try_wipe_memory(data, datalen);
+	if (ret < 0)
 		error("keyctl_instantiate");
 
 	exit(0);
@@ -1344,6 +1374,7 @@ static void act_keyctl_pinstantiate(int argc, char *argv[])
 	size_t datalen;
 	void *data;
 	bool as_hex = false;
+	int ret;
 
 	if (argc > 1 && strcmp(argv[1], "-x") == 0) {
 		as_hex = true;
@@ -1359,7 +1390,9 @@ static void act_keyctl_pinstantiate(int argc, char *argv[])
 	data = grab_stdin(&datalen);
 	hex2bin(&data, &datalen, as_hex);
 
-	if (keyctl_instantiate(key, data, datalen, dest) < 0)
+	ret = keyctl_instantiate(key, data, datalen, dest);
+	try_wipe_memory(data, datalen);
+	if (ret < 0)
 		error("keyctl_instantiate");
 
 	exit(0);
@@ -1931,6 +1964,7 @@ static void act_keyctl_dh_compute_kdf_oi(int argc, char *argv[])
 
 	ret = keyctl_dh_compute_kdf(private, prime, base, argv[5], oi,  oilen,
 				    buffer, buflen);
+	try_wipe_memory(oi, oilen);
 	if (ret < 0)
 		error("keyctl_dh_compute_kdf");
 
