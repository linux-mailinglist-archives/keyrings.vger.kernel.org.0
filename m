Return-Path: <keyrings+bounces-1820-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F252C93F703
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 15:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2F81F2294F
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 13:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F5414EC60;
	Mon, 29 Jul 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4vseqjZ/"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BC14EC5D
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261011; cv=none; b=d8a8KU7MDSUFiGR17M8en4xdxehRXHpJ729lO6xJtlTZt9GQFhZdEB68VB4deq8BYmNIEDGKbSSZrsvqnEjs/BFrEudQiWBj4hJvBMS6fex48/OZW+uvKqVjau487xm4h4T1t0HUHVCsPlUCTeJp1XhyvLO7pUZMVF9z0Zsi9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261011; c=relaxed/simple;
	bh=Q5uRKdexl1FWIgeaecl12wpeJjOcyl1fYNvfHXWGAkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJ0l2DTfpT4ljS1PiO3NS2ZVLgGMNRoCdvzLWfDlBlXzDjCctSESjbJHOLHbjQL1O/fY9dRbCiMClFZxZSot0zzpj7Obv5kmcmIkfhUXtoXGjajh30KlYDZwN9gy/q8ipWRIO6Q7XuxXvEoDjlgMQRsiJGBnVefXwjmH5ureZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4vseqjZ/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so12381a12.1
        for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722261008; x=1722865808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDb5V1QphvVrrCYy2ir9gaKSY7i3HzlEt0UMjL3m1Wo=;
        b=4vseqjZ/lvUgR5siBsVk0eC3FjzIgRIDmpFqz2Sx8iXB6fP+oWbdQQMyMvwjPRL1i9
         zTOrFaUtbBxRkyL0kJ+vvGbuvwLIFz6IyNllJ/l9sHsTZgcdpUHhLNTmz4e1jGeLPRkF
         bq8esFig8O0MAR5mgQuJPL5aCJby7JIJgubajRqQEmSxz3oSEKwjKbgkv4DOhAOA8UNQ
         najn5YnFbqy0L4fv6O8vJu7NlZ4NjMqPlKfPK5/4pVImK6LLrmdEy9NS7VXMJvLYn1Em
         Pb+ZqnUa6BmvK3OvtSsTrZDBKl+k0rLGtJ47zDggBJUk3tD2fOclqv2SO8PV1KTy9+g6
         SzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261008; x=1722865808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDb5V1QphvVrrCYy2ir9gaKSY7i3HzlEt0UMjL3m1Wo=;
        b=KLm6TaApSIfhtzQCz9K6TGZoyDrVhY0/VvceFOFiNXmoojYxKaHYJ8Td1qtUS0Bqfc
         tKZjRCnxtW/7RhapY+VJToHoauJLdLPs3D/G4zQjQUmOpWLaHodtzOFbMPv4Sp+tNGfj
         7Gd28h9O26bROtOuJxCnoS9tMCqkEODYLz0V0iwOj6NctnpYQwtOcpfSSdxDEbeQJHRG
         OJDIcNhLi6SKdJ+sHE82B+AC7XR2AHC3EcRjOijXzfqlHYBIaNajdtF7F3RrIXkEehS0
         GDs1NYrDRPTn/1d3sY2dS7WKxvFKuriVAOuN8VzWC4M/kVHSPb0saNq8i+Mdrt6cywFC
         Z/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/YO0DzHrhnpMiPcF6/ZjSxTCH3MUXUWsQNlbt2PryZGLklZtmRzw/ImKnRt+z6SoO8NpDLCxTHRffF9h7hy6WY5AvGOm1rK8=
X-Gm-Message-State: AOJu0Yy92E3XEXS7x/5xFplvunfuGlofqCUWD9HAjg5crd19zXb987aa
	kgG1dd1A67r5ElZrE2JYYip68IwaCuPqZ4ZXxNSafx9Etk4BcdpPvNOmi+yCtpKZfRea3j5Nj4a
	wJVhca2zCV63IeowUSQ7qUqLhLTznUIS22evk
X-Google-Smtp-Source: AGHT+IG+KGgrjitU74w+Wuh3bTE7G0peIlECTBGCgPXSxL/avmg0YQ1+aMUr2y6hMEsjbkLoM8BTilae4DsdRUeStuo=
X-Received: by 2002:a05:6402:2694:b0:5a1:4658:cb98 with SMTP id
 4fb4d7f45d1cf-5aed459c474mr562712a12.0.1722261007675; Mon, 29 Jul 2024
 06:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729125846.1043211-1-mic@digikod.net>
In-Reply-To: <20240729125846.1043211-1-mic@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Mon, 29 Jul 2024 15:49:29 +0200
Message-ID: <CAG48ez3DzxGMWN9GDhSqpHrDJnZDg2k=VEMD_DFiET5yDr07rw@mail.gmail.com>
Subject: Re: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	James Morris <jmorris@namei.org>, Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 2:59=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> A process can modify its parent's credentials with
> KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
> doesn't take into account all possible access controls.
>
> Enforce the same access checks as for impersonating a process.
>
> The current credentials checks are untouch because they check against
> EUID and EGID, whereas ptrace_may_access() checks against UID and GID.

FWIW, my understanding is that the intended usecase of
KEYCTL_SESSION_TO_PARENT is that command-line tools (like "keyctl
new_session" and "e4crypt new_session") want to be able to change the
keyring of the parent process that spawned them (which I think is
usually a shell?); and Yama LSM, which I think is fairly widely used
at this point, by default prevents a child process from using
PTRACE_MODE_ATTACH on its parent.

I think KEYCTL_SESSION_TO_PARENT is not a great design, but I'm not
sure if we can improve it much without risking some breakage.

