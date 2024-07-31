Return-Path: <keyrings+bounces-1839-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE76794371C
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 22:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690E71F22A9E
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 20:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D001607B9;
	Wed, 31 Jul 2024 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Dy+5Q9Mu"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3114AD3F
	for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722457770; cv=none; b=mbt7+xvTKyIqIdLSLyC+VOO6PyGay552UOPQKqlArhnss3VPsVaMSrIVHWW6L0ZYeudqaSWjfdvh1tGfD0WrOkSvpJEfmed4L6NF3DkDmVRwEcTGBu6KZ19nHAnuFeGSACMVKDJT/fRvfaMlgJIXxD0VrkGJO440BpOwotGLDiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722457770; c=relaxed/simple;
	bh=55Y2FiMTrimrMXILYu++IX6+eHQpPUGeTFOVYaQNTmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhmdfm7kdlWWxsl27i3S3xV/pXlQl2yTtJIarc9iHOorth7X/j18yG5c8Y40GNSz57YxfJSBBC28cBgKeWARnkrVhqVa3v3UU6lwF8J+xp5xYCz/thVqLomfy+4CEyymHrY58r7yvnS1F7UbY+epq9mbPVT38CpvvMmHCgCs8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Dy+5Q9Mu; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0b9d344d66so2456177276.1
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2024 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1722457767; x=1723062567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSX1c8Ru/j8yxo/auh47ofyUjGotjeSFELYrAnjtnVo=;
        b=Dy+5Q9Mux2ZsOfD1GqlkaSzT/PqVOBeeKfhR1reRfMuPCSW2uUIcTgHX+gfKkZfeyS
         p68xfw5+GU61gSQw9LlgVjmsFnNfy/yzq8rjr8XF5N4sK9GLgJREhv3OmteOn29PSwnZ
         WUDOXtPFwvhk6RKtaqMJtW0MMDYvO3ROxg4YhBqxu7QqhGgDPHPZCrsiE3x3nvlOH3SB
         UEZ7w6P63cTy3fmuBZgbROAZA5EJdLH8lN2NAOD2PD6R50AzxyihNh1Bm53nuafY8aNr
         7uLSVR7FKuPpvhGZALj8AD11rLZm/hpCzUAAV4ELQy+cC1Lpj8zNWvrZjI9c+gRTXzdB
         PYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722457767; x=1723062567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSX1c8Ru/j8yxo/auh47ofyUjGotjeSFELYrAnjtnVo=;
        b=sLONcVTLCLB1oWQIXY+1EcEOZOWeLMC9d5TwW+KqDopEazTIkMv4PyGSvm6ZVuB36+
         l9QW5tH/rPs1Bk65mPnDFUQ4E1/NZDrCa7QujgFwYAvhGc09j8nfW7zlcwXWdyZ73OKI
         LKog24Zz0YXh9DZvMrrkV7irAQjxyX4J5dFvzBWyLzXTsAnGySnz/yhSIC7n2nk6YYQH
         XxWxq/qJiqfuyPvYd3vGRtk0c2ckayqdjg2EgW1WdlTtQduWfYhD08NtU+RqG+bB//+M
         ZP8fEqwiDeJi8xA1sjsv+SFXoem/AGTFQ+891BkA2rQi6i1zS09ToA2tTJoy0DIeUS0Z
         xGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVii8HTK+hssWtExAfawNPfqO173ev6bl4cgXGp55dLWBe90klPsR9EaYpUdnVVtlS4hZam5Ngy3OPVcWlcmDwyRFC0gBUXgTI=
X-Gm-Message-State: AOJu0YyH1MNDmrZFHHsIV/m3nvkosm2jvb1cbLxdETaZGwlmctAj1gB4
	XaPpJksG1dg/XhqiOn76exooWEE9W3cuSi2yfa8ormi+SqNBHB5zjqPw2yj7EbaSdx+F8EDw79+
	BnOOWj83bqFPuIC7v5RCH3cOEm6xT3m7jwbp9
