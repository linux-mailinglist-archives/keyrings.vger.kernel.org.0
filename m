Return-Path: <keyrings+bounces-1523-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038828D44C7
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 07:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D846285401
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 05:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B2143C4A;
	Thu, 30 May 2024 05:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uF0QRilb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B49143878;
	Thu, 30 May 2024 05:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717046888; cv=none; b=WYBtDWJsE1vCslhCcL42A1irvYbZFz4elj35kJScfIYjI9MbKejNHdefknmwl4itOJjQ38rzP+SqRW0xbdIG+2Gc6dy2LlUd4yG0/I2WCHNBdmg0Df9TRwiXeXpftQMM/OYtj9mLEUgxZ+2pIBWgpz/0XLXQ91hqtGdnNF0p+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717046888; c=relaxed/simple;
	bh=HhxLngg+9MrDBAFyn+rA3EfB0F+kdCAVkPfHuQxHetQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BQmHbIo8Oaw0bftzIJPbqPb185N9oqZM747bnemTphmKj8rCZ3znSy1rffCmz8MzAjur2gh9ZzKn6EXW2LwQ7i1QjHlmP+gwRwaQ7eecCe4kQ32KzUiT6b3DC7+bJQBNv6NT9M3tK2wtAjDiB7G3GRZrFtnCNTv0rGBATaY1OB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uF0QRilb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2258C2BBFC;
	Thu, 30 May 2024 05:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717046888;
	bh=HhxLngg+9MrDBAFyn+rA3EfB0F+kdCAVkPfHuQxHetQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=uF0QRilbM2sgFAaAhUnAluAl9zYRZZVhp+eNAo6BunLLZqBtK2Akx+Mwj1esh7+ur
	 +TgABnHZOJYQV4xYZBsNY9QIGoXNPgghpvr6aR+QgSg3JqglS4Lt6U6KL8WrHjZAGo
	 Xh9JzZsS/oUE9xzQ6WpBRixVfC1drhy1JMbd/arutdjIuhfaoz0PCQORXTRRO1DVYx
	 xoNd7RSlrIRgSQpojujABtle0/oa2rA1dry/8s/230FOLGV5AOr6zXx0PLfgBKMRAt
	 HW7xh0JdSXrXepB8RuGfW/N2fZGZzKr9yonj6zsqzbzhzjLYrVV6IYgQawwCXO/k4d
	 EEF/5H76uz3fQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 May 2024 08:28:01 +0300
Message-Id: <D1MQBJSYUBRS.12KH2S8FUK0XS@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <lukas@wunner.de>
Subject: Re: [PATCH 1/2] crypto: ecdsa - Use ecc_digits_from_bytes to create
 hash digits array
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
X-Mailer: aerc 0.17.0
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
 <20240529230827.379111-2-stefanb@linux.ibm.com>
In-Reply-To: <20240529230827.379111-2-stefanb@linux.ibm.com>

On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
> Since ecc_digits_from_bytes will provide zeros when an insufficient numbe=
r
> of bytes are passed in the input byte array, use it to create the hash
> digits directly from the input byte array. This avoids going through an
> intermediate byte array (rawhash) that has the first few bytes filled wit=
h
> zeros.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  crypto/ecdsa.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index 258fffbf623d..fa029f36110b 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -142,10 +142,8 @@ static int ecdsa_verify(struct akcipher_request *req=
)
>  	struct ecdsa_signature_ctx sig_ctx =3D {
>  		.curve =3D ctx->curve,
>  	};
> -	u8 rawhash[ECC_MAX_BYTES];
>  	u64 hash[ECC_MAX_DIGITS];
>  	unsigned char *buffer;
> -	ssize_t diff;
>  	int ret;
> =20
>  	if (unlikely(!ctx->pub_key_set))
> @@ -164,18 +162,11 @@ static int ecdsa_verify(struct akcipher_request *re=
q)
>  	if (ret < 0)
>  		goto error;
> =20
> -	/* if the hash is shorter then we will add leading zeros to fit to ndig=
its */
> -	diff =3D bufsize - req->dst_len;
> -	if (diff >=3D 0) {
> -		if (diff)
> -			memset(rawhash, 0, diff);
> -		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
> -	} else if (diff < 0) {
> -		/* given hash is longer, we take the left-most bytes */
> -		memcpy(&rawhash, buffer + req->src_len, bufsize);
> -	}
> +	if (bufsize > req->dst_len)
> +		bufsize =3D req->dst_len;
> =20
> -	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
> +	ecc_digits_from_bytes(buffer + req->src_len, bufsize,
> +			      hash, ctx->curve->g.ndigits);
> =20
>  	ret =3D _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
> =20

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I don't think it'd be even nit-picking to say that the function
called would really need kdoc. I had to spend about 20 minutes
to reacall ecc_digits_from_bytes().

Like something to remind what, how and why... So that you can
recap quickly. Once I got grip of it (for the 2nd time) the
code itself was just fine, no complains on that.

BR, Jarkko

