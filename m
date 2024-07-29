Return-Path: <keyrings+bounces-1832-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521F93F90F
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 17:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02AD5280E8D
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999A93C24;
	Mon, 29 Jul 2024 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eY+PTrMO"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F515573D
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265612; cv=none; b=duXtZ33T2BV6Gk7pG1o8zQ2PFlZtXms6SXO1lk0JjtpV9sI72nHw2nKZIIBkpa0dL51unk6CfadIgpv7/tiVY3i+eUS2zJcgsm2hB4m3LXafj5rmx1p1a5xzQoAf2m2vErZ0QsCtexGCSvNXXo7lHylyEikzG0BSa+3yV7uFHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265612; c=relaxed/simple;
	bh=781BTajwd1hR5wMvp7cNX2jVIl1+v4PLz5QlLHtL65Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5vu/FNwZR5E/eS5I0voqoPotIvWzkRjS6Bs9kRZlgysWDp8fQ2SfmN7jAfMZ5M4anHQb4hreDOzKxSclZG22Z5lh2dji+85h2eGDFTrBKdmufplHNpVnWDmkPRQhTPVCHXlGPLk48401qj/EzrLNakH1pwYylPxQAIWSdOM36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eY+PTrMO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so14354a12.1
        for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722265609; x=1722870409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjeV+QbI7gHUjUzBxliN0skQAqi9SzoY7gAurGQjZfU=;
        b=eY+PTrMO3YlPC5ImRAFguy1j2nwObF8c+R5wgsRaTx6QMj2pgakQzJblyBHjF5iZrs
         qEnxDZASnU7ydfA/oFwDqRMfRxeHxLIUWMGUIyM+ugv81XCFt+l/WVpV4oCP4ucj0ZIB
         gu2TYI8J8AQqZK4YFrIBvrpnmKg0aNa2QlaDuf5uc2zwoCwhK9ZZi6q4GlBc8bPpMYzG
         fGnYozhSbWZ9XA/nmbAM7nJhqoJi8VPck51WY/gMufuVsE8LcNLYprDjWrqwkO35cJgd
         2L1kH3hoImgZsPPlF0KKzCxwp+s4X3HOTX0H6pY9osuYRCpnBVwVErnpcesi4qTaxS3y
         A0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265609; x=1722870409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjeV+QbI7gHUjUzBxliN0skQAqi9SzoY7gAurGQjZfU=;
        b=UoU4Ifdz4n8yuy0EuhGnK5Z8hXRvr/0K6yOFGbe5Qu+AHM/PzqE7lArACd84SYjava
         tRtlEqna2uMUsFaLnUKzwTmdsCcLVETtVF5wR/gWExorCfMWqNpm3k/EYJ38hKjOZsF+
         bP+8VqAWytYf7Otpqm7oVw4JUGxGjEAI1wkA6LWhbzlW1S458ZNR86A7wYAd+HQSxvsm
         mu/ee1//sWcgT/yo2JeBtl8HC8G1qtLN4Np6WhVRx5ub6DeUwTkYSc7tA+E16RP9eRtU
         NY786a1nxTJSv49vbMWFNP6gE+iJ/J8IaT6uzCFLQxjbk6EXXrK/LrkziLINNy1mWu5E
         VsTA==
X-Forwarded-Encrypted: i=1; AJvYcCUxfsro2rtueBCNpAC1JOgFpotYlpAhlIBC8cXcDNIbCrNTP6jLDjhwwuMdfwHIQySlA3LDtkN1U5JINCvm90kMNaVSHpZWEN8=
X-Gm-Message-State: AOJu0YxfAXuosONOGFeNiHgSxc0aoUxxgd8GZa9uABj5tm7XhquaTetD
	o4cIwj0IWXZ8VfslOAV+odpGx/7z7jsf9SqUvMcB87FEYtObiIc3driTBb89sM9etxWSXunNOI6
	8GX2T/HMJvEYGrAjgiNKgB+1NdW3riLhHvlKu
X-Google-Smtp-Source: AGHT+IH/E3Ay7rs5IsVTjtz/VV0d41Am4qW4KdRIkN3yQqDjl1N+gfsf12Fmr2lEmADi+ZEOo8Nafsdq91obb/8Gjzo=
X-Received: by 2002:a05:6402:50cd:b0:58b:90c6:c59e with SMTP id
 4fb4d7f45d1cf-5b40d96bac1mr6385a12.7.1722265608535; Mon, 29 Jul 2024 08:06:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729125846.1043211-1-mic@digikod.net> <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net> <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
 <20240729.rayi3Chi9aef@digikod.net>
In-Reply-To: <20240729.rayi3Chi9aef@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Mon, 29 Jul 2024 17:06:10 +0200
Message-ID: <CAG48ez2HdeKXwwiCck9cvcoS1ZhbGD8Qs2DzV7F6W_6=fSgK5Q@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 5:02=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> On Mon, Jul 29, 2024 at 04:21:01PM +0200, Jann Horn wrote:
> > On Mon, Jul 29, 2024 at 4:09=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@d=
igikod.net> wrote:
> > > On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > > > On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <m=
ic@digikod.net> wrote:
> > > > > A process can modify its parent's credentials with
> > > > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  =
This
> > > > > doesn't take into account all possible access controls.
> > > > >
> > > > > Enforce the same access checks as for impersonating a process.
> > > > >
> > > > > The current credentials checks are untouch because they check aga=
inst
> > > > > EUID and EGID, whereas ptrace_may_access() checks against UID and=
 GID.
> > > >
> > > > FWIW, my understanding is that the intended usecase of
> > > > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyctl
> > > > new_session" and "e4crypt new_session") want to be able to change t=
he
> > > > keyring of the parent process that spawned them (which I think is
> > > > usually a shell?); and Yama LSM, which I think is fairly widely use=
d
> > > > at this point, by default prevents a child process from using
> > > > PTRACE_MODE_ATTACH on its parent.
> > >
> > > About Yama, the patched keyctl_session_to_parent() function already
> > > check if the current's and the parent's credentials are the same befo=
re
> > > this new ptrace_may_access() check.
> >
> > prepare_exec_creds() in execve() always creates new credentials which
> > are stored in bprm->cred and then later committed in begin_new_exec().
> > Also, fork() always copies the credentials in copy_creds().
> > So the "mycred =3D=3D pcred" condition in keyctl_session_to_parent()
> > basically never applies, I think.
> > Also: When that condition is true, the whole operation is a no-op,
> > since if the credentials are the same, then the session keyring that
> > the credentials point to must also be the same.
>
> Correct, it's not a content comparison.  We could compare the
> credential's data for this specific KEYCTL_SESSION_TO_PARENT call, I
> guess this should not be performance sensitive.

Yeah, though I guess keyctl_session_to_parent() is already kind of
doing that for the UID information; and for LSMs that would mean
adding an extra LSM hook?

