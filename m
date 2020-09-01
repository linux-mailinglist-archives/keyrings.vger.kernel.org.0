Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E88259AAA
	for <lists+keyrings@lfdr.de>; Tue,  1 Sep 2020 18:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731773AbgIAQwb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Sep 2020 12:52:31 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46642 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730101AbgIAQw2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Sep 2020 12:52:28 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 081GnlJc130927;
        Tue, 1 Sep 2020 16:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=7ImOCtuv9amf35LQt91qM2sCyLRaBVRabZfd2OBAOA4=;
 b=cFY7bYQx1B1U6JCthfC3F3KeaWeR9qh4FypjRJG3sRqBOCs2QQEy/YPT/FtzRuF9/u88
 ApQYQUsxfCjYNDyKvARmTOgqm5cIFwcOXwgeVllVVGDrVKiYEHntRY1RVjPtGgNr63FR
 T+P+fKozETQT4o7gDDSxU39GHzDxy+sYKsTuV+1TPCOgfESJ4VPGYkxzSCe/4u8HaMxQ
 5LoHnLx/OjqAo5+dfb8nzhPxDNaMqvXoCu487EaxlGmcJhJ4jaWYxJb3yGnxrU02q2v7
 K4o9TWGItMsI6PkINV/Ldp+P0D2+5C9vCF39rLVnPSVEnf3TLIuRswtq8StjUuDd/7Np Qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 339dmmv467-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Sep 2020 16:51:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 081Gngnv186705;
        Tue, 1 Sep 2020 16:51:57 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3380xwsk3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Sep 2020 16:51:57 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 081GprF5017755;
        Tue, 1 Sep 2020 16:51:55 GMT
Received: from localhost.us.oracle.com (/10.147.27.2)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Sep 2020 09:51:52 -0700
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     jarkko.sakkinen@linux.intel.com, jmorris@namei.org,
        serge@hallyn.com, zohar@linux.ibm.com, erichte@linux.ibm.com,
        nayna@linux.ibm.com, mpe@ellerman.id.au, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, eric.snowberg@oracle.com
Subject: [RFC PATCH] certs: Add EFI_CERT_X509_GUID support for dbx entries
Date:   Tue,  1 Sep 2020 12:51:43 -0400
Message-Id: <20200901165143.10295-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9731 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009010140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9731 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010140
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The Secure Boot Forbidden Signature Database, dbx, contains a list of now
revoked signatures and keys previously approved to boot with UEFI Secure
Boot enabled.  The dbx is capable of containing any number of
EFI_CERT_X509_SHA256_GUID, EFI_CERT_SHA256_GUID, and EFI_CERT_X509_GUID
entries.

Currently when EFI_CERT_X509_GUID are contained in the dbx, the entries are
skipped.

This change adds support for EFI_CERT_X509_GUID dbx entries. When a
EFI_CERT_X509_GUID is found, it is added as an asymmetrical key to the
.blacklist keyring.  Anytime the .platform keyring is used, the keys in
the .blacklist keyring are referenced, if a matching key is found, the
key will be rejected.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
---
 certs/blacklist.c                             | 36 +++++++++++++++++++
 certs/system_keyring.c                        |  6 ++++
 include/keys/system_keyring.h                 | 11 ++++++
 .../platform_certs/keyring_handler.c          | 11 ++++++
 4 files changed, 64 insertions(+)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 6514f9ebc943..17ebf50cf0ae 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/seq_file.h>
 #include <keys/system_keyring.h>
+#include <crypto/pkcs7.h>
 #include "blacklist.h"
 
 static struct key *blacklist_keyring;
@@ -100,6 +101,41 @@ int mark_hash_blacklisted(const char *hash)
 	return 0;
 }
 
+int mark_key_revocationlisted(const char *data, size_t size)
+{
+	key_ref_t key;
+
+	key = key_create_or_update(make_key_ref(blacklist_keyring, true),
+				   "asymmetric",
+				   NULL,
+				   data,
+				   size,
+				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
+				    KEY_USR_VIEW),
+				   KEY_ALLOC_NOT_IN_QUOTA |
+				   KEY_ALLOC_BUILT_IN);
+
+	if (IS_ERR(key)) {
+		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
+		return PTR_ERR(key);
+	}
+
+	return 0;
+}
+
+int is_key_revocationlisted(struct pkcs7_message *pkcs7)
+{
+	int ret;
+
+	ret = pkcs7_validate_trust(pkcs7, blacklist_keyring);
+
+	if (ret == 0)
+		return -EKEYREJECTED;
+
+	return -ENOKEY;
+}
+EXPORT_SYMBOL_GPL(is_key_revocationlisted);
+
 /**
  * is_hash_blacklisted - Determine if a hash is blacklisted
  * @hash: The hash to be checked as a binary blob
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 798291177186..f8ea96219155 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -241,6 +241,12 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
 			pr_devel("PKCS#7 platform keyring is not available\n");
 			goto error;
 		}
+
+		ret = is_key_revocationlisted(pkcs7);
+		if (ret != -ENOKEY) {
+			pr_devel("PKCS#7 platform key revocationlisted\n");
+			goto error;
+		}
 	}
 	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
 	if (ret < 0) {
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index fb8b07daa9d1..b6991cfe1b6d 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -31,11 +31,14 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
 #define restrict_link_by_builtin_and_secondary_trusted restrict_link_by_builtin_trusted
 #endif
 
+extern struct pkcs7_message *pkcs7;
 #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
 extern int mark_hash_blacklisted(const char *hash);
+extern int mark_key_revocationlisted(const char *data, size_t size);
 extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 			       const char *type);
 extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
+extern int is_key_revocationlisted(struct pkcs7_message *pkcs7);
 #else
 static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 				      const char *type)
@@ -47,6 +50,14 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
 {
 	return 0;
 }
+static inline int mark_key_revocationlisted(const char *data, size_t size)
+{
+	return 0;
+}
+static inline int is_key_revocationlisted(struct pkcs7_message *pkcs7)
+{
+	return -ENOKEY;
+}
 #endif
 
 #ifdef CONFIG_IMA_BLACKLIST_KEYRING
diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
index c5ba695c10e3..cc5a43804bc4 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -55,6 +55,15 @@ static __init void uefi_blacklist_binary(const char *source,
 	uefi_blacklist_hash(source, data, len, "bin:", 4);
 }
 
+/*
+ * Revocationlist the X509 cert
+ */
+static __init void uefi_revocationlist_x509(const char *source,
+					    const void *data, size_t len)
+{
+	mark_key_revocationlisted(data, len);
+}
+
 /*
  * Return the appropriate handler for particular signature list types found in
  * the UEFI db and MokListRT tables.
@@ -76,5 +85,7 @@ __init efi_element_handler_t get_handler_for_dbx(const efi_guid_t *sig_type)
 		return uefi_blacklist_x509_tbs;
 	if (efi_guidcmp(*sig_type, efi_cert_sha256_guid) == 0)
 		return uefi_blacklist_binary;
+	if (efi_guidcmp(*sig_type, efi_cert_x509_guid) == 0)
+		return uefi_revocationlist_x509;
 	return 0;
 }
-- 
2.18.1

