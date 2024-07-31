Return-Path: <keyrings+bounces-1841-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD26C9437FA
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 23:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01541C209F8
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 21:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906E216C6A9;
	Wed, 31 Jul 2024 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QZepw1yB"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2593208D1
	for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722461277; cv=none; b=Wp1mHEW6zYt9PiHAHE/uviSsPo2wv3zRmEJAcg5lq0m/MYXEVe1uNiBmNQeBwHQVey3U0gcoYRKY4Lee/RNSj9DsXoWGftoOvTxZA9LsCXd7I6b1J4PI90B5YOZ/tNZWjsUZuMcP8DwgKzWRATZZ2IuZFdMWR7so1pSNk++2TI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722461277; c=relaxed/simple;
	bh=Bg7et5ruZt8yvNu/2sa8+ixdiBkNyeysN/V066kBUZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FU1W4LW4EBxaktoNDLxwM2P6+R0p9v6rhjo7ZSfCskfDml0vx+pVjSHRnHJV85KYTv4cGgQIiKDRAGbiNSmPx4rRrwCoo4s8/BiGd58WywOnHwSKbGARTkxgoBEioLSA/Oyk7FFe+OCJOIicEc2iN5Ej7vmekdH6zH7di+XTtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QZepw1yB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-66ca536621cso47769817b3.3
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1722461275; x=1723066075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shignyHrk6JqVt74mQe6i7n2yifhlaaylJbc/fC3q28=;
        b=QZepw1yBgRgQNKAKKLklD5gDnaYqCULLbYwFkk5drsnqf4i+8yP7TNszEr46/Xx6AX
         asa6M0klSMe2SdzcDx61FUQ1Rpdamy8kHd+kbDZ0ZUgjb7AnJ+We8A11vZL4cIwpMmsc
         YaHGXM1f8a9nyGvNPlrLWY5u9rRAdm81//fquX+JOfkOOpx7+pmNPjHlITxTKbi3jt9N
         bYrq9TSBeIioCIy4fid7up0IthtzcjrSAykKUW6n789TgSh/GdWaQDuCaJ6WWbxkSbKW
         dTTMJyOMoZYD/wDB/yzcZgNgBp25k9Ujsi+vP1Q6j0UOaBCquLpb85Lf3+uEv/gbvFlG
         P5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722461275; x=1723066075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shignyHrk6JqVt74mQe6i7n2yifhlaaylJbc/fC3q28=;
        b=SDN20bfwnixAnjYQ38tlEHyhqzTNTLSNqfrrnOqej01bTvKQ1QfaD8cmhA70fZ3WKF
         inX0K8W+ThMEtaNNWIwbSllb4gyvxUxIjr7YC++eY4K3XZ0UmIR0KXae2Zy3wMASX83u
         9V7gcelIwEt1M1T4UxW8Yp8vosNMJW+pLqWTFdYV92pbaUTVlhjLYGutKugdKyxdVvk5
         P5odEw3ZLGHaLE9PWJLe1ejkeNolHvkOdT0beuuatNvRvjVr2tXUtRRjVIxIDLxcm45e
         XrN0XiYu5azSOcSSyu0dNkAJzfhiWByvGIEKwoKFWgAyJUDUpCH0cZ3oXxH2oCuiGaoo
         J3MA==
X-Forwarded-Encrypted: i=1; AJvYcCXYUGW9Oip1UtWpZtuBmS6pTFa2xDQX1AdiY7b9tv7QQ2PlShD2KV2F77RyfoiMyNAHeopGCNrml8YmEcOk8gbdL7ubFpNreqk=
X-Gm-Message-State: AOJu0Yw1fosQ6hu18q6nchePakSqpZx2RaTagQjt3m1lFshiqqewNQmQ
	qjvDSDxHJ9So3oNl3HsGpGtBiFjRuiu/oJMI8lMPr1f83H3ilwIhu7DOaKENCQJ1A3eUVbQfHdN
	FMivBAunKPeoBHZOzvjZqHwuZZxCU6rZ1uWRo
X-Google-Smtp-Source: AGHT+IFeRxXow5f9RrJW+aSWq9j7rgLGtvi8NrI1FgHdy+7qV9A3iGZcN87d2HitubWvGk9aOwuvmv8u3mk+uouoFro=
X-Received: by 2002:a0d:efc1:0:b0:651:6cf1:76b with SMTP id
 00721157ae682-6874dcc1141mr4922287b3.22.1722461274823; Wed, 31 Jul 2024
 14:27:54 -0700 (PDT)
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
 <CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com>
