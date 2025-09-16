Return-Path: <keyrings+bounces-3006-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0716B595A2
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 13:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81F04E508D
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 11:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28AD30C37E;
	Tue, 16 Sep 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="BkDU+Wx0"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076D13D638
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023783; cv=none; b=dWbW7OQHa6vKQ4u7zNC1T+YqeS9tNzIbVotYiVNLeSJUHVEacwftSPEw8cMC7rUC7AGDZVuQ/Qc2timpCxpVuLPRIJhnMKQj/ivjn+fNusSk4i/jzEQRS+LiiLxr6NWBAYnRRwbT/jquI40U4Bez3OkWaZ7LUA+iL63Lb40AXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023783; c=relaxed/simple;
	bh=d/HCKLiLTFUfU2Tu5U0IGixHlZ89/CY18NgoU2X4C6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkyl4ffdEiTP1tZkZICt/KlrsBQbucFEikDbPJQMJMgSkDi3/v4ZHqPof3HADaWzq8ofOas6mr7un4Bq+tqwk2U1sa2ebKf7WjPyyWd0p0gBBhOx0TtIbQfOVwk/FNa0uM7xnRu7O8koCM7JbPC8pWjPCuLjskanq4RMmQiXZa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=BkDU+Wx0; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-351c164936eso39562351fa.0
        for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 04:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758023780; x=1758628580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6rt10mul3EQttwRTQeGYrQf5uqA9rRPNVzaZ7mnpLA=;
        b=BkDU+Wx0Qczmb0NDDC3r19/5HAd2rSrkvVGisn4iYaw1RFpcYVOd5XzFJTZOd2zmVW
         TTNBiNyb7KgMny2XobQ0DX1ZwpP0lR+Y7TgM+okdSDIZ4XYYPwEiQGLe6/zf6wxPlVqM
         uq37bDCmwNiXfilMtMJW1/mLk++dyegojcbKO0/kIH2RNFWAx5u3zgVJya4JWgeLhAy+
         DfCALuZ7gaFlu45H131Kc+K3Ts3xobXxXva4pbE4T9BwWHsenX+lfNrlHnYkXrjvRXSv
         YKSw8FH35i9/Kf89kWLro6Z622l8FeV0UpsR1QXOOMc9IbPa3hLQ7bPIsnLYG9cGejm1
         OF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758023780; x=1758628580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6rt10mul3EQttwRTQeGYrQf5uqA9rRPNVzaZ7mnpLA=;
        b=lS18nhCUUcy8hrk8dyWRQhxq0jw44o4n5zo0NgmhdjtYayuHj9rQ8fHsGobG1eY/Ai
         RYN01yf/xJhHkmYMFro4lTt4+QwgHWhz6V6619NVLQSFHKSSm+QPuD3er9XBkgaYZ5Ac
         53gOlI+Tzsfx7acm2FCsfc49mmi9M9wzuabvtfBoMwIYVVDo1PoXEnOfQPUf39fs1QVc
         j/pwVpG+CX+MyK7rb0le+Ifa+lShquZxcVSAdJdjSYpsbGZ8WX79G2V/wZa06zMCyzlv
         JN7x3W5QqbFKThaJGsitDzswkX9V21nWMng30q9OW1CNjPuK65ODwBcLe5NmMKf51UIR
         4OXA==
X-Forwarded-Encrypted: i=1; AJvYcCURIxNKtFPqgP024nq44xubMjK2s3rpQRh/tkY0623bhs+6VJT2PdDRmDVuruLzRkpIoyn+76zncA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdkcK7mVGyMLIYJhAW8npmBOFVLAzYQOFXEQWnZen9Wi6KvKMg
	Y/LEIwNcK+Re8z3G1z4wlbCWus1BKa35cBohbBaSvIcq8QWAQt7CeMmh1zrTrfnmer/aZsAqtB0
	jDom/rq/l65nH9ePL7EgrZyQR4aG4CHBI8aZCG76/0g==
X-Gm-Gg: ASbGncvbvlAVLwitoFkIyzmmuM0tp6Lu7tIyBK/piXZwF+jqDQh9recA3463/uyoyf3
	vALH8df9c3DmVP5dxASggfOo4af0R1COgw63UptoRqibSclAUDLlSeZ08Za8HExWJDIc7UGvCaF
	GvrdsafrXbgv2Fs8HBRZfNnVok8unZAGvPdXaZbnRUJN/EAdvU2eWn5fH2Jim8z18B7/CoFqLx1
	KQBzeOciiBPNunoy7gC8Xi5pWw12BiFTQ==
