Return-Path: <keyrings+bounces-1987-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA19751A0
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 14:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B551F22D25
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C705E192D74;
	Wed, 11 Sep 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdohdKXw"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D84C192D66;
	Wed, 11 Sep 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056757; cv=none; b=pjiXD/rFjQnmez/sZJvjMxQLljcwW4h3DkxgLFlMa61UTfrHmQ+TcqmO6cGA24L0kXo4AB2t0zxQnvFVU4ijoNMkmOmU6vBxydqspYYNeGFm1RT3hGabSdAoP3a5iFwT23MasXOb5oC1KeZcT2Qnbryz6sH0X3nGI0v1mMsTwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056757; c=relaxed/simple;
	bh=0EI2o99U8hIYQ8IQUYKjLd+GIVu3vHz4KT+prER26z0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=t6MuNjjwikNzgS3okdlW4Zx1M3t1Rxv+jhXFdnmST0Q10Ckp46hsnG+4UcfRyEdgR6w8berOfysMk2GxIt4UhPQNzjVowxIfX4dtgBmIVAKlPVgKTeuWSwT8LXAxy9SEH9+GpqF/RID42/41Vk3l+6r2SLNzsgRWPhppeZNEcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdohdKXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EBFC4CEC5;
	Wed, 11 Sep 2024 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726056757;
	bh=0EI2o99U8hIYQ8IQUYKjLd+GIVu3vHz4KT+prER26z0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=kdohdKXwrcp2XkrbZcoa3oJp3pWTE9KwcaVtnmSJZCBm99I8Ptkm9snxyojMmfrFp
	 cL/AzJfbxLcgRu1+TgyrYHSZyI02RcByogUtAx0Q4sIrK4y+PfyJ0VrWUqrnPJBssQ
	 tX0e1WYmZjwink3cV9/qt6XJClmonArB4N9Ky32H9UW6R+t5pl9AlDa5btxegPcIsF
	 ZKQa/yNS0BGL2IISZYOOPCK7GmQ6Na9BA9qrXeP1xANT6zsjNO2IZaEMHTeBrUz5ZI
	 +wl5x+JhXTa3QQmR17sBSLhZUw/Z46IgsgB1B6RSYEymom2nC1kSlRJMJ4l7dxflFK
	 O02HEBs7VAp9g==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 15:12:33 +0300
