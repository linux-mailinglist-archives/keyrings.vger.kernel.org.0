Return-Path: <keyrings+bounces-2194-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D534999A37
	for <lists+keyrings@lfdr.de>; Fri, 11 Oct 2024 04:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE772844DB
	for <lists+keyrings@lfdr.de>; Fri, 11 Oct 2024 02:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C181F12FE;
	Fri, 11 Oct 2024 02:11:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE091E882D;
	Fri, 11 Oct 2024 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612718; cv=none; b=WlOUhj01FELMtwTwLGuK8zxBPe+sAJwH3EVWeR9B9nJpAtznxB1pjg3yLxMe86Ul6r6LW+IT5MxEJRnjXGExlMjhgwlVGn5YTTjNnQgK/lNXelMYNPM4V+6QVBScFi9gR0CAMQcCH8ktGxuJuUkfV2PK1b3xy9DebLc6rQasYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612718; c=relaxed/simple;
	bh=TCYlr+Y7QDcrbkfAcLLSrwpGAdDWlmlEeU7ugUP5V0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnR6CUW6guentcDRXqFECzPZ4fAhJG1xxwWAY38ItKL/OphG2RgM4U3ytv6Tohk6uafAQ6wVhl2s9FVYtdwnte9FrGcxh0whxvhNfvUjzJXRSG3xuzFXV4H3X7aa1WdgzPEN/nbpOxqogrfV6Vm/Qg792pcZx/w1N6yPcsIGSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XPqqw66rDz4f3jkM;
	Fri, 11 Oct 2024 10:11:40 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id A6FB41A018D;
	Fri, 11 Oct 2024 10:11:52 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP4 (Coremail) with SMTP id gCh0CgAXTclmiQhnOUEJDw--.58880S2;
	Fri, 11 Oct 2024 10:11:51 +0800 (CST)
Message-ID: <7ece4154-b7ef-4be4-926a-2f9d5c7311f6@huaweicloud.com>
Date: Fri, 11 Oct 2024 10:11:49 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Jarkko Sakkinen <jarkko@kernel.org>, chenridong <chenridong@huawei.com>,
 dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <6286c177ee1393c64ed2014322074497730c9b33.camel@kernel.org>
 <68b51392-0f93-405f-bcf4-94db22831058@huawei.com>
 <578d5b202782b3e4195b721bab11a811aa50d34e.camel@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <578d5b202782b3e4195b721bab11a811aa50d34e.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAXTclmiQhnOUEJDw--.58880S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw4fWr17uw13Gw1kCFWDXFb_yoW7Cr13pF
	WDKa4qyr15Kr9Iyr10ywnxWF1FvrW5Jw17Wr9IgryxAFsIqr1rKFZFkF1DuFy5ur4fCa4j
	vF4Yq39xZ3Wjv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUymb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
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



