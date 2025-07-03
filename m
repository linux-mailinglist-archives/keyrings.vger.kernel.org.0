Return-Path: <keyrings+bounces-2903-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C115FAF75C2
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 15:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD0F81C8356F
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B645D199938;
	Thu,  3 Jul 2025 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DGRdDBvF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766118D649
	for <keyrings@vger.kernel.org>; Thu,  3 Jul 2025 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549653; cv=none; b=bkQ1vCOo9qyG2IOFr5NClx+p8oCWTnAjxwBZuJ7uS7tdp/JYOw/i8Kms+7TgbJnJm0H2N+RN+KbPZ3Wnt/IQRSprwPTsfP+yoVz6mUFwsXAMGF+SVRbzUJhWeY1nt1TA6vv8xVXfXkyTMLQVxmZHFa8mgwIYpYAIRPAh6BHaOII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549653; c=relaxed/simple;
	bh=c1PJ1Un9oNgg0AOq+9JVmkeC3QT75Zi2xmOGMC16Joo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAE4prn29dDQiSeVtnPUEhXAIEQbtMJbvSE49fBQTJPextcwUK1DupbO/635xQP09FzOWfZIF2CxjCZwjW5J+RuZknkQnofCTqb4/eLyt+X74WucvGIgu7WJtoZMkHR9rFUiwjdcfPcZsEsPY9/dNr4r0mu2xxUb+3h78LoLDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DGRdDBvF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so1099934e87.1
        for <keyrings@vger.kernel.org>; Thu, 03 Jul 2025 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751549650; x=1752154450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=DGRdDBvFRyQJUh4xBQJD4zRJTxtKWKqN2D/mFZ1EkOLAp73RwLxGJ67cctp8rHFv4C
         uy/cwd37L4dGMt43d86jQO8QnTLS9aoVrY0dePJyw9o6Y3r09I1JHvQCWrF1vkiBKN/p
         DNZZe1avldchksgz4GCGDSKQJCYrwEiiJrfM7XhaTBQP1A14WLUqIKPLNQAPz9lYioSM
         zvIfAOp6RMJMvTD7+A6DfYhjYF0udgSV++uFKJBtLDiG1zn2F3aK7Kk+RkNkVS5QPhQt
         UY8XIEjR6htlxua9Q903e2OVx2Rs3W2SykfCvQXDsfRjJoWADeonDBR4S2IhCnMDdZ56
         sIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549650; x=1752154450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=vaC7NDDK+UDF5zddzDxHJSP+XNs/TEwMk4R2Zd8DmAxs14Ls1V4Rd2tIKUj6ORGyyZ
         dfNF6PwBCi4jWiSJTg6s8BXw8BxNc1mIfRYsuz5uUfbfbyRb9YQBL+4c0lKd4jLCxRyw
         uKH4I4Cpr2xNbE7hbw7Z//XVVBEhVJsR0Vg/B6c4C31KXybzwNa4I6VXh3/m0aH3Z+pl
         UrHt7PWAlnMt7McS0J79wk5tduFo9kX+yVK9CBXSIi21IfGrkns6SYcWa8Ewl7fVypr7
         3Rda56ApXA+otVPUvu42gYT41AKTgjyvAmABBOx75bzbwC6y25gWSorxnmGBvvwt0XGu
         4ZYg==
X-Forwarded-Encrypted: i=1; AJvYcCVVLmSEhxDW+Ww/Rl1qyn7OELkAo9ha4r9kg7LXz04x7XcltftJYfbK+54X/RevRcwzj2zn/Gj+vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81b3BmIxXFy1T4yIdqKBTvHfjfP0z6ewi90igecPaQNlY7kc6
	E/+A5PyNodPHEt6BQP4KLMpD/C6drs+l2oTd9OXxSlZo73T07ozFJpf6RzQX8KCt8tF5txII5sD
	pZwJPEJhDGeSQrOZhkYxwc6Yqq2kwmuddqSqx7MmS3A==
X-Gm-Gg: ASbGnct861kLZMvjww8h3mS6GnRt+ODRcG2lB66YswvOSfFckD+hSmaev/fcjyh1Cze
	uQlliJHwC4oVd64mlRjjliOmUOdMN3UIs1BrmlI9i8gJP6SOB3OUz1gQGp39WZhXjW6/asIoSsr
	Oa0NYEY9QGvGcdQGhU7S2l2ToHDcTRc8QlsbfwoL3rxWVrgaEWjhjMBN3K/v5nVQ==