In-Reply-To: <CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 31 Jul 2024 17:27:44 -0400
Message-ID: <CAHC9VhTk4X61K72FubR8ahNeGyzWKkF=vJZD+k-8+xO7RwZpgg@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: Jann Horn <jannh@google.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:54=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Wed, Jul 31, 2024 at 10:29=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > On Mon, Jul 29, 2024 at 11:17=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@=
digikod.net> wrote:
> > > On Mon, Jul 29, 2024 at 05:06:10PM +0200, Jann Horn wrote:
> > > > On Mon, Jul 29, 2024 at 5:02=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <m=
ic@digikod.net> wrote:
> > > > > On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> > > > > > On Mon, Jul 29, 2024 at 4:09=E2=80=AFPM Micka=C3=ABl Sala=C3=BC=
n <mic@digikod.net> wrote:
> > > > > > > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > > > > > > On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=
=C3=BCn <mic@digikod.net> wrote:
> > > > > > > > > A process can modify its parent's credentials with
> > > > > > > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the=
 same.  This
> > > > > > > > > doesn't take into account all possible access controls.
> > > > > > > > >
> > > > > > > > > Enforce the same access checks as for impersonating a pro=
cess.
> > > > > > > > >
> > > > > > > > > The current credentials checks are untouch because they c=
heck against
> > > > > > > > > EUID and EGID, whereas ptrace_may_access() checks against=
 UID and GID.
> > > > > > > >
> > > > > > > > FWIW, my understanding is that the intended usecase of
> > > > > > > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "=
keyctl
> > > > > > > > new_session" and "e4crypt new_session") want to be able to =
change the
> > > > > > > > keyring of the parent process that spawned them (which I th=
ink is
> > > > > > > > usually a shell?); and Yama LSM, which I think is fairly wi=
dely used
> > > > > > > > at this point, by default prevents a child process from usi=
ng
> > > > > > > > PTRACE_MODE_ATTACH on its parent.
> > > > > > >
> > > > > > > About Yama, the patched keyctl_session_to_parent() function a=
lready
> > > > > > > check if the current's and the parent's credentials are the s=
ame before
> > > > > > > this new ptrace_may_access() check.
> > > > > >
> > > > > > prepare_exec_creds() in execve() always creates new credentials=
 which
> > > > > > are stored in bprm->cred and then later committed in begin_new_=
exec().
> > > > > > Also, fork() always copies the credentials in copy_creds().
> > > > > > So the "mycred =3D=3D pcred" condition in keyctl_session_to_par=
ent()
> > > > > > basically never applies, I think.
> > > > > > Also: When that condition is true, the whole operation is a no-=
op,
> > > > > > since if the credentials are the same, then the session keyring=
 that
> > > > > > the credentials point to must also be the same.
> > > > >
> > > > > Correct, it's not a content comparison.  We could compare the
> > > > > credential's data for this specific KEYCTL_SESSION_TO_PARENT call=
, I
> > > > > guess this should not be performance sensitive.
> > > >
> > > > Yeah, though I guess keyctl_session_to_parent() is already kind of
> > > > doing that for the UID information; and for LSMs that would mean
> > > > adding an extra LSM hook?
> > >
> > > I'm wondering why security_key_session_to_parent() was never used: se=
e
> > > commit 3011a344cdcd ("security: remove dead hook key_session_to_paren=
t")
> >
> > While I was looking at this in another off-list thread I think I came
> > around to the same conclusion: I think we want the
> > security_key_session_to_parent() hook back, and while I'm wearing my
> > SELinux hat, I think we want a SELinux implementation.
>
> FYI: Those checks, including the hook that formerly existed there, are
> (somewhat necessarily) racy wrt concurrent security context changes of
> the parent because they come before asynchronous work is posted to the
> parent to do the keyring update.

I was wondering about something similar while looking at
keyctl_session_to_parent(), aren't all of the parent's cred checks
here racy?

> In theory we could make them synchronous if we have the child wait for
> the parent to enter task work... actually, with that we could probably
> get rid of the whole cred_transfer hack and have the parent do
> prepare_creds() and commit_creds() normally, and propagate any errors
> back to the child, as long as we don't create any deadlocks with
> this...

Assuming that no problems are caused by waiting on the parent, this
might be the best approach.  Should we also move, or duplicate, the
cred checks into the parent's context to avoid any races?

> > Micka=C3=ABl, is this something you want to work on?

--=20
paul-moore.com

