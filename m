Return-Path: <keyrings+bounces-2059-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552B9794F5
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 09:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 056E128478F
	for <lists+keyrings@lfdr.de>; Sun, 15 Sep 2024 07:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EDE208A0;
	Sun, 15 Sep 2024 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g7MfO1ZT"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543B1B59A
	for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 07:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726384287; cv=none; b=qtmYVeddCD99Bp+kXT8ABthYPEeS427M0eok5Ndw6E3M74Yv00SSXQIsFSM++AeIvex8jQe+SmjsSN/j2aN5dwCeKn8fRew1ZqoJ6dZpYViPcFOlc+RgC5FfZzdHarG1WxCxErq1rXxeCCvaMiyap2hNtmMO7oV1GbTk2C7hEks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726384287; c=relaxed/simple;
	bh=xjWojUc1mLB5ktKYpFXYU5sO8vFqeC4TxRTtvNAcNTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOt2XmaLd+bUPT4lH4h+d9IjJ+299zhUK4sLltaOdXJ5tkKc7efB8/p8Vl8vwVR9+g1wJYbaWLtZQQtxlK6HY0o+MLp6HfS+S4LDOqCHW57dkFuVrgCQ3V/9z4SjlIP8BoZRlKjUAh1SLtnHUuMwT5vvxGIQziwMYEXCEYVft9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g7MfO1ZT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d13b83511so413840766b.2
        for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726384284; x=1726989084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc55qxpiIVFj7PWD1KIvBrEfXf3cIQSNj9lFEjAYl9E=;
        b=g7MfO1ZTCqtEcsI2uxXwQYB41trv/aYnxKEeu/ZUWPq9H1MbiarpVfCXhjRQ4/cdfr
         a70CAIBqKCYm/2/woaPgbGTv3FMv6GVEpbrAcXvkH/UWoTmjiF8xWaSWZYYtoxxy9IPj
         h0R1zuhcy2MZg3z2EFD1uLOkeOSKPEOtpIBa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726384284; x=1726989084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc55qxpiIVFj7PWD1KIvBrEfXf3cIQSNj9lFEjAYl9E=;
        b=VAlQLxiG3J8FCn/HIawsSoCI1FOfwtG+1v0mX2NB5rA0DX0BSyNh6++HsZyoKhYrTL
         Klowi2j5GkLOdGsE42Wbj0pWA9/umuvaE1etTferygXn5eDCWWLnSCdQ6PKhLdP5CA+o
         qMafK+B99jpE8Ay+mNSBbncmNgtOznpibg6S8rfifU2J9KnouPv/SiFtxV86OTBQvb7J
         wPDdRU9Ya24GOGk/+D/z23WZy0talPeb6AsGqOxwHjGL28w6WRFE7/pVmC4+p0NuUBMw
         OEahreJ9+zZMOzWh6WuivFuIm17SgM0tD2tJfVp1y4QjhGX41XB6ql6pmo/xKgaZWteP
         UunA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQnCnBJMplUbzQ9LGoj5Z0fh99qrqYT9EeimPo8AQmV4fo4rvFAa2+pIygXEshMAbOY/gfGD1iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+XJ+5gygcdw1rWQMl936DFbjLQO53tCwiu9PIccqgO3+X315
	n+N2JHegbGh96sFjqnnL50Rp7fjkeoa8peInFG+b2c35Pq8DCM2l1k1JNiAGjAbgE9V0+NIxcll
	YB5on4Q==
X-Google-Smtp-Source: AGHT+IHISp6V0i9xk8o8f+a6w4PoCKsZq0GS/ukilDK/8WCf5+19EvkaEGxcYGZxd1Zjk7cyZjuM9Q==
X-Received: by 2002:a17:907:d853:b0:a8d:5f69:c854 with SMTP id a640c23a62f3a-a902944e7a8mr1054950966b.24.1726384283494;
        Sun, 15 Sep 2024 00:11:23 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610968b9sm162703466b.5.2024.09.15.00.11.21
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 00:11:21 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so661170a12.2
        for <keyrings@vger.kernel.org>; Sun, 15 Sep 2024 00:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHVq1/CYBpfpZnV21jbfvLRk8qgEJZIO6GO3HEpVgJs++50ZxEK8s1xGhFnHakQxM1tD335wVJfA==@vger.kernel.org
X-Received: by 2002:a05:6402:5193:b0:5c2:7002:7cf8 with SMTP id
 4fb4d7f45d1cf-5c413e1f43bmr8669748a12.17.1726384281208; Sun, 15 Sep 2024
 00:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZuPDZL_EIoS60L1a@gondor.apana.org.au> <b4a3e55650a9e9f2302cf093e5cc8e739b4ac98f.camel@huaweicloud.com>
In-Reply-To: <b4a3e55650a9e9f2302cf093e5cc8e739b4ac98f.camel@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Sep 2024 09:11:04 +0200
X-Gmail-Original-Message-ID: <CAHk-=wiU24MGO7LZ1ZZYpQJr1+CSFG9VnB0Nyy4xZSSc_Zu0rg@mail.gmail.com>
Message-ID: <CAHk-=wiU24MGO7LZ1ZZYpQJr1+CSFG9VnB0Nyy4xZSSc_Zu0rg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] KEYS: Add support for PGP keys and signatures
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, dhowells@redhat.com, dwmw2@infradead.org, 
	davem@davemloft.net, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, zohar@linux.ibm.com, 
	linux-integrity@vger.kernel.org, roberto.sassu@huawei.com, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Sept 2024 at 10:30, Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> On Fri, 2024-09-13 at 12:45 +0800, Herbert Xu wrote:
> >
> > Does this address Linus's objections? If not then we cannot proceed.
>
> I hope to get an answer from him.

So honestly, just the series adding pgp key verification I have no
objection to. The use case where some firmware uses pgp to validate
allowed keys in EFI variables etc sounds like a "ok, then we need to
parse them".

The objections I had were against the whole "start doing policy in
kernel", with what sounded like actually parsing and unpacking rpm
contents and verifying them with a pgp key. *That* still sounds like a
disaster to me, and is the part that made me go "why isn't that done
in user space together with then generating the fsverifty
information"?

The argument that the kernel is the only part of the system you trust
is bogus. The kernel does nothing on its own (apart from device
enumeration etc of course), so if you have no trustworthy user space,
then you might as well just give up entirely. At a *minimum* you have
initrd, and that can then be the start of a chain of user space trust.

Parsing rpm files in the kernel really sounds horrendous. But that
doesn't mean that I hate *this* series that just adds pgp key handling
in case there are other valid uses for it.

But maybe I misunderstood the original suggestion from Roberto.

              Linus

