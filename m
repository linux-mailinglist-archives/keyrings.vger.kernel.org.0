Return-Path: <keyrings+bounces-2167-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6789872B9
	for <lists+keyrings@lfdr.de>; Thu, 26 Sep 2024 13:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CE81F25716
	for <lists+keyrings@lfdr.de>; Thu, 26 Sep 2024 11:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA07318C002;
	Thu, 26 Sep 2024 11:20:32 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34707158553;
	Thu, 26 Sep 2024 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349632; cv=none; b=SIbf329hUm61BY7raMHzbg2SWSBl+P2SDmvN4e0Gpe1BvqSgwiBpPEeVZVh6GXff3bFq+YSMZoqCdJgu36gJwtv9xmVn/utgafNyDdkBrK+4tNNwdRb+gaKs6nEDKdHfmxtitN33a+82uxWhfA/7cvzjaTB3tETvZGp1XVAdWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349632; c=relaxed/simple;
	bh=01gYD2rhX1Ne4fKjXw+yyfDj6Fh98zIOEkFwA3ErBdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L78/Fnvfrq+0NiKK8LOWEWwSVnvxlJSXAPGfC6GYB4gVlwW/oeAOZsQOPQbUEq0pADtHJj0yOwlfm5zYPM/wXdeNgw2HBrnZ3uokueO/Fk18z4NmMGvc5678YsAsEjup5shdT6/+jmkWli46+59x1YGAqT4jz823BdvRROoeTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XDrj55pcJz1SBkS;
	Thu, 26 Sep 2024 19:19:37 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F39F1402C6;
	Thu, 26 Sep 2024 19:20:27 +0800 (CST)
Received: from [10.67.109.79] (10.67.109.79) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 26 Sep
 2024 19:20:26 +0800
Message-ID: <eef47f37-6d96-4c60-a00b-e96e6025ef43@huawei.com>
Date: Thu, 26 Sep 2024 19:20:25 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Jarkko Sakkinen <jarkko@kernel.org>, Chen Ridong
	<chenridong@huaweicloud.com>, <dhowells@redhat.com>, <paul@paul-moore.com>,
	<jmorris@namei.org>, <serge@hallyn.com>
CC: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <James.Bottomley@HansenPartnership.com>,
	<roberto.sassu@huaweicloud.com>
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
 <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>
 <D46WU24OP9O4.1Y7EGDV8ZN7NR@kernel.org>
 <1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com>
 <D49PLU7VOREK.3UZFD499C96FB@kernel.org>
 <fbe97a9c-0899-403a-840a-8d86e8730934@huaweicloud.com>
 <D4G37UXT3VYV.1F8Z50TNGYYBW@kernel.org>
 <D4G39938DC0V.8PCWJQ73GOK3@kernel.org>
 <D4G4I4V56OJ3.1AUR56F77OOHU@kernel.org>
Content-Language: en-US
From: chenridong <chenridong@huawei.com>
In-Reply-To: <D4G4I4V56OJ3.1AUR56F77OOHU@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd100013.china.huawei.com (7.221.188.163)



