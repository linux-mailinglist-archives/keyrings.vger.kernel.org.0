Return-Path: <keyrings+bounces-1876-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7620953B38
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 22:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7398C2858E7
	for <lists+keyrings@lfdr.de>; Thu, 15 Aug 2024 20:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3F613CFAA;
	Thu, 15 Aug 2024 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XEoCxbyL"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC877E591
	for <keyrings@vger.kernel.org>; Thu, 15 Aug 2024 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723752037; cv=none; b=jSs0EgfyjDG54dj2oyGxinFYgeesVUkw9DbrJAGspTrPFjKoHYqm/BlsMX9u7o+y6SnkYuj5DC3owQ+iQfVDzrIx7U9vd3xCtxb3pnkCDj60aBTkA+CokKExQp7LzCmI2a+6RgMjNOKuj+CAyxsMeMB7qVNWvbdZkq9V/1CszTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723752037; c=relaxed/simple;
	bh=xGYBVjCJruWxpObTcbXRaohepR1nP2OwaL5Zu9E+LTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvP26zGu5uKIrZJnRvv/y4J089YUe5hmhcpZ0tu+f3tEARAYfYyQ3LQzFzwITbOwoIzU3duvYe9bPKDnj+Se9YmGzJkMcraZF+5Z3BHCQhs9vztcCZwj7yWaafXjcRFEd9TwqfK/Qv2yiO5QbOROAzl4ddSaYXxr0cfX4AQIZz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XEoCxbyL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bebc830406so1773a12.0
        for <keyrings@vger.kernel.org>; Thu, 15 Aug 2024 13:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723752034; x=1724356834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ArqisW88zeUJ5548euro8ampk/ZNm/xfRfsdbWrSo=;
        b=XEoCxbyLwL4HcM51EsZbF3tltEsLeG0fMLChLyci6j8xwhfdhsrk6PiWQztaCnghnC
         eaT2mcJ4GFV3M/3yL2RhFQQJf3dUVdRow4s3vrr2/+04q2tTYkdxTpp3dAklavj7Nqat
         qt3xj+w69yg9KR3KfFxFysAFY0NCnGqPh/+jZDSKE8vgmyM40WTWy39GMYmEuULcPvna
         aWkDjRKI0g9hrEGuYsZQoJniEdjA0Z1H51ZpwRfckEvQM/453k1oPkSM1Tb389rtf0BX
         OKs8QmWwYCgZDH20vSOLhDjMJhyNsMS6uelDMF9OtT2GHwOMx8BqyfLU4FfjClsjs7nI
         QfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723752034; x=1724356834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3ArqisW88zeUJ5548euro8ampk/ZNm/xfRfsdbWrSo=;
        b=Diz13+RbdpuAcvOAmH/0CiY/x07glRC4rdinEkjOBAcDOCEajIuQCIhFQurNldL6pO
         ieiy8K+802t97K3apWNZcZNE4tJnSh3uYpxoPCTkfHiPW8UmGffxwglDaKoHzCYgGDnK
         no0K+6desaaNbUxiWTuiFoK4KVCe4ExANI99osa+VkcPqdBClF2DTHXoks5XhjX4lfKg
         92T/43WgZB7sxev2ryjgTYvMgjUZDRc1ajNVEC1gYhrsyvW2w36Ta/gbYKw0pprlv1LQ
         mogZreiz30Wnl2BgmqgLY2DJ1pCv9ZE+C/aOXxgyZt/2TslAyPogMGUX4DRAbWlmcbM1
         iM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpoVM4pveAsF2WjtzPmejRHRoTrm3hZTBoB53QmDHpEIe5XRz0E0LuocTF363v0TRYzxgoGlqCe+bsjBDsbsegCWmi0zqalVo=
X-Gm-Message-State: AOJu0YyOY78j2UhJ4UZqYHPrxzpN7M/9GYVN9qvzEFPO9cMZtQx+dLOd
	GYxN5DZdzU6hHj7gSkoTErVBG0h+iw8o9gNNgRdv55yZH/bMSb5hCPMPGCl9+QC+/fupQF2fdLG
	UFvls6ZNMIcN/1Vk4opr2402gVHfKyL5baTxY
X-Google-Smtp-Source: AGHT+IFwS4EKwUlrFlYXcuSN5oh43sNNRYX1HBigJRCxXbMVgn7z8rfDqxIsTOr1QPI6vYSZFktXxOduALeTABTxFEw=
X-Received: by 2002:a05:6402:27ca:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-5becb50aa8cmr15762a12.4.1723752032713; Thu, 15 Aug 2024
 13:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com> <2494949.1723751188@warthog.procyon.org.uk>
In-Reply-To: <2494949.1723751188@warthog.procyon.org.uk>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 Aug 2024 21:59:54 +0200
Message-ID: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
Subject: Re: Can KEYCTL_SESSION_TO_PARENT be dropped entirely? -- was Re:
 [PATCH v2 1/2] KEYS: use synchronous task work for changing parent credentials
To: David Howells <dhowells@redhat.com>
Cc: Jeffrey Altman <jaltman@auristor.com>, openafs-devel@openafs.org, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, John Johansen <john.johansen@canonical.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
> Jann Horn <jannh@google.com> wrote:
>
> > Rewrite keyctl_session_to_parent() to run task work on the parent
> > synchronously, so that any errors that happen in the task work can be
> > plumbed back into the syscall return value in the child.
>
> The main thing I worry about is if there's a way to deadlock the child an=
d the
> parent against each other.  vfork() for example.

Yes - I think it would work fine for scenarios like using
KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
launched the helper (which I think is the intended usecase?), but
there could theoretically be constellations where it would cause an
(interruptible) hang if the parent is stuck in
uninterruptible/killable sleep.

I think vfork() is rather special in that it does a killable wait for
the child to exit or execute; and based on my understanding of the
intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
through execve?


> > +     if (task_work_cancel(parent, &ctx.work)) {
> > +             /*
> > +              * We got interrupted and the task work was canceled befo=
re it
> > +              * could execute.
> > +              * Use -ERESTARTNOINTR instead of -ERESTARTSYS for
> > +              * compatibility - the manpage does not list -EINTR as a
> > +              * possible error for keyctl().
> > +              */
>
> I think returning EINTR is fine, provided that if we return EINTR, the ch=
ange
> didn't happen.  KEYCTL_SESSION_TO_PARENT is only used by the aklog, dlog =
and
> klog* OpenAFS programs AFAIK, and only if "-setpag" is set as a command l=
ine
> option.  It also won't be effective if you strace the program.

Ah, I didn't even know about those.

The users I knew of are the command-line tools "keyctl new_session"
and "e4crypt new_session" (see
https://codesearch.debian.net/search?q=3DKEYCTL_SESSION_TO_PARENT&literal=
=3D1,
which indexes code that's part of Debian).

> Maybe the AFS people can say whether it's even worth keeping the function=
ality
> rather than just dropping KEYCTL_SESSION_TO_PARENT?

I think this would break the tools "keyctl new_session" and "e4crypt
new_session" - though I don't know if anyone actually uses those
invocations.