X-Google-Smtp-Source: AGHT+IHNv43yQ0XMxXTp2ef+SSEuzoS8acT42g8yBYYlV1yP4CPRR+Oir1K05oVETjo++6ub9AQKMpxraY8UgbEsyWU=
X-Received: by 2002:a05:6512:e92:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-556309cd03fmr914034e87.9.1751549649417; Thu, 03 Jul 2025
 06:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630133934.766646-1-gubowen5@huawei.com> <aGaCTOJ30KNPOBIC@zx2c4.com>
 <aGaFsaUOuNd1xs8m@zx2c4.com>
In-Reply-To: <aGaFsaUOuNd1xs8m@zx2c4.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Thu, 3 Jul 2025 15:33:57 +0200
X-Gm-Features: Ac12FXx7Ayr31pcyKig9jqDUM_fXmneqv04K2EzIf0SOYCgCBbMMEX50kGxvYN0
Message-ID: <CALrw=nG8KaoWTvwvnhyqogMXv7+dre6_hMCZBkegFmktefNw8A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Gu Bowen <gubowen5@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lukas Wunner <lukas@wunner.de>, "David S . Miller" <davem@davemloft.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>, 
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:29=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>
> On Thu, Jul 03, 2025 at 03:14:52PM +0200, Jason A. Donenfeld wrote:
> > Hi,
> >
> > On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> > > To reintroduce the sm2 algorithm, the patch set did the following:
> > >  - Reintroduce the mpi library based on libgcrypt.
> > >  - Reintroduce ec implementation to MPI library.
> > >  - Rework sm2 algorithm.
> > >  - Support verification of X.509 certificates.
> > >
> > > Gu Bowen (4):
> > >   Revert "Revert "lib/mpi: Extend the MPI library""
> > >   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library=
""
> > >   crypto/sm2: Rework sm2 alg with sig_alg backend
> > >   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> >
> > I am less than enthusiastic about this. Firstly, I'm kind of biased
> > against the whole "national flag algorithms" thing. But I don't know ho=
w
> > much weight that argument will have here. More importantly, however,
> > implementing this atop MPI sounds very bad. The more MPI we can get rid
> > of, the better.
> >
> > Is MPI constant time? Usually the good way to implement EC algorithms
> > like this is to very carefully work out constant time (and fast!) field
> > arithmetic routines, verify their correctness, and then implement your
> > ECC atop that. At this point, there's *lots* of work out there on doing
> > fast verified ECC and a bunch of different frameworks for producing goo=
d
> > implementations. There are also other implementations out there you
> > could look at that people have presumably studied a lot. This is old
> > news. (In 3 minutes of scrolling around, I noticed that
> > count_leading_zeros() on a value is used as a loop index, for example.
> > Maybe fine, maybe not, I dunno; this stuff requires analysis.)
> >
> > On the other hand, maybe you don't care because you only implement
> > verification, not signing, so all info is public? If so, the fact that
> > you don't care about CT should probably be made pretty visible. But
> > either way, you should still be concerned with having an actually good =
&
> > correct implementation of which you feel strongly about the correctness=
.
> >
> > Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> > implementation, and support for weierstrauss, montgomery, and edwards,
> > and... surely you don't need all of this for SM-2. Why add all this
> > unused code? Presumably because you don't really understand or "own" al=
l
> > of the code that you're proposing to add. And that gives me a lot of
> > hesitation, because somebody is going to have to maintain this, and if
> > the person sending patches with it isn't fully on top of it, we're not
> > off to a good start.
> >
> > Lastly, just to nip in the bud the argument, "but weierstrauss is all
> > the same, so why not just have one library to do all possible
> > weierstrauss curves?" -- the fact that this series reintroduces the
> > removed "generic EC library" indicates there's actually not another use=
r
> > of it, even before we get into questions of whether it's a good idea.
>
> I went looking for reference implementations and came across this
> "GmSSL" project and located:
>
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_sign.c#L271
> which uses some routines from
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_z256.c
>
> I have no idea what the deal actually is here -- is this any good? has
> anybody looked at it? is it a random github? -- but it certainly
> _resembles_ something more comfortable than the MPI code. Who knows, it
> could be terrible, but you get the idea.

One thing to keep in mind with this project (and other projects) is
license compatibility with GPLv2 (I don't think the above project is
compatible)

>
> Jason

