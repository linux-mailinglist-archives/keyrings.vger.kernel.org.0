Return-Path: <keyrings+bounces-2192-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E96993D01
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 04:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE6D1C209C3
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 02:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EF220326;
	Tue,  8 Oct 2024 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbE8LFx0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B531F60A;
	Tue,  8 Oct 2024 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728355316; cv=none; b=PFgH44t40/R/Iv5uWK7xIUuU2jPPKg1X1tR6Qu+CIo5FzI9NIQ9wx5ABv4IjZfXu651W2lubyR+thaZDwwXkc5yMKNYa2MDPoE8HvN2f6DO637z2RHbpAeQL63r6NwBQQkaRLrmOPHUy1pae8RCSKibc49Q2wDZqZqzChBSF6fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728355316; c=relaxed/simple;
	bh=9Y86n1LVdXrgfQTdqYuGrkCAIEQeam3XR7GvfmbbLec=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZCYqyiQSJX7qFPZRpxEFCF4iLGeQB1Odf9lpL/NUrlieBcoYvT9I2/DOEZZ9nkoEQybWXeJ2h64pq3qWFiq1OUcE/5C2K7MIVl25ybtMBIivOdKn+SEkw60D7SQFIX4/dUizpm0weukaj8gBz6I6gUIYEC0/+nCBGGb4lJFMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbE8LFx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860DFC4CEC6;
	Tue,  8 Oct 2024 02:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728355316;
	bh=9Y86n1LVdXrgfQTdqYuGrkCAIEQeam3XR7GvfmbbLec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JbE8LFx01WSZWq24SeWb/gTnuh8N0I60a6Fm7MVM/dm0+PgxFnYJ2AIgQXHCGYHpF
	 mZ1W9WXA8j3PG91tFjIPQb9fWHqo4Sq+Mic7JIvqYuMiIaDM8HIYgE6thV11kPl/zA
	 oiI9C8WUAOFRuGmKVDO5vEW5JuCxUHyDHr3yTR6gcuxeb+bt0Sq5d/+7PeYs3NxJ+r
	 5CefSIZlOjdzuFINPYTnD4hcEJ+ZDRorlIXrbeURJbGhSD5H/DSlwKxkpZj/bGuMC5
	 JCL+uYaAu1TXf9YyAPDB9d9SSg95Nd5qnMS+6s7bkCBS934z9T47xMkMt87BQfxBE+
	 g+OcWiEkeh7og==
Message-ID: <578d5b202782b3e4195b721bab11a811aa50d34e.camel@kernel.org>
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: Jarkko Sakkinen <jarkko@kernel.org>
To: chenridong <chenridong@huawei.com>, dhowells@redhat.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chenridong@huaweicloud.com
Date: Tue, 08 Oct 2024 05:41:51 +0300
In-Reply-To: <68b51392-0f93-405f-bcf4-94db22831058@huawei.com>
References: <20240913070928.1670785-1-chenridong@huawei.com>
	 <6286c177ee1393c64ed2014322074497730c9b33.camel@kernel.org>
	 <68b51392-0f93-405f-bcf4-94db22831058@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-08 at 09:40 +0800, chenridong wrote:
