Return-Path: <keyrings+bounces-2982-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99719B3332D
	for <lists+keyrings@lfdr.de>; Mon, 25 Aug 2025 00:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8B4177061
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 22:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0737B246799;
	Sun, 24 Aug 2025 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JXGdYpk9"
X-Original-To: keyrings@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B88229B1F;
	Sun, 24 Aug 2025 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756074497; cv=none; b=iZLlmMf5S3z7ZNfHwBnDkec+ntw0Rl8OkQWswZ1VJYrAOFZg3Kkd9GVg+KjeNJ+BSjoNqdiiObGUnpTvy1Ug9QiBIegscR69XfbJCgmN0/RLbDylnqv03Ty0vtGnIwYMql26p5jyu7+r4os7+r3yBQ3f4wjyBQTTCbsXvS9C9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756074497; c=relaxed/simple;
	bh=c1HYkOS02SERE6ZyBgpgeGdEUEJ9BTC0gRpz/poHTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VnnfDyAopIL3uB/PnzN5Rh0+b+0O/pm38m9isSYei/BEvJ8tWHvC/wNugFngtnd/wigRjtgrOO4KuRRlmbcCgQzRV6zhdnblbCSkR08VoKC3gYDBjSYFXyYFnfhrWoqM+QgGil4pPuLQ/B72Yno0pyDH1FP7YTga/9pzHlDyWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JXGdYpk9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Mu1Oi+QR9EoyJ6fex19tF1jhNQq7NS4mjwJGuQRIIgI=; b=JXGdYpk9oHPGFYxNZCwCfXFyIO
	euoFraMAsQMb6kim/UxTRpwo1eSFbMXSZdf/kvbsONgFVXwFDHZHgjeSVBn2kCng5PstymDPI4q7f
	fXuJZ8HcXhVB+j+S2gyVnBz/wgRi68JnxVsX+bL3q+4ghoarro0WTASQGfskMkb9k0QDKEh8jWcYL
	tKWCDaaojlmCAyUFiE/OkN4xPSSOGK376jUDQ//5KosMydHc99m8Y6a8d99w2SeQdQtXE8kTUT6Np
	phx2vvSBeZSo0YBr6oMvHwIxfgasxbCV31kDr++sipQiMYaTXTGhh0mfhvpp4SD+lXg1KcwbqcYGQ
	Yg058etA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqJCB-00000006b6r-2VJb;
	Sun, 24 Aug 2025 22:28:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH] security: keys: use menuconfig for KEYS symbol
Date: Sun, 24 Aug 2025 15:28:13 -0700
Message-ID: <20250824222813.92300-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give the KEYS kconfig symbol and its associated symbols a separate
menu space under Security options by using "menuconfig" instead of
"config".

This also makes it easier to find the security and LSM options.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>

 security/keys/Kconfig |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

--- linux-next-20250819.orig/security/keys/Kconfig
+++ linux-next-20250819/security/keys/Kconfig
@@ -3,7 +3,7 @@
 # Key management configuration
 #
 
-config KEYS
+menuconfig KEYS
 	bool "Enable access key retention support"
 	select ASSOCIATIVE_ARRAY
 	help
@@ -21,9 +21,10 @@ config KEYS
 
 	  If you are unsure as to whether this is required, answer N.
 
+if KEYS
+
 config KEYS_REQUEST_CACHE
 	bool "Enable temporary caching of the last request_key() result"
-	depends on KEYS
 	help
 	  This option causes the result of the last successful request_key()
 	  call that didn't upcall to the kernel to be cached temporarily in the
@@ -41,7 +42,6 @@ config KEYS_REQUEST_CACHE
 
 config PERSISTENT_KEYRINGS
 	bool "Enable register of persistent per-UID keyrings"
-	depends on KEYS
 	help
 	  This option provides a register of persistent per-UID keyrings,
 	  primarily aimed at Kerberos key storage.  The keyrings are persistent
@@ -58,7 +58,6 @@ config PERSISTENT_KEYRINGS
 
 config BIG_KEYS
 	bool "Large payload keys"
-	depends on KEYS
 	depends on TMPFS
 	select CRYPTO_LIB_CHACHA20POLY1305
 	help
@@ -70,7 +69,6 @@ config BIG_KEYS
 
 config TRUSTED_KEYS
 	tristate "TRUSTED KEYS"
-	depends on KEYS
 	help
 	  This option provides support for creating, sealing, and unsealing
 	  keys in the kernel. Trusted keys are random number symmetric keys,
@@ -85,7 +83,6 @@ endif
 
 config ENCRYPTED_KEYS
 	tristate "ENCRYPTED KEYS"
-	depends on KEYS
 	select CRYPTO
 	select CRYPTO_HMAC
 	select CRYPTO_AES
@@ -114,7 +111,6 @@ config USER_DECRYPTED_DATA
 
 config KEY_DH_OPERATIONS
        bool "Diffie-Hellman operations on retained keys"
-       depends on KEYS
        select CRYPTO
        select CRYPTO_KDF800108_CTR
        select CRYPTO_DH
@@ -127,9 +123,11 @@ config KEY_DH_OPERATIONS
 
 config KEY_NOTIFICATIONS
 	bool "Provide key/keyring change notifications"
-	depends on KEYS && WATCH_QUEUE
+	depends on WATCH_QUEUE
 	help
 	  This option provides support for getting change notifications
 	  on keys and keyrings on which the caller has View permission.
 	  This makes use of pipes to handle the notification buffer and
 	  provides KEYCTL_WATCH_KEY to enable/disable watches.
+
+endif # KEYS

