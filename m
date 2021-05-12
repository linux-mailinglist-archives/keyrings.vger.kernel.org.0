Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1723637BFDD
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhELOY6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:24:58 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:33506 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhELOY5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:24:57 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
        by vmicros1.altlinux.org (Postfix) with ESMTP id D107B72C8B4;
        Wed, 12 May 2021 17:23:47 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
        by imap.altlinux.org (Postfix) with ESMTPSA id 03B614A46E8;
        Wed, 12 May 2021 17:23:47 +0300 (MSK)
Date:   Wed, 12 May 2021 17:23:46 +0300
From:   Vitaly Chikunov <vt@altlinux.org>
To:     Elvira Khabirova <e.khabirova@omp.ru>
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, dhowells@redhat.com
Subject: Re: [PATCH] pkcs7: support EC-RDSA/streebog in SignerInfo
Message-ID: <20210512142346.kui3zeyheo7wlnwm@altlinux.org>
References: <20210511174744.4f3c6c59@msk1wst204>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20210511174744.4f3c6c59@msk1wst204>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 11, 2021 at 05:47:44PM +0300, Elvira Khabirova wrote:
> Allow using EC-RDSA/streebog in pkcs7 certificates in a similar way
> to how it's done in the x509 parser.
> 
> This is needed e.g. for loading kernel modules signed with EC-RDSA.
> 
> Signed-off-by: Elvira Khabirova <e.khabirova@omp.ru>

Reviewed-by: Vitaly Chikunov <vt@altlinux.org>

Thanks,

> ---
>  crypto/asymmetric_keys/pkcs7_parser.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 967329e0a07b..39c260a04167 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -248,6 +248,12 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
>  	case OID_sha224:
>  		ctx->sinfo->sig->hash_algo = "sha224";
>  		break;
> +	case OID_gost2012Digest256:
> +		ctx->sinfo->sig->hash_algo = "streebog256";
> +		break;
> +	case OID_gost2012Digest512:
> +		ctx->sinfo->sig->hash_algo = "streebog512";
> +		break;
>  	default:
>  		printk("Unsupported digest algo: %u\n", ctx->last_oid);
>  		return -ENOPKG;
> @@ -269,6 +275,11 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>  		ctx->sinfo->sig->pkey_algo = "rsa";
>  		ctx->sinfo->sig->encoding = "pkcs1";
>  		break;
> +	case OID_gost2012PKey256:
> +	case OID_gost2012PKey512:
> +		ctx->sinfo->sig->pkey_algo = "ecrdsa";
> +		ctx->sinfo->sig->encoding = "raw";
> +		break;
>  	default:
>  		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>  		return -ENOPKG;
> -- 
> 2.25.1
