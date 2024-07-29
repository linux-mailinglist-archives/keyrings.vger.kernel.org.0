Return-Path: <keyrings+bounces-1828-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A993F7CB
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976B12830A6
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7E018E772;
	Mon, 29 Jul 2024 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZMH+r1JK"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D418D4A5
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262902; cv=none; b=tS9LAy+VFsD9hNrDgbbgHzhN0DNOAk6WHFISOlF4+EvQXGL/vT3PkXoczXDPeHBu79YCal+ZA5EHYeTrvIhm1SXYQYLUmW18FlOfX5b5NzTyBnIgsypfbg1BU4XxANHEhU/kZLNrGdHn0zbDcK4OqLfBZrflp0ix8ui7upK/0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262902; c=relaxed/simple;
	bh=R2pg1QM5YjycBRpUMiPEewfK2eJSRXWCvjc02wn9TVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhsnRLV1G0HxC9tHUqY27fVjivYCtGEmanefBv3Ow637sx3kZQ4iC3slfL7844yDk/QYy0KXnzPpHXpDHCOpMyZ/a0wgogvF/gyDV3XwGPdXpUap3nR6eb+6E0a/JjV7+9C8Y79BP3CN0/qr9jfbnr8yN3XnddkzVzcPBDvv0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZMH+r1JK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso13447a12.0
        for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722262898; x=1722867698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmXQ5VQJHZgwk9qmWNV/4mIiXAO7E7BFXPo3AVaYCuA=;
        b=ZMH+r1JK8GYVLTkrQDEsEVpCi/I9R21N2cB5UOXXbhusOkdT2jSM0auMPr7XBg/pLy
         C7pjbfYWcavmPbFLiOwc/rFbTOoSyzF5lvXU5c/M4jKEG3KCPIJzRDR5IPNMnuD66E5v
         8N1z8Hrw81P3LnOusrFPTAeJb46bSQo8UvIfgJ0DFNrsV3jkJfNiPtlA8EmnAnvLakF8
         /ssLWs3TNQvNXeLwATbfEuZJGW4r6WtKLREpXXWOcnY4sOcm+KkeHZxmCuOf0NxKyp5/
         PJsdujWmWIRl/4ibc22UIB+dIK6/dpRMef5wk4CQCvKfq4FgwzLx0otMcy6L162lzLT/
         1/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262898; x=1722867698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmXQ5VQJHZgwk9qmWNV/4mIiXAO7E7BFXPo3AVaYCuA=;
        b=WDHSemwqSmNR343rbCWsB4mVddFOqBqvxm/N5nL13x8LL/GKuFkwQF5IvSpKxGRp/u
         dIa/0aALTvcsmROSyeKdKNws3owEQYcVfCcenGCLBoDQG917/PwqQLx1jDTbRR+3yx7k
         T28vrsK//2kNF6MI/hF8xrhKDtDGKCP6cxLbceEPhYD5hK3JFDnK+aM6cl9qC0GKzJyB
         tLOEjlu56Gn0KdQ6a+FfTEPUvJmsqTaow/7U9DJcRqOScy/y/b6BggwiW46UFOXv5kdb
         d+MawNxDDq4m5uQRqnhFH6KauF/MwkV7VHTiSh1fCv45vGkHZgHfhdNh+pY61w21nXen
         A4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu7byGLFTkJgVQIBvgT3OlXQvwONcNe13yN2TjuWib+ewKl/YgyPfLwwi160+rrbbUPZHNgboy+wnJivWTU3jrBr0kgY0Ukzw=
X-Gm-Message-State: AOJu0YyKTeE5uxiblEfKeYB7O/EJMaBVKurH8eENWqo33hwHrUj1zy1E
	YIBmQ0qeex6+kVwRsou288gIYO2dPDhFQ22JoSYsBIyLCAT/wzpxQ8OqEzvsO2Izz5wfyqquflw
	mQt7OScEVx/oz5p/2UZAp/8o8fX3IxDrgX7nl
X-Google-Smtp-Source: AGHT+IEhv3G8eAvhVOqvhekBIo7K/fTzlyqFGUCj1hgartQNRL4cM2n7OCQmD00ZYx7roI4Umf9zkVlbQhVOQO/mGK8=
X-Received: by 2002:a05:6402:2554:b0:58b:93:b623 with SMTP id
 4fb4d7f45d1cf-5b03425b2c5mr259393a12.5.1722262897861; Mon, 29 Jul 2024
 07:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729125846.1043211-1-mic@digikod.net> <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
 <20240729.cho6saegoHei@digikod.net>
In-Reply-To: <20240729.cho6saegoHei@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Mon, 29 Jul 2024 16:21:01 +0200
Message-ID: <CAG48ez1=xbGd8az4+iNJ_v1z4McMN8dsvWff-PH=ozLYnbzPqg@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:09=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> On Mon, Jul 29, 2024 at 03:49:29PM +0200, Jann Horn wrote:
> > On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@d=
igikod.net> wrote:
> > > A process can modify its parent's credentials with
> > > KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
> > > doesn't take into account all possible access controls.
> > >
> > > Enforce the same access checks as for impersonating a process.
> > >
> > > The current credentials checks are untouch because they check against
> > > EUID and EGID, whereas ptrace_may_access() checks against UID and GID=
.
> >
> > FWIW, my understanding is that the intended usecase of
> > KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyctl
> > new_session" and "e4crypt new_session") want to be able to change the
> > keyring of the parent process that spawned them (which I think is
> > usually a shell?); and Yama LSM, which I think is fairly widely used
> > at this point, by default prevents a child process from using
> > PTRACE_MODE_ATTACH on its parent.
>
> About Yama, the patched keyctl_session_to_parent() function already
> check if the current's and the parent's credentials are the same before
> this new ptrace_may_access() check.

prepare_exec_creds() in execve() always creates new credentials which
are stored in bprm->cred and then later committed in begin_new_exec().
Also, fork() always copies the credentials in copy_creds().
So the "mycred =3D=3D pcred" condition in keyctl_session_to_parent()
basically never applies, I think.
Also: When that condition is true, the whole operation is a no-op,
since if the credentials are the same, then the session keyring that
the credentials point to must also be the same.

