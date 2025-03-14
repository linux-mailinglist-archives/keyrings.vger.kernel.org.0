Return-Path: <keyrings+bounces-2452-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F7A615B8
	for <lists+keyrings@lfdr.de>; Fri, 14 Mar 2025 17:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8AD87A2386
	for <lists+keyrings@lfdr.de>; Fri, 14 Mar 2025 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0440820127B;
	Fri, 14 Mar 2025 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJWlUjPI"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDB200BBE;
	Fri, 14 Mar 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968349; cv=none; b=MyrwcXrUmrHJDeYriPBP855jTQn2kv+etarZ7QJQTYra13QeKyKNz3wLEzzY3MVMKmDiyj1528kgZQpOvpdyzmxwMxU34dD4uZNZ5CoW5wc7MavRntN9d/+OhLJZny+USrXWQYfyOWsXu71RsN+d/ZRjo0qgk7c0V4A6H/Xfuus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968349; c=relaxed/simple;
	bh=QIudmOsm4bMb8DNA+DVmp6GPpavGC5kLfOcQvRWIfVU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WnXIXvpp1bddCwGh7IHeYbYGwGuFgn0YQcZRfqM/0F7Edqz8hv7J24EGVkEK3SA99K2FN5FzNPcY7iY/n+o4Ep5TcZFdb+H9sr3W8yfO9ReGXQ8O8DxSD6LsD0kd0+0EnMkBv3wmh7Hld+PhY/BQ6U+VBoGhcTu7UXTMN7n4/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJWlUjPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4C7C4CEE9;
	Fri, 14 Mar 2025 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741968349;
	bh=QIudmOsm4bMb8DNA+DVmp6GPpavGC5kLfOcQvRWIfVU=;
	h=From:To:Cc:Subject:Date:From;
	b=mJWlUjPIIEEq6mbChzTqrRYzZJvg90PTJTTR4kB2gP/Uf+C95+u9v72/8IskSoIZ4
	 j+mpwdT/enhHN/WGj+HNoSyCgWRe0c/PlOwfXuvwvoicpj+5uH2ack0gVLhxz+082B
	 SRsC8+isgbFudrY56YVf3jqtDotV/qJD9CnYmC905HrKaHT8y0d9BNw38IuDGufbFy
	 p37BmL/Ahj6BCC6c63svo2KDKlL6kpEZsmARORMwAg726KA6W/Oniq5Bhwj+yZssA/
	 wVd7V74+SpsN/FihZqEqvM8Vp9X9SRTCOYAziy1IxtOtfv8ITWVs4Q8ngGo923SkqF
	 gsPJdLsSpSlGA==
From: Arnd Bergmann <arnd@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rosen Penev <rosenp@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Date: Fri, 14 Mar 2025 17:05:32 +0100
Message-Id: <20250314160543.605055-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Any driver that needs these library functions should already be selecting
the corresponding Kconfig symbols, so there is no real point in making
these visible.

The original patch that made these user selectable described problems
with drivers failing to select the code they use, but for consistency
it's better to always use 'select' on a symbol than to mix it with
'depends on'.

Fixes: e56e18985596 ("lib/crypto: add prompts back to crypto libraries")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add the missing 'select' statements
---
 drivers/crypto/marvell/Kconfig | 4 ++--
 lib/crypto/Kconfig             | 8 ++++----
 security/keys/Kconfig          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/marvell/Kconfig b/drivers/crypto/marvell/Kconfig
index 4c25a78ab3ed..aa269abb0499 100644
--- a/drivers/crypto/marvell/Kconfig
+++ b/drivers/crypto/marvell/Kconfig
@@ -24,7 +24,7 @@ config CRYPTO_DEV_OCTEONTX_CPT
 	tristate "Support for Marvell OcteonTX CPT driver"
 	depends on ARCH_THUNDER || COMPILE_TEST
 	depends on PCI_MSI && 64BIT
-	depends on CRYPTO_LIB_AES
+	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	select CRYPTO_HASH
 	select CRYPTO_AEAD
@@ -41,10 +41,10 @@ config CRYPTO_DEV_OCTEONTX2_CPT
 	tristate "Marvell OcteonTX2 CPT driver"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
 	depends on PCI_MSI && 64BIT
-	depends on CRYPTO_LIB_AES
 	depends on NET_VENDOR_MARVELL
 	select OCTEONTX2_MBOX
 	select CRYPTO_DEV_MARVELL
+	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	select CRYPTO_HASH
 	select CRYPTO_AEAD
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 17322f871586..798972b29b68 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -63,7 +63,7 @@ config CRYPTO_LIB_CHACHA_INTERNAL
 	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
 
 config CRYPTO_LIB_CHACHA
-	tristate "ChaCha library interface"
+	tristate
 	select CRYPTO
 	select CRYPTO_LIB_CHACHA_INTERNAL
 	help
@@ -93,7 +93,7 @@ config CRYPTO_LIB_CURVE25519_INTERNAL
 	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
 
 config CRYPTO_LIB_CURVE25519
-	tristate "Curve25519 scalar multiplication library"
+	tristate
 	select CRYPTO
 	select CRYPTO_LIB_CURVE25519_INTERNAL
 	help
@@ -132,7 +132,7 @@ config CRYPTO_LIB_POLY1305_INTERNAL
 	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
 
 config CRYPTO_LIB_POLY1305
-	tristate "Poly1305 library interface"
+	tristate
 	select CRYPTO
 	select CRYPTO_LIB_POLY1305_INTERNAL
 	help
@@ -141,7 +141,7 @@ config CRYPTO_LIB_POLY1305
 	  is available and enabled.
 
 config CRYPTO_LIB_CHACHA20POLY1305
-	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
+	tristate
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
 	select CRYPTO_LIB_UTILS
diff --git a/security/keys/Kconfig b/security/keys/Kconfig
index abb03a1b2a5c..d4f5fc1e7263 100644
--- a/security/keys/Kconfig
+++ b/security/keys/Kconfig
@@ -60,7 +60,7 @@ config BIG_KEYS
 	bool "Large payload keys"
 	depends on KEYS
 	depends on TMPFS
-	depends on CRYPTO_LIB_CHACHA20POLY1305 = y
+	select CRYPTO_LIB_CHACHA20POLY1305
 	help
 	  This option provides support for holding large keys within the kernel
 	  (for example Kerberos ticket caches).  The data may be stored out to
-- 
2.39.5


