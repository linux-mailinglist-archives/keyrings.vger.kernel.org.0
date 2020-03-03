Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF27A176E18
	for <lists+keyrings@lfdr.de>; Tue,  3 Mar 2020 05:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgCCEdu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Mar 2020 23:33:50 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:49501 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726956AbgCCEdu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 2 Mar 2020 23:33:50 -0500
X-IronPort-AV: E=Sophos;i="5.70,509,1574092800"; 
   d="scan'208";a="85484591"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 12:33:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
        by cn.fujitsu.com (Postfix) with ESMTP id 6337B406AB15;
        Tue,  3 Mar 2020 12:23:49 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 12:33:38 +0800
Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
To:     Eric Biggers <ebiggers@kernel.org>
CC:     <jarkko.sakkinen@linux.intel.com>, <keyrings@vger.kernel.org>
References: <20200228033009.GA932@sol.localdomain>
 <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200303041732.GA14653@sol.localdomain>
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8cc77e68-244e-3ac8-dea6-edc51cf372df@cn.fujitsu.com>
Date:   Tue, 3 Mar 2020 12:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200303041732.GA14653@sol.localdomain>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6337B406AB15.AC274
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



on 2020/03/03 12:17, Eric Biggers wrote:
> On Fri, Feb 28, 2020 at 12:41:51PM +0800, Yang Xu wrote:
>>
>> Subject: Re: [PATCH v3] KEYS: reaching the keys quotas correctly
> 
> The subject should be in imperative tense, like
> "KEYS: reach the keys quotas correctly"
Sound reasonable, I think maintainer can change this when merged this patch.

Best Regards
Yang Xu
> 
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
>> Also, fix the similar problem in keyctl_chown_key().
>>
>> Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
>> Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
>> Cc: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> 
> Otherwise this looks fine.  Thanks!
> 
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> 
> - Eric
> 
> 


