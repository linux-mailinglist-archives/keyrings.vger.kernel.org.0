Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF1152B238
	for <lists+keyrings@lfdr.de>; Wed, 18 May 2022 08:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiERGVW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 May 2022 02:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiERGVR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 May 2022 02:21:17 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDD8220C6;
        Tue, 17 May 2022 23:21:15 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L32qH3l7KzQk7x;
        Wed, 18 May 2022 14:18:19 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 18 May 2022 14:21:13 +0800
Message-ID: <3fa9be8a-d02a-0429-0790-8a4c4d2a1bbb@huawei.com>
Date:   Wed, 18 May 2022 14:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] crypto: Use struct_size() helper in kmalloc()
Content-Language: en-US
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC:     <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <davem@davemloft.net>, <dhowells@redhat.com>,
        <herbert@gondor.apana.org.au>, <linux-hardening@vger.kernel.org>
References: <20220518005639.181640-1-guozihua@huawei.com>
 <20220518045507.GA16144@embeddedor>
From:   "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <20220518045507.GA16144@embeddedor>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2022/5/18 12:55, Gustavo A. R. Silva wrote:
> On Wed, May 18, 2022 at 08:56:39AM +0800, GUO Zihua wrote:
>> Make use of struct_size() heler for structures containing flexible array
>> member instead of sizeof() which prevents potential issues as well as
>> addressing the following sparse warning:
>>
>> crypto/asymmetric_keys/asymmetric_type.c:155:23: warning: using sizeof
>> on a flexible structure
>> crypto/asymmetric_keys/asymmetric_type.c:247:28: warning: using sizeof
>> on a flexible structure
> 
> The warnings above are not silenced with this patch as struct_size()
> internally use sizeof on the struct-with-flex-array.
> 
> However, the use of struct_size() instead of the open-coded expressions
> in the calls to kmalloc() is correct.
> 
>>
>> Reference: https://github.com/KSPP/linux/issues/174
> 
> I updated this issue on the issue tracker. Please, from now on, just
> use that issue as a list of potential open-coded instances to be
> audited. :)
> 
>>
>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks
> --
> Gustavo
> 
>>
>> ---
>>
>> v2:
>>      Use size_add() helper following Kees Cook's suggestion.
>> ---
>>   crypto/asymmetric_keys/asymmetric_type.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
>> index 41a2f0eb4ce4..e020222b1fe5 100644
>> --- a/crypto/asymmetric_keys/asymmetric_type.c
>> +++ b/crypto/asymmetric_keys/asymmetric_type.c
>> @@ -152,7 +152,7 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
>>   {
>>   	struct asymmetric_key_id *kid;
>>   
>> -	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
>> +	kid = kmalloc(struct_size(kid, data, size_add(len_1, len_2)),
>>   		      GFP_KERNEL);
>>   	if (!kid)
>>   		return ERR_PTR(-ENOMEM);
>> @@ -244,7 +244,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
>>   	if (asciihexlen & 1)
>>   		return ERR_PTR(-EINVAL);
>>   
>> -	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
>> +	match_id = kmalloc(struct_size(match_id, data, asciihexlen / 2),
>>   			   GFP_KERNEL);
>>   	if (!match_id)
>>   		return ERR_PTR(-ENOMEM);
>> -- 
>> 2.36.0
>>
> .

Thanks for the review Gustavo.

I'll send a v3 patch and update the commit message. Maybe refer to the 
mail from Linus instead.

-- 
Best
GUO Zihua
