Return-Path: <keyrings+bounces-1982-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B7974639
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 01:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA842888A2
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 23:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47841AC423;
	Tue, 10 Sep 2024 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRGuoY6V"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5501AAE34
	for <keyrings@vger.kernel.org>; Tue, 10 Sep 2024 23:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726009544; cv=none; b=NadVhS9Vv34VRIEmTwuXcRO2CPSnbo1aaXbUfh46p0nUQDqr3+XdAGbdklVmTXMVqOdeZh+RZmYEoK3KY2IXUBEW+5w786FaO2g/hy13Yitvpc1+ev62hvI19bgo7zXDXrLtW6EgZLRTbDeK7GjFmtci+qYSRe/nAktEWDKBboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726009544; c=relaxed/simple;
	bh=xl9eYIT9ivuySXl2SQPVFb2BTIVvRUAmegAxUX7d4hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4fsxZl7VFY4EK/QA9Op2gNfaRbb8pY/+rDTtCeODoDpcJBEvmkb3+ylb25t+zZWGnrz8vm/E+GzlJR5+29uXWisRHeOQG6WCwY/COJncJTx759wjbxyKst2tMWzgmyNgkH5FTnTPC4plAQNr3WZE5nHayPlxhArCZ4d2zjH0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRGuoY6V; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c2460e885dso36773a12.0
        for <keyrings@vger.kernel.org>; Tue, 10 Sep 2024 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726009541; x=1726614341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGDNjxA8a/+7X5OLMsKVJ1MSV2s9K8DgSyu27kL3bTc=;
        b=IRGuoY6VHOHQSfwAFWu7X66vhJhmetPFYWTVp3tNwxV3nq4Ktru1Hq4n14FVsPqVUC
         SM85jexXfUSDcskTLqmHwT5Cln0z1n8+8tbKROWQWOWHooxQZh5Sg3hsL/chESkUHuZ5
         nYmnK960p8LJvn79evwids0L/quplkRE+DaaQPk2ueysOQCxQ81SdD4kvMohBMK8o7sV
         OV0okc/ljxDYyi+NRbB8gZBuwqBTt8fJkWnJhnNYuZpC03W7EhFKZBWO3cd/gpGnWyJ1
         hXMxcCcjXhMOk/moJT0NLIMvOoEJ5Z9sVeVZVeatT8229N4w10n5H7VXNc9kSy2X9o47
         pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726009541; x=1726614341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGDNjxA8a/+7X5OLMsKVJ1MSV2s9K8DgSyu27kL3bTc=;
        b=DCpQ+D/kArOFQh/cxbszJo8c/MdqZwN7YrxkW+B6bNttcKd/ak23rdQ5Vcfxa33xmS
         7FXwS11vJPTYTSguzqptEvNDOZMGb8wfuZdZIbDJ6Gwu0JKU+nD2FesHgD8l7M5nnLsF
         1UPtTdGPDhfMm7jMkV7/XMP3tHGsApwAeXNP9V6V3qaUsRen3XHdkVCm2LQot4kHo1Nl
         KDxOYKkyw2N4zQEI6QCVAr6etdLcbwY5TYWPyxR5Z7ZybtxWKjMWTJqHpmk5sOOZCBY2
         XG+XYC4teYeH3Irt3fhbax6fWn/Otx54LKBRgaoSvmTzM1gtk7UVNbQ/6Jp4Q6rUFIve
         pSzg==
X-Forwarded-Encrypted: i=1; AJvYcCXUpG0QqwbsBB+dKc/AbRD1+o3BDT7uacUDOcGohtTRo3mahH7fNvE+7eB4V7JH4I/B0GpXmd98Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRMvPQAM3wwUrGiV9KYUFsXZyDy48a/YMNbey2x7+2oC8CaON
	s81/8j3WEci+ehFTxxE9Cs7YVrJwjCdz4jOw69gH0zttufIuK+oKLrphNdnuIkcetvSTq3u2doe
	22GmUqyWkT+eEbkfkTAVQb2+93FnYjuSP2fMQ
X-Google-Smtp-Source: AGHT+IHi+pt6zImju/NyZ5JtEjJPlJdjWNiRZnmzpVbUhgzUBz1ExYC4BgzyceVyNtRPkeaqMAMV1q5yq7wvDn/CO+U=
X-Received: by 2002:a05:6402:278d:b0:58b:15e4:d786 with SMTP id
 4fb4d7f45d1cf-5c40dacefbamr74233a12.5.1726009540433; Tue, 10 Sep 2024
 16:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com> <47697d5f8d557113244b7c044251fe09@paul-moore.com>
In-Reply-To: <47697d5f8d557113244b7c044251fe09@paul-moore.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Sep 2024 01:05:04 +0200
Message-ID: <CAG48ez1GiPYROLukVwBQhDeFWzp8Xo9uUs-1B5X1YgqNw78dAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KEYS: use synchronous task work for changing
 parent credentials
To: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	John Johansen <john.johansen@canonical.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com, 
	keyrings@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 11:07=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Aug  5, 2024 Jann Horn <jannh@google.com> wrote:
> > -     cred->session_keyring =3D key_ref_to_ptr(keyring_r);
> > -     keyring_r =3D NULL;
> > -     init_task_work(newwork, key_change_session_keyring);
> > +     /* the parent mustn't be init and mustn't be a kernel thread */
> > +     if (is_global_init(parent) || (READ_ONCE(parent->flags) & PF_KTHR=
EAD) !=3D 0)
> > +             goto put_task;
>
> I think we need to explicitly set @ret if we are failing here, yes?

Ah, yes. Thanks.

