Return-Path: <keyrings+bounces-2058-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1A9793E1
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 02:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 999811F21B48
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 00:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F92184E;
	Sun, 15 Sep 2024 00:55:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116EA41;
	Sun, 15 Sep 2024 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726361717; cv=none; b=izdGt4Ekkr4DLCR2evnKHxMHWJgMSpZWo2SlRgfAnjlfZaiqP7oxt1D4C9Vr/Zhcx22d8nOjhQgvcHcl3/WJ8B4l9XAj0RVRyMxcTkQ2pfWDP07+fMNyjB3VVTJuvDlYq4854Y02PfUL3VlH4qAM62H0FfCgUwoz/rhCNzA12bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726361717; c=relaxed/simple;
	bh=7e+VF93yu9rQUiTwqw1nyWInvcLvFgzxDjdDrfLtzqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+Sw7q95ufAV/co/wyONs4cCxKEYnKcm46gKW4gb0nntSVq3dY4nT1Wesqvn0O4vRdj1ABWfkZA84VUQZWlTIgqSvUrSlLi2xRQ514fo6HAUd2yck5Zfh6yCeaMuBZOyHiiiEah4N7OMjWgUpWbGXRJvnNT7BwNbEEmaB1371PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4X5qML5hmQz4f3jsg;
	Sun, 15 Sep 2024 08:54:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 6BBB51A08FC;
	Sun, 15 Sep 2024 08:55:10 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP2 (Coremail) with SMTP id Syh0CgBHfGFrMOZmQWNgBQ--.41765S2;
	Sun, 15 Sep 2024 08:55:09 +0800 (CST)
Message-ID: <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>
Date: Sun, 15 Sep 2024 08:55:07 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Jarkko Sakkinen <jarkko@kernel.org>, Chen Ridong <chenridong@huawei.com>,
 dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:Syh0CgBHfGFrMOZmQWNgBQ--.41765S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyUGr1xKrW7Xw1xKry3Arb_yoWrZw13pF
	WrKFyjyr1Utry2grySk3WUWw1rZa90kw17G39Ig347A3Z5Xr1DJFWvkF1j9Fy5ur42yFyF
	yFsFvwsxZ3Wqv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUymb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UAwIDUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/9/14 19:33, Jarkko Sakkinen wrote:
> On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
>> We meet the same issue with the LINK, which reads memory out of bounds:
> 
> Nit: don't use "we" anywhere".
> 
> Tbh, I really don't understand the sentence above. I don't what
> "the same issue with the LINK" really is.
> 

Hello, Jarkko.
I apologize for any confusion caused.

I've encountered a bug reported by syzkaller. I also found the same bug 
reported at this LINK: 
https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9.

>> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
>> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inline]
>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
>> security/keys/permission.c:54
>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>>
>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #15
>> Call Trace:
>>   __dump_stack lib/dump_stack.c:82 [inline]
>>   dump_stack+0x107/0x167 lib/dump_stack.c:123
>>   print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
>>   __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>>   kasan_report+0x3a/0x50 mm/kasan/report.c:585
>>   __kuid_val include/linux/uidgid.h:36 [inline]
>>   uid_eq include/linux/uidgid.h:63 [inline]
>>   key_task_permission+0x394/0x410 security/keys/permission.c:54
>>   search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>>   keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>>   search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
>>   search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
>>   lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>>   keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>>   __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>>   __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>>   do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>>   entry_SYSCALL_64_after_hwframe+0x67/0xd1
>>
>> However, we can't reproduce this issue.
> 
> "The issue cannot be easily reproduced but by analyzing the code
> it can be broken into following steps:"

Thank you for your correction.
Does this patch address the issue correctly? Is this patch acceptable?

Best regard,
Ridong

> 
>> After our analysis, it can make this issue by following steps.
>> 1.As syzkaller reported, the memory is allocated for struct
>>    assoc_array_shortcut in the assoc_array_insert_into_terminal_node
>>    functions.
>> 2.In the search_nested_keyrings, when we go through the slots in a node,
>>    (bellow tag ascend_to_node), and the slot ptr is meta and
>>    node->back_pointer != NULL, we will proceed to  descend_to_node.
>>    However, there is an exception. If node is the root, and one of the
>>    slots points to a shortcut, it will be treated as a keyring.
>> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
>>    However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>>    ASSOC_ARRAY_PTR_SUBTYPE_MASK,
>> 4.As mentioned above, If a slot of the root is a shortcut, it may be
>>    mistakenly be transferred to a key*, leading to an read out-of-bounds
>>    read.
>>
>> To fix this issue, one should jump to descend_to_node if the pointer is a
>> shortcut.
>>
>> Link: https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9
>> Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
>> Signed-off-by: Chen Ridong <chenridong@huawei.com>
>> ---
>>   security/keys/keyring.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
>> index 4448758f643a..7958486ac834 100644
>> --- a/security/keys/keyring.c
>> +++ b/security/keys/keyring.c
>> @@ -772,7 +772,9 @@ static bool search_nested_keyrings(struct key *keyring,
>>   	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
>>   		ptr = READ_ONCE(node->slots[slot]);
>>   
>> -		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
>> +		if ((assoc_array_ptr_is_meta(ptr) && node->back_pointer) ||
>> +		    (assoc_array_ptr_is_meta(ptr) &&
>> +		     assoc_array_ptr_is_shortcut(ptr)))
>>   			goto descend_to_node;
>>   
>>   		if (!keyring_ptr_is_keyring(ptr))
> 
> 
> BR, Jarkko


