Return-Path: <keyrings+bounces-1844-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B88944F63
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 17:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289581C21246
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857321AED30;
	Thu,  1 Aug 2024 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="pV0P8aex"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7D1A4F26
	for <keyrings@vger.kernel.org>; Thu,  1 Aug 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526499; cv=none; b=mrJKQ7eVYhTLrQsTp5mWpHz+rN9FXTnV8Li11aPZU3MHhLzaHlMdGh61cGf1JVNqB5dz31rNn0ESBlBH7gvTpwUY6VMeIMbHqVDTirN6+XL/iK49C5h0YaUV3UYtAJfWXam/Zzz9yFZhVLskPFQHIfZEpioKLeTwj8Uo8jn/UTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526499; c=relaxed/simple;
	bh=cDl6RN2bBIoFKiHj7VJYtw6XbTm0TAQroLX/vhciFkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh4C13643dLVLODIeyTca7jKFeMO+GhIaQc0NNMScejQoiIA45SJ+E2XBco8Qu3j1MFTFDOE30ZiEQBWsE1GzT/tcjf3QmYDnnmM/RVfGnYl/Icffw6S1a0XPUNRwvPwj8E7eatn8s4cqMXXY3HRFipy+KGAEJXxe2hxAuGYvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=pV0P8aex; arc=none smtp.client-ip=83.166.143.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WZY1M0DX7zsVm;
	Thu,  1 Aug 2024 17:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1722526486;
	bh=A1F5zQZorvNwly9Y8kuUv6R07sNlctROnahVJ8WF67o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pV0P8aexwGkvDEmlicisW25ex2jcKUEbnsi1BWyUaNH8VY5zIzP5c4ikbloRZp0Wn
	 00qnhlQORTaApFlGR2/ELVg53YeW8AtUhnUsaBK3VqxGvJVJ5iJGpeAr/BPe+EcbSb
	 QrFsP7iYx5/CJLfoaKvtHDsibuUDIC20IJkVbsrE=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WZY1L1VZpzy5S;
	Thu,  1 Aug 2024 17:34:46 +0200 (CEST)
Date: Thu, 1 Aug 2024 17:34:41 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jann Horn <jannh@google.com>, Kees Cook <kees@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to
 ptrace_may_access()
Message-ID: <20240801.Ais4tiethaus@digikod.net>
References: <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net>
 <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
 <20240729.rayi3Chi9aef@digikod.net>
 <CAG48ez2HdeKXwwiCck9cvcoS1ZhbGD8Qs2DzV7F6W_6=fSgK5Q@mail.gmail.com>
 <20240729.roSo6soogho8@digikod.net>
 <CAHC9VhRmZOMLwY4AvV+96WU3jyqMt6jX5sRKAos75OjWDo-NvA@mail.gmail.com>
 <CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com>
 <CAHC9VhTk4X61K72FubR8ahNeGyzWKkF=vJZD+k-8+xO7RwZpgg@mail.gmail.com>
 <CAG48ez0RVMpMY2vfWqrCDYjFj7zZx5HCP+h-EaeNW1-0_EU0mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0RVMpMY2vfWqrCDYjFj7zZx5HCP+h-EaeNW1-0_EU0mg@mail.gmail.com>
X-Infomaniak-Routing: alpha

