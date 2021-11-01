Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00B5441188
	for <lists+keyrings@lfdr.de>; Mon,  1 Nov 2021 01:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhKAACl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 31 Oct 2021 20:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhKAACl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 31 Oct 2021 20:02:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2BFC061714;
        Sun, 31 Oct 2021 17:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=NkaMbkAfLHRkcex2Pqf8J0IsG/GjJ1X79xApVZhJZb4=; b=GAiBRQmtI7n8ds8ZxG+6sYQUWA
        P9RbjzQViE/upqxtCf6HVvhIAq45aE8xyaUNHP1h5aZfsQjbkve0XlQwxQ7i6vTAilWrLrKlLPWju
        ysJqK90SLyOMDihf5gORNNvAH3JI1EPW9O9pSJxY81fdRNJulwp5sF7VSxdXfp3KPPsYVcnoKMTDx
        ZTsggXfPnAULE1hb2vOavtjZynrZswnoZE7xKtz7Vl9QaZoJdbxBJDcluvJqQYIOZTvddFxXABam7
        /Teyvw6jkI6DILDNNt0Cy7k44mZzvY6QZjKcThZHGGKzOAqI1crT1ClRCz3Cn21ONnMC5/Brnd1Ol
        pE5jLbMw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhKkA-00ExJz-38; Mon, 01 Nov 2021 00:00:06 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: [PATCH v2] certs: system_keyring.c: clean up kernel-doc
Date:   Sun, 31 Oct 2021 17:00:05 -0700
Message-Id: <20211101000005.9902-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

- Fix all kernel-doc warnings in system_keyring.c:

system_keyring.c:43: warning: expecting prototype for restrict_link_to_builtin_trusted(). Prototype was for restrict_link_by_builtin_trusted() instead
system_keyring.c:77: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Allocate a struct key_restriction for the "builtin and secondary trust"
system_keyring.c:77: warning: missing initial short description on line:
 * Allocate a struct key_restriction for the "builtin and secondary trust"

system_keyring.c:43: warning: No description found for return value of 'restrict_link_by_builtin_trusted'
system_keyring.c:62: warning: No description found for return value of 'restrict_link_by_builtin_and_secondary_trusted'
system_keyring.c:190: warning: No description found for return value of 'verify_pkcs7_message_sig'
system_keyring.c:275: warning: No description found for return value of 'verify_pkcs7_signature'

system_keyring.c:39: warning: contents before sections
system_keyring.c:45: warning: Function parameter or member 'dest_keyring' not described in 'restrict_link_by_builtin_trusted'
system_keyring.c:45: warning: Function parameter or member 'type' not described in 'restrict_link_by_builtin_trusted'
system_keyring.c:45: warning: Function parameter or member 'payload' not described in 'restrict_link_by_builtin_trusted'
system_keyring.c:45: warning: Function parameter or member 'restriction_key' not described in 'restrict_link_by_builtin_trusted'
system_keyring.c:59: warning: contents before sections
system_keyring.c:66: warning: Function parameter or member 'dest_keyring' not described in 'restrict_link_by_builtin_and_secondary_trusted'
system_keyring.c:66: warning: Function parameter or member 'type' not described in 'restrict_link_by_builtin_and_secondary_trusted'
system_keyring.c:66: warning: Function parameter or member 'payload' not described in 'restrict_link_by_builtin_and_secondary_trusted'
system_keyring.c:66: warning: Function parameter or member 'restrict_key' not described in 'restrict_link_by_builtin_and_secondary_trusted'

- Use '%' preceding constants in kernel-doc notation.

- Use "builtin" consistently instead of "built in" or "built-in".

- Don't use "/**" to begin a comment that is not in kernel-doc format.

- Document the use of VERIFY_USE_SECONDARY_KEYRING and
VERIFY_USE_PLATFORM_KEYRING.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org
---
v2: add missing function parameter descriptions

 certs/system_keyring.c |   38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

