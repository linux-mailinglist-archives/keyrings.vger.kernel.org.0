Return-Path: <keyrings+bounces-3008-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B556FB59672
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 14:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C7BC4E5B0C
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 12:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C31730CDA3;
	Tue, 16 Sep 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="XruH2+Rb"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35EB30F926
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026632; cv=none; b=ukwqOMYWnP/bsP8y0/caaXXF/9Ee0MDE0HPNK8n9KO5J2mT/upjb15PrtCzh22br+/n4QjRGqZZwZaRQ3YnKiW9fPrDILVQaswopTg8QihkUWxB97DLl4u1Pyw0Xmtg/twONVybKB9ntyGJnY+iYpTiZwxXHBI4WuRz/ahf49UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026632; c=relaxed/simple;
	bh=NXgR5ZPhnfnceOosb48wNI/7BpZl1QpNbdgOtx1uztc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duJkmiv6RNs1per18tCFk3uxvQInleCiyiMP5/G4p8SW0fUKOMYvap8TR4oCd9TFXK94NE/2jQCNhFR/42wkj7+6KnElt6Ehrp4ko4rtNtPmokt4GbjPrlFnz8p8nXwSXXvrfFqJ/CfPwTLhE5tAWcMB7LOrsvaX7QFsJnONHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=XruH2+Rb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-336b908cbaaso47504721fa.1
        for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758026629; x=1758631429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfVcFdK/dyRVIqU9Pnfj2+UoE4HOEhk3s9CeE+Uc/LQ=;
        b=XruH2+Rb6o66LGWIyjxaXymPZem4XloSfBrGLeFeX58loZElMgsoo78f88qsnQHBJk
         eKWPvQLxsYcS43I8mwduzu3IYV4b9XSF4rFSVeZCXHUkFuihk63qqFHlGbY8DJhccibM
         TEUh1hupIrvy4tdyYL5LvOYtD/1k9Su/i7vonrMF5mJS97jMsMzbfc6HweWzRnGzenuo
         zvZembe2mwt5GSmM9KRGLKmbPD8m4tZp/AFiuPNWFB2bAL4qUDofoLQdu62p5dsWfjTA
         rK3/m8dKeIM3oXWYa4eKSxGVZjzGnnDw9TeIpNiRBbkkHxpxWaDnWQiS1YIM2JUGnmf/
         TKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758026629; x=1758631429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfVcFdK/dyRVIqU9Pnfj2+UoE4HOEhk3s9CeE+Uc/LQ=;
        b=jz/cSsvwTDnkjr7yUpjmvPxZ/Vzr9ZQaeXhjLBB5gqbmgGyzdeDs1rGVdg962pJrXe
         8OCfq/iR8AKPfSNNiK8U2h6d/KYWclNAvlnEsBg2bb+JQ5gpgi9fdT9wWnZQqwnXzsw1
         Z9sreKqbg2RL+4nktblbmqeb1NvJhELx1wU8Q+U4hZxhdhKh6Pw/EEjiHn0nt2bcIRRo
         ask//AcvSQKtn7NUdsM8MVO1yWYb7x0YTDNcA+t/yH8WHfxHGJQQgMcEH30lpopHj+LO
         zNe8HxiqhOlAvqIpOteY9gHJqHuQLM5j7igYCGiXimByRJ7bG61wSaNddmtpQP13+Bti
         YUAw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMrXGW2Jk7xqjobwkET9IxxYltf3VrstpyQtT8t1IC740m4B/e5KZJ3BxP2+wMweo4CunhgSxvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypxl0yW+TYx11+CM2tezX8ZCiXKTUPsNv+SMfMZIO+fDrePeY/
	BPxcc6UkYgFjweL9lmOBFVHoawGmSfEdsZ4nMUqU3v38DvkMBXqZzbttJYW6NlP2G/a7LIniTf3
	K49gF2RBgrEa2FVQ5ewt3GSQI8KyMBDN7PnvwQ6uIUw==
X-Gm-Gg: ASbGncvI+qogTxQgIco5TmfrQKY7ZriYiyvfkLh2C8gyAcInfCDqksKbEszRI5EZmG+
	c7V0Cr0hy7rL10f52TfGCiYnvCogZpnDzDGFUJMnW794lHehax7TOjboW270fcv3BnICVfr8K5a
	HQQQFJxKPOoPNmEDEpN8w2CR/hB8C3+ip7eDWsjnb6ylP7Z9ozdbDUmvezCkZV7ztQSj+3VpCP4
	hSLQ/IfQx/5US5H9fRq1yA=
X-Google-Smtp-Source: AGHT+IGoEG729EZ98uT15jfYeUxBoyXcOBGm1q2HW2T98A/cw0sE6YyQqR9tmeM5iw7Ya8uYO31c0u76ygtMQBZsplY=
X-Received: by 2002:a05:651c:2450:20b0:336:aeeb:7c38 with SMTP id
 38308e7fff4ca-351401fdb1fmr42040211fa.32.1758026628929; Tue, 16 Sep 2025
 05:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark> <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
 <aMjjPV21x2M_Joi1@gondor.apana.org.au> <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
 <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com>
 <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com> <CALrw=nGHDW=FZcVG94GuuX9AOBC-N5OC2aXiybfAro6E8VNzPQ@mail.gmail.com>
 <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
