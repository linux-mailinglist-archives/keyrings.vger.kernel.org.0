Return-Path: <keyrings+bounces-2191-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDD993C57
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 03:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4D61F246B8
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 01:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB1B14A82;
	Tue,  8 Oct 2024 01:41:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D81388;
	Tue,  8 Oct 2024 01:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728351661; cv=none; b=YwBq3iLXJiC04VOAASr8XJzxRmQX4/aGzs0lkFkg487NFROEDy5Ein19GRgap9emnF+yj5kD8iKhe6RhhBChjaJJbJfcWISXU350m/K0bv13mBUL/eHs183jm+lRVFWexBmCi6++Edntsv+KpX2eeSqNzwm+NhqbGx8a+qRuBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728351661; c=relaxed/simple;
	bh=h5lJ0P06Cn7OUBUvyXHzRCji3AK93vlCWS0mhFiNtC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y0ssIEmmHvldkeHw8PevZrvI7scNlLErlE/YazgvZ2f0d5LNQNdRTv11b/m1MV0oi3nkF+jkiSSPZOYJlpGWCIuxFXQEQW65Wr1NpGG0fz09/H5dpzqhPbmKcXJBKohgFao328phinUfqCcKjoSh6PDmFWXo5Zgwy3T48oy5Yv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XMzGb1F4zz2Dd6s;
	Tue,  8 Oct 2024 09:39:51 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id A53521A016C;
	Tue,  8 Oct 2024 09:40:54 +0800 (CST)
Received: from [10.67.109.79] (10.67.109.79) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 8 Oct
 2024 09:40:54 +0800
Message-ID: <68b51392-0f93-405f-bcf4-94db22831058@huawei.com>
Date: Tue, 8 Oct 2024 09:40:53 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Jarkko Sakkinen <jarkko@kernel.org>, <dhowells@redhat.com>,
	<paul@paul-moore.com>, <jmorris@namei.org>, <serge@hallyn.com>
CC: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <chenridong@huaweicloud.com>
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <6286c177ee1393c64ed2014322074497730c9b33.camel@kernel.org>
Content-Language: en-US
From: chenridong <chenridong@huawei.com>
In-Reply-To: <6286c177ee1393c64ed2014322074497730c9b33.camel@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100013.china.huawei.com (7.221.188.163)



On 2024/10/8 7:15, Jarkko Sakkinen wrote:
> Hi,
> 
> Revisit...
> 
> On Fri, 2024-09-13 at 07:09 +0000, Chen Ridong wrote:
>> We meet the same issue with the LINK, which reads memory out of
>> bounds:
> 
> Never ever use pronoun "we" in a commit message in any possible
> sentence. Instead always use passive imperative.
> 
> What you probably want to say is:
> 
> "KASAN reports an out of bounds read:"
> 
> Right?
> 

Yes.

>> BUG: KASAN: slab-out-of-bounds in __kuid_val
>> include/linux/uidgid.h:36
>> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63
>> [inline]
>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
>> security/keys/permission.c:54
>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>>
>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-
>> gafbffd6c3ede #15
>> Call Trace:
>>   __dump_stack lib/dump_stack.c:82 [inline]
>>   dump_stack+0x107/0x167 lib/dump_stack.c:123
>>   print_address_description.constprop.0+0x19/0x170
>> mm/kasan/report.c:400
>>   __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>>   kasan_report+0x3a/0x50 mm/kasan/report.c:585
>>   __kuid_val include/linux/uidgid.h:36 [inline]
>>   uid_eq include/linux/uidgid.h:63 [inline]
>>   key_task_permission+0x394/0x410 security/keys/permission.c:54
>>   search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
> 
> Snip all below away:
> 
>>   keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>>   search_cred_keyrings_rcu+0x111/0x2e0
>> security/keys/process_keys.c:459
>>   search_process_keyrings_rcu+0x1d/0x310
>> security/keys/process_keys.c:544
>>   lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>>   keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>>   __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>>   __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>>   do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>>   entry_SYSCALL_64_after_hwframe+0x67/0xd1
> 
> Remember to cut only the relevant part of the stack trace to make this
> commit message more compact and readable.
> 
Thank you, I will do that.

>>
>> However, we can't reproduce this issue.
>> After our analysis, it can make this issue by following steps.
>> 1.As syzkaller reported, the memory is allocated for struct
> 
> "1."
> 
>>    assoc_array_shortcut in the assoc_array_insert_into_terminal_node
>>    functions.
>> 2.In the search_nested_keyrings, when we go through the slots in a
>> node,
>>    (bellow tag ascend_to_node), and the slot ptr is meta and
>>    node->back_pointer != NULL, we will proceed to  descend_to_node.
>>    However, there is an exception. If node is the root, and one of the
>>    slots points to a shortcut, it will be treated as a keyring.
>> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring
>> function.
>>    However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>>    ASSOC_ARRAY_PTR_SUBTYPE_MASK,
>> 4.As mentioned above, If a slot of the root is a shortcut, it may be
>>    mistakenly be transferred to a key*, leading to an read out-of-
>> bounds
>>    read.
> 
> Delete the whole list and write a description of the problem and why
> your change resolves it.
> 
> As per code change, let's layout it something more readable first:
> 
> /* Traverse branches into depth: */
> if (assoc_array_ptr_is_meta(ptr)) {
> 	if (node->back_pointer || assoc_array_ptr_is_shortcut(ptr))
> 		goto descend_to_node;
> }
> 
> So one thing that should be explained just to make the description
> rigid is why 'ptr' is passed to assoc_array_ptr_is_shortcut() and
> not 'node'. I'm actually 100% sure about that part, which kind
> of supports my view here, right? :-)
> 
> The first part of the if-statement obviously filters out everything
> that is not root (when it comes to 'node'). Explain the second part.
> At that point it is know that node is a root node, so continue from
> there.
> 
> BR, Jarkko
> 

Thank you for your patience.
I will update soon.

Best regards,
Ridong

