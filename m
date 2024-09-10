Return-Path: <keyrings+bounces-1977-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295697444D
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 22:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2106F1F25B9D
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 20:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1528C1A7AFA;
	Tue, 10 Sep 2024 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CqAmCP5O"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AF1A706B
	for <keyrings@vger.kernel.org>; Tue, 10 Sep 2024 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001357; cv=none; b=RgQXr77h5N6Y6HqAbtTVYPFzfGsoDFMrFkVfaxaskyb/XBeXsnfshEQnIFo6MUCs2QAAb4M6jghl67S1xmuJz0wLLf0QiDqm5hI0J6aSZAxK0Qr/i0p4X8XzTwh0Ir6gSIrdtfrvmCPQAgFDfrNV8XKAM/eg0yIjcPXNTvzse6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001357; c=relaxed/simple;
	bh=/sSLbtfrwVeABiJUeQBSaBwJb8hKBmomjLIUb1dAvvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj/2EpUduDLJU7y2Cb64n6s4BBWBrffOq7fVp8e/CyNeYJ8NkQ+XOnT29apf6QEi2rwUBMPIKxhC1Q07r2t1lCfE6ldRv3lu4xivCL1vnpUzJz9vbttC8U41E1zhO9BO9EwILrXgm5HjLUlCY+vTciMQGy+ukg/+q0YLB9o51PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CqAmCP5O; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e1a9b40f6b3so1179925276.1
        for <keyrings@vger.kernel.org>; Tue, 10 Sep 2024 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1726001354; x=1726606154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYjARXF5iHHpTlh5hyqO8bTT4ZmLx2A0R6UF7JUY+9c=;
        b=CqAmCP5OsuNHVeCyEiNDPnaM3R1UIekUKFiV0fw2r0x+b8m+NI86LznKcvmxzV8r+J
         t0mMfjtHbcha1skBFiKcguBvUdZ9nK4dp3TKW2i/70zcGq0nGtexGiPjOefjpkRkjR3E
         MgJp1PwWjZulVI32knqh73bgE4dOFjkaG5eVNhcQJNdNMWLHN89BWv5evIvK0MFWSmgL
         us0Z4beuHS5f9IC3VhveN0M1O2qhTGAZArXErutGwzun8D+or8uWLGOzGivsWo4XGqAM
         QecjxeqYCyqk3NXJAnrbtNRQbLDk2X+fd1GAmLwamKyAZVpH9O7UiSsw2BUGHx8/ygvW
         2ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726001354; x=1726606154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYjARXF5iHHpTlh5hyqO8bTT4ZmLx2A0R6UF7JUY+9c=;
        b=JM/GQ2x5gl9UjRGTQepJKaTRDufWx/fdz2DZq535Jckywgc1pP2FBRglSkfLqO7SZ0
         uwWmO5aMYmat8ly4BQ2WK9iEwrfJjd9yIKDcp1xHQ1whaNQo0fKGaz1okZi44fiZo2v/
         khKYYBH4iHEdOmftwm/0UquNWZUTDltvWgUtcpCk1HVDGIzNwqVjL2WbGC+9ypEOMaO+
         Pu9YKoTBXerXvKXozitwHf5Qmkb52Q9mKzvZ2pPtvK8yNrSg5o3dhnkBkumwjlVCHg/S
         uU/rZs795E+gJwPDsH7Ny8g++AJd4YXMntxN0EvZ2D5VmPNC2aG7TBCjgJ3ByeAEsNHs
         qxUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqHdsjGtY5N466+QCPUhGbYS57+bdD9p/sSBHlWn9RaNfXGDquq7TZcGm9SwfoV5PGfcG5FPzzPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJSa4pHuaCPNQx1JFZMGsoTKOvBKHJuCiaMspLk6IVwWAys/E
	4nUJ64eay2SsCz+fjRWtlVOfb3H1uVKPKRbApcKa9VnBqbO/gpeMfBjKJ2CXv2lnpo99+nm3bT1
	z++s42bUAcYbfjGEF6w9RMLsgjUjU8WXvOqff
X-Google-Smtp-Source: AGHT+IFgMK6PeTDRSiV3IUUm82K2jugYC/SvYQbL/2kIQWJ6vCR0av/sG1KukB6SNfhmqpD5QEYFAa0dGswS6AalsdQ=
X-Received: by 2002:a05:690c:6812:b0:6c9:9341:1c45 with SMTP id
 00721157ae682-6dba6d98f5fmr12360207b3.14.1726001354371; Tue, 10 Sep 2024
 13:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk> <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
In-Reply-To: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Sep 2024 16:49:03 -0400
Message-ID: <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
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

On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.co=
m> wrote:
> > Jann Horn <jannh@google.com> wrote:
> >
> > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > synchronously, so that any errors that happen in the task work can be
> > > plumbed back into the syscall return value in the child.
> >
> > The main thing I worry about is if there's a way to deadlock the child =
and the
> > parent against each other.  vfork() for example.
>
> Yes - I think it would work fine for scenarios like using
> KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> launched the helper (which I think is the intended usecase?), but
> there could theoretically be constellations where it would cause an
> (interruptible) hang if the parent is stuck in
> uninterruptible/killable sleep.
>
> I think vfork() is rather special in that it does a killable wait for
> the child to exit or execute; and based on my understanding of the
> intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> through execve?

Where did we land on all of this?  Unless I missed a thread somewhere,
it looks like the discussion trailed off without any resolution on if
we are okay with a potentially (interruptible) deadlock?

--=20
paul-moore.com

