Return-Path: <keyrings+bounces-2210-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6799FE57
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 03:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A709286821
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 01:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84E2143744;
	Wed, 16 Oct 2024 01:34:04 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CD1339A4;
	Wed, 16 Oct 2024 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042444; cv=none; b=TsKF5jlM/3cqMBbZi1ATqlCIAwkU6ZdqS/jz+/KvOAPNsa8F0y+FyoQG/adlcmjtZTTKUIVqL6LzYqstYSHXk9RB2KeOvoT03HZ1wXW6pEqz37OAJjJgrpbJThwm18+n1CJ82tMed3w+bZ27KnCgHdKcLWYjFj6NVs0rQuFF5No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042444; c=relaxed/simple;
	bh=xs/J6VNwzMC5r7vGO0BQwBEbyyFFvHTrixiq7S4zUFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCvB654hgXUPB3KGlJ31aEnoSnsNc1181HlhSRgvVtS0EdjDEcRWIXevJU+CjSVsCYwZZRCCXhodBeom7sYD3ZDlFbt/rUNxDU/WBa3VQbRDoTHGCuowGSRK3sQYI66z0gct5lTgDGeratc39PZ+Z8a8Nb91wCrw03bVi2MGpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XStlf41Vlz4f3jXs;
	Wed, 16 Oct 2024 09:33:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id A6C891A07B6;
	Wed, 16 Oct 2024 09:33:51 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgB3F4T8Fw9n3tdQEA--.39499S2;
	Wed, 16 Oct 2024 09:33:49 +0800 (CST)
Message-ID: <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
Date: Wed, 16 Oct 2024 09:33:47 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Chen Ridong <chenridong@huaweicloud.com>, dhowells@redhat.com,
 jarkko@kernel.org, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241008124639.70000-1-chenridong@huaweicloud.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20241008124639.70000-1-chenridong@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgB3F4T8Fw9n3tdQEA--.39499S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4rZFW8Jr18tryxtr4fZrb_yoWrWry3pr
	Z0gF4qyrW0yFySgr17A3WUuw1rZFs0k3W7KFWSg3yrZ3Z0qr1vgF9FkryUurZ5ur4IyFyY
	yr43Wwsa9Fn0v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8
	ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/10/8 20:46, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> KASAN reports an out of bounds read:
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
> 
> This issue was also reported by syzbot [1].
> 
> It can be reproduced by following these steps(more details [2]):
> 1. Obtain more than 32 inputs that have similar hashes, which ends with the
>     pattern '0xxxxxxxe6'.
> 2. Reboot and add the keys obtained in step 1.
> 
> The reproducer demonstrates how this issue happened:
> 1. In the search_nested_keyrings function, when it iterates through the
>     slots in a node(below tag ascend_to_node), if the slot pointer is meta
>     and node->back_pointer != NULL(it means a root), it will proceed to
>     descend_to_node. However, there is an exception. If node is the root,
>     and one of the slots points to a shortcut, it will be treated as a
>     keyring.
> 2. Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
>     However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>     ASSOC_ARRAY_PTR_SUBTYPE_MASK.
> 3. When 32 keys with the similar hashes are added to the tree, the ROOT
>     has keys with hashes that are not similar (e.g. slot 0) and it splits
>     NODE A without using a shortcut. When NODE A is filled with keys that
>     all hashes are xxe6, the keys are similar, NODE A will split with a
>     shortcut. Finally, it forms the tree as shown below, where slot 6 points
>     to a shortcut.
> 
>                        NODE A
>                +------>+---+
>        ROOT    |       | 0 | xxe6
>        +---+   |       +---+
>   xxxx | 0 | shortcut  :   : xxe6
>        +---+   |       +---+
>   xxe6 :   :   |       |   | xxe6
>        +---+   |       +---+
>        | 6 |---+       :   : xxe6
>        +---+           +---+
>   xxe6 :   :           | f | xxe6
>        +---+           +---+
>   xxe6 | f |
>        +---+
> 
> 4. As mentioned above, If a slot(slot 6) of the root points to a shortcut,
>     it may be mistakenly transferred to a key*, leading to a read
>     out-of-bounds read.
> 
> To fix this issue, one should jump to descend_to_node if the ptr is a
> shortcut, regardless of whether the node is root or not.
> 
> [1] https://lore.kernel.org/all/000000000000cbb7860611f61147@google.com/T/
> [2] https://lore.kernel.org/linux-kernel/1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com/
> 
> Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
> Reported-by: syzbot+5b415c07907a2990d1a3@syzkaller.appspotmail.com
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>   security/keys/keyring.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 4448758f643a..f331725d5a37 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -772,8 +772,11 @@ static bool search_nested_keyrings(struct key *keyring,
>   	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
>   		ptr = READ_ONCE(node->slots[slot]);
>   
> -		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
> -			goto descend_to_node;
> +		if (assoc_array_ptr_is_meta(ptr)) {
> +			if (node->back_pointer ||
> +			    assoc_array_ptr_is_shortcut(ptr))
> +				goto descend_to_node;
> +		}
>   
>   		if (!keyring_ptr_is_keyring(ptr))
>   			continue;

Friendly ping.

Best regards,
Ridong


