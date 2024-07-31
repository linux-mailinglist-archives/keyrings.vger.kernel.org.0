Return-Path: <keyrings+bounces-1842-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799D943808
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 23:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F321F21D47
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 21:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D12C14AD3F;
	Wed, 31 Jul 2024 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ct5/Veca"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5B3A1A8
	for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722461626; cv=none; b=RW09jYwVi9vWz0DJwxHbR58Scy6uKx29W+w9ztgxT425FCv4b5eVMPMK2Eayb7YErxP1QTYWdSsgjX3m6fYZbfGozl1Qra/PWPFTnMt85niYB9pQb6DuZZ31784RTWytCoTF0UI4R0p8Hp5gg+7wVJhUzaCv7ps5ezuaz7ZDLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722461626; c=relaxed/simple;
	bh=QDEvnq82N57jTLmqconLtEOjULtygLMOjR80JzO/Uow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhBh54l3ldcQy+fFA90GxNaxUB7FTuvV/OY/oVO6h8Z+MwK58qspIq767gtwv2+qgGC/HCWft8J8zap5hfofnB+Qkup8trXLLUNcaRa8ZplLyWSkHKpsURJDFmMZYZZ4oHNVbOE4B2P7tCEvIqHbtQcrcbKIK4d9qMy+onZ9Los=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ct5/Veca; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so24495a12.1
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722461623; x=1723066423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT2CbU3e64LwMM3GkfeJLb6Pchn2DXv7wXZ8rasocw0=;
        b=Ct5/VecavRXLxIQFu9tl1QRTfbN8oRxvJghGB7q9vrmi4GvDB1ClqMX27eohj+NCF2
         NG8H40r0wnilT/ktQuGgP8znSNGdhtiNRZS7cJsPSTO11QqhDyVxWthFsEOI3+oZBrhc
         TwxJeMaFGNRaj//htc59TnvrcfksuLQWRISCiUcAM9QiO0u9v3ubplmLSjcNCqa08CWr
         oy92TTsVxwja95mowwETMCt5HoULxCqf+yZCoUuAsu3fmDjgXM0jnws4U3uV1wBbZvje
         jzg61et1QvxwCLx3pWcelqdS/5FVb4w/QrOVPsbRfIAcppMvO4/+4aoFETTOip+zdlUA
         KxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722461623; x=1723066423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT2CbU3e64LwMM3GkfeJLb6Pchn2DXv7wXZ8rasocw0=;
        b=pdK4tbby9thJquEoe69klvtmnsOGNPpQa8Nsv5Z0mOX15z9LHOPUIjcBP1SaWnuPCT
         N3jJcbDX7lQ7SgYn9oYxRaZTz2OjmkdmRL+jDrEk1TNTRjGRgkupUbNqPFBvb44R7UXM
         NFck50upXNiC04nMGIcpii+pQo+21CkU36jiUKqXU1BQMQzp7FEkJ04uFj5TQxURnxlQ
         eHRW9lTlclpx/1aZXteyc8QqaZZa7gpKafnSbwMg25hDWa+ipWxuCsEhfAD6NUODX5n4
         YPkuOPjsZ/rPXM7q3EKeG6amLPWtCP748WnL/X9+Ax+obKemMwlRcVUNRi/5xOAwhrut
         fK3A==
X-Forwarded-Encrypted: i=1; AJvYcCVyvNp4WqfAefxVNdCRGXQNGZ4GPcxIVJjKC0ue7A2u3Xswjp9U0hd9ggs91lfnBTnX0BDrl/bNRPv5WdMvzq/KOiPAjTDQXZw=
X-Gm-Message-State: AOJu0YzyRd8WGovSSDSVL8floEJQm61MTXnlhX6+5s/CzYXD4VDrBWkt
	CbCW/k0Ub6hd9sMvQiiDm39CxMsNr2S5SNpczHOLFCcW9DY3i9TjtCN/D4HOxdAvZu+bQK4jcLV
	puDKFZknO52fjR3WuW9w5j6ibCT/81slVhe5q
X-Google-Smtp-Source: AGHT+IED6P4njH1kFTeL8uebfbc6qlu33azi3bN5/ytT8UeUR/yn6BvbajOL7ztRhsvLqNC6mAXpN/eL5nQpCVXaf68=
X-Received: by 2002:a05:6402:3547:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-5b71ed92d2amr5027a12.3.1722461622374; Wed, 31 Jul 2024 14:33:42
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729125846.1043211-1-mic@digikod.net> <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net> <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
 <20240729.rayi3Chi9aef@digikod.net> <CAG48ez2HdeKXwwiCck9cvcoS1ZhbGD8Qs2DzV7F6W_6=fSgK5Q@mail.gmail.com>
 <20240729.roSo6soogho8@digikod.net> <CAHC9VhRmZOMLwY4AvV+96WU3jyqMt6jX5sRKAos75OjWDo-NvA@mail.gmail.com>
 <CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com> <CAHC9VhTk4X61K72FubR8ahNeGyzWKkF=vJZD+k-8+xO7RwZpgg@mail.gmail.com>