X-Google-Smtp-Source: AGHT+IFx10AYMBAygpAsRMReCo80r71LTCsmoGAG8m/NF9tKd5CFmX1RfasNmH6AK1pKP7GjMtINChhEtHlz600Jia4=
X-Received: by 2002:a05:6902:210f:b0:e08:655c:af14 with SMTP id
 3f1490d57ef6-e0bcd3fdbb9mr165982276.36.1722457767336; Wed, 31 Jul 2024
 13:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729125846.1043211-1-mic@digikod.net> <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net> <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
 <20240729.rayi3Chi9aef@digikod.net> <CAG48ez2HdeKXwwiCck9cvcoS1ZhbGD8Qs2DzV7F6W_6=fSgK5Q@mail.gmail.com>
 <20240729.roSo6soogho8@digikod.net>
In-Reply-To: <20240729.roSo6soogho8@digikod.net>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 31 Jul 2024 16:29:16 -0400
Message-ID: <CAHC9VhRmZOMLwY4AvV+96WU3jyqMt6jX5sRKAos75OjWDo-NvA@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Jann Horn <jannh@google.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:17=E2=80=AFAM Micka=C3=ABl Sala=C3=BCn <mic@digi=
kod.net> wrote:
> On Mon, Jul 29, 2024 at 05:06:10PM +0200, Jann Horn wrote:
> > On Mon, Jul 29, 2024 at 5:02=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@d=
igikod.net> wrote:
> > > On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> > > > On Mon, Jul 29, 2024 at 4:09=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <m=
ic@digikod.net> wrote:
> > > > > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > > > > On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=C3=BC=
n <mic@digikod.net> wrote:
> > > > > > > A process can modify its parent's credentials with
> > > > > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the sam=
e.  This
> > > > > > > doesn't take into account all possible access controls.
> > > > > > >
> > > > > > > Enforce the same access checks as for impersonating a process=
.
> > > > > > >
> > > > > > > The current credentials checks are untouch because they check=
 against
> > > > > > > EUID and EGID, whereas ptrace_may_access() checks against UID=
 and GID.
> > > > > >
> > > > > > FWIW, my understanding is that the intended usecase of
> > > > > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyc=
tl
> > > > > > new_session" and "e4crypt new_session") want to be able to chan=
ge the
> > > > > > keyring of the parent process that spawned them (which I think =
is
> > > > > > usually a shell?); and Yama LSM, which I think is fairly widely=
 used
> > > > > > at this point, by default prevents a child process from using
> > > > > > PTRACE_MODE_ATTACH on its parent.
> > > > >
> > > > > About Yama, the patched keyctl_session_to_parent() function alrea=
dy
> > > > > check if the current's and the parent's credentials are the same =
before
> > > > > this new ptrace_may_access() check.
> > > >
> > > > prepare_exec_creds() in execve() always creates new credentials whi=
ch
> > > > are stored in bprm->cred and then later committed in begin_new_exec=
().
> > > > Also, fork() always copies the credentials in copy_creds().
> > > > So the "mycred =3D=3D pcred" condition in keyctl_session_to_parent(=
)
> > > > basically never applies, I think.
> > > > Also: When that condition is true, the whole operation is a no-op,
> > > > since if the credentials are the same, then the session keyring tha=
t
> > > > the credentials point to must also be the same.
> > >
> > > Correct, it's not a content comparison.  We could compare the
> > > credential's data for this specific KEYCTL_SESSION_TO_PARENT call, I
> > > guess this should not be performance sensitive.
> >
> > Yeah, though I guess keyctl_session_to_parent() is already kind of
> > doing that for the UID information; and for LSMs that would mean
> > adding an extra LSM hook?
>
> I'm wondering why security_key_session_to_parent() was never used: see
> commit 3011a344cdcd ("security: remove dead hook key_session_to_parent")

While I was looking at this in another off-list thread I think I came
around to the same conclusion: I think we want the
security_key_session_to_parent() hook back, and while I'm wearing my
SELinux hat, I think we want a SELinux implementation.

Micka=C3=ABl, is this something you want to work on?

--=20
paul-moore.com

