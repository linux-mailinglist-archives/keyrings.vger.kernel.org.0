Return-Path: <keyrings+bounces-2067-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8EF9796EB
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 15:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DBC281EA4
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 13:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68731C6890;
	Sun, 15 Sep 2024 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbtfAXaW"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943914286;
	Sun, 15 Sep 2024 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726408778; cv=none; b=dfwaY0tclYMzNRcMabMp5LU0fY3VG3gm4zhouM1ATnKsePT0fgCs0tjbek0q5FAuPp/W6jcNKXUjYHdQrxdJFt+ikiwPrEsvW2b3wnNUHmpwrI7QmW91HmlH8mKFq+j+N4JWndHCwYEK+xfotugQZvMQXP6oguzTp+ila4AiHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726408778; c=relaxed/simple;
	bh=pGhdpnLKMMpzp5BtVWktmzX+4TYM4NBSRmFyG1Z+wtA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bh6hE+Bzp26rlzzmDkkPJIHtF9i9LH8f5Sw5061LVh6JyPe4sP8hZeMTaoy6sJuIIT7zbgYbH0m5AGJpSiHSmq23nzpu88O4ta3QWvaV94uSTDgzngRdMOfT/Rixho4jq9dBMiQltnQPQZDK0suicM+xWnNRN8EUOKI15eSUg3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbtfAXaW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2558C4CEC3;
	Sun, 15 Sep 2024 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726408778;
	bh=pGhdpnLKMMpzp5BtVWktmzX+4TYM4NBSRmFyG1Z+wtA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=sbtfAXaWb+1nAyij4kgj52CR1uoOks3EK2FOcx/PKWm0nfj/uEjdsoj507dkSRCrg
	 09KXd4+BXOZKqTjfqi7kO6dQtFnryWENOaikdp28qK6oemoZIuoADzKbYfmpqAtEs9
	 1LR1MUhxMP0/WOHDr51s3t2SSEawdu5dK7tsVShoa+iF83apVqm3EuJN9FIGTKDrle
	 gybf4l0LTMBWQAXEKcZs/ETzEDUf64+OiLh0INtOQkIg0Q9Lit2uVBGHidzOUCk0xv
	 mMdiMzp0Jr7xMvlWsA9fykDxHZjtNN75WmyEQOmzSteOB97phBNFlVCQ2HkpeSwaV1
	 vlO7XLKPOPV6Q==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Sep 2024 16:59:34 +0300
Message-Id: <D46WU24OP9O4.1Y7EGDV8ZN7NR@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] security/keys: fix slab-out-of-bounds in
 key_task_permission
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Chen Ridong" <chenridong@huaweicloud.com>, "Chen Ridong"
 <chenridong@huawei.com>, <dhowells@redhat.com>, <paul@paul-moore.com>,
 <jmorris@namei.org>, <serge@hallyn.com>
X-Mailer: aerc 0.18.2
References: <20240913070928.1670785-1-chenridong@huawei.com>
 <D45Z3J2E2MPX.4SDWNGAP3D41@kernel.org>
 <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>
In-Reply-To: <4079d020-edcc-4e27-9815-580f83a6c0ca@huaweicloud.com>

On Sun Sep 15, 2024 at 3:55 AM EEST, Chen Ridong wrote:
>
>
> On 2024/9/14 19:33, Jarkko Sakkinen wrote:
> > On Fri Sep 13, 2024 at 10:09 AM EEST, Chen Ridong wrote:
> >> We meet the same issue with the LINK, which reads memory out of bounds=
:
> >=20
> > Nit: don't use "we" anywhere".
> >=20
> > Tbh, I really don't understand the sentence above. I don't what
> > "the same issue with the LINK" really is.
> >=20
>
> Hello, Jarkko.
> I apologize for any confusion caused.
>
> I've encountered a bug reported by syzkaller. I also found the same bug=
=20
> reported at this LINK:=20
> https://syzkaller.appspot.com/bug?id=3D68a5e206c2a8e08d317eb83f05610c0484=
ad10b9.
>
> >> BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
> >> BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [in=
line]
> >> BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
> >> security/keys/permission.c:54
> >> Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362
> >>
> >> CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ed=
e #15
> >> Call Trace:
> >>   __dump_stack lib/dump_stack.c:82 [inline]
> >>   dump_stack+0x107/0x167 lib/dump_stack.c:123
> >>   print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:4=
00
> >>   __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
> >>   kasan_report+0x3a/0x50 mm/kasan/report.c:585
> >>   __kuid_val include/linux/uidgid.h:36 [inline]
> >>   uid_eq include/linux/uidgid.h:63 [inline]
> >>   key_task_permission+0x394/0x410 security/keys/permission.c:54
> >>   search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
> >>   keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
> >>   search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:45=
9
> >>   search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:=
544
> >>   lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
> >>   keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
> >>   __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
> >>   __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
> >>   do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
> >>   entry_SYSCALL_64_after_hwframe+0x67/0xd1
> >>
> >> However, we can't reproduce this issue.
> >=20
> > "The issue cannot be easily reproduced but by analyzing the code
> > it can be broken into following steps:"
>
> Thank you for your correction.
> Does this patch address the issue correctly? Is this patch acceptable?

I only comment new patch versions so not giving any promises but I can
say that it is I think definitely in the correct direction :-)

BR, Jarkko

