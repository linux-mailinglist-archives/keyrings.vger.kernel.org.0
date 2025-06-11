Return-Path: <keyrings+bounces-2817-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC558AD5B32
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 17:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC133A7B14
	for <lists+keyrings@lfdr.de>; Wed, 11 Jun 2025 15:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104B1F0985;
	Wed, 11 Jun 2025 15:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VoQZRUnc"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5781EBA19
	for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657265; cv=none; b=hHLet4YKP1a3AEtNQWwLQOFJg0Rvwymyl5PvxxEa/ntAsJl91wUJR4IzORFLAyR8xhurQNAngb4BIOUNuxkrC5nQjLt0qbQUCnJzMtPtgi7pq00v4cQkCee3B/Px26jlrjWx3XpUMWQM7MTePq8TDxe8q3zRTmEs88QNAAa2gU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657265; c=relaxed/simple;
	bh=MNJifaaW2DKC7Ep+EbGEsZeWuZtW79t5zkE61iueUzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bW5J0vveShpz8XyFbeKuq3p83af2Il0MX2/tAX3taRbISaqlAI8XvNvAn9ufkT0c2ldXSjx36vIwAsb4itjmMsSGMfewwPxMrMRF5oeejeTHuorYFi69psDmB85ASC9h0g6/Ylkvdi+U5L7avuxGHgha+F87tSilEIbW7lzCL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VoQZRUnc; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e1d8c2dc2so64991547b3.3
        for <keyrings@vger.kernel.org>; Wed, 11 Jun 2025 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749657261; x=1750262061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBhZQu6BqagB3PC5bDYHjkHrfQ+2AWYQFfsjZus8X6I=;
        b=VoQZRUncykxaGZ7NsMVcqtrTcp5nmfGaQziEJb32XqsWTZI6DGMxeVHR1blITt+Qqs
         F4ZIMuJCaM4dIVkrt1JLT6ircWVM4EmwCb32sw80IEIvBznEZ+gNvVax6xGMEsXWgvEB
         e5AHBdIrSwkRtkYcnPm514FFcCfdtbf3xCt0N4er71YLh31wmQS3O8FPjGaM5JI2c/nA
         fIwMS2I5G6xhiEDD/vAZtQKVLzpB0v1l7d0cHEWOMvqaMKYd2Wp+f8F8pPZYKTdolany
         NmSD6Pf7L8yUSJhryERsnSG/SXuFJ6HeKKqIgpj1Rt0a2/R9t/igWvnflEDMXU8BvDcW
         BClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657261; x=1750262061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBhZQu6BqagB3PC5bDYHjkHrfQ+2AWYQFfsjZus8X6I=;
        b=fkEBBtG1K9Kcta/AHH6DB442dQvAXoSKJ3v/IvG0cZY1brJ6ayLg1eJUI170igEVFN
         t/1nD7K8ZYGec+FpMOg9v1HSi8tWzC1IctNejGscmebxQ4ri9bsbDjqpXVpy8ewi3F9J
         u59AEFoamp9jw9xq3hBBDi2LKz/scFZpzS0/WAuHjjPHHvi8+S7rHNU7V2bUEDwS9ARu
         sv9JotgBaFkpxVS1FkPY1Pi0B+RPzGsVaWixwqPbuaVFMCNiBNPIhot4WTB/9qBOZVnI
         7ISsMNBty2VquDHfK8WAQ7Q7KorcEwZEnGm5Z9k3LCxsFJKoF1y2BPQWPmjwL0h0Nw+U
         G3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqFuB1d9eV5G+ztPwG5y+Sk9P5OSBjsmFy+cQ87q95AlaFnPDPxzUYhm9oP4jqTlXMI0oGIMj7xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygB2JHMA6SyYN17JwHIYJvQ7ERYbkemdLJQFAef2Wz04KidIsz
	7ozvf1NwtfkYEgHoSBpXNsxV/5WIIZIn2BS/2ArYMsXtEs67yBupv8G48OsORiQWmDvmDJ4yksm
	/G2bztG14qb/G1yD2wkKIKmludlvTsBPfs0q2xA2k
X-Gm-Gg: ASbGncuxWwa5tuFMvRiTKTOLyytWH415eMEfSeSgcAbT0KYerNke3r8ecP0s2rd0mCN
	mkifMQbrxC22f/iuvxQ0xvCva59bJ7ckbUSXN7wVSMD9HF5KJ5VfX2mFbZwdM/rTHHr/mA1lFAk
	O6s3VmPkaDomk182mfoxNTygwGHrus2K01zVzOUtU8lHk=
X-Google-Smtp-Source: AGHT+IEn+kC/BZ+RXwGYxRkP+XLD0tGlRkO0idFv9DQonG8a7gWIJr8vGNDUYR6rx6ZmmovcVVyDmS1thVUaW8UvqdA=
X-Received: by 2002:a05:690c:f8c:b0:70e:7663:8bb4 with SMTP id
 00721157ae682-71140adb8bamr52684357b3.25.1749657261129; Wed, 11 Jun 2025
 08:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
 <aElIgixaHGuHEnb8@gondor.apana.org.au>
In-Reply-To: <aElIgixaHGuHEnb8@gondor.apana.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 11 Jun 2025 11:54:10 -0400
X-Gm-Features: AX0GCFs9HQfkD829H3Li4br3UccO43H5X5WtKEy278IEIzt6bh6uwIsmTEf8mkI
Message-ID: <CAHC9VhT9k9+DWh14HEnv6V1T3=hDJFY-fOcE-nexPFv0jdL04g@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>, torvalds@linux-foundation.org, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 5:12=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
> On Tue, Jun 10, 2025 at 08:22:59PM -0400, Paul Moore wrote:
> >
> > It doesn't look like this has made its way to Linus.  David or Jarkko,
> > do one of you want to pick this up into a tree and send this to Linus
> > properly?
>
> I can pick it up for the next merge window.

Great, thanks Herbert.

--=20
paul-moore.com

