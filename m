Return-Path: <keyrings+bounces-1240-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A28C7A41
	for <lists+keyrings@lfdr.de>; Thu, 16 May 2024 18:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8668B284938
	for <lists+keyrings@lfdr.de>; Thu, 16 May 2024 16:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1B814E2D7;
	Thu, 16 May 2024 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YrVEFcX1"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762014E2C6
	for <keyrings@vger.kernel.org>; Thu, 16 May 2024 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715876629; cv=none; b=I/plaM/hsloGZRfuRVNW7cWMeHziOLamOZ7UDdYvKNwwkFkizdc0X6j1ZV2bQrO5LGgBDTG1hygZ6ZKOeQSMtEv9Kisf05uJcmIohnKf0FDp/Ttg+LkZf/+MFZzuCJhTASDLQ/xKPXaku6tOsjODgl+bcy2GQ/+2fkYNVNTcAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715876629; c=relaxed/simple;
	bh=EZ7K4NzPBe6mgvmzDvgcN0o2b/NCkPR6fbfbuMDf1ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYzmPFzwaZQHPlsuByqxGkr0ALulpXBPfXqHM+2py7vvVQOucdMyM8zv1i59YRL5kJPC64KpyXh5nN1MrqZ9dvG4NtOFOxJXKlqIWWRhfX79liCd7BfCs/m6pXyY26wAR9Lf+D8Yspimkv6pfYPFDtd92eUqhnxm2JMDyhHyClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YrVEFcX1; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-df457d734abso1172524276.0
        for <keyrings@vger.kernel.org>; Thu, 16 May 2024 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1715876626; x=1716481426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Razho7lHGpyap1v7dPaP5qSSISsR7xC/uw6XBXBKDDs=;
        b=YrVEFcX1ds2TXr7XCZ5Fzp/kPwxTFs9f70qlsY7O0tR1s3pk7uoWBqDKnlqm7TdF3A
         CgAwIvtI9e1GzcSarlc1Z1YlgQmC0ZX/v8R3TQANXQddY8NiRSDggauIINJbBJ0Iczpz
         lMA709PVe5DCeKreg6yFIWlK1ceEEOINXkvutC3N3ClIByNvxJHHktZbCppgco7VocEQ
         wcbaksZwQtESir+rhGAsuKMbpk+95a7W7ODxrfoo7Z614SZzjzJd3/W4Q+HyXywn49CG
         tAgvnx4f3fpDjXR4CBJfglcTrAXsLHgZsdGw70QYisGLauQc0yRzF2aL0Wrrb+Hi6q4K
         cgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876626; x=1716481426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Razho7lHGpyap1v7dPaP5qSSISsR7xC/uw6XBXBKDDs=;
        b=ORysfLe6jjiI7CZba8rV5uN+GjXzvWaTw86FycSui59xZZiNe/P5a5TDffBXLciK2Q
         pbQKdTajgG/AVYMTOyNMJ4eP52VgYQa8OJcoGswuOiRAv2BDsmZ7iQeQgARkXcRJVag/
         rN7aFvgVv43e6guwSDPmy9bzUDPKvNJGAavBl/j7C/jMXoOKW2cY6c0eQr0GGk1FB7h2
         pgE4V74YlWTRETej7h59TQW1W5oVepJ95D2MruiD6pkzk0VOesaZ2GxhSJTc28mPj9Rd
         JBOrr5FS5fdDg+ctQ8KNUGJN0myh6W3a8mmt95M76C7psaKadZn60gmvieesXt1rOa1Y
         sISQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcoOLGxqU83tAGnPB94A+gw1m5GbzSTKqvqeJb5A7VSXNTaKcOhkrlZi6kZFF8PQ3BcCxcV5aPF5efF47edm0q4ZvmBvAB4zU=
X-Gm-Message-State: AOJu0YwDwuqZiOq857MuZod62/ZgImXrUxGPyaT/IM8/diSp7mTcJ9F5
	9+DnTULxb+xM7viY/eovxt+736l6DCvTq181SaRpPRIIerDqA9x+NWEDUqs9XDanDMF/NYdslO5
	0LZj7bBLRYNI8a4tbSJBHgvY1zDyVKwHo0aHs
X-Google-Smtp-Source: AGHT+IEe/+V1bbRxOWwuKMKyGJUCyojV3Orv/M9T3K8RKww9g1UJdluzqC20c4o+/xI6Shg9MmTrzyhw8zyqu2pFzkc=
X-Received: by 2002:a25:ade7:0:b0:dcd:5c7:8466 with SMTP id
 3f1490d57ef6-dee4f3a9f30mr20073221276.44.1715876626618; Thu, 16 May 2024
 09:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516092213.6799-1-jcalmels@3xx0.net>
In-Reply-To: <20240516092213.6799-1-jcalmels@3xx0.net>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 16 May 2024 12:23:35 -0400
Message-ID: <CAHC9VhQ=nNPLRHF8RAMxArT1CESei+qYsnGse6--ixPhACAWTA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Introduce user namespace capabilities
To: Jonathan Calmels <jcalmels@3xx0.net>, Serge Hallyn <serge@hallyn.com>
Cc: brauner@kernel.org, ebiederm@xmission.com, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Joel Granados <j.granados@samsung.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, containers@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 5:21=E2=80=AFAM Jonathan Calmels <jcalmels@3xx0.net=
> wrote:
>
> It's that time of the year again where we debate security settings for us=
er
> namespaces ;)
>
> I=E2=80=99ve been experimenting with different approaches to address the =
gripe
> around user namespaces being used as attack vectors.
> After invaluable feedback from Serge and Christian offline, this is what =
I
> came up with.

As Serge is the capabilities maintainer it would be good to hear his
thoughts on-list about this proposal.

> There are obviously a lot of things we could do differently but I feel th=
is
> is the right balance between functionality, simplicity and security. This
> also serves as a good foundation and could always be extended if the need
> arises in the future.
>
> Notes:
>
> - Adding a new capability set is far from ideal, but trying to reuse the
>   existing capability framework was deemed both impractical and
>   questionable security-wise, so here we are.
>
> - We might want to add new capabilities for some of the checks instead of
>   reusing CAP_SETPCAP every time. Serge mentioned something like
>   CAP_SYS_LIMIT?
>
> - In the last patch, we could decide to have stronger requirements and
>   perform checks inside cap_capable() in case we want to retroactively
>   prevent capabilities in old namespaces, this might be an overreach thou=
gh
>   so I left it out.
>
>   I'm also not fond of the ulong logic for setting the sysctl parameter, =
on
>   the other hand, the usermodhelper code always uses two u32s which makes=
 it
>   very confusing to set in userspace.
>
>
> Jonathan Calmels (3):
>   capabilities: user namespace capabilities
>   capabilities: add securebit for strict userns caps
>   capabilities: add cap userns sysctl mask
>
>  fs/proc/array.c                 |  9 ++++
>  include/linux/cred.h            |  3 ++
>  include/linux/securebits.h      |  1 +
>  include/linux/user_namespace.h  |  7 +++
>  include/uapi/linux/prctl.h      |  7 +++
>  include/uapi/linux/securebits.h | 11 ++++-
>  kernel/cred.c                   |  3 ++
>  kernel/sysctl.c                 | 10 ++++
>  kernel/umh.c                    | 16 +++++++
>  kernel/user_namespace.c         | 83 ++++++++++++++++++++++++++++++---
>  security/commoncap.c            | 59 +++++++++++++++++++++++
>  security/keys/process_keys.c    |  3 ++
>  12 files changed, 204 insertions(+), 8 deletions(-)

--=20
paul-moore.com

