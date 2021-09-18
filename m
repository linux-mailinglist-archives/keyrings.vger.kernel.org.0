Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698974102FA
	for <lists+keyrings@lfdr.de>; Sat, 18 Sep 2021 04:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239131AbhIRC12 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Sep 2021 22:27:28 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:52834 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238376AbhIRC12 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Sep 2021 22:27:28 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0Uojdl5R_1631931951;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0Uojdl5R_1631931951)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 18 Sep 2021 10:25:52 +0800
Subject: Re: [PATCH v2] sign-file: Fix confusing error messages
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        James Morris <jmorris@namei.org>,
        James Morris <jamorris@linux.microsoft.com>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20210624104824.82616-1-tianjia.zhang@linux.alibaba.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <e743c607-93f6-86c6-5d50-f40ed3d4105b@linux.alibaba.com>
Date:   Sat, 18 Sep 2021 10:25:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210624104824.82616-1-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

ping.

On 6/24/21 6:48 PM, Tianjia Zhang wrote:
> When an error occurs, use errx() instead of err() to display the
> error message, because openssl has its own error record. When an
> error occurs, errno will not be changed, while err() displays the
> errno error message. It will cause confusion. For example, when
> CMS_add1_signer() fails, the following message will appear:
> 
>    sign-file: CMS_add1_signer: Success
> 
> errx() ignores errno and does not cause such issue.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>   scripts/sign-file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index fbd34b8e8f57..37d8760cb0d1 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -107,7 +107,7 @@ static void drain_openssl_errors(void)
>   		bool __cond = (cond);			\
>   		display_openssl_errors(__LINE__);	\
>   		if (__cond) {				\
> -			err(1, fmt, ## __VA_ARGS__);	\
> +			errx(1, fmt, ## __VA_ARGS__);	\
>   		}					\
>   	} while(0)
>   
> 
