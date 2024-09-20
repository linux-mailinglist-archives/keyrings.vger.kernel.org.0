Return-Path: <keyrings+bounces-2108-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAAB97D4E8
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 13:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02C81C21196
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 11:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B2114389F;
	Fri, 20 Sep 2024 11:42:52 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DD20B20;
	Fri, 20 Sep 2024 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726832572; cv=none; b=ZQSHf00V1/EIPZs/LdSWi5NdWZoZdPvvoY2jmubALhl21jU8NWi1vvNTR+T5j0zQFSeC3IFqbAgNPVgPMg56QQr0qy1o5q7f/hnjfLR6yhVDwUmpppkyQZ4HW2wGMUr2B1NIU+iSwTIWSHL+7/fiGX0k5Vws2wob9JRU1fuPLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726832572; c=relaxed/simple;
	bh=EiUrBnnPPKo3+c08LehpmkVRBmIR2Vey6Rh8ikMEH0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fckr81ggwv2hYSmg9l2IiFiuphyJqAcE+bLT5bwe4g+jA7W2qWKPArnGFqqXuzM1BV2PQGHtZQ3psTyOi3kBk1nQduZJLdUFuf5v8RDZOmvJTIO+j7fOorGl9mxjXKzzfOSTJ4X1xtH6HShrSll1278b9nl67PM/f2rhFiNZrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso18491271fa.1;
        Fri, 20 Sep 2024 04:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726832567; x=1727437367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdsT5svVcvOhG90auQdmy7PS7pzw5L+P6+hRSDptKww=;
        b=W1cCwiGQKq6akhvyyZYm54BIbKr+PKp5aZQWwMC6Ljf8z5f6tMS6nMSZO2jEedqyWv
         w6XtYWpu+u2B/etTE3SJk+vcW0097Dk6FWo65pC6qt8HaVQhHbPQ6RpRJZLCViAJswwU
         QiCZNobUu7wx136VqJRE2Lr6dvU91fFFDbE7NUPfQUeZjurLYjVHQ61yKcbIRIbZQAhu
         o20h4yQBqixz5vqDrS5oI/7SMucS9gTE1CeE1gAhy2LirmeqxdaxW+fxbXke/RIWd2yY
         y0508V8JD8BoDSXEx0rmFd17V7vLjHjouxzYnmNFdsnAYjhO/LCbkcRZfZQfbpU29iUk
         A2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUF4q1ZcvRwX5Kap36pMMXgNnj5uRqEGwvjyg54FI6jGLkcs7jYs/B76i/A8vOABsy71ZPzpkBILA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSh/g0x3CyBqQtCgRg8t9BH+yyQ9WXdcJIMWauZd+ZTX/xmdWD
	BeFnOlEYZnorp3ZpHPOhgqmXyTLkdzYZyBBzpfP0jqcBeu2rylYPIUyaECsK
X-Google-Smtp-Source: AGHT+IEAB8MH+s+cPyGf14bPoRydyUJ9Rvr31bhySAjXmys51OeqSbYnWRaTk8FsAxgpXyrI/H0C+A==
X-Received: by 2002:ac2:4c41:0:b0:536:533c:c460 with SMTP id 2adb3069b0e04-536ac3401d2mr1481136e87.50.1726832566788;
        Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870ad17dsm2149940e87.241.2024.09.20.04.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso2318662e87.2;
        Fri, 20 Sep 2024 04:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqTIVmcuXDnzdJmP/3c0EiVsTn5oDDZ4t8LhWSLx/5XaW9UmgLuhO3QAOFBnT1Kus7ipPtzh33og==@vger.kernel.org
X-Received: by 2002:a05:6512:108f:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-536ac2f5ba6mr1546516e87.35.1726832565794; Fri, 20 Sep 2024
 04:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720728319.git.jstancek@redhat.com> <27899413.1r3eYUQgxm@skuld-framework>
In-Reply-To: <27899413.1r3eYUQgxm@skuld-framework>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 20 Sep 2024 07:42:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>
Message-ID: <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, David Howells <dhowells@redhat.com>, dwmw2@infradead.org, 
	zxu@redhat.com, keyrings@vger.kernel.org, Jan Stancek <jstancek@redhat.com>
Cc: linux-kernel@vger.kernel.org, Asahi Linux <asahi@lists.linux.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 4:27=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> > The ENGINE interface has its limitations and it has been superseded
> > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > Some distros have started removing it from header files.
> >
> > Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major=
 >=3D
> > 3.
> >
> > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> > openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert as P=
EM
> > and PKCS11 and comparing that the result is identical.
> >
> > Jan Stancek (3):
> >   sign-file,extract-cert: move common SSL helper functions to a header
> >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
> >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
> >
> >  MAINTAINERS          |   1 +
> >  certs/Makefile       |   2 +-
> >  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
> >  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
> >  scripts/ssl-common.h |  32 ++++++++++
> >  5 files changed, 178 insertions(+), 129 deletions(-)
> >  create mode 100644 scripts/ssl-common.h
>
> The code looks fairly reasonable to me and behaves as expected.
>
> I have been actively using this patch set for several weeks now across
> linux-6.9.y and now linux-6.10.y with good success.
>
> It is in use in production for Fedora Asahi Linux kernels with good succe=
ss.
> Thanks for the fixes. :)
>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
>

Jarkko, could you please consider submitting this for inclusion into
6.12? I've been carrying this for three Linux kernel rebases now
(6.9.y, 6.10.y, and now 6.11.y) and it seems to be just fine, and
without it, I cannot build kernels anymore with the OpenSSL engine API
disabled in Fedora and CentOS/RHEL. I also expect that the engine API
will disappear on other platforms in the near future given its
deprecated status and recently accelerated conversion of engine
backends to the newer provider API.

Thanks in advance! :)


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

