Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8634E1ABC2C
	for <lists+keyrings@lfdr.de>; Thu, 16 Apr 2020 11:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502721AbgDPJG4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 16 Apr 2020 05:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503247AbgDPJGX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 16 Apr 2020 05:06:23 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6092AC061A0C;
        Thu, 16 Apr 2020 02:06:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o81so3735533wmo.2;
        Thu, 16 Apr 2020 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yAv2GmlpRM4DHIRBfsgxasc2IYmBEhDxXdtOBrWJ4U8=;
        b=CDIbpLAXS1EKEN13b1kSvVLcPacISXzq1NCV1iNJQ773+hnlYxG6Is9sS4JShoc9n9
         k3G+6a27oWeEwt1pJwSRR0lOqb7uuEEBotwWpvxkLBGK4sdBUm8VpyGwZR2F5LMIYqmk
         jdGMEpxdJ/9JULk5sX11duK6rZAqJyG/z56EqlK13PYxHHxIL+8WRSUbU5ji/DGzNUGm
         HOARn5L1Ub3isaoR3g2aijZ5lSKOTG9AyfvU2TfqATFGm5A0bNt42+GLwleMkWBtAL45
         NP+kQIWlgHBldPKo/9BCkRg6xGazgJNk5fkBnBgzz39Ee28aFn0FcpL1N6kRJexGyPZ3
         9o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yAv2GmlpRM4DHIRBfsgxasc2IYmBEhDxXdtOBrWJ4U8=;
        b=nZzbtq4CDPveDMUBj3G1lX3hXqUq0j8z9TPPCkeQwyGfJVWZztEWkdSnjYExlkamxF
         eQ+sSM5lL2hEvW/baPH104LOZX9n9p76eu3zUGFFAUC5W7BtxhzXSBhQsMal5sJxYjLB
         GzjkEEa4hfohDaLjoMfAo9KV7nWsfRG6rHU8SAmyrg2zfBcPpKcUUKY3OCECJ3Cj4Apt
         m5xqvIBHsYhZi+ztWJqd6zp5c8f3BDA7KXdr1qNBIHxrq6x8js2tWLbZbZFaBOUozrjz
         Dfv6mCl0kxk8UA/PbGLbFcIk/pCARrHWrFd2ZrqBR6ibIfQ3NatT3PSK38rBEC11L0lv
         0U5A==
X-Gm-Message-State: AGi0PubZD+edKX12yOIwzjpRdTw45nXB2adw3tfgINY7nYbFeMsTE5+1
        C7NHZ9oJdggnwGZayT/7vD4=
X-Google-Smtp-Source: APiQypIT5qLrY1V6iR8ope7blS6HLhe0vatqp7eT57ABrFQv0dME7fPlM3XipHt6eXvUq16Sx0qycg==
X-Received: by 2002:a1c:e242:: with SMTP id z63mr3963633wmg.72.1587027981096;
        Thu, 16 Apr 2020 02:06:21 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id s18sm17572177wrv.2.2020.04.16.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 02:06:20 -0700 (PDT)
Date:   Thu, 16 Apr 2020 11:06:18 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Chen-Yu Tsai <wens@csie.org>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/3] crypto: Remove unnecessary memzero_explicit()
Message-ID: <20200416090618.GB29148@Red>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200414200214.1873-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414200214.1873-1-longman@redhat.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 14, 2020 at 04:02:14PM -0400, Waiman Long wrote:
> Since kfree_sensitive() will do an implicit memzero_explicit(),
> there is no need to call memzero_explicit() before it. Eliminate those
> memzero_explicit() and simplify the call sites. For better correctness,
> keylen is cleared if key memory allocation fails.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 23 +++++++-----------
>  .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 24 +++++++------------
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 14 ++++-------
>  drivers/crypto/inside-secure/safexcel_hash.c  |  3 +--
>  4 files changed, 24 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index aa4e8fdc2b32..a2bac10d2876 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
>  {
>  	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	crypto_free_sync_skcipher(op->fallback_tfm);
>  	pm_runtime_put_sync_suspend(op->ce->dev);
>  }
> @@ -391,14 +388,13 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
>  		return -EINVAL;
>  	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> +	if (unlikely(!op->key)) {
> +		op->keylen = 0;
>  		return -ENOMEM;
> +	}
>  
>  	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>  	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> @@ -416,14 +412,13 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  	if (err)
>  		return err;
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> +	if (unlikely(!op->key)) {
> +		op->keylen = 0;
>  		return -ENOMEM;
> +	}
>  
>  	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>  	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> index 5246ef4f5430..a24d567a6c36 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -249,7 +249,6 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
>  			offset = areq->cryptlen - ivsize;
>  			if (rctx->op_dir & SS_DECRYPTION) {
>  				memcpy(areq->iv, backup_iv, ivsize);
> -				memzero_explicit(backup_iv, ivsize);
>  				kfree_sensitive(backup_iv);
>  			} else {
>  				scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
> @@ -367,10 +366,7 @@ void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
>  {
>  	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	crypto_free_sync_skcipher(op->fallback_tfm);
>  	pm_runtime_put_sync(op->ss->dev);
>  }
> @@ -392,14 +388,13 @@ int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		dev_dbg(ss->dev, "ERROR: Invalid keylen %u\n", keylen);
>  		return -EINVAL;
>  	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> +	if (unlikely(!op->key))
> +		op->keylen = 0;
>  		return -ENOMEM;
> +	}
>  
>  	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>  	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> @@ -418,14 +413,13 @@ int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		return -EINVAL;
>  	}
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> +	if (unlikely(!op->key))
> +		op->keylen = 0;
>  		return -ENOMEM;
> +	}
>  
>  	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>  	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index fd1269900d67..5312bad7534e 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -341,10 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
>  {
>  	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>  
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	crypto_free_sync_skcipher(op->fallback_tfm);
>  }
>  
> @@ -368,14 +365,13 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
>  		return -EINVAL;
>  	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>  	op->keylen = keylen;
>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
> -	if (!op->key)
> +	if (unlikely(!op->key))
> +		op->keylen = 0;
>  		return -ENOMEM;
> +	}
>  
>  	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
>  }

For sun8i-ss/sun8i-ce
Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
For amlogic
Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
