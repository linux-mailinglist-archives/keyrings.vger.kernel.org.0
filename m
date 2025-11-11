Return-Path: <keyrings+bounces-3326-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F6C4F03D
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 17:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D03214EBF0F
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4752936C5A1;
	Tue, 11 Nov 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j9Zqu+Ab"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BF2F7464
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878193; cv=none; b=cCqAdRH6v1p9AtMKQns55sAohiuKRpxQDW/vecQLYvbGNglsvGxmnw+5SZsmDble/eijHhng2tK4FL5QrfN2aKWpxdHmQ5QQzQ0GiIe/qP4RN7tmJC5f12CHVExlzYFKAzjfash4kDLr4WkMRcBRd5mtnESdXD/d1Dz+uBmlufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878193; c=relaxed/simple;
	bh=6K2M6sXqSfWuHEO5SZZB6vJuswyuFAvFpqwznwwaw6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qt/dq+Fj9puut3WQzClqVPhWVY3o2f8RxGt/qCCDw90dg3sXI7G5Y4+nbu4pyeNZa9XOqQLxE+RIuklkGv1yCA0Gcqnl50uFV7UxLA3+EJDVydHc/eYR/L+P2WGTobfJgOQf+tgZkEZ0F0OSShDlSUCctVaBJXDcze1S514vjSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j9Zqu+Ab; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2980343d9d1so193945ad.1
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 08:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762878191; x=1763482991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkUuhGxVx7htjf3miH8SdELPvuF/att6+BPRWArWBaA=;
        b=j9Zqu+Abxe+ZBg4SeKM+8X36f3Og+vdq/13ynSR/ZhdVwzIbxM7l9Gd4jSdvSQ4YV5
         CFW/e5YuTIvolzjrE2W8xkBaAz2Sj2r3BUTSkVMFhB8tu1fr1xiMEJ2nRAoqIwKQ33IN
         YrVrL7Q/9FyjhmZuZHEoaFs6B1b3nvhkCPrCWT2RLMpTJueBpzLxcEPiSFmejLKXibxk
         c6Np+H5KRyB7iKEMEkvRqLOA9vyqTuWj+gQpohpEqweQqjKD4ZfTunMLCbCUrG1z/5JL
         7OuZ05XfqMfV/DSI6YeZpPyr4qWTWlfvJhJmD+1qNs+6Bh4Wp68VvMh37C7ZtOGJJyzu
         IUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762878191; x=1763482991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZkUuhGxVx7htjf3miH8SdELPvuF/att6+BPRWArWBaA=;
        b=OTcuGct2TG2Cy+h+YwxPWYChuK4IC4gycsVjY8W0prtD8hKB7b0IZhCxDsdhbLveyJ
         RPf8csa3eohu50ZT3KfO7BNZHyVm6//mtVOReDwuBJyEeOuIIfQabSkhUODEJC7LEcUX
         NG3tfFOfl+ukRqAfXe9IUvqkhOO+clLElSI8dvu7eCppDA2k345Or0gQMI3ZmR3j/+94
         xLQjT9LW7dmWWkEQ5/GNhWpNZDWolqh2Unnmxt4ySmsSU1cXuMmosaRq9OGiOVpV2aa2
         AwZeX7is8ZwTxp0rSqQ1LnqhHLrc5WII9EGDuU7QgOMKHMG/f6P2g7+72AUjwfJNhuRh
         rA9A==
X-Forwarded-Encrypted: i=1; AJvYcCUVMGK9vd7SqACw4x7/TCcx1RZ0NMb0Z7QZrM18epppcT167Y1aFccY/Bjq2aRPgPE0iVoHYUh7dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZM8FOGIIdF/acsRoHoCehrM1Y68X/KmtHm6NJ+0TX8kKpdiP
	owLEyeq8g4XnAuYB8JIrD5oSnw6hHKgm6VX3z57mjgeIqd0jk3pDNm7OGWSSapyxU2kwq3o0XDx
	ajYqG3qf+dvy37nEAm07L7JDd4A2DziJdXTaDKp2K
X-Gm-Gg: ASbGnct0zEMXR0KtSXEd8fCezr7LU67ILEas+IXlJJUiCRjwqBj5g37J2yIAvYsXHzm
	D++4rqBEgNCYkRFdmeX6TndClB12WFR3bTDuTDtHCFGOSiCaoroUYt+WUzR4X0xOlUedNBE1s5m
	9u5UW4i/kCgfP96SwP+UExwMmMjeiEm7gb8um5w8HJGj6dAhcKOOjusvJKHxJfzJcQZxurLUodN
	lUwwXfouIFchLbZg5ixyJMQnmTUezqb0UB8eTPeXoPv68k4MUs70LkIqOyj/C2TfxovZ/45SRw/
	qLE=
X-Google-Smtp-Source: AGHT+IGjW9VeCdmnQlOPDbbOtgrUBcup+YzsUPtCtblVRIqj97xYrG1xVzenjeYmpZa+4PI1E9DpGWY0UTrKvAd+0z0=
X-Received: by 2002:a17:902:b715:b0:294:e585:1f39 with SMTP id
 d9443c01a7336-29841595fc8mr4192095ad.14.1762878190750; Tue, 11 Nov 2025
 08:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111154923.978181-1-petr.pavlu@suse.com>
In-Reply-To: <20251111154923.978181-1-petr.pavlu@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 11 Nov 2025 08:22:34 -0800
X-Gm-Features: AWmQ_bkt--52MX6mbNFrxPL1Hwy8cf5iG1Co9zB8o3_9L6IQpFMw_TrpSWKzpZE
Message-ID: <CABCJKucEqEnXtV0TCqxq8_vcZtdcgRCz85jqjbckYq1xuJc9Tw@mail.gmail.com>
Subject: Re: [PATCH 0/2] module: Remove SHA-1 support for module signing
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Nov 11, 2025 at 7:49=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> SHA-1 is considered deprecated and insecure due to vulnerabilities that c=
an
> lead to hash collisions. Most distributions have already been using SHA-2
> for module signing because of this. The default was also changed last yea=
r
> from SHA-1 to SHA-512 in f3b93547b91a ("module: sign with sha512 instead =
of
> sha1 by default"). This was not reported to cause any issues. Therefore, =
it
> now seems to be a good time to remove SHA-1 support for module signing.
>
> Looking at the configs of several distributions [1], it seems only Androi=
d
> still uses SHA-1 for module signing.
>
> @Sami, it this correct and is there a specific reason for using SHA-1?

It looks like GKI just uses the defaults here. Overall, Android
doesn't rely on module signing for security, it's only used to
differentiate between module types. Dropping SHA-1 support sounds like
a good idea to me.

> Note: The second patch has a minor conflict with the sign-file update in =
the
> series "lib/crypto: Add ML-DSA signing" [2].
>
> [1] https://oracle.github.io/kconfigs/?config=3DUTS_RELEASE&config=3DMODU=
LE_SIG_SHA1&version=3Dbe8f5f6abf0b0979be20ee8d9afa2a49a13500b8
> [2] https://lore.kernel.org/linux-crypto/61637.1762509938@warthog.procyon=
.org.uk/
>
> Petr Pavlu (2):
>   module: Remove SHA-1 support for module signing
>   sign-file: Remove support for signing with PKCS#7
>
>  kernel/module/Kconfig |  5 ----
>  scripts/sign-file.c   | 66 ++-----------------------------------------
>  2 files changed, 3 insertions(+), 68 deletions(-)

For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

