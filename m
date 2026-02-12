Return-Path: <keyrings+bounces-4053-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPPFKuapjWkK5wAAu9opvQ
	(envelope-from <keyrings+bounces-4053-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 11:22:30 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E027412C6FE
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 11:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFB813002D32
	for <lists+keyrings@lfdr.de>; Thu, 12 Feb 2026 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A4C2BE643;
	Thu, 12 Feb 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWiyNXH8"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E84964F;
	Thu, 12 Feb 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891668; cv=none; b=Mw9h4tb3rHAIF2cJ0HQ9gYrBXpjk1jXKxfWbTlsVeXgvIAvIy0jl8G/EfjtsUjf0Gl9hWEd4rgSnwSrgr+Zw83jUbdkRHEy+7gUbARvbRdzt5/E9z/FZFloSdJP7Wq27dXOx3deH9oEGO1Q2m92kf9Kriyo/7H3F+nHR6073peU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891668; c=relaxed/simple;
	bh=egG7NOMgE84DrrDlDVX+Vuena/oQ6IhL97E+DVT0cf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZEurzIJjxeuSdSHdyQaK6mUKl5UenDPJr3fgtwQ2JkFre5MfaH1sX/PWsPdz+xlT8v4R2StC0omzWUpXg+jdCwdCWDPNpTGSAxo8K/Q8NtZ2k6Y7DWhrA+IGdp8BsIO9ANp+BJZ05uP8+h5RIdZmPPrGiaOuaOVyV0/dDPusvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWiyNXH8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C023C4CEF7;
	Thu, 12 Feb 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770891667;
	bh=egG7NOMgE84DrrDlDVX+Vuena/oQ6IhL97E+DVT0cf8=;
	h=From:To:Cc:Subject:Date:From;
	b=EWiyNXH8yHHRV80tkDxmDIcpGtGG7nVONGyiyEJRE1d63yGC6dQ6qiL8rhQEzhKnD
	 /nJC+BZYpmg1qJXqVYwR6KMoCkF3SM/8cXln4qf3WNQHge0ZxW1TNhSQCYXjvFiPxJ
	 ydvrxM6QG+BPB7JU6pzREKnEQm6Ia7HYGm9iqmK6x6uZYMLmfzChZw2+b3en9L7vQH
	 Km+yvmrPjww7LnsDt40SIjRgT9vDQVBjpIHRAtYoOED3K4LjMDIFFw20pyobEXzN16
	 5lyPK9C95Q1V7ebHmhbbBxt+HUORTlWmRBKMigr+oQ6SrwCZzm8IuPbgkTha79hQCN
	 4HwzclPXVjLhQ==
From: Arnd Bergmann <arnd@kernel.org>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x509: select CONFIG_CRYPTO_LIB_SHA256
Date: Thu, 12 Feb 2026 11:20:55 +0100
Message-Id: <20260212102102.429181-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4053-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: E027412C6FE
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The x509 public key code gained a dependency on the sha256 hash
implementation, causing a rare link time failure in randconfig
builds:

arm-linux-gnueabi-ld: crypto/asymmetric_keys/x509_public_key.o: in function `x509_get_sig_params':
x509_public_key.c:(.text.x509_get_sig_params+0x12): undefined reference to `sha256'
arm-linux-gnueabi-ld: (sha256): Unknown destination type (ARM/Thumb) in crypto/asymmetric_keys/x509_public_key.o
x509_public_key.c:(.text.x509_get_sig_params+0x12): dangerous relocation: unsupported relocation

Select the necessary library code from Kconfig.

Fixes: 2c62068ac86b ("x509: Separately calculate sha256 for blacklist")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 crypto/asymmetric_keys/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 1dae2232fe9a..e50bd9b3e27b 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -27,6 +27,7 @@ config X509_CERTIFICATE_PARSER
 	tristate "X.509 certificate parser"
 	depends on ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select ASN1
+	select CRYPTO_LIB_SHA256
 	select OID_REGISTRY
 	help
 	  This option provides support for parsing X.509 format blobs for key
-- 
2.39.5


