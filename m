Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1D32584B
	for <lists+keyrings@lfdr.de>; Thu, 25 Feb 2021 22:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbhBYVCh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Feb 2021 16:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54882 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234637AbhBYVA3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Feb 2021 16:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614286734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WA+D7oNNozPvj5BJ1jFe8Y27rzgot3tkvbP9tK3Mmds=;
        b=YXSKI5TZV7866tQrFRPFmFR6etthJ83F0uoXcKXVgy/AYNcKP5/eoVXWxuesmwkvMdBWf7
        cHmE2mdYTz/aPyiXRWbRrGBXPvFrdfROhLi1lFR90RpD2G/FdkR/ptcZGSS8GR5hrfzlvs
        kxWodBsyf3yM7LfobWQ1mWmhOwS0pcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-9G7ibTusPSCzes01q26GAQ-1; Thu, 25 Feb 2021 15:58:52 -0500
X-MC-Unique: 9G7ibTusPSCzes01q26GAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D0608799EB;
        Thu, 25 Feb 2021 20:58:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 007AF1980D;
        Thu, 25 Feb 2021 20:58:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/4] certs: Move load_system_certificate_list to a common
 function
From:   David Howells <dhowells@redhat.com>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 25 Feb 2021 20:58:48 +0000
Message-ID: <161428672825.677100.7545516389752262918.stgit@warthog.procyon.org.uk>
In-Reply-To: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
References: <161428671215.677100.6372209948022011988.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Snowberg <eric.snowberg@oracle.com>

Move functionality within load_system_certificate_list to a common
function, so it can be reused in the future.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/20200930201508.35113-2-eric.snowberg@oracle.com/
Link: https://lore.kernel.org/r/20210122181054.32635-3-eric.snowberg@oracle.com/ # v5
---

 certs/Makefile         |    2 +-
 certs/common.c         |   56 ++++++++++++++++++++++++++++++++++++++++++++++++
 certs/common.h         |    9 ++++++++
 certs/system_keyring.c |   49 +++---------------------------------------
 4 files changed, 69 insertions(+), 47 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h

diff --git a/certs/Makefile b/certs/Makefile
index f4c25b67aad9..f4b90bad8690 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the linux kernel signature checking certificates.
 #
 
-obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o
+obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o
 ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
diff --git a/certs/common.c b/certs/common.c
new file mode 100644
index 000000000000..83800f51a1a1
--- /dev/null
+++ b/certs/common.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/kernel.h>
+#include <linux/key.h>
+
+int load_certificate_list(const u8 cert_list[],
+			  const unsigned long list_size,
+			  const struct key *keyring)
+{
+	key_ref_t key;
+	const u8 *p, *end;
+	size_t plen;
+
+	p = cert_list;
+	end = p + list_size;
+	while (p < end) {
+		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
+		 * than 256 bytes in size.
+		 */
+		if (end - p < 4)
+			goto dodgy_cert;
+		if (p[0] != 0x30 &&
+		    p[1] != 0x82)
+			goto dodgy_cert;
+		plen = (p[2] << 8) | p[3];
+		plen += 4;
+		if (plen > end - p)
+			goto dodgy_cert;
+
+		key = key_create_or_update(make_key_ref(keyring, 1),
+					   "asymmetric",
+					   NULL,
+					   p,
+					   plen,
+					   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
+					   KEY_USR_VIEW | KEY_USR_READ),
+					   KEY_ALLOC_NOT_IN_QUOTA |
+					   KEY_ALLOC_BUILT_IN |
+					   KEY_ALLOC_BYPASS_RESTRICTION);
+		if (IS_ERR(key)) {
+			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
+			       PTR_ERR(key));
+		} else {
+			pr_notice("Loaded X.509 cert '%s'\n",
+				  key_ref_to_ptr(key)->description);
+			key_ref_put(key);
+		}
+		p += plen;
+	}
+
+	return 0;
+
+dodgy_cert:
+	pr_err("Problem parsing in-kernel X.509 certificate list\n");
+	return 0;
+}
diff --git a/certs/common.h b/certs/common.h
new file mode 100644
index 000000000000..abdb5795936b
--- /dev/null
+++ b/certs/common.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _CERT_COMMON_H
+#define _CERT_COMMON_H
+
+int load_certificate_list(const u8 cert_list[], const unsigned long list_size,
+			  const struct key *keyring);
+
+#endif
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index ed98754d5795..0c9a4795e847 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -16,6 +16,7 @@
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
 #include <crypto/pkcs7.h>
+#include "common.h"
 
 static struct key *builtin_trusted_keys;
 #ifdef CONFIG_SECONDARY_TRUSTED_KEYRING
@@ -137,54 +138,10 @@ device_initcall(system_trusted_keyring_init);
  */
 static __init int load_system_certificate_list(void)
 {
-	key_ref_t key;
-	const u8 *p, *end;
-	size_t plen;
-
 	pr_notice("Loading compiled-in X.509 certificates\n");
 
-	p = system_certificate_list;
-	end = p + system_certificate_list_size;
-	while (p < end) {
-		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
-		 * than 256 bytes in size.
-		 */
-		if (end - p < 4)
-			goto dodgy_cert;
-		if (p[0] != 0x30 &&
-		    p[1] != 0x82)
-			goto dodgy_cert;
-		plen = (p[2] << 8) | p[3];
-		plen += 4;
-		if (plen > end - p)
-			goto dodgy_cert;
-
-		key = key_create_or_update(make_key_ref(builtin_trusted_keys, 1),
-					   "asymmetric",
-					   NULL,
-					   p,
-					   plen,
-					   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
-					   KEY_USR_VIEW | KEY_USR_READ),
-					   KEY_ALLOC_NOT_IN_QUOTA |
-					   KEY_ALLOC_BUILT_IN |
-					   KEY_ALLOC_BYPASS_RESTRICTION);
-		if (IS_ERR(key)) {
-			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
-			       PTR_ERR(key));
-		} else {
-			pr_notice("Loaded X.509 cert '%s'\n",
-				  key_ref_to_ptr(key)->description);
-			key_ref_put(key);
-		}
-		p += plen;
-	}
-
-	return 0;
-
-dodgy_cert:
-	pr_err("Problem parsing in-kernel X.509 certificate list\n");
-	return 0;
+	return load_certificate_list(system_certificate_list, system_certificate_list_size,
+				     builtin_trusted_keys);
 }
 late_initcall(load_system_certificate_list);
 


