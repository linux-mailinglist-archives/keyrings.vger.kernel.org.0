Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7A454DAE
	for <lists+keyrings@lfdr.de>; Wed, 17 Nov 2021 20:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240370AbhKQTOE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 17 Nov 2021 14:14:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:39776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239360AbhKQTOD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 17 Nov 2021 14:14:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C518D61AFD;
        Wed, 17 Nov 2021 19:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637176265;
        bh=VlfW1BcHNt7n+eRSHpnpMG24e4a0jUh1X6foZIcr3u4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHS71tzbkiDvTdlyBNCpbMebkSYR1vnMqSGMUtQZRyz6PMfsIeDOl5dK2ce6G8PeT
         Q8rPXMxfOPMx7zs0g1bWjYZHCgGykLmU8wC2rdJ6u9faYgLw5VR1A+g/foricb2rS2
         efGcik9cQapXk97QHck7ghLaysvrP8w65AC1Ur+NrJjQ0X/2a7T+TqhkI+YI9HrKyx
         Z9e2hoUcxWwXlYsbkHpBiM2E2LP50mY+qDrYawSnCdBvHiL7abnE1hVQH+9yB17q2W
         CNSOMOI3l0lbcNv9TgaVva/l8isa8lbaUFKKEemv1FmTFC0EI6l5fVmJ3ke94DcqGT
         CliLhoNr5p1tw==
Date:   Wed, 17 Nov 2021 11:11:03 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>
Cc:     herbert@gondor.apana.org.au, Jarkko Sakkinen <jarkko@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: Re: [PATCH v3 2/4] crypto: add SP800-108 counter key derivation
 function
Message-ID: <YZVTx01YyvCsPc9i@gmail.com>
References: <2589009.vuYhMxLoTh@positron.chronox.de>
 <3412396.dWV9SEqChM@positron.chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3412396.dWV9SEqChM@positron.chronox.de>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Nov 15, 2021 at 09:43:13AM +0100, Stephan Müller wrote:
> SP800-108 defines three KDFs - this patch provides the counter KDF
> implementation.
> 
> The KDF is implemented as a service function where the caller has to
> maintain the hash / HMAC state. Apart from this hash/HMAC state, no
> additional state is required to be maintained by either the caller or
> the KDF implementation.
> 
> The key for the KDF is set with the crypto_kdf108_setkey function which
> is intended to be invoked before the caller requests a key derivation
> operation via crypto_kdf108_ctr_generate.
> 
> SP800-108 allows the use of either a HMAC or a hash as crypto primitive
> for the KDF. When a HMAC primtive is intended to be used,
> crypto_kdf108_setkey must be used to set the HMAC key. Otherwise, for a
> hash crypto primitve crypto_kdf108_ctr_generate can be used immediately
> after allocating the hash handle.
> 
> Signed-off-by: Stephan Mueller <smueller@chronox.de>
> ---
>  crypto/Kconfig                |   7 ++
>  crypto/Makefile               |   5 ++
>  crypto/kdf_sp800108.c         | 149 ++++++++++++++++++++++++++++++++++
>  include/crypto/kdf_sp800108.h |  61 ++++++++++++++
>  4 files changed, 222 insertions(+)
>  create mode 100644 crypto/kdf_sp800108.c
>  create mode 100644 include/crypto/kdf_sp800108.h
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 285f82647d2b..09c393a57b58 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1845,6 +1845,13 @@ config CRYPTO_JITTERENTROPY
>  	  random numbers. This Jitterentropy RNG registers with
>  	  the kernel crypto API and can be used by any caller.
>  
> +config CRYPTO_KDF800108_CTR
> +	tristate "Counter KDF (SP800-108)"
> +	select CRYPTO_HASH
> +	help
> +	  Enable the key derivation function in counter mode compliant to
> +	  SP800-108.

These are just some library functions, so they shouldn't be user-selectable.

> +/*
> + * The seeding of the KDF
> + */
> +int crypto_kdf108_setkey(struct crypto_shash *kmd,
> +			 const u8 *key, size_t keylen,
> +			 const u8 *ikm, size_t ikmlen)
> +{
> +	unsigned int ds = crypto_shash_digestsize(kmd);
> +
> +	/* SP800-108 does not support IKM */
> +	if (ikm || ikmlen)
> +		return -EINVAL;

Why have the ikm parameter if it's not supported?

> +	/*
> +	 * We require that we operate on a MAC -- if we do not operate on a
> +	 * MAC, this function returns an error.
> +	 */
> +	return crypto_shash_setkey(kmd, key, keylen);
> +}
> +EXPORT_SYMBOL(crypto_kdf108_setkey);

Well, crypto_shash_setkey() will succeed if the hash algorithm takes a "key".
That doesn't necessarily mean that it's a MAC.	It could be crc32 or xxhash64,
for example; those interpret the "key" as the initial value.

> +static int __init crypto_kdf108_init(void)
> +{
> +	int ret = kdf_test(&kdf_ctr_hmac_sha256_tv_template[0], "hmac(sha256)",
> +			   crypto_kdf108_setkey, crypto_kdf108_ctr_generate);
> +
> +	if (ret)
> +		pr_warn("alg: self-tests for CTR-KDF (hmac(sha256)) failed (rc=%d)\n",
> +			ret);

This should be a WARN() since it indicates a kernel bug.

- Eric