On 2024/10/8 10:41, Jarkko Sakkinen wrote:
> On Tue, 2024-10-08 at 09:40 +0800, chenridong wrote:
>>
>>
>> On 2024/10/8 7:15, Jarkko Sakkinen wrote:
>>> Hi,
>>>
>>> Revisit...
>>>
>>> On Fri, 2024-09-13 at 07:09 +0000, Chen Ridong wrote:
>>>> We meet the same issue with the LINK, which reads memory out of
>>>> bounds:
>>>
>>> Never ever use pronoun "we" in a commit message in any possible
>>> sentence. Instead always use passive imperative.
>>>
>>> What you probably want to say is:
>>>
>>> "KASAN reports an out of bounds read:"
>>>
>>> Right?
>>>
>>
>> Yes.
>>
>>>> BUG: KASAN: slab-out-of-bounds in __kuid_val
>>>> include/linux/uidgid.h:36
>>>> BUG: KASAN: slab-out-of-bounds in uid_eq
>>>> include/linux/uidgid.h:63
>>>> [inline]
>>>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
>>>> security/keys/permission.c:54
>>>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>>>>
>>>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-
>>>> gafbffd6c3ede #15
>>>> Call Trace:
>>>>    __dump_stack lib/dump_stack.c:82 [inline]
>>>>    dump_stack+0x107/0x167 lib/dump_stack.c:123
>>>>    print_address_description.constprop.0+0x19/0x170
>>>> mm/kasan/report.c:400
>>>>    __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>>>>    kasan_report+0x3a/0x50 mm/kasan/report.c:585
>>>>    __kuid_val include/linux/uidgid.h:36 [inline]
>>>>    uid_eq include/linux/uidgid.h:63 [inline]
>>>>    key_task_permission+0x394/0x410 security/keys/permission.c:54
>>>>    search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>>>
>>> Snip all below away:
>>>
>>>>    keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>>>>    search_cred_keyrings_rcu+0x111/0x2e0
>>>> security/keys/process_keys.c:459
>>>>    search_process_keyrings_rcu+0x1d/0x310
>>>> security/keys/process_keys.c:544
>>>>    lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>>>>    keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>>>>    __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>>>>    __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>>>>    do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>>>>    entry_SYSCALL_64_after_hwframe+0x67/0xd1
>>>
>>> Remember to cut only the relevant part of the stack trace to make
>>> this
>>> commit message more compact and readable.
>>>
>> Thank you, I will do that.
>>
>>>>
>>>> However, we can't reproduce this issue.
>>>> After our analysis, it can make this issue by following steps.
>>>> 1.As syzkaller reported, the memory is allocated for struct
>>>
>>> "1."
>>>
>>>>     assoc_array_shortcut in the
>>>> assoc_array_insert_into_terminal_node
>>>>     functions.
>>>> 2.In the search_nested_keyrings, when we go through the slots in
>>>> a
>>>> node,
>>>>     (bellow tag ascend_to_node), and the slot ptr is meta and
>>>>     node->back_pointer != NULL, we will proceed to
>>>> descend_to_node.
>>>>     However, there is an exception. If node is the root, and one
>>>> of the
>>>>     slots points to a shortcut, it will be treated as a keyring.
>>>> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring
>>>> function.
>>>>     However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>>>>     ASSOC_ARRAY_PTR_SUBTYPE_MASK,
>>>> 4.As mentioned above, If a slot of the root is a shortcut, it may
>>>> be
>>>>     mistakenly be transferred to a key*, leading to an read out-
>>>> of-
>>>> bounds
>>>>     read.
>>>
>>> Delete the whole list and write a description of the problem and
>>> why
>>> your change resolves it.
>>>
>>> As per code change, let's layout it something more readable first:
>>>
>>> /* Traverse branches into depth: */
>>> if (assoc_array_ptr_is_meta(ptr)) {
>>> 	if (node->back_pointer ||
>>> assoc_array_ptr_is_shortcut(ptr))
>>> 		goto descend_to_node;
>>> }
>>>
>>> So one thing that should be explained just to make the description
>>> rigid is why 'ptr' is passed to assoc_array_ptr_is_shortcut() and
>>> not 'node'. I'm actually 100% sure about that part, which kind
>>> of supports my view here, right? :-)
>>>
>>> The first part of the if-statement obviously filters out everything
>>> that is not root (when it comes to 'node'). Explain the second
>>> part.
>>> At that point it is know that node is a root node, so continue from
>>> there.
>>>
>>> BR, Jarkko
>>>
>>
>> Thank you for your patience.
>> I will update soon.
> 
> Yeah of course, and I did low quality job earlier no issues admitting
> that, so let's do this correct this time. I just try to describe
> what I'm seeing as accurately as I can :-)
> 
> Here it is just important to get the explanation and the code change
> in-sync so that it is easy to verify and compare them, given that it
> is quite sensitive functionality and somewhat obfuscated peace of code
> showing age.
> 
> Also I think a good is to make sure that every fix will leave it at
> least a bit cleaner state. From this basis I proposed a bit different
> layout for the code.
> 
>>
>> Best regards,
>> Ridong
> 
> BR,Jarkko

Hi, Jarkko, I sent the v2 several days ago.
I don't know whether you have received it. I hope you have time to look 
into it, and I am still looking forward to your reply.

v2: 
https://lore.kernel.org/linux-kernel/20241008124639.70000-1-chenridong@huaweicloud.com/

Best regards,
Ridong


