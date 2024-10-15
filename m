Return-Path: <keyrings+bounces-2205-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33999FB50
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18370284642
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F73D1D63C6;
	Tue, 15 Oct 2024 22:22:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75AF1B0F0F;
	Tue, 15 Oct 2024 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030977; cv=none; b=r+kU+GscUPToqkdkvH1G/P6b06yVUf1EE6lMtTeJ6/s1jCcsMYR2610wmhboxIRg0ExWhgkHq7/2TsXPyAW+lyshTWtn/T2xULExUAFbc5IFMRQOFHTQsO6qBsRGrKIClnlBrdE7YFs/SSIGSy5J2Mdt6vPrBK2xpC58Hjt2FBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030977; c=relaxed/simple;
	bh=Hyol+qnMXN5hFfxO1tenvEfNy6Zotd9r1odI5pxqgm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQORGs4lSjdT3QMLbCqAk3+EVYo7FJDpQKMvHZmwbPRdID+iiey+S9vMIuNe+DII7gp9IY0b+/PNlFW4/fc8dIn1vGM6v/2IOo6VOikT2TmSC7tM3tVJ+FwmRmw8zroSxxlCAA2PuG1no1ZwdAeWJYGtKRXchfnlKNO/w+wVXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5D81691;
	Tue, 15 Oct 2024 15:23:24 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D872D3F71E;
	Tue, 15 Oct 2024 15:22:54 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	gregkh@linuxfoundation.org,
	graf@amazon.com,
	lukas@wunner.de,
	wufan@linux.microsoft.com,
	brauner@kernel.org,
	jsperbeck@google.com,
	ardb@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	keyrings@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 2/5] KEYS/certs: Start the builtin key and cert system earlier
Date: Tue, 15 Oct 2024 17:22:32 -0500
Message-ID: <20241015222235.71040-3-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241015222235.71040-1-jeremy.linton@arm.com>
References: <20241015222235.71040-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This exists at the moment to assure that the module signature checking
logic can be utilized before the initramfs is mounted.

Assuming we want to use the built in keys as well as MOK's to validate
an init image, is just moving this stuff earlier in the boot process
the right choice?

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 certs/blacklist.c                        | 2 +-
 certs/system_keyring.c                   | 4 ++--
 crypto/asymmetric_keys/asymmetric_type.c | 2 +-
 crypto/asymmetric_keys/x509_public_key.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 675dd7a8f07a..e644dd4cfc2b 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -356,7 +356,7 @@ static int __init blacklist_init(void)
 /*
  * Must be initialised before we try and load the keys into the keyring.
  */
-device_initcall(blacklist_init);
+fs_initcall(blacklist_init);
 
 #ifdef CONFIG_SYSTEM_REVOCATION_LIST
 /*
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 9de610bf1f4b..81a86418cb00 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -260,7 +260,7 @@ static __init int system_trusted_keyring_init(void)
 /*
  * Must be initialised before we try and load the keys into the keyring.
  */
-device_initcall(system_trusted_keyring_init);
+subsys_initcall(system_trusted_keyring_init);
 
 __init int load_module_cert(struct key *keyring)
 {
@@ -293,7 +293,7 @@ static __init int load_system_certificate_list(void)
 
 	return x509_load_certificate_list(p, size, builtin_trusted_keys);
 }
-late_initcall(load_system_certificate_list);
+fs_initcall_sync(load_system_certificate_list);
 
 #ifdef CONFIG_SYSTEM_DATA_VERIFICATION
 
diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 43af5fa510c0..a0607e8cdafc 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -681,5 +681,5 @@ static void __exit asymmetric_key_cleanup(void)
 	unregister_key_type(&key_type_asymmetric);
 }
 
-module_init(asymmetric_key_init);
+subsys_initcall(asymmetric_key_init);
 module_exit(asymmetric_key_cleanup);
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 8409d7d36cb4..391db5f1ede6 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -246,7 +246,7 @@ static void __exit x509_key_exit(void)
 	unregister_asymmetric_key_parser(&x509_key_parser);
 }
 
-module_init(x509_key_init);
+fs_initcall(x509_key_init);
 module_exit(x509_key_exit);
 
 MODULE_DESCRIPTION("X.509 certificate parser");
-- 
2.46.0


