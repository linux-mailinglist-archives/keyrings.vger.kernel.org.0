Return-Path: <keyrings+bounces-2335-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD1A01161
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 01:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D93D164CF6
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 00:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479AB136A;
	Sat,  4 Jan 2025 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="mNPUDpIm"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6B433C8;
	Sat,  4 Jan 2025 00:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735951542; cv=none; b=EC8vtjxwDSXiplx0CLYXcx0yJ5UvisYm3hyR6+u3OuI5QlUWjgkfxaXdJo5tsUTlFtSlJMXBMKCBNzCjWwgFw7TLjWM1io3SmndGYSqQ4RDcf8WNUWWZOQt/RtfZ3ymwlHYulKTVs5ac2CNB1ILHJbJyJQ/ahrqhk0eQvG6fNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735951542; c=relaxed/simple;
	bh=z9ciVlNAwLFSV2H+ZVw9S3Vr5MLiKNyzCf4ACULh6Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d12SMadNlMZ5yTtsRRGSJMvO0To4SNgwz2bqGZItw/S6DD/RjWHPjrAzd9k5EAoO4Hw3uRLwWd5sU76GnLB74hl9eu04duls42lNC2QE7fc5wgf5l2aqwg1Rw8Jcj63gAcGF05Oq/2hzuRm2YOnZsgYfEyc4BRC6JjfgXMsMSIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=mNPUDpIm; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UCr4cBLWXQom82eCeY4sVn6DvRq2QaaDPgJ8bjZrJ64=; b=mNPUDpIm9Mc8E4PM+l1TKzxzEi
	3pRYVLqdKYr9Duw5aBb+WZVxCXkDKNzkXaZ5s4LLBk/p3FYAOtZ8ZVadFFTWnA9WxokHxaZxSwWz5
	AfaipBJWRLfDmxjMJXciRjtuII3QxIP1nrBzARvXnAhdLZphLEwOvmMRjbrIfOv9U0tNGP7kijTso
	erMIB1ynlClTLuhvHQnIO51yyL+XgQKc+W9mnI5La1s6puQLenzg/suJLLlD5EXalyZnUgkMp2T9G
	CQV+s/mbzpd6Q93UmU4ok8nhGjmENFEOTPxqH2v4FoSg0VUdCboZBg2qtOmBHK9FLJH+BNy2dT+te
	bG6YEw/Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tTs4z-005fPY-1w;
	Sat, 04 Jan 2025 08:45:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 04 Jan 2025 08:45:10 +0800
Date: Sat, 4 Jan 2025 08:45:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z3iElsILmoSu6FuC@gondor.apana.org.au>
References: <cover.1735236227.git.lukas@wunner.de>
 <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>

On Thu, Dec 26, 2024 at 07:08:03PM +0100, Lukas Wunner wrote:
>
> diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> index eaae7214d69b..c4f458df18ed 100644
> --- a/crypto/ecdsa-p1363.c
> +++ b/crypto/ecdsa-p1363.c
> @@ -21,7 +21,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
>  			      const void *digest, unsigned int dlen)
>  {
>  	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
> -	unsigned int keylen = crypto_sig_keysize(ctx->child);
> +	unsigned int keylen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);

This may overflow unnecessarily, please rewrite these as:

	X / 8 + !!(X & 7)

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

