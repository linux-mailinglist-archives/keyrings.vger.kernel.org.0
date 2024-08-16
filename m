Return-Path: <keyrings+bounces-1878-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B59546F0
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8E428344A
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AA0194C73;
	Fri, 16 Aug 2024 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/Q293h/"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125B13DBB7;
	Fri, 16 Aug 2024 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805524; cv=none; b=P1lhppFTbPBaOUu6VzQwyXk0qVU6bb3JBm1SyWwXf/gf8l/+pS0ZYaieP/xDEMzuIQcT+6OdJFTs6Y3FdpQxKF8smq3tJn/zsFAUgKRsWCmxyUsaASS1mF5VnSy+k+42lOs+VpAF/IShHvYJCUXs/Y7uVD4b+LSjHCIbtWwAFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805524; c=relaxed/simple;
	bh=1sR3kzfqGCPk6o6xpt/iBSsdvNffZQycm96/GnQwgFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kAAr9xT8sGBFy1pTDHD9OspM9cBFc6pMKQ7pezH1HjkFVfO7mygXyHBLBVNN6LkTRgJOyrcChxWpQEcaFfRphXpUukV8FkN3Ykw8mJE/H33l/SD3v+p0kt3Z6cgi74P9Q6W035Euuvj9GVcAJCrrOg/GZvgPtjxcdoJfJX1cRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/Q293h/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4294C4AF09;
	Fri, 16 Aug 2024 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723805524;
	bh=1sR3kzfqGCPk6o6xpt/iBSsdvNffZQycm96/GnQwgFQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=M/Q293h/7CNIPdkkW/W0u/9moWvk6RkJxcXowaU3rwpsD4R2Je1UfPslzhChK6F9v
	 /mnXbPGzPQIwpGhvtj9PlQ29hK29YCR/wYhLWGkcLkbUpWHK1E8lsfSU7nK+qh9gWR
	 DR/5Fjw1B3arA2dG8TkxYArMdGmzuesv3KQBH40Ye/6eCMg9SJonMISSQgqoDWT9X1
	 9mEt6MC5gd+/oNLnyIqx1puxhGQ8zjtGAYOEJN2Hns+hHmPX0dF6X7nd266XtMzoa1
	 ZaSX9OwZJYheW4TvwFFTcufk622HKPIg4/oC1f52yUto7qP/4ueex54ie4apjbcDw0
	 Pk7PXF+BtJZHQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 13:52:00 +0300
Message-Id: <D3HA23RMEIJ8.2AHOMIYR3J6F3@kernel.org>
Cc: "Jeffrey Altman" <jaltman@auristor.com>, <openafs-devel@openafs.org>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "John Johansen"
 <john.johansen@canonical.com>, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek"
 <omosnace@redhat.com>, "Casey Schaufler" <casey@schaufler-ca.com>,
 <linux-afs@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <apparmor@lists.ubuntu.com>,
 <keyrings@vger.kernel.org>, <selinux@vger.kernel.org>
Subject: Re: Can KEYCTL_SESSION_TO_PARENT be dropped entirely? -- was Re:
 [PATCH v2 1/2] KEYS: use synchronous task work for changing parent
 credentials
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
 <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
In-Reply-To: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>

On Thu Aug 15, 2024 at 10:59 PM EEST, Jann Horn wrote:
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

Could this encapsulated to a kselftest? Like having host process
that forks the payload and send SIGINT. That could be deployed e.g
to tools/testing/selftests/keys. Would be nice to be able to try
this out with a low barrier.

Doing this type of testing is different axis than keyutils test suite
IMHO. That would be also great starting point for adding concurrency
tests in future.

Could be done either in C or Python.

BR, Jarkko

