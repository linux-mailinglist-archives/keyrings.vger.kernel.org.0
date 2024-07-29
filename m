Return-Path: <keyrings+bounces-1825-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A912993F748
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCFC51C20A9F
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669ED14A0B7;
	Mon, 29 Jul 2024 14:09:37 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEBE1E515;
	Mon, 29 Jul 2024 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262177; cv=none; b=L2AHy2BK94rgEUnrWEBzERzvnn21YB6EVo85PWUQSP8jrn+v6pPa7UIivb5A7vbJjmVSfOESp4KC8v2K33lulYJmSGTXwdRlq+EblyRKrW65Y4EAMPm1vWxFZa3Rzj+oYyNYNtdG5u2RMOeZL2k1g6HnmRWLEYmkhUseheEiNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262177; c=relaxed/simple;
	bh=RcAAJ8fmfX2NcwwdaRaXyVBwYdu794CqKr587/Wkr2A=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=D7SLyur4PytigjLan+pWSNUpz2Mx0FGCC6RHQH3c7C0hVZtbuyupdPXQdAimnYWy65t8sFvs30USHpwf44qGd7OxkFC5e6b9FY/Gs6ujZIFNY6toLTyqIB3Ubkh+0FiIlE2zXGzf1iPWqihMZ5LSvRkeGT2O0Q7KAEBCKcbHG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id B04DC101917BB;
	Mon, 29 Jul 2024 16:09:32 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 8383562FAD29;
	Mon, 29 Jul 2024 16:09:32 +0200 (CEST)
X-Mailbox-Line: From 919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd Mon Sep 17 00:00:00 2001
Message-ID: <919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd.1722260176.git.lukas@wunner.de>
In-Reply-To: <cover.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 29 Jul 2024 15:49:00 +0200
Subject: [PATCH 3/5] crypto: ecdsa - Avoid signed integer overflow on
 signature decoding
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

When extracting a signature component r or s from an ASN.1-encoded
integer, ecdsa_get_signature_rs() subtracts the expected length
"bufsize" from the ASN.1 length "vlen" (both of unsigned type size_t)
and stores the result in "diff" (of signed type ssize_t).

This results in a signed integer overflow if vlen > SSIZE_MAX + bufsize.

The kernel is compiled with -fno-strict-overflow, which implies -fwrapv,
meaning signed integer overflow is not undefined behavior.  And the
function does check for overflow:

       if (-diff >= bufsize)
               return -EINVAL;

So the code is fine in principle but not very obvious.  In the future it
might trigger a false-positive with CONFIG_UBSAN_SIGNED_WRAP=y.

Avoid by comparing the two unsigned variables directly and erroring out
if "vlen" is too large.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/ecdsa.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index f63731fb7535..03f608132242 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -35,29 +35,20 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
 				  const void *value, size_t vlen, unsigned int ndigits)
 {
 	size_t bufsize = ndigits * sizeof(u64);
-	ssize_t diff = vlen - bufsize;
 	const char *d = value;
 
-	if (!value || !vlen)
+	if (!value || !vlen || vlen > bufsize + 1)
 		return -EINVAL;
 
-	/* diff = 0: 'value' has exacly the right size
-	 * diff > 0: 'value' has too many bytes; one leading zero is allowed that
-	 *           makes the value a positive integer; error on more
-	 * diff < 0: 'value' is missing leading zeros
-	 */
-	if (diff > 0) {
+	if (vlen > bufsize) {
 		/* skip over leading zeros that make 'value' a positive int */
 		if (*d == 0) {
 			vlen -= 1;
-			diff--;
 			d++;
-		}
-		if (diff)
+		} else {
 			return -EINVAL;
+		}
 	}
-	if (-diff >= bufsize)
-		return -EINVAL;
 
 	ecc_digits_from_bytes(d, vlen, dest, ndigits);
 
-- 
2.43.0


