Return-Path: <keyrings+bounces-2095-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4297B8C2
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2024 09:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 409DA28334C
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2024 07:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E35E482EF;
	Wed, 18 Sep 2024 07:47:31 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8978C7E;
	Wed, 18 Sep 2024 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726645651; cv=none; b=gFyfE/s5tFtl1z2nLQvuYKph0D6yZX3DVULq2ZGV8eC62P8HbfvX54gyJ9f9iYF32F316FMA9y4WB+xAFLsH4LVYSN8Gm5FTGAK2agsObpyNrvCqJsIW2AXiho2CMXhklrCJo21MCdMzI4fQUrGBF0UmzA04CK1HnxSRbuMZWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726645651; c=relaxed/simple;
	bh=3045n59cIco54XfiERjOQ+PTrTg/hH4mWZaU1y2ah4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPONb8xYvRR6Unq09P5Byj3wfMZ887a0uEzBapRGh1VjEt4S2BvB5/WkbpQ076BcEHFv2+LJoNA3m75KK0TKs8FhORUQGS5s5dYafa5F3zATclopKBeDZtsBawI8W+voA9+SyBS60NrClBodJzyPB+i5AG5a+YdZogg1C0vGt/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4X7r003RSCz4f3jkY;
	Wed, 18 Sep 2024 15:30:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 6231E1A058E;
	Wed, 18 Sep 2024 15:30:19 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP4 (Coremail) with SMTP id gCh0CgAXmMSHgepmPa2aBg--.52679S2;
	Wed, 18 Sep 2024 15:30:16 +0800 (CST)
Message-ID: <1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com>
Date: Wed, 18 Sep 2024 15:30:15 +0800
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
 <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>
 <D46WU24OP9O4.1Y7EGDV8ZN7NR@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <D46WU24OP9O4.1Y7EGDV8ZN7NR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgAXmMSHgepmPa2aBg--.52679S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWxAFy8Cr47uw1rJFyrJFb_yoW7XF1xpF
	W5KF12yFWkJasrtr42kr1UKw1Fv39Ykw17Wwn3WryjyFnxXr1DJr40kF4rCF93ur4IvFy5
	ArsxX39xXwn0q3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/9/15 21:59, Jarkko Sakkinen wrote:
> On Sun Sep 15, 2024 at 3:55 AM EEST, Chen Ridong wrote:
>>
>>
>> On 2024/9/14 19:33, Jarkko Sakkinen wrote:
>>> On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
>>>> We meet the same issue with the LINK, which reads memory out of bounds:
>>>
>>> Nit: don't use "we" anywhere".
>>>
>>> Tbh, I really don't understand the sentence above. I don't what
>>> "the same issue with the LINK" really is.
>>>
>>
>> Hello, Jarkko.
>> I apologize for any confusion caused.
>>
>> I've encountered a bug reported by syzkaller. I also found the same bug
>> reported at this LINK:
>> https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9.
>>
>>>> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
>>>> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inline]
>>>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
>>>> security/keys/permission.c:54
>>>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>>>>
>>>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #15
>>>> Call Trace:
>>>>    __dump_stack lib/dump_stack.c:82 [inline]
>>>>    dump_stack+0x107/0x167 lib/dump_stack.c:123
>>>>    print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
>>>>    __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>>>>    kasan_report+0x3a/0x50 mm/kasan/report.c:585
>>>>    __kuid_val include/linux/uidgid.h:36 [inline]
>>>>    uid_eq include/linux/uidgid.h:63 [inline]
>>>>    key_task_permission+0x394/0x410 security/keys/permission.c:54
>>>>    search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>>>>    keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>>>>    search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
>>>>    search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
>>>>    lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>>>>    keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>>>>    __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>>>>    __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>>>>    do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>>>>    entry_SYSCALL_64_after_hwframe+0x67/0xd1
>>>>
>>>> However, we can't reproduce this issue.
>>>
>>> "The issue cannot be easily reproduced but by analyzing the code
>>> it can be broken into following steps:"
>>
>> Thank you for your correction.
>> Does this patch address the issue correctly? Is this patch acceptable?
> 
> I only comment new patch versions so not giving any promises but I can
> say that it is I think definitely in the correct direction :-)
> 
> BR, Jarkko

Hello, Jarkko. I have reproduced this issue. It can be reproduced by 
following these steps:

1. Add the helper patch.

@@ -205,6 +205,9 @@ static void hash_key_type_and_desc(struct 
keyring_index_key *index_key)
         else if (index_key->type == &key_type_keyring && (hash & 
fan_mask) != 0)
                 hash = (hash + (hash << level_shift)) & ~fan_mask;
         index_key->hash = hash;
+       if ((index_key->hash & 0xff) == 0xe6) {
+                       pr_err("hash_key_type_and_desc: type %s %s 
0x%x\n",  index_key->type->name, index_key->description, index_key->hash);
+       }
  }

2. Pick up the inputs whose hash is xxe6 using the following cmd. If a 
key's hash is xxe6, it will be printed.

for ((i=0; i<=10000; i++)); do ./test_key user user$i "Some payload"; done

You have complile test_key whith following code.

#include <sys/types.h>
#include <keyutils.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int
main(int argc, char *argv[])
{
    key_serial_t key;

    if (argc != 4) {
	   fprintf(stderr, "Usage: %s type description payload\n",
			   argv[0]);
	   exit(EXIT_FAILURE);
    }

    key = add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
			   KEY_SPEC_SESSION_KEYRING);
    if (key == -1) {
	   perror("add_key");
	   exit(EXIT_FAILURE);
    }

    printf("Key ID is %jx\n", (uintmax_t) key);

    exit(EXIT_SUCCESS);
}


3. Have more than 32 inputs now. their hashes are xxe6.
eg.
hash_key_type_and_desc: type user user438 0xe3033fe6
hash_key_type_and_desc: type user user526 0xeb7eade6
...
hash_key_type_and_desc: type user user9955 0x44bc99e6

4. Reboot and add the keys obtained from step 3.
When adding keys to the ROOT that their hashes are all xxe6, and up to 
16, the ROOT has keys with hashes that are not xxe6 (e.g., slot 0), so 
the keys are dissimilar. The ROOT will then split NODE A without using a 
shortcut. When NODE A is filled with keys that have hashes of xxe6, the 
keys are similar. NODE A will split with a shortcut.

As my analysis, if a slot of the root is a shortcut(slot 6), it may be 
mistakenly be transferred to a key*, leading to an read out-of-bounds read.

                       NODE A
               +------>+---+
       ROOT    |       | 0 | xxe6
       +---+   |       +---+
  xxxx | 0 | shortcut  :   : xxe6
       +---+   |       +---+
  xxe6 :   :   |       |   | xxe6
       +---+   |       +---+
       | 6 |---+       :   : xxe6
       +---+           +---+
  xxe6 :   :           | f | xxe6
       +---+           +---+
  xxe6 | f |
       +---+

5. cat /proc/keys. and the issue is reproduced.


