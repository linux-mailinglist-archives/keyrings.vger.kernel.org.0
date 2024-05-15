Return-Path: <keyrings+bounces-1225-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD38C60F8
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 08:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF63F283385
	for <lists+keyrings@lfdr.de>; Wed, 15 May 2024 06:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE9E3D967;
	Wed, 15 May 2024 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Kztt4isx"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F73D57D
	for <keyrings@vger.kernel.org>; Wed, 15 May 2024 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715755461; cv=none; b=RuASZs8vP0e1iAGt7qvbVUf/VCuz+e9VSm0j5FBnXXGqFqMGmSDCjVUrRJVSTTQj8+HQhaQBs1HB1i3FuVUOQR7HjBwC8NpRjiwvEQpQE4G4L84HJJFVam8YUkfPOwpXl7OYsgPl5bhKSKaNI0XSscuRz2wXleS3iRKoN36yghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715755461; c=relaxed/simple;
	bh=Fajia5z7P12kLeYYIqCKzSxxUzjVfBhm34t9XrY0/yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuQgsSQeIKT+gSTiflcHv5jA1/CMhhf+vAxZv6DxL/RwqgqxKfbjGgyq/VHX7AdM2WKhA010OEJiGrH/HkXr5PrVPV0b4JrnYORBAdyBlIYM1Eq0AHYnKgDgGpupFyqh7kH7SVeq6bcwdO+jRRkq4uWkqOXFcnEaQARsFT0793s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Kztt4isx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce2aada130so4599035a12.1
        for <keyrings@vger.kernel.org>; Tue, 14 May 2024 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1715755459; x=1716360259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHt6iIdLhW0U7BUX4DS9zeBTZluih3jaSJ3akZl6570=;
        b=Kztt4isx1Mubyl8Fpbrxwcx7WVR/jnojP6TJ/5wHuCSUbd3W7go/1zLZOGFd7EYr9B
         2JRFvVaeSeLQgeDmG7DQyoVaGjJ5idyNDN/T6gM4R5QII+2aOfhgucxc5udCRHCFDnlm
         8HhhrDV2Jel12WEzipoWc1i9V/Cxd04w1SjiDtZezIW34m2ccc3ubDhYaf+5rs4tCpzC
         NPzztGmKeDVXxO1oSGH3VHw6OOR39bwCNEL/xN1cjxn7tTp8aRIBLjuBln8QmhZed7Gt
         hIP1mGuDVx+q0kUb0BGcRBsBSn9hDLcQDmbTtvYsnJz7bH+teVKQAWJLm1VzM8nZaDo1
         pJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715755459; x=1716360259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHt6iIdLhW0U7BUX4DS9zeBTZluih3jaSJ3akZl6570=;
        b=VeIc48Awaa6M/J2H7lu9F6aQcP8ahXyxPgwZGDmFdjHxPR/x5Pk7xJfRk8D/8LoUvM
         8hrTbrKRzk4+Kdek40Hz5luOI45HzRqdZ96a52tbeHj+N3+ByQkd7VuN2t6IrhcCDvTX
         NzqYxrHh2Hh+pXlQqFfFU8c/6bieN9Exmsxzs1tcUwq6tC8Dv18GCEn8Nk6wFJ9oT8ij
         k60ivigrYFQumHZjXyxRO+Sq2k5MaUG+2DQyqBev0Jkw062iA7O++CX/aVqMqgLW8XX3
         2zJAfLJclDTgFAm8jjYorqBK0KzF7SJJqDGo+a1IIQa+a6Rp5d+i54n5h/T13l1aEMox
         0C4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlWCgyuVoJDtAhULiwVLMRcpLH6FhPlxQ/TDfwI3tOvqaOa1vwXoAO5/TKA07yjKCEgo4VR4o/s1oQEp3R0z9LNYzsqdQaSuc=
X-Gm-Message-State: AOJu0YzkT05MjizFoNBxeZ8K7xek4LNDXUqGlPLYzWsQ0tvndgKoHUDZ
	4DkF/3m9yDdr9yCy4VtNkR0KReR1TcrQoDdPpcwGcPlJGtFSjInmb0T3E2+P2dw/qQZWE7vZzzU
	FMY9GtHTAGX4HGp30iQlbQOiBYjj/9KnpU0erfg==