On 2024/9/26 17:54, Jarkko Sakkinen wrote:
> On Thu Sep 26, 2024 at 11:55 AM EEST, Jarkko Sakkinen wrote:
>> On Thu Sep 26, 2024 at 11:53 AM EEST, Jarkko Sakkinen wrote:
>>> On Thu Sep 26, 2024 at 6:48 AM EEST, Chen Ridong wrote:
>>>>
>>>> On 2024/9/19 4:57, Jarkko Sakkinen wrote:
>>>>> On Wed Sep 18, 2024 at 10:30 AM EEST, Chen Ridong wrote:
>>>>>>
>>>>>>
>>>>>> On 2024/9/15 21:59, Jarkko Sakkinen wrote:
>>>>>>> On Sun Sep 15, 2024 at 3:55 AM EEST, Chen Ridong wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2024/9/14 19:33, Jarkko Sakkinen wrote:
>>>>>>>>> On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
>>>>>>>>>> We meet the same issue with the LINK, which reads memory out of bounds:
>>>>>>>>>
>>>>>>>>> Nit: don't use "we" anywhere".
>>>>>>>>>
>>>>>>>>> Tbh, I really don't understand the sentence above. I don't what
>>>>>>>>> "the same issue with the LINK" really is.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hello, Jarkko.
>>>>>>>> I apologize for any confusion caused.
>>>>>>>>
>>>>>>>> I've encountered a bug reported by syzkaller. I also found the same bug
>>>>>>>> reported at this LINK:
>>>>>>>> https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9.
>>>>>>>>
>>>>>>>>>> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
>>>>>>>>>> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inline]
>>>>>>>>>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
>>>>>>>>>> security/keys/permission.c:54
>>>>>>>>>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>>>>>>>>>>
>>>>>>>>>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #15
>>>>>>>>>> Call Trace:
>>>>>>>>>>      __dump_stack lib/dump_stack.c:82 [inline]
>>>>>>>>>>      dump_stack+0x107/0x167 lib/dump_stack.c:123
>>>>>>>>>>      print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
>>>>>>>>>>      __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>>>>>>>>>>      kasan_report+0x3a/0x50 mm/kasan/report.c:585
>>>>>>>>>>      __kuid_val include/linux/uidgid.h:36 [inline]
>>>>>>>>>>      uid_eq include/linux/uidgid.h:63 [inline]
>>>>>>>>>>      key_task_permission+0x394/0x410 security/keys/permission.c:54
>>>>>>>>>>      search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>>>>>>>>>>      keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>>>>>>>>>>      search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
>>>>>>>>>>      search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
>>>>>>>>>>      lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>>>>>>>>>>      keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>>>>>>>>>>      __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>>>>>>>>>>      __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>>>>>>>>>>      do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>>>>>>>>>>      entry_SYSCALL_64_after_hwframe+0x67/0xd1
>>>>>>>>>>
>>>>>>>>>> However, we can't reproduce this issue.
>>>>>>>>>
>>>>>>>>> "The issue cannot be easily reproduced but by analyzing the code
>>>>>>>>> it can be broken into following steps:"
>>>>>>>>
>>>>>>>> Thank you for your correction.
>>>>>>>> Does this patch address the issue correctly? Is this patch acceptable?
>>>>>>>
>>>>>>> I only comment new patch versions so not giving any promises but I can
>>>>>>> say that it is I think definitely in the correct direction :-)
>>>>>>>
>>>>>>> BR, Jarkko
>>>>>>
>>>>>> Hello, Jarkko. I have reproduced this issue. It can be reproduced by
>>>>>> following these steps:
>>>>>>
>>>>>> 1. Add the helper patch.
>>>>>>
>>>>>> @@ -205,6 +205,9 @@ static void hash_key_type_and_desc(struct
>>>>>> keyring_index_key *index_key)
>>>>>>            else if (index_key->type == &key_type_keyring && (hash &
>>>>>> fan_mask) != 0)
>>>>>>                    hash = (hash + (hash << level_shift)) & ~fan_mask;
>>>>>>            index_key->hash = hash;
>>>>>> +       if ((index_key->hash & 0xff) == 0xe6) {
>>>>>> +                       pr_err("hash_key_type_and_desc: type %s %s
>>>>>> 0x%x\n",  index_key->type->name, index_key->description, index_key->hash);
>>>>>> +       }
>>>>>>     }
>>>>>>
>>>>>> 2. Pick up the inputs whose hash is xxe6 using the following cmd. If a
>>>>>> key's hash is xxe6, it will be printed.
>>>>>>
>>>>>> for ((i=0; i<=10000; i++)); do ./test_key user user$i "Some payload"; done
>>>>>>
>>>>>> You have complile test_key whith following code.
>>>>>>
>>>>>> #include <sys/types.h>
>>>>>> #include <keyutils.h>
>>>>>> #include <stdint.h>
>>>>>> #include <stdio.h>
>>>>>> #include <stdlib.h>
>>>>>> #include <string.h>
>>>>>>
>>>>>> int
>>>>>> main(int argc, char *argv[])
>>>>>> {
>>>>>>       key_serial_t key;
>>>>>>
>>>>>>       if (argc != 4) {
>>>>>> 	   fprintf(stderr, "Usage: %s type description payload\n",
>>>>>> 			   argv[0]);
>>>>>> 	   exit(EXIT_FAILURE);
>>>>>>       }
>>>>>>
>>>>>>       key = add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
>>>>>> 			   KEY_SPEC_SESSION_KEYRING);
>>>>>>       if (key == -1) {
>>>>>> 	   perror("add_key");
>>>>>> 	   exit(EXIT_FAILURE);
>>>>>>       }
>>>>>>
>>>>>>       printf("Key ID is %jx\n", (uintmax_t) key);
>>>>>>
>>>>>>       exit(EXIT_SUCCESS);
>>>>>> }
>>>>>>
>>>>>>
>>>>>> 3. Have more than 32 inputs now. their hashes are xxe6.
>>>>>> eg.
>>>>>> hash_key_type_and_desc: type user user438 0xe3033fe6
>>>>>> hash_key_type_and_desc: type user user526 0xeb7eade6
>>>>>> ...
>>>>>> hash_key_type_and_desc: type user user9955 0x44bc99e6
>>>>>>
>>>>>> 4. Reboot and add the keys obtained from step 3.
>>>>>> When adding keys to the ROOT that their hashes are all xxe6, and up to
>>>>>> 16, the ROOT has keys with hashes that are not xxe6 (e.g., slot 0), so
>>>>>> the keys are dissimilar. The ROOT will then split NODE A without using a
>>>>>> shortcut. When NODE A is filled with keys that have hashes of xxe6, the
>>>>>> keys are similar. NODE A will split with a shortcut.
>>>>>>
>>>>>> As my analysis, if a slot of the root is a shortcut(slot 6), it may be
>>>>>> mistakenly be transferred to a key*, leading to an read out-of-bounds read.
>>>>>>
>>>>>>                          NODE A
>>>>>>                  +------>+---+
>>>>>>          ROOT    |       | 0 | xxe6
>>>>>>          +---+   |       +---+
>>>>>>     xxxx | 0 | shortcut  :   : xxe6
>>>>>>          +---+   |       +---+
>>>>>>     xxe6 :   :   |       |   | xxe6
>>>>>>          +---+   |       +---+
>>>>>>          | 6 |---+       :   : xxe6
>>>>>>          +---+           +---+
>>>>>>     xxe6 :   :           | f | xxe6
>>>>>>          +---+           +---+
>>>>>>     xxe6 | f |
>>>>>>          +---+
>>>>>>
>>>>>> 5. cat /proc/keys. and the issue is reproduced.
>>>>>
>>>>> Hi, I'll try to run through your procedure next week and give my comments.
>>>>> Thanks for doing this.
>>>>>
>>>>> BR, Jarkko
>>>>
>>>> Hi, Jarkko, have you run these procedure?
>>>> I have tested this patch with LTP and a pressure test(stress-ng --key),
>>>> and this patch have fixed this issue. Additionally, no new bugs have
>>>> been found so far.
>>>>
>>>> I am looking forward to your reply.
>>>>
>>>> Best regards,
>>>> Ridong
>>>
>>> Nope because we are apparently stuck with release critical bug:
>>>
>>> https://lore.kernel.org/linux-integrity/D4EPMF7G3E05.1VHS9CVG3DZDE@kernel.org/T/#t
>>>
>>> Might take several weeks before I look into this.
>>
>> I was expecting to send a PR early this week since the patch set
>> addresses the issue so thus wrong estimation.
> 
> I asked David if he could look into this.
> 
> BR, Jarkko

Thank you very much.

Best regards,
Ridong