X-Google-Smtp-Source: AGHT+IGZHIJms1PdfdobCF0PHag54tV/vQ2luqF5yML0HzIEjgy410kiDpDIgcy5Oo7sjnurHziZpkbkNojCCCse7cA=
X-Received: by 2002:a2e:a993:0:b0:337:e4a0:ccf9 with SMTP id
 38308e7fff4ca-3513969d23amr50439561fa.6.1758023779695; Tue, 16 Sep 2025
 04:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark> <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
 <aMjjPV21x2M_Joi1@gondor.apana.org.au> <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
 <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com> <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com>
In-Reply-To: <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 16 Sep 2025 12:56:08 +0100
X-Gm-Features: AS18NWBsAGjsbtFBKx49_gD23Voi-xBG3_uoA627mbeoTytoWiD_LmneZ3QclxI
Message-ID: <CALrw=nGHDW=FZcVG94GuuX9AOBC-N5OC2aXiybfAro6E8VNzPQ@mail.gmail.com>
Subject: Re: [V1 0/4] User API for KPP
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 12:21=E2=80=AFPM Rodolfo Giometti <giometti@enneenn=
e.com> wrote:
>
> On 16/09/25 12:21, Ignat Korchagin wrote:
> > On Tue, Sep 16, 2025 at 9:22=E2=80=AFAM Rodolfo Giometti <giometti@enne=
enne.com> wrote:
> >>
> >> On 16/09/25 06:10, Herbert Xu wrote:
> >>> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
> >>>>
> >>>> The main purpose of using this implementation is to be able to use t=
he
> >>>> kernel's trusted keys as private keys. Trusted keys are protected by=
 a TPM
> >>>> or other hardware device, and being able to generate private keys th=
at can
> >>>> only be (de)encapsulated within them is (IMHO) a very useful and sec=
ure
> >>>> mechanism for storing a private key.
> >>>
> >>> If the issue is key management then you should be working with
> >>> David Howell on creating an interface that sits on top of the
> >>> keyring subsystem.
> >>>
> >>> The Crypto API doesn't care about keys.
> >>
> >> No, the problem concerns the use of the Linux keyring (specifically, t=
rusted
> >> keys and other hardware-managed keys) with cryptographic algorithms.
> >>
> >>   From a security standpoint, AF_ALG and keyctl's trusted keys are a p=
erfect
> >> match to manage secure encryption and decryption, so why not do the sa=
me with
> >> KPP operations (or other cryptographic operations)?
> >
> > I generally find the AF_ALG API ugly to use, but I can see the use
> > case for symmetric algorithms, where one needs to encrypt/decrypt a
> > large stream in chunks. For asymmetric operations, like signing and
> > KPP it doesn't make much sense to go through the socket API. In fact
> > we already have an established interface through keyctl(2).
>
> I see, but if we consider shared secret support, for example, keyctl does=
n't
> support ECDH, while AF_ALG allows you to choose whether to use DH or ECDH=
.

But this is exactly the point: unlike symmetric algorithms, where you
can just use any blob with any algorithm, you can't use an RSA key for
ECDH for example. That is, you cannot arbitrarily select an algorithm
for any key and the algorithm is a property attached to the key
itself. So if you "cast" a blob to an EC key, you would need to select
the algorithm at cast time and the implementation should validate if
the blob actually represents a valid EC key (with all the proper
checks, like if the key is an a big in and is less than the order
group etc). With AF_ALG you would need to do this validation for every
crypto operation, which is not very efficient at the very least.

> Furthermore, AF_ALG allows us to choose which driver actually performs th=
e
> encryption operation!

This is indeed a limitation of the current keyctl interface, but again
- we probably should not select the algorithm here, but we should
consider extending it so the user can specify a particular crypto
driver/implementation.

> In my opinion, keyctl is excellent for managing key generation and access=
, but
> using AF_ALG for using them isn't entirely wrong even in the case of asym=
metric
> keys and, in my opinion, is much more versatile.
>
> > Now, in my opinion, the fundamental problem here is that we want to
> > use trusted keys as asymmetric keys, where currently they are just
> > binary blobs from a kernel perspective (so suitable only for symmetric
> > use). So instead of the AF_ALG extension we need a way to "cast" a
> > trusted key to an asymmetric key and once it is "cast" (or type
> > changed somehow) - we can use the established keyring interfaces both
> > for signatures and KPP.
>
> IMHO the fact that trusted keys are binary blobs is perfect for use with =
AF_ALG,
> where we can specify different algorithms to operate on. :)
>
> Ciao,
>
> Rodolfo
>
> --
> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
> Linux Device Driver                          giometti@linux.it
> Embedded Systems                     phone:  +39 349 2432127
> UNIX programming

