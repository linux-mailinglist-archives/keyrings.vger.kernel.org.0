Return-Path: <keyrings+bounces-1831-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338693F8F4
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 17:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBCEB2829B0
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 15:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEDE74E09;
	Mon, 29 Jul 2024 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="k/8V+Utu"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771E155399
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265376; cv=none; b=Q+MhZZeCDH7o1NMpSauKvISmTAyEuhSwU5QYilzncbfrh0OGuNjLByHWK63O8MJL1tFwV22w/5HG3W9E2+JYKoeq8XGoepPfZmVqYHuAiMIIvZ6ol7nXfQ5MVzJ2dJnKjMnElPGy91NfhSxxHOA+2yM7XdQvBx+QXBbng6Tt7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265376; c=relaxed/simple;
	bh=onBbiaEWw8YNvIODJmcayzpy+8J+PVNXsDSfrhQlNes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDrdOjWfA9c+h8wkXvN4BPelLzscSbsdmcYbFsSUuLeghNsqOw3XlZZ2QXoDqt6DQKvydChZrvyyotxFyPG7vjPQAWo/HKKX20VD4GIpQ2hlFwphKqnN6fCdDbemehKb46k2Dv/EqGGR/XUrgcMgmKrpGA+Pd54R21IYmBm7xXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=k/8V+Utu; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WXhRm5vdzzWrC;
	Mon, 29 Jul 2024 17:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1722265364;
	bh=9LGQN8Vc3Rs6TsiKBFEp9Lr0Cof6R+g+itZnhj1fmxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/8V+UtuS28xmHYtqebOtZ1h+gw0saUyWy9nNjqNzdJQMGh2tqUYuDTa1kHMWYr0c
	 dpnU0keYfYF7c3K2Y0A5MFAD/7rp9OTFKT9b8V/D8Gliaam664/PMqKrHMq0u1hxpY
	 D26x6Kn+Sk7GNFUJD/vlEwpzYkDufHqKq6dhO0fs=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4WXhRm0dkYz6N6;
	Mon, 29 Jul 2024 17:02:44 +0200 (CEST)
Date: Mon, 29 Jul 2024 17:02:41 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jann Horn <jannh@google.com>
Cc: David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to
 ptrace_may_access()
Message-ID: <20240729.rayi3Chi9aef@digikod.net>
References: <20240729125846.1043211-1-mic@digikod.net>
 <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net>
 <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
X-Infomaniak-Routing: alpha

On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> On Mon, Jul 29, 2024 at 4:09 PM Mickaël Salaün <mic@digikod.net> wrote:
> > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > On Mon, Jul 29, 2024 at 2:59 PM Mickaël Salaün <mic@digikod.net> wrote:
> > > > A process can modify its parent's credentials with
> > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
> > > > doesn't take into account all possible access controls.
> > > >
> > > > Enforce the same access checks as for impersonating a process.
> > > >
> > > > The current credentials checks are untouch because they check against
> > > > EUID and EGID, whereas ptrace_may_access() checks against UID and GID.
> > >
> > > FWIW, my understanding is that the intended usecase of
> > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyctl
> > > new_session" and "e4crypt new_session") want to be able to change the
> > > keyring of the parent process that spawned them (which I think is
> > > usually a shell?); and Yama LSM, which I think is fairly widely used
> > > at this point, by default prevents a child process from using
> > > PTRACE_MODE_ATTACH on its parent.
> >
> > About Yama, the patched keyctl_session_to_parent() function already
> > check if the current's and the parent's credentials are the same before
> > this new ptrace_may_access() check.
> 
> prepare_exec_creds() in execve() always creates new credentials which
> are stored in bprm->cred and then later committed in begin_new_exec().
> Also, fork() always copies the credentials in copy_creds().
> So the "mycred == pcred" condition in keyctl_session_to_parent()
> basically never applies, I think.
> Also: When that condition is true, the whole operation is a no-op,
> since if the credentials are the same, then the session keyring that
> the credentials point to must also be the same.

Correct, it's not a content comparison.  We could compare the
credential's data for this specific KEYCTL_SESSION_TO_PARENT call, I
guess this should not be performance sensitive.