--- linux-next-20211029.orig/certs/system_keyring.c
+++ linux-next-20211029/certs/system_keyring.c
@@ -31,10 +31,16 @@ extern __initconst const unsigned long s
 extern __initconst const unsigned long module_cert_size;
 
 /**
- * restrict_link_to_builtin_trusted - Restrict keyring addition by built in CA
+ * restrict_link_by_builtin_trusted - Restrict keyring addition by builtin CA
+ * @dest_keyring: Keyring being linked to.
+ * @type: The type of key being added.
+ * @payload: The payload of the new key.
+ * @restriction_key: Key providing additional data for evaluating restriction.
  *
  * Restrict the addition of keys into a keyring based on the key-to-be-added
- * being vouched for by a key in the built in system keyring.
+ * being vouched for by a key in the builtin system keyring.
+ *
+ * Return: %0 on success or a negative value on error
  */
 int restrict_link_by_builtin_trusted(struct key *dest_keyring,
 				     const struct key_type *type,
@@ -49,10 +55,16 @@ int restrict_link_by_builtin_trusted(str
 /**
  * restrict_link_by_builtin_and_secondary_trusted - Restrict keyring
  *   addition by both builtin and secondary keyrings
+ * @dest_keyring: Keyring being linked to.
+ * @type: The type of key being added.
+ * @payload: The payload of the new key.
+ * @restrict_key: Key providing additional data for evaluating restriction.
  *
  * Restrict the addition of keys into a keyring based on the key-to-be-added
- * being vouched for by a key in either the built-in or the secondary system
+ * being vouched for by a key in either the builtin or the secondary system
  * keyrings.
+ *
+ * Return: %0 on success or a negative value on error
  */
 int restrict_link_by_builtin_and_secondary_trusted(
 	struct key *dest_keyring,
@@ -73,7 +85,7 @@ int restrict_link_by_builtin_and_seconda
 					  secondary_trusted_keys);
 }
 
-/**
+/*
  * Allocate a struct key_restriction for the "builtin and secondary trust"
  * keyring. Only for use in system_trusted_keyring_init().
  */
@@ -170,14 +182,17 @@ late_initcall(load_system_certificate_li
 
 /**
  * verify_pkcs7_message_sig - Verify a PKCS#7-based signature on system data.
- * @data: The data to be verified (NULL if expecting internal data).
+ * @data: The data to be verified (%NULL if expecting internal data).
  * @len: Size of @data.
  * @pkcs7: The PKCS#7 message that is the signature.
- * @trusted_keys: Trusted keys to use (NULL for builtin trusted keys only,
- *					(void *)1UL for all trusted keys).
+ * @trusted_keys: Trusted keys to use (%NULL for builtin trusted keys only,
+ *		  %VERIFY_USE_SECONDARY_KEYRING for secondary trusted keys,
+ *		  %VERIFY_USE_PLATFORM_KEYRING for platform trusted keys).
  * @usage: The use to which the key is being put.
  * @view_content: Callback to gain access to content.
  * @ctx: Context for callback.
+ *
+ * Return: %0 on success or a negative value on error
  */
 int verify_pkcs7_message_sig(const void *data, size_t len,
 			     struct pkcs7_message *pkcs7,
@@ -254,15 +269,18 @@ error:
 
 /**
  * verify_pkcs7_signature - Verify a PKCS#7-based signature on system data.
- * @data: The data to be verified (NULL if expecting internal data).
+ * @data: The data to be verified (%NULL if expecting internal data).
  * @len: Size of @data.
  * @raw_pkcs7: The PKCS#7 message that is the signature.
  * @pkcs7_len: The size of @raw_pkcs7.
- * @trusted_keys: Trusted keys to use (NULL for builtin trusted keys only,
- *					(void *)1UL for all trusted keys).
+ * @trusted_keys: Trusted keys to use (%NULL for builtin trusted keys only,
+ *		  %VERIFY_USE_SECONDARY_KEYRING for secondary trusted keys,
+ *		  %VERIFY_USE_PLATFORM_KEYRING for platform trusted keys).
  * @usage: The use to which the key is being put.
  * @view_content: Callback to gain access to content.
  * @ctx: Context for callback.
+ *
+ * Return: %0 on success or a negative value on error
  */
 int verify_pkcs7_signature(const void *data, size_t len,
 			   const void *raw_pkcs7, size_t pkcs7_len,