In-Reply-To: <CAHC9VhTk4X61K72FubR8ahNeGyzWKkF=vJZD+k-8+xO7RwZpgg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 31 Jul 2024 23:33:04 +0200
Message-ID: <CAG48ez0RVMpMY2vfWqrCDYjFj7zZx5HCP+h-EaeNW1-0_EU0mg@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 11:27=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Wed, Jul 31, 2024 at 4:54=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Wed, Jul 31, 2024 at 10:29=E2=80=AFPM Paul Moore <paul@paul-moore.co=
m> wrote:
> > > On Mon, Jul 29, 2024 at 11:17=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mi=
c@digikod.net> wrote:
> > > > On Mon, Jul 29, 2024 at 05:06:10PM +0200, Jann Horn wrote:
> > > > > On Mon, Jul 29, 2024 at 5:02=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn =
<mic@digikod.net> wrote:
> > > > > > On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> > > > > > > On Mon, Jul 29, 2024 at 4:09=E2=80=AFPM Micka=C3=ABl Sala=C3=
=BCn <mic@digikod.net> wrote:
> > > > > > > > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > > > > > > > On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=
=C3=BCn <mic@digikod.net> wrote:
> > > > > > > > > > A process can modify its parent's credentials with
> > > > > > > > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are t=
he same.  This
> > > > > > > > > > doesn't take into account all possible access controls.
> > > > > > > > > >
> > > > > > > > > > Enforce the same access checks as for impersonating a p=
rocess.
> > > > > > > > > >
> > > > > > > > > > The current credentials checks are untouch because they=
 check against
> > > > > > > > > > EUID and EGID, whereas ptrace_may_access() checks again=
st UID and GID.
> > > > > > > > >
> > > > > > > > > FWIW, my understanding is that the intended usecase of
> > > > > > > > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like=
 "keyctl
> > > > > > > > > new_session" and "e4crypt new_session") want to be able t=
o change the
> > > > > > > > > keyring of the parent process that spawned them (which I =
think is
> > > > > > > > > usually a shell?); and Yama LSM, which I think is fairly =
widely used
> > > > > > > > > at this point, by default prevents a child process from u=
sing
> > > > > > > > > PTRACE_MODE_ATTACH on its parent.
> > > > > > > >
> > > > > > > > About Yama, the patched keyctl_session_to_parent() function=
 already
> > > > > > > > check if the current's and the parent's credentials are the=
 same before
> > > > > > > > this new ptrace_may_access() check.
> > > > > > >
> > > > > > > prepare_exec_creds() in execve() always creates new credentia=
ls which
> > > > > > > are stored in bprm->cred and then later committed in begin_ne=
w_exec().
> > > > > > > Also, fork() always copies the credentials in copy_creds().
> > > > > > > So the "mycred =3D=3D pcred" condition in keyctl_session_to_p=
arent()
> > > > > > > basically never applies, I think.
> > > > > > > Also: When that condition is true, the whole operation is a n=
o-op,
> > > > > > > since if the credentials are the same, then the session keyri=
ng that
> > > > > > > the credentials point to must also be the same.
> > > > > >
> > > > > > Correct, it's not a content comparison.  We could compare the
> > > > > > credential's data for this specific KEYCTL_SESSION_TO_PARENT ca=
ll, I
> > > > > > guess this should not be performance sensitive.
> > > > >
> > > > > Yeah, though I guess keyctl_session_to_parent() is already kind o=
f
> > > > > doing that for the UID information; and for LSMs that would mean
> > > > > adding an extra LSM hook?
> > > >
> > > > I'm wondering why security_key_session_to_parent() was never used: =
see
> > > > commit 3011a344cdcd ("security: remove dead hook key_session_to_par=
ent")
> > >
> > > While I was looking at this in another off-list thread I think I came
> > > around to the same conclusion: I think we want the
> > > security_key_session_to_parent() hook back, and while I'm wearing my
> > > SELinux hat, I think we want a SELinux implementation.
> >
> > FYI: Those checks, including the hook that formerly existed there, are
> > (somewhat necessarily) racy wrt concurrent security context changes of
> > the parent because they come before asynchronous work is posted to the
> > parent to do the keyring update.
>
> I was wondering about something similar while looking at
> keyctl_session_to_parent(), aren't all of the parent's cred checks
> here racy?

Yeah...

> > In theory we could make them synchronous if we have the child wait for
> > the parent to enter task work... actually, with that we could probably
> > get rid of the whole cred_transfer hack and have the parent do
> > prepare_creds() and commit_creds() normally, and propagate any errors
> > back to the child, as long as we don't create any deadlocks with
> > this...
>
> Assuming that no problems are caused by waiting on the parent, this
> might be the best approach.  Should we also move, or duplicate, the
> cred checks into the parent's context to avoid any races?

Yeah, I think that'd probably be a reasonable way to do it. Post task
work to the parent, wait for the task work to finish (with an
interruptible sleep that cancels the work item on EINTR), and then do
the checks and stuff in the parent. I guess whether we should also do
racy checks in the child before that depends on whether we're worried
about a child without the necessary permissions being able to cause
spurious syscall restarts in the parent...

> > > Micka=C3=ABl, is this something you want to work on?
>
> --
> paul-moore.com

