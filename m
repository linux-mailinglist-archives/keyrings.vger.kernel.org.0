Return-Path: <keyrings+bounces-2030-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C7976BCA
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 16:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51B8283A1E
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58B31885BC;
	Thu, 12 Sep 2024 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riOkLlVx"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3072209B;
	Thu, 12 Sep 2024 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150759; cv=none; b=G0RZhO8k5WTD+jSnURHXuLRUXTQB24Ux4xG4MiHsfpnD8M4pZN1QqpkHajTBNL3/f6Oz0ib+CxkyGNuIJgYuj5pdxVG4Wzw01/+l/ejD9+G2x2zX4Fu3ytAhh7dPCSqLKR+WyZegkbkj8saSrFRXM4Wn998Kb6MZZCrvAWALVHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150759; c=relaxed/simple;
	bh=1N+76OYxt4TCHaw7AeC4HG6b7ZzM/95WgGfqaDExxLs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EagioYQ1W/Dbr7Ywp3wOyaiHdKIHGe4wndZGaSAfqxiY6v0vUSkTb9v1ID7sShfjI2QgQinEi8/V1LQgjIjhB6bV5LS+uhv/5PoYC+eBdpCRfSYgu6l8qeIZRkPm/5vJn+erVN3qcaA0dkBKSUFgABt7qRRJXPOGQIEhlCr4fVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riOkLlVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CEDC4CEC3;
	Thu, 12 Sep 2024 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726150759;
	bh=1N+76OYxt4TCHaw7AeC4HG6b7ZzM/95WgGfqaDExxLs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=riOkLlVxymhCGHZ3POAMIO58a0ANEc7vWymUeEebrpb2Pje1Pk0geSTOVmbV0Vkqn
	 xQytI9DdZ8+PcqSvTp2zyQm5kDggYWDhx5bzvkN5R0BskLzvvXEsXa6I2M11ZQWEPq
	 Fa5Zdo9BA+jlqXfJ9u9AONDrtH/apO8Q0Ttjaqf4/1nMhkFyJhwvWgFrpW5z2y6Ruy
	 tsphD2l1CPnPJhcU0JXPh+yLvU251VaE30gwhNsgc7uSNDrkAKF6itsOIemZW8gHnJ
	 LSfbKFroRziLVtSKpT7InafzfDl0a9ZlOgX8E9lMZ4xortplBoZ2YRti1lkhCNwxY2
	 vaTRJSBwqS3xA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Sep 2024 17:19:15 +0300
Message-Id: <D44DDHSNZNKO.2LVIDKUHA3LGX@kernel.org>
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Eric Biggers" <ebiggers@google.com>, "Stefan
 Berger" <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>,
 "Tadeusz Struk" <tstruk@gigaio.com>, "David Howells" <dhowells@redhat.com>,
 "Andrew Zaborowski" <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
 <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org> <ZuKeHmeMRyXZHyTK@wunner.de>
In-Reply-To: <ZuKeHmeMRyXZHyTK@wunner.de>

On Thu Sep 12, 2024 at 10:54 AM EEST, Lukas Wunner wrote:
> On Wed, Sep 11, 2024 at 03:12:33PM +0300, Jarkko Sakkinen wrote:
> > >  static int crypto_sig_init_tfm(struct crypto_tfm *tfm)
> > >  {
> > >  	if (tfm->__crt_alg->cra_type !=3D &crypto_sig_type)
> > >  		return crypto_init_akcipher_ops_sig(tfm);
> > > =20
> > > +	struct crypto_sig *sig =3D __crypto_sig_tfm(tfm);
> > > +	struct sig_alg *alg =3D crypto_sig_alg(sig);
> > > +
> > > +	if (alg->exit)
> > > +		sig->base.exit =3D crypto_sig_exit_tfm;
> > > +
> > > +	if (alg->init)
> > > +		return alg->init(sig);
> >=20
> > 1. alg->exit =3D=3D NULL, alg->init =3D=3D NULL
> > 2. alg->exit !=3D NULL, alg->init =3D=3D NULL
> > 3. alg->exit =3D=3D NULL, alg->init !=3D NULL
> >=20
> > Which of the three are legit use of the API and which are not?
>
> All three are possible.  Same as crypto_akcipher_init_tfm().

Lot's of nitpicks but...

I try to understand these in detail because I rebase later on my TPM2
ECDSA patches (series last updated in April) on top of this. I'll hold
with that for the sake of less possible conflicts with this larger
series.

Many of the questions rised during the Spring about akcipher so now is
my chance to fill the dots by asking them here.

BR, Jarkko

