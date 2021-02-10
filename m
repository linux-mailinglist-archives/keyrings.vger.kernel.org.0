Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5223316047
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 08:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhBJHrC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Feb 2021 02:47:02 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:60130 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232955AbhBJHqi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Feb 2021 02:46:38 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=songyang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UOLx6x._1612943154;
Received: from localhost(mailfrom:songyang@linux.alibaba.com fp:SMTPD_---0UOLx6x._1612943154)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 10 Feb 2021 15:45:54 +0800
From:   Yang Song <songyang@linux.alibaba.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     zhang.jia@linux.alibaba.com, tianjia.zhang@linux.alibaba.com,
        songyang@linux.alibaba.com
Subject: [PATCH] sign-file: add openssl engine support
Date:   Wed, 10 Feb 2021 15:45:54 +0800
Message-Id: <20210210074554.81100-1-songyang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Use a customized signature service supported by openssl engine
to sign the kernel module.
Add command line parameters that support engine for sign-file
to use the customized openssl engine service to sign kernel modules.

Signed-off-by: Yang Song <songyang@linux.alibaba.com>
---
 scripts/sign-file.c | 65 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..276068e9b595 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -70,7 +70,7 @@ static __attribute__((noreturn))
 void format(void)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+		"Usage: scripts/sign-file [-edp] [<openssl engine>] <hash algo> <key> <x509> <module> [<dest>]\n");
 	fprintf(stderr,
 		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
 	exit(2);
@@ -206,12 +206,54 @@ static X509 *read_x509(const char *x509_name)
 	return x509;
 }
 
+/* Try to load an engine in a shareable library */
+static ENGINE *try_load_engine(const char *engine)
+{
+	ENGINE *e = ENGINE_by_id("dynamic");
+	if (e) {
+		if (!ENGINE_ctrl_cmd_string(e, "SO_PATH", engine, 0)
+			|| !ENGINE_ctrl_cmd_string(e, "LOAD", NULL, 0)) {
+			ENGINE_free(e);
+			e = NULL;
+		}
+	}
+	return e;
+}
+
+static ENGINE *setup_engine(const char *engine)
+{
+	ENGINE *e = NULL;
+
+	if (engine) {
+		e = ENGINE_by_id(engine);
+		if (e == NULL) {
+			e = try_load_engine(engine);
+			if (e == NULL) {
+				ERR(1, "invalid engine \"%s\"\n", engine);
+				return NULL;
+			}
+		}
+
+		if (!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
+			ERR(1, "can't use that engine\n");
+			ENGINE_free(e);
+			return NULL;
+		}
+
+		fprintf(stdout,  "engine \"%s\" set.\n", ENGINE_get_id(e));
+	}
+
+	return e;
+}
+
 int main(int argc, char **argv)
 {
 	struct module_signature sig_info = { .id_type = PKEY_ID_PKCS7 };
+	char *ossl_engine = NULL;
 	char *hash_algo = NULL;
 	char *private_key_name = NULL, *raw_sig_name = NULL;
 	char *x509_name, *module_name, *dest_name;
+	bool use_engine = false;
 	bool save_sig = false, replace_orig;
 	bool sign_only = false;
 	bool raw_sig = false;
@@ -242,8 +284,9 @@ int main(int argc, char **argv)
 #endif
 
 	do {
-		opt = getopt(argc, argv, "sdpk");
+		opt = getopt(argc, argv, "sedpk");
 		switch (opt) {
+		case 'e': use_engine = true; break;
 		case 's': raw_sig = true; break;
 		case 'p': save_sig = true; break;
 		case 'd': sign_only = true; save_sig = true; break;
@@ -257,13 +300,18 @@ int main(int argc, char **argv)
 
 	argc -= optind;
 	argv += optind;
-	if (argc < 4 || argc > 5)
+	if (argc < 4 || argc > 6)
 		format();
 
 	if (raw_sig) {
 		raw_sig_name = argv[0];
 		hash_algo = argv[1];
 	} else {
+		if (use_engine) {
+			ossl_engine = argv[0];
+			argc--;
+			argv++;
+		}
 		hash_algo = argv[0];
 		private_key_name = argv[1];
 	}
@@ -291,6 +339,17 @@ int main(int argc, char **argv)
 	ERR(!bm, "%s", module_name);
 
 	if (!raw_sig) {
+		if (use_engine) {
+			if (ossl_engine == NULL) {
+				fprintf(stderr, "Input openssl engine is null\n");
+				exit(1);
+			}
+
+			// Engine setup
+			ENGINE_load_builtin_engines();
+			setup_engine(ossl_engine);
+		}
+
 		/* Read the private key and the X.509 cert the PKCS#7 message
 		 * will point to.
 		 */
-- 
2.19.1.3.ge56e4f7