In-Reply-To: <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 16 Sep 2025 13:43:36 +0100
X-Gm-Features: AS18NWCeXpAzjLPWBzb9lyDRexFUOghSKbSS3LStX5IKgTCvRJ03ALVD9z4aZzU
Message-ID: <CALrw=nFSsFYtz0vo7fGyBFCZ+HGHPGSVvoDECiSWfSVbPz4OeA@mail.gmail.com>
Subject: Re: [V1 0/4] User API for KPP
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 1:33=E2=80=AFPM Rodolfo Giometti <giometti@enneenne=
.com> wrote:
>
> On 16/09/25 13:56, Ignat Korchagin wrote:
> > On Tue, Sep 16, 2025 at 12:21=E2=80=AFPM Rodolfo Giometti <giometti@enn=
eenne.com> wrote:
> >>
> >> On 16/09/25 12:21, Ignat Korchagin wrote:
> >>> On Tue, Sep 16, 2025 at 9:22=E2=80=AFAM Rodolfo Giometti <giometti@en=
neenne.com> wrote:
> >>>>
> >>>> On 16/09/25 06:10, Herbert Xu wrote:
> >>>>> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
> >>>>>>
> >>>>>> The main purpose of using this implementation is to be able to use=
 the
> >>>>>> kernel's trusted keys as private keys. Trusted keys are protected =
by a TPM
> >>>>>> or other hardware device, and being able to generate private keys =
that can
> >>>>>> only be (de)encapsulated within them is (IMHO) a very useful and s=
ecure
> >>>>>> mechanism for storing a private key.
> >>>>>
> >>>>> If the issue is key management then you should be working with
> >>>>> David Howell on creating an interface that sits on top of the
> >>>>> keyring subsystem.
> >>>>>
> >>>>> The Crypto API doesn't care about keys.
> >>>>
> >>>> No, the problem concerns the use of the Linux keyring (specifically,=
 trusted
> >>>> keys and other hardware-managed keys) with cryptographic algorithms.
> >>>>
> >>>>    From a security standpoint, AF_ALG and keyctl's trusted keys are =
a perfect
> >>>> match to manage secure encryption and decryption, so why not do the =
same with
> >>>> KPP operations (or other cryptographic operations)?
> >>>
> >>> I generally find the AF_ALG API ugly to use, but I can see the use
> >>> case for symmetric algorithms, where one needs to encrypt/decrypt a
> >>> large stream in chunks. For asymmetric operations, like signing and
> >>> KPP it doesn't make much sense to go through the socket API. In fact
> >>> we already have an established interface through keyctl(2).
> >>
> >> I see, but if we consider shared secret support, for example, keyctl d=
oesn't
> >> support ECDH, while AF_ALG allows you to choose whether to use DH or E=
CDH.
> >
> > But this is exactly the point: unlike symmetric algorithms, where you
> > can just use any blob with any algorithm, you can't use an RSA key for
> > ECDH for example. That is, you cannot arbitrarily select an algorithm
> > for any key and the algorithm is a property attached to the key
> > itself. So if you "cast" a blob to an EC key, you would need to select
> > the algorithm at cast time and the implementation should validate if
> > the blob actually represents a valid EC key (with all the proper
> > checks, like if the key is an a big in and is less than the order
> > group etc).
>
> I understand your point; however, I believe that allowing the AF_ALG deve=
loper
> to use a generic data blob (of the appropriate size, of course) as a key =
is more
> versatile and allows for easier implementation of future extensions.
>
> > With AF_ALG you would need to do this validation for every
> > crypto operation, which is not very efficient at the very least.
>
> I think this might be acceptable if we consider the security we gain comp=
ared to
> using any existing user-space implementation!

I don't think the alternative approach I proposed compromises on
security. That is it has the same security level (using a trusted key
to do ECDH without exposing it to userspace). Unless I'm missing
something?

> >> Furthermore, AF_ALG allows us to choose which driver actually performs=
 the
> >> encryption operation!
> >
> > This is indeed a limitation of the current keyctl interface, but again
> > - we probably should not select the algorithm here, but we should
> > consider extending it so the user can specify a particular crypto
> > driver/implementation.
>
> Furthermore, I think one solution isn't mutually exclusive. So, why not g=
ive the
> developer the freedom to choose which interface to use? ;)
>
> Furthermore, there's nothing stopping us from strengthening the current A=
F_ALG
> support so that it can also be used well with asymmetric keys.
>
> >> In my opinion, keyctl is excellent for managing key generation and acc=
ess, but
> >> using AF_ALG for using them isn't entirely wrong even in the case of a=
symmetric
> >> keys and, in my opinion, is much more versatile.
> >>
> >>> Now, in my opinion, the fundamental problem here is that we want to
> >>> use trusted keys as asymmetric keys, where currently they are just
> >>> binary blobs from a kernel perspective (so suitable only for symmetri=
c
> >>> use). So instead of the AF_ALG extension we need a way to "cast" a
> >>> trusted key to an asymmetric key and once it is "cast" (or type
> >>> changed somehow) - we can use the established keyring interfaces both
> >>> for signatures and KPP.
> >>
> >> IMHO the fact that trusted keys are binary blobs is perfect for use wi=
th AF_ALG,
> >> where we can specify different algorithms to operate on. :)
> >>
> >> Ciao,
> >>
> >> Rodolfo
> >>
> >> --
> >> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
> >> Linux Device Driver                          giometti@linux.it
> >> Embedded Systems                     phone:  +39 349 2432127
> >> UNIX programming
>
>
> --
> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
> Linux Device Driver                          giometti@linux.it
> Embedded Systems                     phone:  +39 349 2432127
> UNIX programming

