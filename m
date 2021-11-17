Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50EE454F8A
	for <lists+keyrings@lfdr.de>; Wed, 17 Nov 2021 22:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240717AbhKQVsg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 17 Nov 2021 16:48:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:46590 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232906AbhKQVsg (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 17 Nov 2021 16:48:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221276007"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="221276007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 13:45:37 -0800
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="586836016"
Received: from ankushj1-mobl.amr.corp.intel.com ([10.251.8.192])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 13:45:36 -0800
Date:   Wed, 17 Nov 2021 13:45:35 -0800 (PST)
From:   Mat Martineau <mathew.j.martineau@linux.intel.com>
To:     =?ISO-8859-15?Q?Stephan_M=FCller?= <smueller@chronox.de>
cc:     herbert@gondor.apana.org.au, ebiggers@kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: Re: [PATCH v3 4/4] security: DH - use KDF implementation from crypto
 API
In-Reply-To: <9271627.eNJFYEL58v@positron.chronox.de>
Message-ID: <1a332942-c5ec-b317-ceac-a48dcdf45e46@linux.intel.com>
References: <2589009.vuYhMxLoTh@positron.chronox.de> <9271627.eNJFYEL58v@positron.chronox.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1506706538-1637185536=:51702"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1506706538-1637185536=:51702
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Nov 2021, Stephan Müller wrote:

> The kernel crypto API provides the SP800-108 counter KDF implementation.
> Thus, the separate implementation provided as part of the keys subsystem
> can be replaced with calls to the KDF offered by the kernel crypto API.
>
> The keys subsystem uses the counter KDF with a hash primitive. Thus,
> it only uses the call to crypto_kdf108_ctr_generate.
>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>
> ---
> security/keys/Kconfig |  2 +-
> security/keys/dh.c    | 97 +++++++------------------------------------
> 2 files changed, 15 insertions(+), 84 deletions(-)
>
> diff --git a/security/keys/Kconfig b/security/keys/Kconfig
> index 64b81abd087e..969122c7b92f 100644
> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -109,7 +109,7 @@ config KEY_DH_OPERATIONS
>        bool "Diffie-Hellman operations on retained keys"
>        depends on KEYS
>        select CRYPTO
> -       select CRYPTO_HASH
> +       select CRYPTO_KDF800108_CTR
>        select CRYPTO_DH
>        help
> 	 This option provides support for calculating Diffie-Hellman
> diff --git a/security/keys/dh.c b/security/keys/dh.c
> index 56e12dae4534..46fa442b81ec 100644
> --- a/security/keys/dh.c
> +++ b/security/keys/dh.c
> @@ -11,6 +11,7 @@
> #include <crypto/hash.h>
> #include <crypto/kpp.h>
> #include <crypto/dh.h>
> +#include <crypto/kdf_sp800108.h>
> #include <keys/user-type.h>
> #include "internal.h"
>
> @@ -79,16 +80,9 @@ static void dh_crypto_done(struct crypto_async_request *req, int err)
> 	complete(&compl->completion);
> }
>
> -struct kdf_sdesc {
> -	struct shash_desc shash;
> -	char ctx[];
> -};
> -
> -static int kdf_alloc(struct kdf_sdesc **sdesc_ret, char *hashname)
> +static int kdf_alloc(struct crypto_shash **hash, char *hashname)
> {
> 	struct crypto_shash *tfm;
> -	struct kdf_sdesc *sdesc;
> -	int size;
> 	int err;
>
> 	/* allocate synchronous hash */
> @@ -102,14 +96,7 @@ static int kdf_alloc(struct kdf_sdesc **sdesc_ret, char *hashname)
> 	if (crypto_shash_digestsize(tfm) == 0)
> 		goto out_free_tfm;

With the sdesc allocation failure path removed below, there's only one use 
of the 'err' variable and the out_free_tfm code path. I suggest furthering 
the cleanup by removing err and the goto path, and moving the 
crypto_free_shash() and return -EINVAL here (where the goto currently is).

-Mat


>
> -	err = -ENOMEM;
> -	size = sizeof(struct shash_desc) + crypto_shash_descsize(tfm);
> -	sdesc = kmalloc(size, GFP_KERNEL);
> -	if (!sdesc)
> -		goto out_free_tfm;
> -	sdesc->shash.tfm = tfm;
> -
> -	*sdesc_ret = sdesc;
> +	*hash = tfm;
>
> 	return 0;
>
> @@ -118,76 +105,20 @@ static int kdf_alloc(struct kdf_sdesc **sdesc_ret, char *hashname)
> 	return err;
> }
>
> -static void kdf_dealloc(struct kdf_sdesc *sdesc)
> -{
> -	if (!sdesc)
> -		return;
> -
> -	if (sdesc->shash.tfm)
> -		crypto_free_shash(sdesc->shash.tfm);
> -
> -	kfree_sensitive(sdesc);
> -}
> -
> -/*
> - * Implementation of the KDF in counter mode according to SP800-108 section 5.1
> - * as well as SP800-56A section 5.8.1 (Single-step KDF).
> - *
> - * SP800-56A:
> - * The src pointer is defined as Z || other info where Z is the shared secret
> - * from DH and other info is an arbitrary string (see SP800-56A section
> - * 5.8.1.2).
> - *
> - * 'dlen' must be a multiple of the digest size.
> - */
> -static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
> -		   u8 *dst, unsigned int dlen)
> +static void kdf_dealloc(struct crypto_shash *hash)
> {
> -	struct shash_desc *desc = &sdesc->shash;
> -	unsigned int h = crypto_shash_digestsize(desc->tfm);
> -	int err = 0;
> -	u8 *dst_orig = dst;
> -	__be32 counter = cpu_to_be32(1);
> -
> -	while (dlen) {
> -		err = crypto_shash_init(desc);
> -		if (err)
> -			goto err;
> -
> -		err = crypto_shash_update(desc, (u8 *)&counter, sizeof(__be32));
> -		if (err)
> -			goto err;
> -
> -		if (src && slen) {
> -			err = crypto_shash_update(desc, src, slen);
> -			if (err)
> -				goto err;
> -		}
> -
> -		err = crypto_shash_final(desc, dst);
> -		if (err)
> -			goto err;
> -
> -		dlen -= h;
> -		dst += h;
> -		counter = cpu_to_be32(be32_to_cpu(counter) + 1);
> -	}
> -
> -	return 0;
> -
> -err:
> -	memzero_explicit(dst_orig, dlen);
> -	return err;
> +	if (hash)
> +		crypto_free_shash(hash);
> }
>
> -static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
> +static int keyctl_dh_compute_kdf(struct crypto_shash *hash,
> 				 char __user *buffer, size_t buflen,
> 				 uint8_t *kbuf, size_t kbuflen)
> {
> +	struct kvec kbuf_iov = { .iov_base = kbuf, .iov_len = kbuflen };
> 	uint8_t *outbuf = NULL;
> 	int ret;
> -	size_t outbuf_len = roundup(buflen,
> -				    crypto_shash_digestsize(sdesc->shash.tfm));
> +	size_t outbuf_len = roundup(buflen, crypto_shash_digestsize(hash));
>
> 	outbuf = kmalloc(outbuf_len, GFP_KERNEL);
> 	if (!outbuf) {
> @@ -195,7 +126,7 @@ static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
> 		goto err;
> 	}
>
> -	ret = kdf_ctr(sdesc, kbuf, kbuflen, outbuf, outbuf_len);
> +	ret = crypto_kdf108_ctr_generate(hash, &kbuf_iov, 1, outbuf, outbuf_len);
> 	if (ret)
> 		goto err;
>
> @@ -224,7 +155,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
> 	struct kpp_request *req;
> 	uint8_t *secret;
> 	uint8_t *outbuf;
> -	struct kdf_sdesc *sdesc = NULL;
> +	struct crypto_shash *hash = NULL;
>
> 	if (!params || (!buffer && buflen)) {
> 		ret = -EINVAL;
> @@ -257,7 +188,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
> 		}
>
> 		/* allocate KDF from the kernel crypto API */
> -		ret = kdf_alloc(&sdesc, hashname);
> +		ret = kdf_alloc(&hash, hashname);
> 		kfree(hashname);
> 		if (ret)
> 			goto out1;
> @@ -367,7 +298,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
> 			goto out6;
> 		}
>
> -		ret = keyctl_dh_compute_kdf(sdesc, buffer, buflen, outbuf,
> +		ret = keyctl_dh_compute_kdf(hash, buffer, buflen, outbuf,
> 					    req->dst_len + kdfcopy->otherinfolen);
> 	} else if (copy_to_user(buffer, outbuf, req->dst_len) == 0) {
> 		ret = req->dst_len;
> @@ -386,7 +317,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
> out2:
> 	dh_free_data(&dh_inputs);
> out1:
> -	kdf_dealloc(sdesc);
> +	kdf_dealloc(hash);
> 	return ret;
> }
>
> -- 
> 2.33.1
>
>
>
>
>

--
Mat Martineau
Intel
--0-1506706538-1637185536=:51702--
