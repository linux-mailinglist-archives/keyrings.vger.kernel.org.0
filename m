Return-Path: <keyrings+bounces-2585-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C50A7D26E
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 05:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55BFD3ADC39
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 03:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4817C212B0B;
	Mon,  7 Apr 2025 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ObQOpUtO"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3897290F;
	Mon,  7 Apr 2025 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995981; cv=none; b=XTYHNk+oH4Q+UaijR6lxIOy+YgXIG16SfuNFzzCpsl09gDoKrWnPHzdYUo79LeLJahNXXkQ36X5A1rCXOZEaoCaF0Qzk7tibVsHzxxnnZQ70z6Km1DQjtI1EdgfRMOWeTb8J84GR2k+E/azyi5rwQSrTmsGAPOLu4Wqf2syhDsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995981; c=relaxed/simple;
	bh=Hm8FGxRhfxG633ckCPbQQSs2gfFoytTnInv9UMTHBEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1XeWBoa3R0TnrdLI1/4BkOwGLkNIG4LfcDKqX23WDZdJTD0DtZHCir3d1fiagPbfGCBzE847QkFwIr6dKavdaVP2HZ67d2L7CPk/QkGRPYSN9SqLIRqcnyAAOZP32WNrPXe/18OVZSXQqMbmYXzTpPFLcdJJYhQHaacHN8aXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ObQOpUtO; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JpQAhn66dPy3mveuyeXogxvGzypobhfbRX1ztgaf9qA=; b=ObQOpUtOmjNSBedVJJYVoofNfp
	CkewpjanjZR3p/q7PMt7JWZwaXQ7r+E0TIv/C0n042qEpcrZZALL3KziON1IDAhr92yZfLELJktEE
	MgUZhfvaAlSmKs5uMq9yHIm0BNV3N/u5jyJmjjEPb0IPCwNMCtoeqDqIE7y1IfIzSpeB4K62jpad5
	D4oFQ4EoUJbc/eoHPgDFZS7rcN56nJgIlq2vEsncoSCbdnni5HO570AG0S4ao1OEBd5GBk2gShJSS
	Qw4L87TqeTaW556/vk8uD008e09/OJt2UJqh139tllMYkZOAxQqL4EQ+GZx9hPn1YDtFUVEYjdniT
	xSkdYMog==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1d10-00DMD8-3B;
	Mon, 07 Apr 2025 11:19:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 11:19:14 +0800
Date: Mon, 7 Apr 2025 11:19:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: x509 - Replace kmalloc() + NUL-termination with
 kzalloc()
Message-ID: <Z_NEMpXznpe4Qniq@gondor.apana.org.au>
References: <20250317104841.54336-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317104841.54336-2-thorsten.blum@linux.dev>

On Mon, Mar 17, 2025 at 11:48:41AM +0100, Thorsten Blum wrote:
> Use kzalloc() to zero out the one-element array instead of using
> kmalloc() followed by a manual NUL-termination.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

We have a new maintainer for crypto/asymmetric_keys, please make
sure he is CCed on these patches:

ASYMMETRIC KEYS
M:      David Howells <dhowells@redhat.com>
M:      Lukas Wunner <lukas@wunner.de>
M:      Ignat Korchagin <ignat@cloudflare.com>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

