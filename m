Return-Path: <keyrings+bounces-2056-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B33979084
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 13:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C730B2811BA
	for <lists+keyrings@lfdr.de>; Sat, 14 Sep 2024 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9061CEAAC;
	Sat, 14 Sep 2024 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixU4HPOP"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D41DA5E;
	Sat, 14 Sep 2024 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726313603; cv=none; b=dGkjv/k7ENUFTQgLsDI3d2Ko8UW1lg7727auCRuWOe0BAIdEcmfBO1PQPvkmMVS2oE9Ivw5ELA/zQ3flD7X9itJLYky7w+xaODKw1aZW/xrd7VttDXTPHAEatRSs86S2bMf4g2CN/jXiS3l7slNJt7FBx0jrVMd+3f6G7ox30gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726313603; c=relaxed/simple;
	bh=N+eA+vXiE+7USFq4J1f1zDHROoHvcWUvof4TiItgmVI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=NkhUmXbP9+ZQd+E69r2ERPGp03/5aWSfZXl8ocx1FZNt1/auMgauxqODjRzIbRh7Gd/dqk5zDfralvfjgVnprarUsyi3dGpoXvoX7tVioUCW03J6mqz7SNZsjMyNUphiCkl0a8U/RidB7tNxO+lIY+emPYm0w/iG7knbNO432pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixU4HPOP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250CBC4CEC0;
	Sat, 14 Sep 2024 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726313602;
	bh=N+eA+vXiE+7USFq4J1f1zDHROoHvcWUvof4TiItgmVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixU4HPOPRYdIdUtrTaqZboeUpxPXGrvxKq6SxuD1L/VhR4wu3lOWD04s/xwMso11v
	 KGLUvMaYPt2p+vH0C0zizRDKjHB+uprZhIhyekneTUXKc/xYo6H1q4mDkUql+Umg29
	 6xNxwAC0hT3GiFJhhSW9AW8JFO0ENfgWxdgNs+ncKWQMSOMGriDPrNTK6hT6LLeO80
	 1AKc1vdtRG3h032tjEhmBRAQStlzUImJcfsdwWhPsoGiXIHRy6FMGlaXLp8E3FwpuA
	 r24X9GCLEe96mh4NsSZJU30vZHW7n4JO25E6Fw5G9wp8z222AuS17jNJxTuY5XkcDd
	 gbTS2kzPrLu5g==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Sep 2024 14:33:18 +0300
Message-Id: <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Chen Ridong" <chenridong@huawei.com>, <dhowells@redhat.com>,
 <paul@paul-moore.com>, <jmorris@namei.org>, <serge@hallyn.com>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chenridong@huaweicloud.com>
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
X-Mailer: aerc 0.18.2
References: <20240913070928.1670785-1-chenridong@huawei.com>
In-Reply-To: <20240913070928.1670785-1-chenridong@huawei.com>

On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
> We meet the same issue with the LINK, which reads memory out of bounds:

Nit: don't use "we" anywhere".

Tbh, I really don't understand the sentence above. I don't what
"the same issue with the LINK" really is.

> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inlin=
e]
> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> security/keys/permission.c:54
> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>
> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #=
15
> Call Trace:
>  __dump_stack lib/dump_stack.c:82 [inline]
>  dump_stack+0x107/0x167 lib/dump_stack.c:123
>  print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
>  __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>  kasan_report+0x3a/0x50 mm/kasan/report.c:585
>  __kuid_val include/linux/uidgid.h:36 [inline]
>  uid_eq include/linux/uidgid.h:63 [inline]
>  key_task_permission+0x394/0x410 security/keys/permission.c:54
>  search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
>  keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>  search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
>  search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
>  lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>  keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>  __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>  __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>  do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x67/0xd1
>
> However, we can't reproduce this issue.

"The issue cannot be easily reproduced but by analyzing the code
it can be broken into following steps:"

> After our analysis, it can make this issue by following steps.
> 1.As syzkaller reported, the memory is allocated for struct
>   assoc_array_shortcut in the assoc_array_insert_into_terminal_node
>   functions.
> 2.In the search_nested_keyrings, when we go through the slots in a node,
>   (bellow tag ascend_to_node), and the slot ptr is meta and
>   node->back_pointer !=3D NULL, we will proceed to  descend_to_node.
>   However, there is an exception. If node is the root, and one of the
>   slots points to a shortcut, it will be treated as a keyring.
> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
>   However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>   ASSOC_ARRAY_PTR_SUBTYPE_MASK,
> 4.As mentioned above, If a slot of the root is a shortcut, it may be
>   mistakenly be transferred to a key*, leading to an read out-of-bounds
>   read.
>
> To fix this issue, one should jump to descend_to_node if the pointer is a
> shortcut.
>
> Link: https://syzkaller.appspot.com/bug?id=3D68a5e206c2a8e08d317eb83f0561=
0c0484ad10b9
> Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  security/keys/keyring.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 4448758f643a..7958486ac834 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -772,7 +772,9 @@ static bool search_nested_keyrings(struct key *keyrin=
g,
>  	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
>  		ptr =3D READ_ONCE(node->slots[slot]);
> =20
> -		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
> +		if ((assoc_array_ptr_is_meta(ptr) && node->back_pointer) ||
> +		    (assoc_array_ptr_is_meta(ptr) &&
> +		     assoc_array_ptr_is_shortcut(ptr)))
>  			goto descend_to_node;
> =20
>  		if (!keyring_ptr_is_keyring(ptr))


BR, Jarkko