X-Google-Smtp-Source: AGHT+IFEtAJZ2VfYRn/ENkTjxi26mgbfcvdMy4KCuQ8gQasIEb6jSLE6aTIv+LC20CsuGZBINyFevEeFRMr7E7pWuzI=
X-Received: by 2002:a17:90b:3715:b0:2b3:9ce8:1239 with SMTP id
 98e67ed59e1d1-2b6cc1438dbmr12551957a91.6.1715755458902; Tue, 14 May 2024
 23:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503221634.44274-1-ignat@cloudflare.com> <20240503221634.44274-3-ignat@cloudflare.com>
 <D19QW70177QG.2YC9XL0FT7VME@kernel.org> <D19RM0OV7YUW.1ZEI72XQUREMQ@kernel.org>
In-Reply-To: <D19RM0OV7YUW.1ZEI72XQUREMQ@kernel.org>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 15 May 2024 07:44:07 +0100
Message-ID: <CALrw=nEnqBCBQKhK9ACc7tbicqkXaDD+Bjc1d90xizMvbb--oA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] KEYS: implement derived keys
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, serge@hallyn.com, linux-integrity@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 12:44=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> On Wed May 15, 2024 at 2:10 AM EEST, Jarkko Sakkinen wrote:
> > On Sat May 4, 2024 at 1:16 AM EEST, Ignat Korchagin wrote:
> > > Derived keys are similar to user keys, but their payload is derived f=
rom the
> > > primary TPM seed and some metadata of the requesting process. This wa=
y every
> >
> > What is exactly "some metadata"?
> >
> > > application can get a unique secret/key, which is cryptographically b=
ound to
> >
> > What is "cryptographically bound". Please go straight to the point and
> > cut out *all* white paper'ish phrases. We do not need it and will make
> > painful to backtrack this commit once in the mainline.
> >
> > > the TPM without the need to provide the key material externally (unli=
ke trusted
> > > keys). Also, the whole key derivation process is deterministic, so as=
 long as
> >
> > Why trusted keys is inside braces. It is not important for the point
> > you are trying to make here?
> >
> > > the TPM is available, applications can always recover their keys, whi=
ch may
> > > allow for easier key management on stateless systems.
> >
> > Please drop "stateless system" unless you provide a rigid definition
> > what it is. I have no idea what you mean by it. Probably not that
> > important, right?
> >
> > >
> > > In this implementation the following factors will be used as a key de=
rivation
> > > factor:
> > >   * requested key length
> > >   * requesting process effective user id
> > >   * either the application executable path or the application integri=
ty
> > >     metadata (if available)
> >
> > NAK for path for any possible key derivation. They are racy and
> > and ambiguous.
> >
> > This should have been in the beginning instead of "some data". What
> > other implementations exist. For me "this implementation" implies
> > that this one competing alternative to multiple implementations
> > of the same thing.
> >
> > I do not like this science/white paper style at all. Just express
> > short, open code everything right at start when you need and cut
> > extras like "stateless system" unless you can provide exact, sound
> > and unambiguous definiton of it.
> >
> > Just want to underline how this really needs a complete rewrite with
> > clear and concise explanation :-) This won't ever work.
> >
> > >
> > > Key length is used so requests for keys with different sizes result i=
n keys
> > > with different cryptographic material.
> >
> > What is "key length"? Please refer the exact attribute.
> >
> > >
> > > User id is mixed, so different users get different keys even when exe=
cuting the
> >
> > First of all it would be more clear to just s/User id/UID/
> >
> > And make obvious whether we are talking about ruid or euid and how
> > this interacts with GIDs.
> >
> > I'll look at the code change next round if the commit message starts
> > making any sense.
>
> Right and neither UIDs and GIDs are applicable for key derivation for
> quite obvious reasons. So NAK for that too.

Can you, please, clarify a bit here? Not very obvious for me. I added
euid for two reasons:
  * an unprivileged user might run a normally privileged application,
for example /usr/sbin/sshd, and depending on the code could "leak" the
key
  * without it and with unprivileged user namespaces it is possible to
create an unprivileged container with code at the same path as a
privileged application

Why do you think UIDs/GIDs are not applicable as mixins?

Ignat

> You can make them point out unlimited different identities...
>
> BR, Jarkko

