Return-Path: <keyrings+bounces-3738-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F81CFE282
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 15:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA1EC30057C0
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 14:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A017329C7C;
	Wed,  7 Jan 2026 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="f+VOfcMf"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC82D8387
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794403; cv=none; b=s0e7XtDneuQZ6MvdxpvsQ7qAxMSrsI07gAN9P37hys2ynxFZbOXZIB2QxRzaqo3jtJWmOS9IKHijYNBg7H5GgGh8grCUi4IcG+PnYmu1b3l38UsIjzO2Od5nDn9krAG9YQ7VM/r2z4fzAnQWTud9NOsMwSRwmVu5p9xY0qNCXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794403; c=relaxed/simple;
	bh=TrNOZ6HpS6QFZtTMyoW+Wf0WTeQJHYUhQM0CiAPXgec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYs4ocE+Ick6nK8vjtc14yO8MC8VO5CAAbu/+4lp1Ek/ptZ37qbTrUqE9y8YMJqgz0vh2rJ3DiZoBTtRTIQl//LHJC0u66I6V9y1sJruiK/YRZ/g2uj4njjG41uZiYvq5MI/S3SVyjOwe0+l7jVhT7mysWy72ezdFlY9IK0304k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=f+VOfcMf; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b6d1b16dbso1170553e87.2
        for <keyrings@vger.kernel.org>; Wed, 07 Jan 2026 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1767794400; x=1768399200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nLSyDph51skBA6xT8p5KzKOmafgGpX1ihcuW8dmXLk=;
        b=f+VOfcMfdCYhA4DRixHaJ/P15g3Y+KhLXx9aXPu0cr+N4b534DUGr09Z6gKLXdsC5B
         0a+2vyO6aiy6w7zEhFDc0jAc5KHerMNeIxmiO3cMvitGWz0ddPyOf9wBZdLcDYCXJeg8
         YS9buXZxlF5Kplxxt7bOQBeQTqkKc3hZWLV8SAlVfER7s1uAPT1Yo3ox/ewtnML7nrvd
         gzV8K7W4n91mw9VXj/1YB5y9oLjE2ZkG2t0kZWaYCnMa5JlPYcTNhL9IyYQwRk9bLiBP
         dCxJEtBUE2gfz9djpE/USDBD/9BGEMZDwTCuSOUVrYuFX8/l7D6IMhgmFQN49ukvMD3x
         +BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794400; x=1768399200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6nLSyDph51skBA6xT8p5KzKOmafgGpX1ihcuW8dmXLk=;
        b=jP0GMeOrBl0K7ZUXYNNLLS+pvZkKBNV7UtITMkBkReBl4Gv0f+QK7Vygstq9WtrbZz
         YZl0Cl3rf+2Ld7e50ibWXEaUQqXwuGyREszkIAawg6AUdkhlmRlgmPkL8kMtU7sRSIvl
         wmew/wURKCqilmkAQrm1SRWbTbgwlAS5WwtyWRJrwyOgSU6SkETe8FoSlbnqiDKXEK1c
         ova2hf74J1H93KIeObFBWX8P1U6vbKOJ7erUdKbSkYoc4UgE+m+rURME8y9rtZq6KExP
         1Boc+HefemjgyswErA0dPA0an/TgFk4KqMgzLI/9DYCKIyuUXDwskzStvvHFnPjpuahd
         Rsiw==
X-Forwarded-Encrypted: i=1; AJvYcCWAqEEtA9fL0QPsgT4cEymNZ4p0pQDajNz2tSaJFrQvBFxjIajEygp6KRZpCek1SBDhWMPdkpcv9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgF8O67AQ/H1HunXPAPxDB/4+GI7FenGg+FZ7LRtZekfmgIlS9
	OVxM+y2NW2JqgkcQNBLYMNQllNjFC7fWbDasoBItFLRsxZc1WhBb3D0ocV+qIzT+lTb2shSIIL7
	MkOoeMD0jS/RqNIBkc2R31XbmgyqSmyDVFo617fQoaQ==
X-Gm-Gg: AY/fxX7ePyahKGoCNWkC8jI7+ruqHrQZPu1WQRIdgSNDn22Hp5lfVh8XaK6MTseXLVk
	Nkati44L7BrS1s0IxXZv3ZqTZwfYaUZiMPiknSBkauYd5Qokal9DyJC7yGdAfFa/aXgwAPberUG
	wWcVsAsr514sQ3BZ2etT+mFtszB3YBPxQTP6OFsa04pALicnEazMm8hHxxA5q3Ah3Y4Brbm72+C
	v2WffElyNxbja3PL2h2enNgTDnhjVR/TieFgIXqp5P5l/mcb5vcIbJMha8RxIDz/T/dWgK2M6Ua
	Zj6xQGE4sqdZAA==
X-Google-Smtp-Source: AGHT+IEHYfi0dlZf2YFiZv8lqVOnOsYUzA5eTbLyIL6UM3u5CJcQUUMyunitfw+FxpRXUzE0Q5OSUPDvSRXxOsia/QM=
X-Received: by 2002:a05:6512:39cf:b0:59a:1bdf:c437 with SMTP id
 2adb3069b0e04-59b6ef094bdmr951885e87.11.1767794399867; Wed, 07 Jan 2026
 05:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-3-dhowells@redhat.com>
 <CALrw=nFj9OEsREJ8Kxox3U6N8y=e00ZawxEkCPOb5-6_k=7+nQ@mail.gmail.com> <2366240.1767794004@warthog.procyon.org.uk>
In-Reply-To: <2366240.1767794004@warthog.procyon.org.uk>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 7 Jan 2026 13:59:48 +0000
X-Gm-Features: AQt7F2plMc4I4NtJi5fV1xvI4Yfd3PKBoxKSGD1WG5sCKDWXR-Ox669ezz_yn9M
Message-ID: <CALrw=nEmPVNRvno2=48d5k+txRv=CKKezsKt5YunoKHUaNhGmQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] pkcs7: Allow the signing algo to calculate the
 digest itself
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 1:53=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Ignat Korchagin <ignat@cloudflare.com> wrote:
>
> > > +                       ret =3D -ENOMEM;
> > > +                       sig->digest =3D kmalloc(umax(sinfo->authattrs=
_len, sig->digest_size),
> > > +                                             GFP_KERNEL);
> >
> > Can we refactor this so we allocate the right size from the start.
>
> The problem is that we don't know the right size until we've tried parsin=
g it.
>
> > Alternatively, should we just unconditionally use this approach
> > "overallocating" some times?
>
> In some ways, what I'd rather do is push the hash calculation down into t=
he
> crypto/ layer for all public key algos.

Probably better indeed

> Also, we probably don't actually need to copy the authattrs, just retain =
a
> pointer into the source buffer and the length since we don't intend to ke=
ep
> the digest around beyond the verification procedure.  So I might be able =
to
> get away with just a flag saying I don't need to free it.
>
> However, there's an intermediate hash if there are authattrs, so I will n=
eed
> to store that somewhere - though that could be allocated on demand.
>
> David
>

Ignat