>=20
>=20
> On 2024/10/8 7:15, Jarkko Sakkinen wrote:
> > Hi,
> >=20
> > Revisit...
> >=20
> > On Fri, 2024-09-13 at 07:09 +0000, Chen Ridong wrote:
> > > We meet the same issue with the LINK, which reads memory out of
> > > bounds:
> >=20
> > Never ever use pronoun "we" in a commit message in any possible
> > sentence. Instead always use passive imperative.
> >=20
> > What you probably want to say is:
> >=20
> > "KASAN reports an out of bounds read:"
> >=20
> > Right?
> >=20
>=20
> Yes.
>=20
> > > BUG: KASAN: slab-out-of-bounds in __kuid_val
> > > include/linux/uidgid.h:36
> > > BUG: KASAN: slab-out-of-bounds in uid_eq
> > > include/linux/uidgid.h:63
> > > [inline]
> > > BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> > > security/keys/permission.c:54
> > > Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
> > >=20
> > > CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-
> > > gafbffd6c3ede #15
> > > Call Trace:
> > > =C2=A0 __dump_stack lib/dump_stack.c:82 [inline]
> > > =C2=A0 dump_stack+0x107/0x167 lib/dump_stack.c:123
> > > =C2=A0 print_address_description.constprop.0+0x19/0x170
> > > mm/kasan/report.c:400
> > > =C2=A0 __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
> > > =C2=A0 kasan_report+0x3a/0x50 mm/kasan/report.c:585
> > > =C2=A0 __kuid_val include/linux/uidgid.h:36 [inline]
> > > =C2=A0 uid_eq include/linux/uidgid.h:63 [inline]
> > > =C2=A0 key_task_permission+0x394/0x410 security/keys/permission.c:54
> > > =C2=A0 search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
> >=20
> > Snip all below away:
> >=20
> > > =C2=A0 keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
> > > =C2=A0 search_cred_keyrings_rcu+0x111/0x2e0
> > > security/keys/process_keys.c:459
> > > =C2=A0 search_process_keyrings_rcu+0x1d/0x310
> > > security/keys/process_keys.c:544
> > > =C2=A0 lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
> > > =C2=A0 keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
> > > =C2=A0 __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
> > > =C2=A0 __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
> > > =C2=A0 do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
> > > =C2=A0 entry_SYSCALL_64_after_hwframe+0x67/0xd1
> >=20
> > Remember to cut only the relevant part of the stack trace to make
> > this
> > commit message more compact and readable.
> >=20
> Thank you, I will do that.
>=20
> > >=20
> > > However, we can't reproduce this issue.
> > > After our analysis, it can make this issue by following steps.
> > > 1.As syzkaller reported, the memory is allocated for struct
> >=20
> > "1."
> >=20
> > > =C2=A0=C2=A0 assoc_array_shortcut in the
> > > assoc_array_insert_into_terminal_node
> > > =C2=A0=C2=A0 functions.
> > > 2.In the search_nested_keyrings, when we go through the slots in
> > > a
> > > node,
> > > =C2=A0=C2=A0 (bellow tag ascend_to_node), and the slot ptr is meta an=
d
> > > =C2=A0=C2=A0 node->back_pointer !=3D NULL, we will proceed to=C2=A0
> > > descend_to_node.
> > > =C2=A0=C2=A0 However, there is an exception. If node is the root, and=
 one
> > > of the
> > > =C2=A0=C2=A0 slots points to a shortcut, it will be treated as a keyr=
ing.
> > > 3.Whether the ptr is keyring decided by keyring_ptr_is_keyring
> > > function.
> > > =C2=A0=C2=A0 However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
> > > =C2=A0=C2=A0 ASSOC_ARRAY_PTR_SUBTYPE_MASK,
> > > 4.As mentioned above, If a slot of the root is a shortcut, it may
> > > be
> > > =C2=A0=C2=A0 mistakenly be transferred to a key*, leading to an read =
out-
> > > of-
> > > bounds
> > > =C2=A0=C2=A0 read.
> >=20
> > Delete the whole list and write a description of the problem and
> > why
> > your change resolves it.
> >=20
> > As per code change, let's layout it something more readable first:
> >=20
> > /* Traverse branches into depth: */
> > if (assoc_array_ptr_is_meta(ptr)) {
> > 	if (node->back_pointer ||
> > assoc_array_ptr_is_shortcut(ptr))
> > 		goto descend_to_node;
> > }
> >=20
> > So one thing that should be explained just to make the description
> > rigid is why 'ptr' is passed to assoc_array_ptr_is_shortcut() and
> > not 'node'. I'm actually 100% sure about that part, which kind
> > of supports my view here, right? :-)
> >=20
> > The first part of the if-statement obviously filters out everything
> > that is not root (when it comes to 'node'). Explain the second
> > part.
> > At that point it is know that node is a root node, so continue from
> > there.
> >=20
> > BR, Jarkko
> >=20
>=20
> Thank you for your patience.
> I will update soon.

Yeah of course, and I did low quality job earlier no issues admitting
that, so let's do this correct this time. I just try to describe
what I'm seeing as accurately as I can :-)=20

Here it is just important to get the explanation and the code change
in-sync so that it is easy to verify and compare them, given that it
is quite sensitive functionality and somewhat obfuscated peace of code
showing age.=20

Also I think a good is to make sure that every fix will leave it at
least a bit cleaner state. From this basis I proposed a bit different
layout for the code.

>=20
> Best regards,
> Ridong

BR,Jarkko

