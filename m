Return-Path: <keyrings+bounces-2074-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E76979FB1
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2024 12:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD728286FB5
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2024 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CD01547EF;
	Mon, 16 Sep 2024 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZF/CBSDL"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB311465AB
	for <keyrings@vger.kernel.org>; Mon, 16 Sep 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726483584; cv=none; b=Td7EdzdL12WKKilYlduJYSxBuuAnCzDDbLr3MrjkzqKPL4vzh6DPdcIWrwnfX0XTKL0nFAhofg+vA4fV7+Oxe0+v7trYVl0LZSqX52NpQiXCaIQ1g1pD7XwU/3F2dci0jYPURMBAWXtnvbkodaWGMz1HGxEF5vgFJlhu7JMFsUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726483584; c=relaxed/simple;
	bh=mV9du04VKGKk1nPwWEovpDjsnvZZeLOYjvudwBnQ87c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPjpuWpbLxbsf2qwWLL2WnOZ442L7zjAr2FU+ZXSnDWpIkGQSm+68wZR4oMTIlbuyZMQ+Yf404ynpj6qK+LF/hppElrUh9yuIfDtn2HYvo4bcDF1ULKaiL6odB9GQkOhDTlIdgW/qkwkeiz4UKWH9pc6jTLb+wFOtX8BL6/4lTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZF/CBSDL; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso2524331276.1
        for <keyrings@vger.kernel.org>; Mon, 16 Sep 2024 03:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1726483582; x=1727088382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOot1WAmO0n8LqJvNiku2kLrm8KQvY7N+dDNwBSEg74=;
        b=ZF/CBSDLw30DFYzkwvHzm2IktN8jmz0b7vNZq0DWTGZAVFfcfFcP/wIXl0Tvj+ujnp
         GbkaPj0CXymhl6axTdGscnGJQph5P/lxaOYhn7ebYVqaA4nOxHUUJNuBdtKqhxhHoPpk
         VZRjlhm5ad7OJYYX9V4jmqM5qpBr7Q7XDdqcBMJqy/PXxY8qKwnG+J8T/mqJLYqIS+YL
         GxSWeR9JIBw9hDX8iHDe1/htoiETqUVtz9xY2QAJC3sQEnTqWmIKOk/9uSXcQAPz/04i
         XR70Zq/8CDOmKPO9mdnZk57XNSW/d5Tf/Ju0ftptKSA/ti6NofGU+jdV8vfZB9pqzlkh
         0MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726483582; x=1727088382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOot1WAmO0n8LqJvNiku2kLrm8KQvY7N+dDNwBSEg74=;
        b=J9v1UJeIERa9Qtu2dEyBvV06Bluquekvaa2mzlqfYKTxku1konFm/ZLT6T/FF4Wsan
         nxWaD5l89Te5mYsItVVUJKGviOeNzEF8dDMXZGTu6h1GYh+/CW/B9MpkmbfPf5FlKQTg
         kH63Q0mdgcAnZ5hu0YmRByUdzDCaWCrdiX8LkVqwY7/MSi73eoesE9LaxLfzGaettBq2
         nJAzYjCOP/ij0l0yPwUph/KSudcCNt0FIfvwoX3xj00ONYA3VzyKFzDibleMQNkyswWS
         5Ze+nXw1NSnahGzUeB4hPTUKUpDOG/AKyjB51wmx/TmMU61urYw09hbVArCvXCrPURuJ
         hT6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ4aVbsVtdSVyPSmU8ShAyiOxPbYqwG6vOZa+kgOCHU2wuXDLUa5OAUcC583hs9Bm2DwUMvZafg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9H3EKIxIuLnWGyxWn9DPawdEXbFV+5oZOHjK0nYAjENO+FHk8
	ZhNcf/zuGlpmpAvROrzNRH9YAvVpBqMplqbqQ9sMhJ4UNc5nJSWdOPKOkpbzw4a9ATwqH8P9of3
	1zq53OQpJUsgtJR3GeLAdaUjk5APAZ4aB3xt0
X-Google-Smtp-Source: AGHT+IFPT7p70pyzFPnGYf9oumwIpGAwqpVNEQ2qCQe0d4QnaPMyQB86xSQEpMCg12204Y4OQ+FOje+z2iOX3Dd9gQg=
X-Received: by 2002:a05:6902:1883:b0:e1a:8e31:e451 with SMTP id
 3f1490d57ef6-e1daff6229bmr8957471276.10.1726483581486; Mon, 16 Sep 2024
 03:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk> <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
 <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
In-Reply-To: <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Sep 2024 06:46:10 -0400
Message-ID: <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
Subject: Re: Can KEYCTL_SESSION_TO_PARENT be dropped entirely? -- was Re:
 [PATCH v2 1/2] KEYS: use synchronous task work for changing parent credentials
To: Jann Horn <jannh@google.com>, David Howells <dhowells@redhat.com>
Cc: Jeffrey Altman <jaltman@auristor.com>, openafs-devel@openafs.org, 
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

On Tue, Sep 10, 2024 at 4:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.=
com> wrote:
> > > Jann Horn <jannh@google.com> wrote:
> > >
> > > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > > synchronously, so that any errors that happen in the task work can =
be
> > > > plumbed back into the syscall return value in the child.
> > >
> > > The main thing I worry about is if there's a way to deadlock the chil=
d and the
> > > parent against each other.  vfork() for example.
> >
> > Yes - I think it would work fine for scenarios like using
> > KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> > launched the helper (which I think is the intended usecase?), but
> > there could theoretically be constellations where it would cause an
> > (interruptible) hang if the parent is stuck in
> > uninterruptible/killable sleep.
> >
> > I think vfork() is rather special in that it does a killable wait for
> > the child to exit or execute; and based on my understanding of the
> > intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> > KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> > through execve?
>
> Where did we land on all of this?  Unless I missed a thread somewhere,
> it looks like the discussion trailed off without any resolution on if
> we are okay with a potentially (interruptible) deadlock?

As a potential tweak to this, what if we gave up on the idea of
returning the error code so we could avoid the signal deadlock issue?
I suppose there could be an issue if the parent was
expecting/depending on keyring change from the child, but honestly, if
the parent is relying on the kernel keyring and spawning a child
process without restring the KEYCTL_SESSION_TO_PARENT then the parent
really should be doing some sanity checks on the keyring after the
child returns anyway.

I'm conflicted on the best way to solve this problem, but I think we
need to fix this somehow as I believe the current behavior is broken
...

--=20
paul-moore.com

