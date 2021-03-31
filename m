Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758AE350A9D
	for <lists+keyrings@lfdr.de>; Thu,  1 Apr 2021 01:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhCaXPK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Mar 2021 19:15:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232356AbhCaXOw (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 31 Mar 2021 19:14:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A284F61003;
        Wed, 31 Mar 2021 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617232492;
        bh=WjxyFBkmPm+gzU0axrCxNopetlu+vQikrjFiYWKVaX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hDFteJct3n5Xjw8DiMEynCqUmkIQiba51625hZQyML53eneKKX2S53TS/oxuychcP
         KrsMCa9pspD71Ui6U36EVOYaJe25O9LK/vbD0xYaMoOtXQ0cc1yEM99px4hJFl9o4P
         FtcxYBa92ZXgrx6+h4kYIobHxoskVh1aD8hfyNTPlA7vMylK00kPowmVxp9v3CNONi
         NvsVyrdSMuDmzhPjVqNQAd+vmmWU4GDsO52KJjzl1d+fW4FdPBs/V1YGQkF4rxsIEV
         OfIS3WKf6WdCHDsET2q9cL6HS9TqoXynk8iK0NLKlrQ181w0mIWkV5qenTfWGTFK7+
         1+wR4ulF32IKw==
Date:   Thu, 1 Apr 2021 02:14:48 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 17/18] crypto: Accept pss as valid encoding during
 signature verification
Message-ID: <YGUCaNuUFLlrX887@kernel.org>
References: <20210330202829.4825-1-varad.gautam@suse.com>
 <20210330202829.4825-18-varad.gautam@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330202829.4825-18-varad.gautam@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 30, 2021 at 10:28:28PM +0200, Varad Gautam wrote:
> Accept pss encoding for public_key_verify_signature. If
> CONFIG_CRYPTO_RSASSA_PSS is disabled, crypto_alloc_akcipher will
> fail to find a pss backend anyway.
> 
> Signed-off-by: Varad Gautam <varad.gautam@suse.com>
> ---

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

>  crypto/asymmetric_keys/public_key.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index 788a4ba1e2e7..b9cc83ba7a12 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -69,19 +69,20 @@ int software_key_determine_akcipher(const char *encoding,
>  {
>  	int n;
>  
> -	if (strcmp(encoding, "pkcs1") == 0) {
> +	if (strcmp(encoding, "pkcs1") == 0 || strcmp(encoding, "pss") == 0) {
>  		/* The data wangled by the RSA algorithm is typically padded
>  		 * and encoded in some manner, such as EMSA-PKCS1-1_5 [RFC3447
> -		 * sec 8.2].
> +		 * sec 8.2] or EMSA-PSS [RFC8017 sec 9.1].
>  		 */
>  		if (!hash_algo)
>  			n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
> -				     "pkcs1pad(%s)",
> +				     "%spad(%s)",
> +				     encoding,
>  				     pkey->pkey_algo);
>  		else
>  			n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
> -				     "pkcs1pad(%s,%s)",
> -				     pkey->pkey_algo, hash_algo);
> +				     "%spad(%s,%s)",
> +				     encoding, pkey->pkey_algo, hash_algo);
>  		return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
>  	}
>  
> @@ -363,6 +364,13 @@ int public_key_verify_signature(const struct public_key *pkey,
>  			goto error_free_key;
>  	}
>  
> +	if (strcmp(sig->encoding, "pss") == 0) {
> +		ret = crypto_akcipher_set_sig_params(tfm, sig, sizeof(*sig));
> +		if (ret) {
> +			goto error_free_key;
> +		}
> +	}
> +
>  	sg_init_table(src_sg, 2);
>  	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
>  	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
> -- 
> 2.30.2
> 
> 
