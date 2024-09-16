Return-Path: <keyrings+bounces-2082-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27A97A8A5
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2024 23:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9F7EB21D11
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2024 21:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4343166F0C;
	Mon, 16 Sep 2024 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jlu1YcLz"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC11165F0E
	for <keyrings@vger.kernel.org>; Mon, 16 Sep 2024 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726521314; cv=none; b=m3c2JAiL546ZriEnZMr9lFRFQVceeatZ+dgFDNkOOu0B/pyYZnjxt3AQuedp/LOh2OwmO+Xpfb+EC9yQB4CbWAsBLkFAZ19VmkcAFPtDEp/J0eN9wiMDXcBikTeKzi0Aj+4qOToBGi7kmTEj8tMT5cls6yuqeNmszQyB6X/VJC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726521314; c=relaxed/simple;
	bh=jsP4BpefWGxRC1SsETIlVv45lPzMhi8m9W79ZBrx1F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J21vjfT/E8xTbQ5qr9Oy9/9GRvQoZdmQKEUp0YWw4PjGC/L5jhXhXpXAaSUGrRTRKQ2EvMpW6fhACGs5AFgFk46VQsHZspUYSBuiC+Qg4e2b0cypWA4M65olqCOpnspNJg7lK2/fkKJbJMlZnivVXh5PD2uRcM+X6vSrwJrvQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jlu1YcLz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso8368a12.0
        for <keyrings@vger.kernel.org>; Mon, 16 Sep 2024 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726521310; x=1727126110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9leef1lP79QdzQSlMu20RvsBQRhUgfHGz+v151OddCM=;
        b=Jlu1YcLzmx45LjdHR6gqD+YPMYTOLGbeoySXwl34ODW2tfzjiu8+RvB2MjdYZW6n6K
         3azYz/kdJ7LSWtAkef00K+c8ZL08/NAMcLxJxP4hM6/u8DIfuj0mu8tqmf9xDP+AKM3f
         v4fzrCwFx9nPzTO40ljd1W9ypQjXn44T6yZtZlfiMnEV1tu01TAi2Os3Jd1HonqBG/65
         ovlKRS6OUNBD/YFKa4og7UYYBrvwOSbE/7g1iFHiruKC5AN2NVNNryKuUGuv5Mz0o+Q+
         dYX4GMaHBw/728lNDkVesyvH9G9NqWG2L7EiNJl4VDgsQF50yD/m1pFMNaxhSsCo8aqy
         3J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726521310; x=1727126110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9leef1lP79QdzQSlMu20RvsBQRhUgfHGz+v151OddCM=;
        b=PcyLTjNfi/M3n7Cpg4dvNnOaAhAyKmlASzWkIAyNdqrTKrPM5451YkYyAVrmRYa1CA
         nn98P8v1MpNWTZuBuJ5/GnKIC+v8amIRLQjtOUzCJMeaTPwdg+t76RApyPUdY7NlbPnS
         8CEf7a+7Y9ltS9IpYRlIMsKTY/mT7Yc8SmunjveNglS5JVN8VzSrCbal33rkO06rZMkE
         7Ci4wrz8Pit5Q8RmS1i4miMyxzcPoRz4XBaemWdcAW57/iZ4muCDx+K7r+fROlIbw/xG
         N+YyuT61pkZSxGifV9Lk/v4jcxUo55U8oJ05m34iKuTnfUP6PrtxVF/ZdjkS8d1r0p3G
         ALuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX501V7rWIFj7LIUIqUws5ugQQ1lNhao57Ue1JggUI0h2N7K3ttxdKXZGdaSL1Fm8cm1X1G8SkrTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCqvxm4sSYehxZRrru01yLvPNEz6vmNDjQy+QbkHZjJkJ1go+
	EgKhlOs6hyhe+DKZMKpqoXuDu29h9Jv9ypHMzkpCXDWAjfE5GmgdN5H7gJydIKqliSSEJxTzDWD
	gK+8tfTPRag6r5HNILq84jpVNblrugTO79GVv
X-Google-Smtp-Source: AGHT+IF6dyyQJaSHZbZwngVDJVdsJApUMqXalKKi0actzWHOX8EqkqUTgpJ77CsgYsbI+x2vL0Ykn2Y5eGpt5/BHf5s=
X-Received: by 2002:a05:6402:348c:b0:5c4:2c6f:e265 with SMTP id
 4fb4d7f45d1cf-5c4478072b6mr15387a12.1.1726521309278; Mon, 16 Sep 2024
 14:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk> <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
 <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com> <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
In-Reply-To: <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 16 Sep 2024 23:14:30 +0200
Message-ID: <CAG48ez2hhu8AXgBR=ze9RRLDpB0V1rzUX2Xr2e45giV6ebTxMA@mail.gmail.com>
Subject: Re: Can KEYCTL_SESSION_TO_PARENT be dropped entirely? -- was Re:
 [PATCH v2 1/2] KEYS: use synchronous task work for changing parent credentials
To: Paul Moore <paul@paul-moore.com>
Cc: David Howells <dhowells@redhat.com>, Jeffrey Altman <jaltman@auristor.com>, openafs-devel@openafs.org, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	John Johansen <john.johansen@canonical.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 12:46=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Tue, Sep 10, 2024 at 4:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wr=
ote:
> > > On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redha=
t.com> wrote:
> > > > Jann Horn <jannh@google.com> wrote:
> > > >
> > > > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > > > synchronously, so that any errors that happen in the task work ca=
n be
> > > > > plumbed back into the syscall return value in the child.
> > > >
> > > > The main thing I worry about is if there's a way to deadlock the ch=
ild and the
> > > > parent against each other.  vfork() for example.
> > >
> > > Yes - I think it would work fine for scenarios like using
> > > KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> > > launched the helper (which I think is the intended usecase?), but
> > > there could theoretically be constellations where it would cause an
> > > (interruptible) hang if the parent is stuck in
> > > uninterruptible/killable sleep.
> > >
> > > I think vfork() is rather special in that it does a killable wait for
> > > the child to exit or execute; and based on my understanding of the
> > > intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> > > KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> > > through execve?
> >
> > Where did we land on all of this?  Unless I missed a thread somewhere,
> > it looks like the discussion trailed off without any resolution on if
> > we are okay with a potentially (interruptible) deadlock?
>
> As a potential tweak to this, what if we gave up on the idea of
> returning the error code so we could avoid the signal deadlock issue?

I'm still not convinced that there is a real danger of deadlocking
here if the only way to deadlock involves the parent being in an
uninterruptible wait. There aren't many places in the kernel that
involve a parent uninterruptibly waiting for the child without locks
being involved, especially when the parent is a shell that spawns the
child with execve, as seems to be the intended use here.

I really dislike the idea of silently ignoring an error - I kinda feel
like if we give up on returning an error to the child that issued the
keyctl, the next-best option is to SIGKILL the parent, so that we can
say "hey, we technically ensured that all future syscalls in the
parent will use the new creds, because the parent will no longer do
_any_ syscalls".

> I suppose there could be an issue if the parent was
> expecting/depending on keyring change from the child, but honestly, if
> the parent is relying on the kernel keyring and spawning a child
> process without restring the KEYCTL_SESSION_TO_PARENT then the parent
> really should be doing some sanity checks on the keyring after the
> child returns anyway.



> I'm conflicted on the best way to solve this problem, but I think we
> need to fix this somehow as I believe the current behavior is broken
> ...

