Return-Path: <keyrings+bounces-1861-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61B946AAB
	for <lists+keyrings@lfdr.de>; Sat,  3 Aug 2024 19:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98985281AFF
	for <lists+keyrings@lfdr.de>; Sat,  3 Aug 2024 17:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38C1175AE;
	Sat,  3 Aug 2024 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr85dsLh"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F613FF9;
	Sat,  3 Aug 2024 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722705639; cv=none; b=Z1uKvL0ZBluLEmtOQhtI7Z1fBT78CNN+HqsgiOJw1STFDzBHng3WgLe9BlZy9v1bC1vQMhoylv1+k1W+jqDCIpN/llpVzWQRgzIT69JKCH63FzMo5xVDQB2uCj+tJaSXby89GSFqB83QXZ5P21Ow7Qz44EJEKjRCUERIHFaYG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722705639; c=relaxed/simple;
	bh=oopEEmNt7me2D3Oh0stU4KwiD5hCwyE/D6bQNo1nin8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=OQaMohWxrk/iTwg5olM3Z6YBQDhd5eVwYNJ4dsbBNhSYCQmYjF9AzLUNWmuHZ2kzy8U70tj5Tkjcu08EGtW10otjubqEN0xacxI26h3A4x0bgu28ffUXq+FNZPeHWp9ZDD7zGx+zgaR5blqiCKuA7+AoXtwZLpVZtj2kHDjCYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr85dsLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E2EC116B1;
	Sat,  3 Aug 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722705639;
	bh=oopEEmNt7me2D3Oh0stU4KwiD5hCwyE/D6bQNo1nin8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sr85dsLhagZP5boe6BgFHYmvqBlZGpivyNEIa0QQ9DeKARirv0EkarkzgRFylYGeo
	 w5yoe2KqvuSV2Op9Cv68bnmQ/OU8sUHx19LuKmA+qwyXZl2PLCRkYHPqAjUPv3kOEj
	 WU+moUAhnR7+Ovr8U6AzCUkTX4wVyDPatVpu7uBCZXn42Cw/NRgoTyGgWZfRZxhNqX
	 9rnQOnR6cf7XkGNWLQsTNK2BdV9Wbh96K46fcThgmH8IYS5pcht4KhTFcJ/80hPdz9
	 ms2Jm38RJx1wV60bgxLAjFadol8dmUMNUrwREJtm1rTRv+EFT/v3z2p9i4bQsmi+WJ
	 8YIZ0K2dHPepg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Aug 2024 20:20:35 +0300
Message-Id: <D36G6JFV79FK.2LCFXJYDTRRPK@kernel.org>
Subject: Re: [PATCH RFC] security/KEYS: get rid of cred_alloc_blank and
 cred_transfer
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Jarkko Sakkinen"
 <jarkko.sakkinen@iki.fi>
Cc: "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "John Johansen"
 <john.johansen@canonical.com>, "David Howells" <dhowells@redhat.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Stephen Smalley"
 <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Casey Schaufler" <casey@schaufler-ca.com>, <linux-kernel@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <apparmor@lists.ubuntu.com>,
 <keyrings@vger.kernel.org>, <selinux@vger.kernel.org>
X-Mailer: aerc 0.18.0
References: <20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com>
 <D35ML45KMWK8.1E29IC0VZO4CL@iki.fi>
 <CAG48ez1GFY5H1ujaDfcj-Ay5_Pm8MsBVL=vU4tEynXgzg5yduQ@mail.gmail.com>
In-Reply-To: <CAG48ez1GFY5H1ujaDfcj-Ay5_Pm8MsBVL=vU4tEynXgzg5yduQ@mail.gmail.com>

On Fri Aug 2, 2024 at 9:39 PM EEST, Jann Horn wrote:
> > > What do you think? Synchronously waiting for task work is a bit ugly,
> > > but at least this condenses the uglyness in the keys subsystem instea=
d
> > > of making the rest of the security subsystem deal with this stuff.
> >
> > Why does synchronously waiting is ugly? Not sarcasm, I genuineily
> > interested of breaking that down in smaller pieces.
> >
> > E.g. what disadvantages would be there from your point of view?
> >
> > Only trying to form a common picture, that's all.
>
> Two things:
>
> 1. It means we have to send a pseudo-signal to the parent, to get the
> parent to bail out into signal handling context, which can lead to
> extra spurious -EGAIN in the parent. I think this is probably fine
> since _most_ parent processes will already expect to handle SIGCHLD
> signals...
>
> 2. If the parent is blocked on some other killable wait, we won't be
> able to make progress - so in particular, if the parent was using a
> killable wait to wait for the child to leave its syscall, userspace
> =E1=BA=81ould deadlock (in a way that could be resolved by SIGKILLing one=
 of
> the processes). Actually, I think that might happen if the parent uses
> ptrace() with sufficiently bad timing? We could avoid the issue by
> doing an interruptible wait instead of a killable one, but then that
> might confuse userspace callers of the keyctl() if they get an
> -EINTR...
> I guess the way to do this cleanly is to use an interruptible wait and
> return -ERESTARTNOINTR if it gets interrupted?

Or ERESTARTSYS if you want to select the behavior from caller using
SA_RESTART, whether to restart or -EINTR.


> > > Another approach to simplify things further would be to try to move
> > > the session keyring out of the creds entirely and just let the child
> > > update it directly with appropriate locking, but I don't know enough
> > > about the keys subsystem to know if that would maybe break stuff
> > > that relies on override_creds() also overriding the keyrings, or
> > > something like that.
> > > ---
> > >  include/linux/cred.h          |   1 -
> > >  include/linux/lsm_hook_defs.h |   3 --
> > >  include/linux/security.h      |  12 -----
> > >  kernel/cred.c                 |  23 ----------
> > >  security/apparmor/lsm.c       |  19 --------
> > >  security/keys/internal.h      |   8 ++++
> > >  security/keys/keyctl.c        | 100 +++++++++++---------------------=
----------
> > >  security/keys/process_keys.c  |  86 +++++++++++++++++++-------------=
----
> > >  security/landlock/cred.c      |  11 +----
> > >  security/security.c           |  35 ---------------
> > >  security/selinux/hooks.c      |  12 -----
> > >  security/smack/smack_lsm.c    |  32 --------------
> > >  12 files changed, 82 insertions(+), 260 deletions(-)
> >
> > Given the large patch size:
> >
> > 1. If it is impossible to split some meaningful patches, i.e. patches
> >    that transform kernel tree from working state to another, I can
> >    cope with this.
> > 2. Even for small chunks that can be split into their own logical
> >    pieces: please do that. Helps to review the main gist later on.
>
> There are basically two parts to this, it could be split up nicely into t=
hese:
>
> 1. refactor code in security/keys/
> 2. rip out all the code that is now unused (as you can see in the
> diffstat, basically everything outside security/keys/ is purely
> removals)

Yeah, I'd go for this simply because it allows better reviewer
visibility. You can look at the soluton and cleanups separately.

>
> [...]
> > Not going through everything but can we e.g. make a separe SMACK patch
> > prepending?
>
> I wouldn't want to split it up further: As long as the cred_transfer
> mechanism and LSM hook still exist, all the LSMs that currently have
> implementations of it should also still implement it.
>
> But I think if patch 2/2 is just ripping out unused infrastructure
> across the tree, that should be sufficiently reviewable? (Or we could
> split it up into ripping out one individual helper per patch, but IDK,
> that doesn't seem to me like it adds much reviewability.)

I don't want to dictate this because might give wrong advice (given
bandwidth to think it through). Pick a solution and we'll look at it :-)

BR, Jarkko

