Return-Path: <keyrings+bounces-2187-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B81993AAD
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 01:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0D0B1F23A97
	for <lists+keyrings@lfdr.de>; Mon,  7 Oct 2024 23:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA618F2F9;
	Mon,  7 Oct 2024 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpXMMoUO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D618C002;
	Mon,  7 Oct 2024 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728342905; cv=none; b=lNB+VvvoC/zc89ytp0rOCpZkOEGzL60BuIZ+Kj/iyEufLk+J7tOhtuyzoFLpuGBNylscYe9x1sAfY2NYmAVI0pjhup4mm9QRVWcg0pP3QmTBMkAlKbr+5e8COQ8jzz8PsNfVtgvhWaGvtnEs6FqMheYGP56jLbA6XHwYOoRi+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728342905; c=relaxed/simple;
	bh=JdWjJSglb44kyO62Fro8bfFUd47NktATVZQueaOFco8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PnrQ+iAZmkV6XMUYxyq8/HvCfPX2r0bK+stoCcHVectVL3VG055P7Iw3FWU0ZY4Eg/7SaDEGsZg7OPoAmCopixuuusUTER51U5phor7HtSlOLXI+W5sA1ZrHIE4YLAe37xMYNhXbyBKFbMOxKYZmoO2fZOulUvekuJv/rU8STmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpXMMoUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FB7C4CEC6;
	Mon,  7 Oct 2024 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728342904;
	bh=JdWjJSglb44kyO62Fro8bfFUd47NktATVZQueaOFco8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DpXMMoUO/sMB+im79i7DRqTPxXxj2WN+dNI74h4vqz76RIZsRGbIxvCohpCkgDYP+
	 CwwIL3/BCrXgls6dtSNDNU2w/CVjO9nHvVlDV7q/ODftckK2MypmqmRbyiG/3QSHy4
	 woeUcU1oI/r5Kgz9NiNn2l9ADDyXTVz6HSHq46/3RV6IJVEoblNxNZxSaFLnITvV45
	 fpypvQ241D0CTswt1HfXbgUTXZDO0OPts72Q456jdMEkUGZjDH4GaJYm5LZqlw12I6
	 WroINCpkbb7iukYPLIewYPZ4b5Gqub4t6bMBYstDcIUSb1th5aT773tU429skEjEK0
	 ckImOnpQfpUDw==
Message-ID: <6286c177ee1393c64ed2014322074497730c9b33.camel@kernel.org>
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Chen Ridong <chenridong@huawei.com>, dhowells@redhat.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chenridong@huaweicloud.com
Date: Tue, 08 Oct 2024 02:15:00 +0300
In-Reply-To: <20240913070928.1670785-1-chenridong@huawei.com>
References: <20240913070928.1670785-1-chenridong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Revisit...

On Fri, 2024-09-13 at 07:09 +0000, Chen Ridong wrote:
> We meet the same issue with the LINK, which reads memory out of
> bounds:

Never ever use pronoun "we" in a commit message in any possible
sentence. Instead always use passive imperative.

What you probably want to say is:

"KASAN reports an out of bounds read:"

Right?

> BUG: KASAN: slab-out-of-bounds in __kuid_val
> include/linux/uidgid.h:36
> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63
> [inline]
> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> security/keys/permission.c:54
> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
>=20
> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-
> gafbffd6c3ede #15
> Call Trace:
>  __dump_stack lib/dump_stack.c:82 [inline]
>  dump_stack+0x107/0x167 lib/dump_stack.c:123
>  print_address_description.constprop.0+0x19/0x170
> mm/kasan/report.c:400
>  __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
>  kasan_report+0x3a/0x50 mm/kasan/report.c:585
>  __kuid_val include/linux/uidgid.h:36 [inline]
>  uid_eq include/linux/uidgid.h:63 [inline]
>  key_task_permission+0x394/0x410 security/keys/permission.c:54
>  search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793

Snip all below away:

>  keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
>  search_cred_keyrings_rcu+0x111/0x2e0
> security/keys/process_keys.c:459
>  search_process_keyrings_rcu+0x1d/0x310
> security/keys/process_keys.c:544
>  lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
>  keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
>  __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
>  __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
>  do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x67/0xd1

Remember to cut only the relevant part of the stack trace to make this
commit message more compact and readable.

>=20
> However, we can't reproduce this issue.
> After our analysis, it can make this issue by following steps.
> 1.As syzkaller reported, the memory is allocated for struct

"1. "

>   assoc_array_shortcut in the assoc_array_insert_into_terminal_node
>   functions.
> 2.In the search_nested_keyrings, when we go through the slots in a
> node,
>   (bellow tag ascend_to_node), and the slot ptr is meta and
>   node->back_pointer !=3D NULL, we will proceed to  descend_to_node.
>   However, there is an exception. If node is the root, and one of the
>   slots points to a shortcut, it will be treated as a keyring.
> 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring
> function.
>   However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
>   ASSOC_ARRAY_PTR_SUBTYPE_MASK,
> 4.As mentioned above, If a slot of the root is a shortcut, it may be
>   mistakenly be transferred to a key*, leading to an read out-of-
> bounds
>   read.

Delete the whole list and write a description of the problem and why
your change resolves it.

As per code change, let's layout it something more readable first:

/* Traverse branches into depth: */
if (assoc_array_ptr_is_meta(ptr)) {
	if (node->back_pointer || assoc_array_ptr_is_shortcut(ptr))
		goto descend_to_node;
}

So one thing that should be explained just to make the description
rigid is why 'ptr' is passed to assoc_array_ptr_is_shortcut() and
not 'node'. I'm actually 100% sure about that part, which kind
of supports my view here, right? :-)

The first part of the if-statement obviously filters out everything
that is not root (when it comes to 'node'). Explain the second part.
At that point it is know that node is a root node, so continue from
there.

BR, Jarkko