Message-Id: <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
In-Reply-To: <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
> began a transition of asymmetric sign/verify operations from
> crypto_akcipher to a new crypto_sig frontend.
>
> Internally, the crypto_sig frontend still uses akcipher_alg as backend,
> however:
>
>    "The link between sig and akcipher is meant to be temporary.  The
>     plan is to create a new low-level API for sig and then migrate
>     the signature code over to that from akcipher."
>     https://lore.kernel.org/r/ZrG6w9wsb-iiLZIF@gondor.apana.org.au/
>
>    "having a separate alg for sig is definitely where we want to
>     be since there is very little that the two types actually share."
>     https://lore.kernel.org/r/ZrHlpz4qnre0zWJO@gondor.apana.org.au/
>
> Take the next step of that migration and augment the crypto_sig frontend
> with a sig_alg backend to which all algorithms can be moved.
>
> During the migration, there will briefly be signature algorithms that
> are still based on crypto_akcipher, whilst others are already based on
> crypto_sig.  Allow for that by building a fork into crypto_sig_*() API
> calls (i.e. crypto_sig_maxsize() and friends) such that one of the two
> backends is selected based on the transform's cra_type.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  Documentation/crypto/api-sig.rst      |  15 +++
>  Documentation/crypto/api.rst          |   1 +
>  Documentation/crypto/architecture.rst |   2 +
>  crypto/sig.c                          | 143 +++++++++++++++++++++++++-
>  crypto/testmgr.c                      | 115 +++++++++++++++++++++
>  crypto/testmgr.h                      |  13 +++
>  include/crypto/internal/sig.h         |  80 ++++++++++++++
>  include/crypto/sig.h                  |  61 +++++++++++
>  include/uapi/linux/cryptouser.h       |   5 +
>  9 files changed, 433 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/crypto/api-sig.rst
>
> diff --git a/Documentation/crypto/api-sig.rst b/Documentation/crypto/api-=
sig.rst
> new file mode 100644
> index 000000000000..e5e87e106884
> --- /dev/null
> +++ b/Documentation/crypto/api-sig.rst
> @@ -0,0 +1,15 @@
> +Asymmetric Signature Algorithm Definitions
> +------------------------------------------
> +
> +.. kernel-doc:: include/crypto/sig.h
> +   :functions: sig_alg
> +
> +Asymmetric Signature API
> +------------------------
> +
> +.. kernel-doc:: include/crypto/sig.h
> +   :doc: Generic Public Key Signature API
> +
> +.. kernel-doc:: include/crypto/sig.h
> +   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey cr=
ypto_sig_set_privkey crypto_sig_maxsize crypto_sig_sign crypto_sig_verify
> +
> diff --git a/Documentation/crypto/api.rst b/Documentation/crypto/api.rst
> index ff31c30561d4..8b2a90521886 100644
> --- a/Documentation/crypto/api.rst
> +++ b/Documentation/crypto/api.rst
> @@ -10,4 +10,5 @@ Programming Interface
>     api-digest
>     api-rng
>     api-akcipher
> +   api-sig
>     api-kpp
> diff --git a/Documentation/crypto/architecture.rst b/Documentation/crypto=
/architecture.rst
> index 646c3380a7ed..15dcd62fd22f 100644
> --- a/Documentation/crypto/architecture.rst
> +++ b/Documentation/crypto/architecture.rst
> @@ -214,6 +214,8 @@ the aforementioned cipher types:
> =20
>  -  CRYPTO_ALG_TYPE_AKCIPHER Asymmetric cipher
> =20
> +-  CRYPTO_ALG_TYPE_SIG Asymmetric signature
> +
>  -  CRYPTO_ALG_TYPE_PCOMPRESS Enhanced version of
>     CRYPTO_ALG_TYPE_COMPRESS allowing for segmented compression /
>     decompression instead of performing the operation on one segment

I'd split the documentation update. It's not strictly necessary as it is
still part of crypto (e.g. not kernel-parameters.txt) but they are still
too disjoint logical artifacts that you need to review separately.

> diff --git a/crypto/sig.c b/crypto/sig.c
> index 7645bedf3a1f..4f36ceb7a90b 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c
> @@ -21,14 +21,38 @@
> =20
>  static const struct crypto_type crypto_sig_type;
> =20
> +static void crypto_sig_exit_tfm(struct crypto_tfm *tfm)
> +{
> +	struct crypto_sig *sig =3D __crypto_sig_tfm(tfm);
> +	struct sig_alg *alg =3D crypto_sig_alg(sig);
> +
> +	alg->exit(sig);
> +}
> +
>  static int crypto_sig_init_tfm(struct crypto_tfm *tfm)
>  {
>  	if (tfm->__crt_alg->cra_type !=3D &crypto_sig_type)
>  		return crypto_init_akcipher_ops_sig(tfm);
> =20
> +	struct crypto_sig *sig =3D __crypto_sig_tfm(tfm);
> +	struct sig_alg *alg =3D crypto_sig_alg(sig);
> +
> +	if (alg->exit)
> +		sig->base.exit =3D crypto_sig_exit_tfm;
> +
> +	if (alg->init)
> +		return alg->init(sig);

1. alg->exit =3D=3D NULL, alg->init =3D=3D NULL
2. alg->exit !=3D NULL, alg->init =3D=3D NULL
3. alg->exit =3D=3D NULL, alg->init !=3D NULL

Which of the three are legit use of the API and which are not?

BR, Jarkko

