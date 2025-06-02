Return-Path: <keyrings+bounces-2780-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54320ACAEF6
	for <lists+keyrings@lfdr.de>; Mon,  2 Jun 2025 15:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B31D7A1EF5
	for <lists+keyrings@lfdr.de>; Mon,  2 Jun 2025 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D42B21FF35;
	Mon,  2 Jun 2025 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qb9clEsm"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925C21CC7B
	for <keyrings@vger.kernel.org>; Mon,  2 Jun 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870764; cv=none; b=fo+MPQ5UMD9Un5uLxIHF2XtntT4qhSsbfbSd3QAzI3KVgNFiZduJkaaMJ8Dqy2wN71o1oF0Z7jq4pVNIPs23ILa4eKon4b7m8ieW8J9z2Tj1mmk/gPxbk1BKIjy2HP3bSSBRZPwKHxBW/goi/bidZnZBY3A0QXDMfhUMl4Wu6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870764; c=relaxed/simple;
	bh=Mz2VSrEiZ5oX5C4O51bSvAOqVSLa2TxMZyfLzwwUvoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YLrcZfHnbnzSDlarMuiIgtvoQK8G9E0lcg7hISpFoZ+lL2oN4mwxapXOQuq8PobYL6h9yCg//SddRerovhxnoRsN3Qv23Ot2Xkilh2LLmaj+2zTi6JuoOrbB3/y073gj/l+Xltv70p7sJWTFWmH/Htbrz0VTZFqXhj/6H0yTyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qb9clEsm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748870761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGJhWJHjw7Hp8c1hgWnOUEnNwrG2wjjIX1QvpNBnjsw=;
	b=Qb9clEsmGCXehXgxYCnfXvvitOOf0eVNuAJbgqldee/nzY6sUkTBw8wY9hiWo5l579328P
	ZWCN60fophZw10cclkatHfqnl7nz2q/hDbO4KZA6hFr+H3GAw6nXz3P/6c2YvuVl+BUaCR
	riTv0Qkt/S8JUAjN+qBRVAPPs52E3PY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-Y6nYanefN1aR8MDWv4PZRw-1; Mon,
 02 Jun 2025 09:25:57 -0400
X-MC-Unique: Y6nYanefN1aR8MDWv4PZRw-1
X-Mimecast-MFC-AGG-ID: Y6nYanefN1aR8MDWv4PZRw_1748870755
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A9E9195608A;
	Mon,  2 Jun 2025 13:25:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.34.87])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44E9E18001DA;
	Mon,  2 Jun 2025 13:25:46 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	keyrings@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Jones <pjones@redhat.com>,
	Robert Holmes <robeholmes@gmail.com>,
	Jeremy Cline <jcline@redhat.com>,
	Coiby Xu <coxu@redhat.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH RFC 1/1] module: Make use of platform keyring for module signature verify
Date: Mon,  2 Jun 2025 15:25:35 +0200
Message-ID: <20250602132535.897944-2-vkuznets@redhat.com>
In-Reply-To: <20250602132535.897944-1-vkuznets@redhat.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This patch complements commit 278311e417be ("kexec, KEYS: Make use of
platform keyring for signature verify") and commit 6fce1f40e951
("dm verity: add support for signature verification with platform keyring")
and allows for signing modules using keys from SecureBoot 'db'. This may
come handy when the user has control over it, e.g. in a virtualized or a
cloud environment.

Suggested-by: Robert Holmes <robeholmes@gmail.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 Documentation/admin-guide/module-signing.rst |  6 ++++++
 kernel/module/Kconfig                        | 11 +++++++++++
 kernel/module/signing.c                      |  9 ++++++++-
 security/integrity/Kconfig                   |  2 +-
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index a8667a777490..44ed93e586b9 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -118,6 +118,12 @@ This has a number of options available:
      additional certificates which will be included in the system keyring by
      default.
 
+ (5) :menuselection:`Use .platform keyring for verifying kernel modules signatures`
+     (``CONFIG_MODULE_SIG_PLATFORM``)
+
+     This option additionally allows modules to be signed with a key present
+     in ``.platform`` keyring, e.g. a SecureBoot 'db' key.
+
 Note that enabling module signing adds a dependency on the OpenSSL devel
 packages to the kernel build processes for the tool that does the signing.
 
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 39278737bb68..f1b85c14548a 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -340,6 +340,17 @@ config MODULE_SIG_HASH
 	default "sha3-384" if MODULE_SIG_SHA3_384
 	default "sha3-512" if MODULE_SIG_SHA3_512
 
+config MODULE_SIG_PLATFORM
+	bool "Use .platform keyring for verifying kernel modules signatures"
+	depends on INTEGRITY_PLATFORM_KEYRING
+	depends on MODULE_SIG
+	help
+	  When selected, keys from .platform keyring can be used for verifying
+	  modules signatures. In particular, this allows to use UEFI SecureBoot
+	  'db' for verification.
+
+	  If unsure, say N.
+
 config MODULE_COMPRESS
 	bool "Module compression"
 	help
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index a2ff4242e623..3327e7243211 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -61,10 +61,17 @@ int mod_verify_sig(const void *mod, struct load_info *info)
 	modlen -= sig_len + sizeof(ms);
 	info->len = modlen;
 
-	return verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
+	ret = verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
 				      VERIFY_USE_SECONDARY_KEYRING,
 				      VERIFYING_MODULE_SIGNATURE,
 				      NULL, NULL);
+	if (ret == -ENOKEY && IS_ENABLED(CONFIG_MODULE_SIG_PLATFORM)) {
+		ret = verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
+				VERIFY_USE_PLATFORM_KEYRING,
+				VERIFYING_MODULE_SIGNATURE,
+				NULL, NULL);
+	}
+	return ret;
 }
 
 int module_sig_check(struct load_info *info, int flags)
diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 3c45f4f3455f..b7fa83d37a01 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -60,7 +60,7 @@ config INTEGRITY_PLATFORM_KEYRING
 	  Provide a separate, distinct keyring for platform trusted keys, which
 	  the kernel automatically populates during initialization from values
 	  provided by the platform for verifying the kexec'ed kerned image
-	  and, possibly, the initramfs signature.
+	  and, possibly, the initramfs signature and kernel modules signatures.
 
 config INTEGRITY_MACHINE_KEYRING
 	bool "Provide a keyring to which Machine Owner Keys may be added"
-- 
2.49.0


