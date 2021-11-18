Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4AD45564A
	for <lists+keyrings@lfdr.de>; Thu, 18 Nov 2021 09:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244237AbhKRIL0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 Nov 2021 03:11:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:19266 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244233AbhKRILD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 Nov 2021 03:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637222876;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pqxqeDLYvduBqgPCaONKS31VBdYNk/GP5KTwPLPfQJE=;
    b=e4TfzP/RSBFBhnYFpBG0Oz/NFSBdc86BMUSY4fs9cnwFrdsPztGri2n8/50l5cnp14
    F8F5ozqprk8iyO//8YFnEQq5WmogWtbBGNHVUf7PDKxuulPTj0GHxcRFYdfBpyfGiGpa
    61h2yC0qE8nKtycvwukgutOH1BhY+ofPCb1DgfkWuAyMgLFUsptPAVru0dd9Yn3Tlw0P
    /FkRt5wEtNuSH78oLrtUDNN/kkcQ5fk73XoYRot1tR/AFYXYe/Q7jHSwM+FDuU2m88F4
    VNDVG6XoYEgA0yir4ebvzY7djV/nnMJnjU1U30/GvssOPG1u/KInw4Y+V3ke2fLvAU6Z
    rAXQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPbJvScPP/G"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAI87toU9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 18 Nov 2021 09:07:55 +0100 (CET)
From:   Stephan Mueller <smueller@chronox.de>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     herbert@gondor.apana.org.au, Jarkko Sakkinen <jarkko@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: Re: [PATCH v3 2/4] crypto: add SP800-108 counter key derivation function
Date:   Thu, 18 Nov 2021 09:07:55 +0100
Message-ID: <3820150.6QZi0asr2n@tauon.chronox.de>
In-Reply-To: <YZVTx01YyvCsPc9i@gmail.com>
References: <2589009.vuYhMxLoTh@positron.chronox.de> <3412396.dWV9SEqChM@positron.chronox.de> <YZVTx01YyvCsPc9i@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Am Mittwoch, 17. November 2021, 20:11:03 CET schrieb Eric Biggers:

Hi Eric,

thanks for your comments.

> On Mon, Nov 15, 2021 at 09:43:13AM +0100, Stephan M=FCller wrote:
> > SP800-108 defines three KDFs - this patch provides the counter KDF
> > implementation.
> >=20
> > The KDF is implemented as a service function where the caller has to
> > maintain the hash / HMAC state. Apart from this hash/HMAC state, no
> > additional state is required to be maintained by either the caller or
> > the KDF implementation.
> >=20
> > The key for the KDF is set with the crypto_kdf108_setkey function which
> > is intended to be invoked before the caller requests a key derivation
> > operation via crypto_kdf108_ctr_generate.
> >=20
> > SP800-108 allows the use of either a HMAC or a hash as crypto primitive
> > for the KDF. When a HMAC primtive is intended to be used,
> > crypto_kdf108_setkey must be used to set the HMAC key. Otherwise, for a
> > hash crypto primitve crypto_kdf108_ctr_generate can be used immediately
> > after allocating the hash handle.
> >=20
> > Signed-off-by: Stephan Mueller <smueller@chronox.de>
> > ---
> >=20
> >  crypto/Kconfig                |   7 ++
> >  crypto/Makefile               |   5 ++
> >  crypto/kdf_sp800108.c         | 149 ++++++++++++++++++++++++++++++++++
> >  include/crypto/kdf_sp800108.h |  61 ++++++++++++++
> >  4 files changed, 222 insertions(+)
> >  create mode 100644 crypto/kdf_sp800108.c
> >  create mode 100644 include/crypto/kdf_sp800108.h
> >=20
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index 285f82647d2b..09c393a57b58 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -1845,6 +1845,13 @@ config CRYPTO_JITTERENTROPY
> >=20
> >  	  random numbers. This Jitterentropy RNG registers with
> >  	  the kernel crypto API and can be used by any caller.
> >=20
> > +config CRYPTO_KDF800108_CTR
> > +	tristate "Counter KDF (SP800-108)"
> > +	select CRYPTO_HASH
> > +	help
> > +	  Enable the key derivation function in counter mode compliant to
> > +	  SP800-108.
>=20
> These are just some library functions, so they shouldn't be user-selectab=
le.

Ok, I will remove the user-visible entry in the kernel configuration.

> > +/*
> > + * The seeding of the KDF
> > + */
> > +int crypto_kdf108_setkey(struct crypto_shash *kmd,
> > +			 const u8 *key, size_t keylen,
> > +			 const u8 *ikm, size_t ikmlen)
> > +{
> > +	unsigned int ds =3D crypto_shash_digestsize(kmd);
> > +
> > +	/* SP800-108 does not support IKM */
> > +	if (ikm || ikmlen)
> > +		return -EINVAL;
>=20
> Why have the ikm parameter if it's not supported?

The original idea is that we have a common function declaration for SP800-1=
08=20
and HKDF. I am still thinking that in the long run, a KDF template support =
may=20
make sense. In this case, a common function declaration would be needed for=
=20
all KDF implementations.

=46urthermore, the test code can be shared between the different KDFs when =
we=20
allow the ikm/ikmlen parameter for this function.
>=20
> > +	/*
> > +	 * We require that we operate on a MAC -- if we do not operate on a
> > +	 * MAC, this function returns an error.
> > +	 */
> > +	return crypto_shash_setkey(kmd, key, keylen);
> > +}
> > +EXPORT_SYMBOL(crypto_kdf108_setkey);
>=20
> Well, crypto_shash_setkey() will succeed if the hash algorithm takes a
> "key". That doesn't necessarily mean that it's a MAC.	It could be crc32 or
> xxhash64, for example; those interpret the "key" as the initial value.

Agreed. But I am not sure a check in this regard would be needed considerin=
g=20
that this KDF is only an internal service function.

I have updated the comment accordingly.
>=20
> > +static int __init crypto_kdf108_init(void)
> > +{
> > +	int ret =3D kdf_test(&kdf_ctr_hmac_sha256_tv_template[0],=20
"hmac(sha256)",
> > +			   crypto_kdf108_setkey, crypto_kdf108_ctr_generate);
> > +
> > +	if (ret)
> > +		pr_warn("alg: self-tests for CTR-KDF (hmac(sha256)) failed=20
(rc=3D%d)\n",
> > +			ret);
>=20
> This should be a WARN() since it indicates a kernel bug.

Changed. Considering that the test result behavior should be identical to=20
testmgr.c, I have added also the panic() call in case of fips_enabled.

Thanks a lot for your review.
>=20
> - Eric


Ciao
Stephan


