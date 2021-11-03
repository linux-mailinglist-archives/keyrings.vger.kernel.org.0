Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CE044437C
	for <lists+keyrings@lfdr.de>; Wed,  3 Nov 2021 15:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhKCO3w (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Nov 2021 10:29:52 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52440 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhKCO3u (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Nov 2021 10:29:50 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id BF1031FD38;
        Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635949632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cjYVBDGU+kLhHmA2i7EyQbKMCoFpK8UUMfIbBTUvwnw=;
        b=fg7QS3/P0iYQD5eZtJ6p72R1eRHWQs33XDRwDHVV1iQVoe04MGYyIqRc3GS3+hWIjv0bqe
        YFR/5KEfO9mUTJ+VifQ6fDbP7bBGWQ71TH8FbypXCe6jjumceoc9iMFwFsOzRKetLUzdY7
        ck3s3k1WMZJf24oUgPdhFg9L7A8OcKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635949632;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cjYVBDGU+kLhHmA2i7EyQbKMCoFpK8UUMfIbBTUvwnw=;
        b=4JuoZKxBijz2nevAtUXxKYeO3paBrlviav5cVnCMPszSH1LAe4oqJZC/yhxqrXxnkCgydH
        D2VqztyQYY3RFICg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        by relay2.suse.de (Postfix) with ESMTP id A54D1A3BAE;
        Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     keyrings@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>, Rob Herring <robh@kernel.org>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Frank van der Linden <fllinden@amazon.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH 2/3] module: strip the signature marker in the verification function.
Date:   Wed,  3 Nov 2021 15:27:07 +0100
Message-Id: <8c183211d3980554b046a1cc215f3b0f1ca17072.1635948742.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635948742.git.msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

It is stripped by each caller separately.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/s390/kernel/machine_kexec_file.c |  9 ---------
 kernel/module.c                       |  7 +------
 kernel/module_signing.c               | 12 ++++++++++--
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index 634e641cd8aa..82260bb61060 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -26,20 +26,11 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 int s390_verify_sig(const char *kernel, unsigned long length)
 {
 	size_t kernel_len = length;
-	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
 
 	/* Skip signature verification when not secure IPLed. */
 	if (!ipl_secure_flag)
 		return 0;
 
-	if (marker_len > kernel_len)
-		return -EKEYREJECTED;
-
-	if (memcmp(kernel + kernel_len - marker_len, MODULE_SIG_STRING,
-		   marker_len))
-		return -EKEYREJECTED;
-	kernel_len -= marker_len;
-
 	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
 					"kexec_file");
 }
diff --git a/kernel/module.c b/kernel/module.c
index 137b3661be75..1c421b0442e3 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2882,7 +2882,6 @@ static inline void kmemleak_load_module(const struct module *mod,
 static int module_sig_check(struct load_info *info, int flags)
 {
 	int err = -ENODATA;
-	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	const char *reason;
 	const void *mod = info->hdr;
 
@@ -2890,11 +2889,7 @@ static int module_sig_check(struct load_info *info, int flags)
 	 * Require flags == 0, as a module with version information
 	 * removed is no longer the module that was signed
 	 */
-	if (flags == 0 &&
-	    info->len > markerlen &&
-	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
-		/* We truncate the module to discard the signature */
-		info->len -= markerlen;
+	if (flags == 0) {
 		err = verify_appended_signature(mod, &info->len,
 						VERIFY_USE_SECONDARY_KEYRING, "module");
 		if (!err) {
diff --git a/kernel/module_signing.c b/kernel/module_signing.c
index f492e410564d..4c28cb55275f 100644
--- a/kernel/module_signing.c
+++ b/kernel/module_signing.c
@@ -15,8 +15,7 @@
 #include "module-internal.h"
 
 /**
- * verify_appended_signature - Verify the signature on a module with the
- * signature marker stripped.
+ * verify_appended_signature - Verify the signature on a module
  * @data: The data to be verified
  * @len: Size of @data.
  * @trusted_keys: Keyring to use for verification
@@ -25,12 +24,21 @@
 int verify_appended_signature(const void *data, size_t *len,
 			      struct key *trusted_keys, const char *what)
 {
+	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
 	struct module_signature ms;
 	size_t sig_len, modlen = *len;
 	int ret;
 
 	pr_devel("==>%s(,%zu)\n", __func__, modlen);
 
+	if (markerlen > modlen)
+		return -ENODATA;
+
+	if (memcmp(data + modlen - markerlen, MODULE_SIG_STRING,
+		   markerlen))
+		return -ENODATA;
+	modlen -= markerlen;
+
 	if (modlen <= sizeof(ms))
 		return -EBADMSG;
 
-- 
2.31.1

