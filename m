Return-Path: <keyrings+bounces-2104-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7279197C11E
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2024 22:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 981581C21A6A
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2024 20:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984871CA6AA;
	Wed, 18 Sep 2024 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dU+x1z73"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921B17E019;
	Wed, 18 Sep 2024 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726693067; cv=none; b=sL3ZfQnqsrug1V6oIGn8TWM7lGp+WE3KxTqYYXQUCLWEjeYBnXTU9LK1OpUzE5UuV72gonF5OD6ANSMkfIclfsWmvOgOBlThwcfCDJ5WIdQTd0DRiA7DdxrDiDLxqk8VDE6dWA9AP6SVzXh1aY9McUxwgj2BTTKzLn30I3lmfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726693067; c=relaxed/simple;
	bh=TtUVSbWnkZDmRjZByD6OwGNHt8dNi+VAQtbRHJxuvIw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=j4kqvZAfSCgd2gg/ixRev5lik6ch3xG6e5zqMahFN2M0h3d1A7qVVbUkxeWSPgro3AXDDgbDiJbqtW/Wvhl6Ao2S4Ifmgh+Lt9bxewHg8solnCodjIZhE4yHKRucImwHyBTnbqrHGDL3m1IkJNbbcnzTB/eCl/TClYGGVGOqtSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dU+x1z73; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5B0C4CEC2;
	Wed, 18 Sep 2024 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726693067;
	bh=TtUVSbWnkZDmRjZByD6OwGNHt8dNi+VAQtbRHJxuvIw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=dU+x1z73gtS3ZrP0Vzo6deR8WT0zwFRJxc/KxynAHjX/fvT96VH9E1M6Y60sDGCHg
	 gIrAbsrCpZQEjlM3D8hKnuP31zMZ81rhfm3cwg9fXsfdVY4lyiiNtHvUIRuYWy/btW
	 9wiK1byI2uma9jrYWTR+pHQswTsfKbJ7div9Zwyqzt5zhDdgrTull7VY7IPfXdc9BV
	 jqC0BUmO7e8kJoQzPcplzrg0+iPHLMaSJVex4+E44z9DTkTqLaShXXjJ4wH49xT0jN
	 6iKc2kL92MOGnxYRdC1iZxqLMv1m0RTuCN5eHn24mBUUVRfl06MiHGVwB6mf/z3WhV
	 pVZiLK0fOg9hA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Sep 2024 23:57:42 +0300
Message-Id: <D49PLU7VOREK.3UZFD499C96FB@kernel.org>
To: "Chen Ridong" <chenridong@huaweicloud.com>, "Chen Ridong"
 <chenridong@huawei.com>, <dhowells@redhat.com>, <paul@paul-moore.com>,
 <jmorris@namei.org>, <serge@hallyn.com>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.18.2
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
 <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>
 <D46WU24OP9O4.1Y7EGDV8ZN7NR@kernel.org>
 <1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com>
In-Reply-To: <1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com>