On Wed, Jul 31, 2024 at 11:33:04PM +0200, Jann Horn wrote:
> On Wed, Jul 31, 2024 at 11:27 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Wed, Jul 31, 2024 at 4:54 PM Jann Horn <jannh@google.com> wrote:
> > > On Wed, Jul 31, 2024 at 10:29 PM Paul Moore <paul@paul-moore.com> wrote:
> > > > On Mon, Jul 29, 2024 at 11:17 AM Mickaël Salaün <mic@digikod.net> wrote:
> > > > > On Mon, Jul 29, 2024 at 05:06:10PM +0200, Jann Horn wrote:
> > > > > > On Mon, Jul 29, 2024 at 5:02 PM Mickaël Salaün <mic@digikod.net> wrote:
> > > > > > > On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> > > > > > > > On Mon, Jul 29, 2024 at 4:09 PM Mickaël Salaün <mic@digikod.net> wrote:
> > > > > > > > > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > > > > > > > > On Mon, Jul 29, 2024 at 2:59 PM Mickaël Salaün <mic@digikod.net> wrote:
> > > > > > > > > > > A process can modify its parent's credentials with
> > > > > > > > > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
> > > > > > > > > > > doesn't take into account all possible access controls.
> > > > > > > > > > >
> > > > > > > > > > > Enforce the same access checks as for impersonating a process.
> > > > > > > > > > >
> > > > > > > > > > > The current credentials checks are untouch because they check against
> > > > > > > > > > > EUID and EGID, whereas ptrace_may_access() checks against UID and GID.
> > > > > > > > > >
> > > > > > > > > > FWIW, my understanding is that the intended usecase of
> > > > > > > > > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyctl
> > > > > > > > > > new_session" and "e4crypt new_session") want to be able to change the
> > > > > > > > > > keyring of the parent process that spawned them (which I think is
> > > > > > > > > > usually a shell?); and Yama LSM, which I think is fairly widely used
> > > > > > > > > > at this point, by default prevents a child process from using
> > > > > > > > > > PTRACE_MODE_ATTACH on its parent.
> > > > > > > > >
> > > > > > > > > About Yama, the patched keyctl_session_to_parent() function already
> > > > > > > > > check if the current's and the parent's credentials are the same before
> > > > > > > > > this new ptrace_may_access() check.
> > > > > > > >
> > > > > > > > prepare_exec_creds() in execve() always creates new credentials which
> > > > > > > > are stored in bprm->cred and then later committed in begin_new_exec().
> > > > > > > > Also, fork() always copies the credentials in copy_creds().
> > > > > > > > So the "mycred == pcred" condition in keyctl_session_to_parent()
> > > > > > > > basically never applies, I think.
> > > > > > > > Also: When that condition is true, the whole operation is a no-op,
> > > > > > > > since if the credentials are the same, then the session keyring that
> > > > > > > > the credentials point to must also be the same.
> > > > > > >
> > > > > > > Correct, it's not a content comparison.  We could compare the
> > > > > > > credential's data for this specific KEYCTL_SESSION_TO_PARENT call, I
> > > > > > > guess this should not be performance sensitive.
> > > > > >
> > > > > > Yeah, though I guess keyctl_session_to_parent() is already kind of
> > > > > > doing that for the UID information; and for LSMs that would mean
> > > > > > adding an extra LSM hook?
> > > > >
> > > > > I'm wondering why security_key_session_to_parent() was never used: see
> > > > > commit 3011a344cdcd ("security: remove dead hook key_session_to_parent")
> > > >
> > > > While I was looking at this in another off-list thread I think I came
> > > > around to the same conclusion: I think we want the
> > > > security_key_session_to_parent() hook back, and while I'm wearing my
> > > > SELinux hat, I think we want a SELinux implementation.
> > >
> > > FYI: Those checks, including the hook that formerly existed there, are
> > > (somewhat necessarily) racy wrt concurrent security context changes of
> > > the parent because they come before asynchronous work is posted to the
> > > parent to do the keyring update.
> >
> > I was wondering about something similar while looking at
> > keyctl_session_to_parent(), aren't all of the parent's cred checks
> > here racy?
> 
> Yeah...
> 
> > > In theory we could make them synchronous if we have the child wait for
> > > the parent to enter task work... actually, with that we could probably
> > > get rid of the whole cred_transfer hack and have the parent do
> > > prepare_creds() and commit_creds() normally, and propagate any errors
> > > back to the child, as long as we don't create any deadlocks with
> > > this...
> >
> > Assuming that no problems are caused by waiting on the parent, this
> > might be the best approach.  Should we also move, or duplicate, the
> > cred checks into the parent's context to avoid any races?
> 
> Yeah, I think that'd probably be a reasonable way to do it. Post task
> work to the parent, wait for the task work to finish (with an
> interruptible sleep that cancels the work item on EINTR), and then do
> the checks and stuff in the parent. I guess whether we should also do
> racy checks in the child before that depends on whether we're worried
> about a child without the necessary permissions being able to cause
> spurious syscall restarts in the parent...

Why doing the check only in the parent and reporting back the result to
the child could be a security issue?  I guess duplicating the check
would just avoid executing useless code in the parent side if the child
doesn't have enough privileges right?

> 
> > > > Mickaël, is this something you want to work on?

I'll let you handle the new design of the hook, but I'll review it. :)

I guess we're not OK to tie the KEYCTL_SESSION_TO_PARENT call to a
ptrace_may_access() mainly because of the Yama case?  I'm wondering if
we should add an exception for Yama here, or if each LSM should
implement its own new hook with the related new bit of security policy.
I guess some systems with a fine-tuned SELinux policy could be an issue
too.

Anyway, I wondering what was the motivation to only/mainly check
EUID/EGID for keyring change.

