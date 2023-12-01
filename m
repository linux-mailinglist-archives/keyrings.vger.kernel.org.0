Return-Path: <keyrings+bounces-203-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DEC8004EF
	for <lists+keyrings@lfdr.de>; Fri,  1 Dec 2023 08:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83FF01C209DF
	for <lists+keyrings@lfdr.de>; Fri,  1 Dec 2023 07:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A57215ACF;
	Fri,  1 Dec 2023 07:44:50 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AFFA8;
	Thu, 30 Nov 2023 23:44:45 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yilin.li@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VxY7s2Y_1701416682;
Received: from 30.221.128.92(mailfrom:YiLin.Li@linux.alibaba.com fp:SMTPD_---0VxY7s2Y_1701416682)
          by smtp.aliyun-inc.com;
          Fri, 01 Dec 2023 15:44:43 +0800
Subject: Re: [PATCH] crypto: asymmetric_keys/pkcs7.asn1 - remove the
 duplicated contentType pkcs7_note_OID processing logic
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: tianjia.zhang@linux.alibaba.com, YiLin.Li@linux.alibaba.com
References: <20231111055553.103757-1-YiLin.Li@linux.alibaba.com>
From: "YiLin.Li" <YiLin.Li@linux.alibaba.com>
Message-ID: <99c010f0-3bb1-1e67-4184-6b0ce312b232@linux.alibaba.com>
Date: Fri, 1 Dec 2023 15:44:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231111055553.103757-1-YiLin.Li@linux.alibaba.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit


gently ping...
> The OID of contentType has been recorded in
> `ContentType ::= OBJECT IDENTIFIER ({ pkcs7_note_OID })`,
> so there is no need to re-extract the OID of contentType in
> `contentType ContentType ({ pkcs7_note_OID })`.
> Therefore, we need to remove the duplicated contentType
> pkcs7_note_OID processing logic.
>
> Signed-off-by: YiLin.Li <YiLin.Li@linux.alibaba.com>
> ---
>   crypto/asymmetric_keys/pkcs7.asn1 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/crypto/asymmetric_keys/pkcs7.asn1 b/crypto/asymmetric_keys/pkcs7.asn1
> index 28e1f4a41c14..3f7adec38245 100644
> --- a/crypto/asymmetric_keys/pkcs7.asn1
> +++ b/crypto/asymmetric_keys/pkcs7.asn1
> @@ -28,7 +28,7 @@ SignedData ::= SEQUENCE {
>   }
>   
>   ContentInfo ::= SEQUENCE {
> -	contentType	ContentType ({ pkcs7_note_OID }),
> +	contentType	ContentType,
>   	content		[0] EXPLICIT Data OPTIONAL
>   }
>   

