Return-Path: <keyrings+bounces-1557-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9628FB8FF
	for <lists+keyrings@lfdr.de>; Tue,  4 Jun 2024 18:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B35E1F22348
	for <lists+keyrings@lfdr.de>; Tue,  4 Jun 2024 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC4143C7B;
	Tue,  4 Jun 2024 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPcmO3Bx"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E446713A25B;
	Tue,  4 Jun 2024 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518697; cv=none; b=S0QZCu99U/Kjt9JfniFL5De5kM2OHnlCy4BubgNa9Hdo0Sq18LsJC5OF2p4BmYdGijfofnUQAlsDTo3d1iYSjYR5JGOF9woTyNapA8Gfyou1BfwE5t2JH8XlP3Kl7R+sd6pXU3u7xGSr0eFr/V1VF+cmLXfXfAJ0fqgG9TALYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518697; c=relaxed/simple;
	bh=gx2z9MIvVzpD3fMjmYWHHK/bgF7kgmwdQt0O+eHtnPA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mGJnSltQUs9EwuJDW+xoTjwVk1LYFWxMWZ8u9BvmU2U+yPgzkwweG1FmPos+Cz7ithlTd1jvJp3TDxKIaQswWJH2oVx//zdKIaaZefRR34V/s91QZ6Kf/whXKjPw1UFAJ041EbVTkgjSr4eFUQih/yQtNFqdvbQLSKQynzZttNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPcmO3Bx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3C9C2BBFC;
	Tue,  4 Jun 2024 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717518696;
	bh=gx2z9MIvVzpD3fMjmYWHHK/bgF7kgmwdQt0O+eHtnPA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qPcmO3Bxoyn5nW9FJUB4gxkjQpxX+6MmsVqL8SQ8jYONwGociecl8XCM1oZL7NnUQ
	 DBsrr/5TLyue1SrorVFuOlrnnS2OIcUe5hu9mHCBgNBihvWPKweMj3B4IUq591MnMx
	 W2CTYN+i50vr9Uc1+vHPPPt/huq1+i/r4zlImccg67nIRf5AajldRibrI7kbddohgW
	 93LMSj80l9g7a7OctQgfzbiklUsN+338LZ8AGvPAc9a2gcOzHcnm+zosnM/8ynL/hW
	 4tkEh80acprZXpbSuh3aEP7uAfsp+CVPXWSlMIpbiB/iUuEOj1CJEo2oWW9v9JQ29K
	 BOQ4770sdIivg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 19:31:33 +0300
Message-Id: <D1RDKBAGB7DD.CML0Z8K8Z5KI@kernel.org>
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
 <D1MQBJSYUBRS.12KH2S8FUK0XS@kernel.org>
 <899c3637-dc2a-4c73-9b8a-91e7b4da1638@linux.ibm.com>
In-Reply-To: <899c3637-dc2a-4c73-9b8a-91e7b4da1638@linux.ibm.com>

On Thu May 30, 2024 at 3:24 PM EEST, Stefan Berger wrote:
>
>
> On 5/30/24 01:28, Jarkko Sakkinen wrote:
> > On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
> >> Since ecc_digits_from_bytes will provide zeros when an insufficient nu=
mber
> >> of bytes are passed in the input byte array, use it to create the hash
> >> digits directly from the input byte array. This avoids going through a=
n
> >> intermediate byte array (rawhash) that has the first few bytes filled =
with
> >> zeros.
> >>
> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> ---
> >>   crypto/ecdsa.c | 17 ++++-------------
> >>   1 file changed, 4 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> >> index 258fffbf623d..fa029f36110b 100644
> >> --- a/crypto/ecdsa.c
> >> +++ b/crypto/ecdsa.c
> >> @@ -142,10 +142,8 @@ static int ecdsa_verify(struct akcipher_request *=
req)
> >>   	struct ecdsa_signature_ctx sig_ctx =3D {
> >>   		.curve =3D ctx->curve,
> >>   	};
> >> -	u8 rawhash[ECC_MAX_BYTES];
> >>   	u64 hash[ECC_MAX_DIGITS];
> >>   	unsigned char *buffer;
> >> -	ssize_t diff;
> >>   	int ret;
> >>  =20
> >>   	if (unlikely(!ctx->pub_key_set))
> >> @@ -164,18 +162,11 @@ static int ecdsa_verify(struct akcipher_request =
*req)
> >>   	if (ret < 0)
> >>   		goto error;
> >>  =20
> >> -	/* if the hash is shorter then we will add leading zeros to fit to n=
digits */
> >> -	diff =3D bufsize - req->dst_len;
> >> -	if (diff >=3D 0) {
> >> -		if (diff)
> >> -			memset(rawhash, 0, diff);
> >> -		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
> >> -	} else if (diff < 0) {
> >> -		/* given hash is longer, we take the left-most bytes */
> >> -		memcpy(&rawhash, buffer + req->src_len, bufsize);
> >> -	}
> >> +	if (bufsize > req->dst_len)
> >> +		bufsize =3D req->dst_len;
> >>  =20
> >> -	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
> >> +	ecc_digits_from_bytes(buffer + req->src_len, bufsize,
> >> +			      hash, ctx->curve->g.ndigits);
> >>  =20
> >>   	ret =3D _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
> >>  =20
> >=20
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> > I don't think it'd be even nit-picking to say that the function
> > called would really need kdoc. I had to spend about 20 minutes
> > to reacall ecc_digits_from_bytes().
>
> Here's the file with all the kdocs:=20
> https://elixir.bootlin.com/linux/v6.10-rc1/source/include/crypto/internal=
/ecc.h#L67

LOL, sorry I forgot this. I think this was the 2nd time I complained
about this ;-) I'm sorry, yeah that WFM.

Just not used to this convention but I don't mind actually if it is
that way.

BR, Jarkko

