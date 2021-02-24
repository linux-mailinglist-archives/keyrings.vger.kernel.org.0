Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EBB323AD7
	for <lists+keyrings@lfdr.de>; Wed, 24 Feb 2021 11:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhBXKx4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Feb 2021 05:53:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40579 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234926AbhBXKxq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Feb 2021 05:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614163936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GH11eDVLhD/SidI1qdEzLb3AWqWR9ut66Endvy0g5sg=;
        b=bbX7A5ACYn9nw6X+Q2mYXvEV0EFK1/mErS7YpFZE9ETrAJygcMfysTA92Ft1KmLqsnqJAo
        Mm2u8RPQMNjOpMxHy9plxUMsIyhbeU50BCuM+7gOuvQOVmvZIMHuSH0xBKgk9ynKJQ47mR
        uORsLt/6Qe+N68Xx9CYglQOakkJAAfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-5MJlS2NeP7-XzypAY4PELg-1; Wed, 24 Feb 2021 05:52:00 -0500
X-MC-Unique: 5MJlS2NeP7-XzypAY4PELg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771A18018AB;
        Wed, 24 Feb 2021 10:51:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-119-68.rdu2.redhat.com [10.10.119.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 980EA2D035;
        Wed, 24 Feb 2021 10:51:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com>
References: <F6980CA4-737D-416A-BBE3-390CEBA8B192@oracle.com> <20210217165058.1336155-1-eric.snowberg@oracle.com> <3524595.1614124044@warthog.procyon.org.uk>
To:     Eric Snowberg <eric.snowberg@oracle.com>
Cc:     dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cert: Add kconfig dependency for validate_trust
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3731127.1614163916.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 24 Feb 2021 10:51:56 +0000
Message-ID: <3731128.1614163916@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

How about these changes?

I've added an extra config option to turn on SYSTEM_REVOCATION_LIST suppor=
t.

I've also added kerneldoc comments and moved the functions so that they're=
 not
in the middle of the blacklist-specific stuff.

I'm not sure uefi_revocation_list_x509() needs conditionalising as the
optimiser should just inline it if SYSTEM_REVOCATION_LIST=3Dn (assuming __=
init
doesn't disable inlining).

David
---
diff --git a/certs/Kconfig b/certs/Kconfig
index c94e93d8bccf..76e469b56a77 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -83,4 +83,13 @@ config SYSTEM_BLACKLIST_HASH_LIST
 	  wrapper to incorporate the list into the kernel.  Each <hash> should
 	  be a string of hex digits.
 =

+config SYSTEM_REVOCATION_LIST
+	bool "Provide system-wide ring of revocation certificates"
+	depends on SYSTEM_BLACKLIST_KEYRING
+	depends on PKCS7_MESSAGE_PARSER=3Dy
+	help
+	  If set, this allows revocation certificates to be stored in the
+	  blacklist keyring and implements a hook whereby a PKCS#7 message can
+	  be checked to see if it matches such a certificate.
+
 endmenu
diff --git a/certs/blacklist.c b/certs/blacklist.c
index e9f5fc632f0d..2b8644123d5f 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -101,38 +101,6 @@ int mark_hash_blacklisted(const char *hash)
 	return 0;
 }
 =

-int add_key_to_revocation_list(const char *data, size_t size)
-{
-	key_ref_t key;
-
-	key =3D key_create_or_update(make_key_ref(blacklist_keyring, true),
-				   "asymmetric",
-				   NULL,
-				   data,
-				   size,
-				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
-				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
-
-	if (IS_ERR(key)) {
-		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
-		return PTR_ERR(key);
-	}
-
-	return 0;
-}
-
-int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
-{
-	int ret;
-
-	ret =3D validate_trust(pkcs7, blacklist_keyring);
-
-	if (ret =3D=3D 0)
-		return -EKEYREJECTED;
-
-	return -ENOKEY;
-}
-
 /**
  * is_hash_blacklisted - Determine if a hash is blacklisted
  * @hash: The hash to be checked as a binary blob
@@ -177,6 +145,49 @@ int is_binary_blacklisted(const u8 *hash, size_t hash=
_len)
 }
 EXPORT_SYMBOL_GPL(is_binary_blacklisted);
 =

+#ifdef CONFIG_SYSTEM_REVOCATION_LIST
+/**
+ * add_key_to_revocation_list - Add a revocation certificate to the black=
list
+ * @data: The data blob containing the certificate
+ * @size: The size of data blob
+ */
+int add_key_to_revocation_list(const char *data, size_t size)
+{
+	key_ref_t key;
+
+	key =3D key_create_or_update(make_key_ref(blacklist_keyring, true),
+				   "asymmetric",
+				   NULL,
+				   data,
+				   size,
+				   ((KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW),
+				   KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN);
+
+	if (IS_ERR(key)) {
+		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
+		return PTR_ERR(key);
+	}
+
+	return 0;
+}
+
+/**
+ * is_key_on_revocation_list - Determine if the key for a PKCS#7 message =
is revoked
+ * @pkcs7: The PKCS#7 message to check
+ */
+int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
+{
+	int ret;
+
+	ret =3D pkcs7_validate_trust(pkcs7, blacklist_keyring);
+
+	if (ret =3D=3D 0)
+		return -EKEYREJECTED;
+
+	return -ENOKEY;
+}
+#endif
+
 /*
  * Initialise the blacklist
  */
diff --git a/certs/blacklist.h b/certs/blacklist.h
index 420bb7c86e07..51b320cf8574 100644
--- a/certs/blacklist.h
+++ b/certs/blacklist.h
@@ -3,13 +3,3 @@
 #include <crypto/pkcs7.h>
 =

 extern const char __initconst *const blacklist_hashes[];
-
-#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
-#define validate_trust pkcs7_validate_trust
-#else
-static inline int validate_trust(struct pkcs7_message *pkcs7,
-				 struct key *trust_keyring)
-{
-	return -ENOKEY;
-}
-#endif
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index 61f98739e8b1..875e002a4180 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -34,11 +34,9 @@ extern int restrict_link_by_builtin_and_secondary_trust=
ed(
 extern struct pkcs7_message *pkcs7;
 #ifdef CONFIG_SYSTEM_BLACKLIST_KEYRING
 extern int mark_hash_blacklisted(const char *hash);
-extern int add_key_to_revocation_list(const char *data, size_t size);
 extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 			       const char *type);
 extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
-extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
 #else
 static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
 				      const char *type)
@@ -50,6 +48,12 @@ static inline int is_binary_blacklisted(const u8 *hash,=
 size_t hash_len)
 {
 	return 0;
 }
+#endif
+
+#ifdef CONFIG_SYSTEM_REVOCATION_LIST
+extern int add_key_to_revocation_list(const char *data, size_t size);
+extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
+#else
 static inline int add_key_to_revocation_list(const char *data, size_t siz=
e)
 {
 	return 0;

