Return-Path: <keyrings+bounces-2052-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A612B97900D
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 12:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CE91284DDE
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 10:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C02A1CEAA4;
	Sat, 14 Sep 2024 10:43:35 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F71CDA1E;
	Sat, 14 Sep 2024 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726310614; cv=none; b=plfMcxUALt/oYBCvMh47U2WsdlzuSuEEyUgvh9Yp2xqd3wBXR95g/tJuEMIOT815cQGhN1u2wtcS2wUE59fJeZKonZeHiQ29lTZM821vhSwof0qYsKDzBYrjaFObROrscGgIrHOnHi82EJKXFdDSDzcRGHWcINx+mc+5juImr5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726310614; c=relaxed/simple;
	bh=W3CbrpRRnofOMK51ORYuAItMi4ThiwBTj2Lzkrp522c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjiJjn4jLDQkeU0oZuPgqLIy0clx4+YiQHJ92LpvMRohXAYiqE8H772TQgsRRVfpk2/MWFJDanON9HjBv0KJALlWhA6Z9n4JslIpsK/xjZv9Qmyimj2CuDn8hyjz024JCWumwqf9hcrB72qF8mqF8kRGv2MWBYhc47CFP6NMPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4X5SSW43g0z4f3jdm;
	Sat, 14 Sep 2024 18:43:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 28F6D1A0359;
	Sat, 14 Sep 2024 18:43:23 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP4 (Coremail) with SMTP id gCh0CgBnm8fIaOVmaO8sBQ--.15683S2;
	Sat, 14 Sep 2024 18:43:22 +0800 (CST)
Message-ID: <33b56a8a-75da-4ab1-871b-ea6af5c22bed@huaweicloud.com>
Date: Sat, 14 Sep 2024 18:43:20 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: dhowells@redhat.com, jarkko@kernel.org, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240913070928.1670785-1-chenridong@huawei.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20240913070928.1670785-1-chenridong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgBnm8fIaOVmaO8sBQ--.15683S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4rZFW8Jr18tryxtr4fZrb_yoWrXw1kpF
	ZxKFyjyr1Ut34agr1rC3W5Ww1rZa909w17K39Ig3yUZFn5Xr1DJFWvkF1j9Fy5urW7AFyq
	ya12vws3A3Wqv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/9/13 15:09, Chen Ridong wrote:
> We meet the same issue with the LINK, which reads memory out of bounds:
> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inline]
> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> security/keys/permission.c:54
> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
> 
> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #15
> Call Trace:
>   __dump_stack lib/dump_stack.c:82 [inline]
>   dump_stack+0x107/0x167 lib/dump_stack.c:123
>   print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
>   __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>   kasan_report+0x3a/0x50 mm/kasan/report.c:585
>   __kuid_val include/linux/uidgid.h:36 [inline]
>   uid_eq include/linux/uidgid.h:63 [inline]
>   key_task_permission+0x394/0x410 security/keys/permission.c:54
>   search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>   keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>   search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
>   search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
>   lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>   keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>   __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>   __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>   do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>   entry_SYSCALL_64_after_hwframe+0x67/0xd1
> 
> However, we can't reproduce this issue.
> After our analysis, it can make this issue by following steps.
> 1.As syzkaller reported, the memory is allocated for struct
>    assoc_array_shortcut in the assoc_array_insert_into_terminal_node
>    functions.
> 2.In the search_nested_keyrings, when we go through the slots in a node,
>    (bellow tag ascend_to_node), and the slot ptr is meta and
>    node->back_pointer != NULL, we will proceed to  descend_to_node.
>    However, there is an exception. If node is the root, and one of the
>    slots points to a shortcut, it will be treated as a keyring.
> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
>    However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>    ASSOC_ARRAY_PTR_SUBTYPE_MASK,
> 4.As mentioned above, If a slot of the root is a shortcut, it may be
>    mistakenly be transferred to a key*, leading to an read out-of-bounds
>    read.
> 
> To fix this issue, one should jump to descend_to_node if the pointer is a
> shortcut.
> 
> Link: https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9
> Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>   security/keys/keyring.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 4448758f643a..7958486ac834 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -772,7 +772,9 @@ static bool search_nested_keyrings(struct key *keyring,
>   	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
>   		ptr = READ_ONCE(node->slots[slot]);
>   
> -		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
> +		if ((assoc_array_ptr_is_meta(ptr) && node->back_pointer) ||
> +		    (assoc_array_ptr_is_meta(ptr) &&
> +		     assoc_array_ptr_is_shortcut(ptr)))
>   			goto descend_to_node;
>   
>   		if (!keyring_ptr_is_keyring(ptr))

Should assoc_array_ptr_is_shortcut add ASSOC_ARRAY_PTR_TYPE_MASK 
judgement? Just like:

static inline bool assoc_array_ptr_is_shortcut(const struct 
assoc_array_ptr *x)
{
	return (unsigned long)x & ASSOC_ARRAY_PTR_TYPE_MASK &&
		   (unsigned long)x & ASSOC_ARRAY_PTR_SUBTYPE_MASK;
}


