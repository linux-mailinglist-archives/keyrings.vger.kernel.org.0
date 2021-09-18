Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8AC4102F7
	for <lists+keyrings@lfdr.de>; Sat, 18 Sep 2021 04:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhIRC0u (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Sep 2021 22:26:50 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:53677 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231142AbhIRC0t (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Sep 2021 22:26:49 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Uojv9nD_1631931922;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0Uojv9nD_1631931922)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 18 Sep 2021 10:25:23 +0800
Subject: Re: [PATCH v3] pkcs7: make parser enable SM2 and SM3 algorithms
 combination
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20210624094705.48673-1-tianjia.zhang@linux.alibaba.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <ba6bdc45-d0f1-2a33-4ccd-67c2739567a3@linux.alibaba.com>
Date:   Sat, 18 Sep 2021 10:25:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210624094705.48673-1-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

ping.

On 6/24/21 5:47 PM, Tianjia Zhang wrote:
> Support parsing the message signature of the SM2 and SM3 algorithm
> combination. This group of algorithms has been well supported. One
> of the main users is module signature verification.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>   crypto/asymmetric_keys/pkcs7_parser.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 967329e0a07b..6cf6c4552c11 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -248,6 +248,9 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
>   	case OID_sha224:
>   		ctx->sinfo->sig->hash_algo = "sha224";
>   		break;
> +	case OID_sm3:
> +		ctx->sinfo->sig->hash_algo = "sm3";
> +		break;
>   	default:
>   		printk("Unsupported digest algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;
> @@ -269,6 +272,10 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>   		ctx->sinfo->sig->pkey_algo = "rsa";
>   		ctx->sinfo->sig->encoding = "pkcs1";
>   		break;
> +	case OID_SM2_with_SM3:
> +		ctx->sinfo->sig->pkey_algo = "sm2";
> +		ctx->sinfo->sig->encoding = "raw";
> +		break;
>   	default:
>   		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>   		return -ENOPKG;
> 
