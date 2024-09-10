Return-Path: <keyrings+bounces-1966-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A57973BDC
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59CA8B26B3B
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3CD1A2C04;
	Tue, 10 Sep 2024 15:26:02 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41641A01CA;
	Tue, 10 Sep 2024 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981962; cv=none; b=Rav8VcPUzIrAktfYWc+w2LQYIb94d31hWvnjNIoLEcg475fqTI5agq6TD/kkx/+yI9ZV3rFO7/TmLydePXFf6/64+C9HfjsFv9Gn92/Q0OIKtazIioxXFe905uDG5FODXdO20NVFoNnWQeF3Zt2srUFhW1KcPkTC6jN7ZKpGDPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981962; c=relaxed/simple;
	bh=UuNWLOkpN2Kr6+gI0jyf4qB6UU6KAPybbT6dZ4y3R5w=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=sScP4DcSH5ZtPW/dPrQLgLqWkheeTAgaO17Hz5eghgTf/PiYqkQiN3an/1H81E310ILm05GV7OiiqavwX7dvb4I1N3B+MGHBxranUsbLOxoNSZGDjKc6KNikGWlt8uqyNL9D6oTFwPnzPL7CZPFqDrnyOV6nPWvudLZRx1WLy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 8943D1019178F;
	Tue, 10 Sep 2024 17:25:58 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 68DD360A8B01;
	Tue, 10 Sep 2024 17:25:58 +0200 (CEST)
X-Mailbox-Line: From d5018797f813f8baae02954dabf6df167324fa75 Mon Sep 17 00:00:00 2001
Message-ID: <d5018797f813f8baae02954dabf6df167324fa75.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:24 +0200
Subject: [PATCH v2 14/19] crypto: ecdsa - Avoid signed integer overflow on
 signature decoding
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
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
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes v1 -> v2:
  * Add code comment explaining why vlen may be larger than bufsize (Stefan)

 crypto/ecdsa.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 3b9873f56b0a..4a0ca93c99ea 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -35,29 +35,24 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
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
+	/*
+	 * vlen may be 1 byte larger than bufsize due to a leading zero byte
+	 * (necessary if the most significant bit of the integer is set).
 	 */
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


