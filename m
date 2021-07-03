Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F473BA6AB
	for <lists+keyrings@lfdr.de>; Sat,  3 Jul 2021 04:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhGCCJo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 2 Jul 2021 22:09:44 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:54486 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230094AbhGCCJo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 2 Jul 2021 22:09:44 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UeWX25L_1625278028;
Received: from 30.25.251.73(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UeWX25L_1625278028)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 03 Jul 2021 10:07:09 +0800
Subject: Re: [PATCH] pkcs7: support EC-RDSA/streebog in SignerInfo
To:     Elvira Khabirova <e.khabirova@omp.ru>, keyrings@vger.kernel.org,
        Vitaly Chikunov <vt@altlinux.org>
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, herbert@gondor.apana.org.au,
        dhowells@redhat.com, vt@altlinux.org
References: <20210511174744.4f3c6c59@msk1wst204>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <0091ddbc-a32d-848a-4f18-37b041a048f4@linux.alibaba.com>
Date:   Sat, 3 Jul 2021 10:07:08 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210511174744.4f3c6c59@msk1wst204>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Elvira,

On 5/11/21 10:47 PM, Elvira Khabirova wrote:
> Allow using EC-RDSA/streebog in pkcs7 certificates in a similar way
> to how it's done in the x509 parser.
> 
> This is needed e.g. for loading kernel modules signed with EC-RDSA.
> 
> Signed-off-by: Elvira Khabirova <e.khabirova@omp.ru>

Reviewed-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

I sent a similar patch to support the SM2/3 algorithm combination, which 
happened to conflict with your patch.

https://lkml.org/lkml/2021/6/24/248

If possible and you agree, I will put these two patches in a series and 
then resend.

Cheers,
Tianjia

> ---
>   crypto/asymmetric_keys/pkcs7_parser.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 967329e0a07b..39c260a04167 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -248,6 +248,12 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
>   	case OID_sha224:
>   		ctx->sinfo->sig->hash_algo = "sha224";
>   		break;
> +	case OID_gost2012Digest256:
> +		ctx->sinfo->sig->hash_algo = "streebog256";
> +		break;
> +	case OID_gost2012Digest512:
> +		ctx->sinfo->sig->hash_algo = "streebog512";
> +		break;
>   	default:
>   		printk("Unsupported digest algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;
> @@ -269,6 +275,11 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>   		ctx->sinfo->sig->pkey_algo = "rsa";
>   		ctx->sinfo->sig->encoding = "pkcs1";
>   		break;
> +	case OID_gost2012PKey256:
> +	case OID_gost2012PKey512:
> +		ctx->sinfo->sig->pkey_algo = "ecrdsa";
> +		ctx->sinfo->sig->encoding = "raw";
> +		break;
>   	default:
>   		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;
> 