On Wed Sep 18, 2024 at 10:30 AM EEST, Chen Ridong wrote:
>
>
> On 2024/9/15 21:59, Jarkko Sakkinen wrote:
> > On Sun Sep 15, 2024 at 3:55 AM EEST, Chen Ridong wrote:
> >>
> >>
> >> On 2024/9/14 19:33, Jarkko Sakkinen wrote:
> >>> On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
> >>>> We meet the same issue with the LINK, which reads memory out of boun=
ds:
> >>>
> >>> Nit: don't use "we" anywhere".
> >>>
> >>> Tbh, I really don't understand the sentence above. I don't what
> >>> "the same issue with the LINK" really is.
> >>>
> >>
> >> Hello, Jarkko.
> >> I apologize for any confusion caused.
> >>
> >> I've encountered a bug reported by syzkaller. I also found the same bu=
g
> >> reported at this LINK:
> >> https://syzkaller.appspot.com/bug?id=3D68a5e206c2a8e08d317eb83f05610c0=
484ad10b9.
> >>
> >>>> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:=
36
> >>>> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [=
inline]
> >>>> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> >>>> security/keys/permission.c:54
> >>>> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
> >>>>
> >>>> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3=
ede #15
> >>>> Call Trace:
> >>>>    __dump_stack lib/dump_stack.c:82 [inline]
> >>>>    dump_stack+0x107/0x167 lib/dump_stack.c:123
> >>>>    print_address_description.constprop.0+0x19/0x170 mm/kasan/report.=
c:400
> >>>>    __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
> >>>>    kasan_report+0x3a/0x50 mm/kasan/report.c:585
> >>>>    __kuid_val include/linux/uidgid.h:36 [inline]
> >>>>    uid_eq include/linux/uidgid.h:63 [inline]
> >>>>    key_task_permission+0x394/0x410 security/keys/permission.c:54
> >>>>    search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
> >>>>    keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
> >>>>    search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c=
:459
> >>>>    search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys=
.c:544
> >>>>    lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
> >>>>    keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
> >>>>    __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
> >>>>    __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
> >>>>    do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
> >>>>    entry_SYSCALL_64_after_hwframe+0x67/0xd1
> >>>>
> >>>> However, we can't reproduce this issue.
> >>>
> >>> "The issue cannot be easily reproduced but by analyzing the code
> >>> it can be broken into following steps:"
> >>
> >> Thank you for your correction.
> >> Does this patch address the issue correctly? Is this patch acceptable?
> >=20
> > I only comment new patch versions so not giving any promises but I can
> > say that it is I think definitely in the correct direction :-)
> >=20
> > BR, Jarkko
>
> Hello, Jarkko. I have reproduced this issue. It can be reproduced by=20
> following these steps:
>
> 1. Add the helper patch.
>
> @@ -205,6 +205,9 @@ static void hash_key_type_and_desc(struct=20
> keyring_index_key *index_key)
>          else if (index_key->type =3D=3D &key_type_keyring && (hash &=20
> fan_mask) !=3D 0)
>                  hash =3D (hash + (hash << level_shift)) & ~fan_mask;
>          index_key->hash =3D hash;
> +       if ((index_key->hash & 0xff) =3D=3D 0xe6) {
> +                       pr_err("hash_key_type_and_desc: type %s %s=20
> 0x%x\n",  index_key->type->name, index_key->description, index_key->hash)=
;
> +       }
>   }
>
> 2. Pick up the inputs whose hash is xxe6 using the following cmd. If a=20
> key's hash is xxe6, it will be printed.
>
> for ((i=3D0; i<=3D10000; i++)); do ./test_key user user$i "Some payload";=
 done
>
> You have complile test_key whith following code.
>
> #include <sys/types.h>
> #include <keyutils.h>
> #include <stdint.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
>
> int
> main(int argc, char *argv[])
> {
>     key_serial_t key;
>
>     if (argc !=3D 4) {
> 	   fprintf(stderr, "Usage: %s type description payload\n",
> 			   argv[0]);
> 	   exit(EXIT_FAILURE);
>     }
>
>     key =3D add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
> 			   KEY_SPEC_SESSION_KEYRING);
>     if (key =3D=3D -1) {
> 	   perror("add_key");
> 	   exit(EXIT_FAILURE);
>     }
>
>     printf("Key ID is %jx\n", (uintmax_t) key);
>
>     exit(EXIT_SUCCESS);
> }
>
>
> 3. Have more than 32 inputs now. their hashes are xxe6.
> eg.
> hash_key_type_and_desc: type user user438 0xe3033fe6
> hash_key_type_and_desc: type user user526 0xeb7eade6
> ...
> hash_key_type_and_desc: type user user9955 0x44bc99e6
>
> 4. Reboot and add the keys obtained from step 3.
> When adding keys to the ROOT that their hashes are all xxe6, and up to=20
> 16, the ROOT has keys with hashes that are not xxe6 (e.g., slot 0), so=20
> the keys are dissimilar. The ROOT will then split NODE A without using a=
=20
> shortcut. When NODE A is filled with keys that have hashes of xxe6, the=
=20
> keys are similar. NODE A will split with a shortcut.
>
> As my analysis, if a slot of the root is a shortcut(slot 6), it may be=20
> mistakenly be transferred to a key*, leading to an read out-of-bounds rea=
d.
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
> 5. cat /proc/keys. and the issue is reproduced.

Hi, I'll try to run through your procedure next week and give my comments.=
=20
Thanks for doing this.

BR, Jarkko

