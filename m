Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B37172F6C
	for <lists+keyrings@lfdr.de>; Fri, 28 Feb 2020 04:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbgB1Dhs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 22:37:48 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:30881 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730638AbgB1Dhr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Feb 2020 22:37:47 -0500
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; 
   d="scan'208";a="84620793"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 11:37:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
        by cn.fujitsu.com (Postfix) with ESMTP id 2EAD7406AB15;
        Fri, 28 Feb 2020 11:27:50 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 11:37:36 +0800
Subject: Re: [PATCH v2] KEYS: reaching the keys quotas(max_bytes) correctly
To:     Eric Biggers <ebiggers@kernel.org>
CC:     <jarkko.sakkinen@linux.intel.com>, <keyrings@vger.kernel.org>
References: <20200227162623.GG5140@linux.intel.com>
 <1582857177-29093-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200228033009.GA932@sol.localdomain>
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0829856a-6caf-4e03-9aaa-b41f720c9cdb@cn.fujitsu.com>
Date:   Fri, 28 Feb 2020 11:37:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200228033009.GA932@sol.localdomain>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2EAD7406AB15.AC652
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



on 2020/02/28 11:30, Eric Biggers wrote:
> On Fri, Feb 28, 2020 at 10:32:57AM +0800, Yang Xu wrote:
>> Currently, when we add a new user key, the calltrace as below:
>>
>> add_key()
>>    key_create_or_update()
>>      key_alloc()
>>      __key_instantiate_and_link
>>        generic_key_instantiate
>>          key_payload_reserve
>>            ......
>>
>> Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
>> we can reach max bytes/keys in key_alloc, but we forget to remove this
>> limit when we reserver space for payload in key_payload_reserve. So we
>> can only reach max keys but not max bytes when having delta between plen
>> and type->def_datalen. Remove this limit when instantiating the key, so we
>> can keep consistent with key_alloc.
>>
>> Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
>> Cc: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   security/keys/key.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/security/keys/key.c b/security/keys/key.c
>> index 718bf7217420..e959b3c96b48 100644
>> --- a/security/keys/key.c
>> +++ b/security/keys/key.c
>> @@ -382,7 +382,7 @@ int key_payload_reserve(struct key *key, size_t datalen)
>>   		spin_lock(&key->user->lock);
>>   
>>   		if (delta > 0 &&
>> -		    (key->user->qnbytes + delta >= maxbytes ||
>> +		    (key->user->qnbytes + delta > maxbytes ||
>>   		     key->user->qnbytes + delta < key->user->qnbytes)) {
>>   			ret = -EDQUOT;
>>   		}
> 
> This looks good, but I see that both of us forgot to update keyctl_chown_key().
> Can you handle that too?
> 
Of course. I will handle this together.
> You could also use two Fixes tags:
> 
>      Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
>      Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> 
> ... to make it clearer that this is fixing an incomplete fix for the original
> bug, as opposed to fixing a regression.
OK. This is more clearer.
Thanks for your comment.

Best Reagrds
Yang Xu
> 
> - Eric
> 
> 


