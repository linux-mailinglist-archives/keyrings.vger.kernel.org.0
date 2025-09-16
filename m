Return-Path: <keyrings+bounces-3004-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0DB5935B
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 12:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD3C4E1354
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B22303C87;
	Tue, 16 Sep 2025 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="NeIIJPvd"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E2225334B
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018094; cv=none; b=Zbjgk12J8l1NwanFk4kzVhTD5+9kmYLdtJBekmOJGHCmV5IZ+bEllCOCqJJmdnnP4UsNLLNEdFqpEx369n1eRVN+tcWobs5wbkcH/FvuwD67XM+y/nNbF6rJH3d60+1qkw439Z05yWGPcD2ykJYK+Djl9WglvTrxtRi4dtg1aQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018094; c=relaxed/simple;
	bh=+pHfAIinNV2odKqBFFjt35fFvhndrYbaBa5T8z2tI5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChPUKYJynnzICi7M4SpxDBhpKD+/JkCiLLSi2z6xC/h5krNmN7XpJjZ4oHe2toz5CaeG32umJ0Pyh47lIbhIIq0w14hKbZVzd1p7aNEBeb7q7/eyTiD/A7alBYkjHYwlhP+nhmMsjQeqR/zRd1FWKCHmqc4QU9ZyNoATfAj8L/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=NeIIJPvd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-560888dc903so6414735e87.2
        for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758018090; x=1758622890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re0vwBhFoYzxGBDIw019v96czr5mGdxB5qY8UUQnmFA=;
        b=NeIIJPvdRwBDzTNRbp5+M8urTZCthFRR/Lwqd/XQ9kRzI7bM2bEyq4NEhcaY+7vuZY
         nCqersycL14wCUpndQ1T0HSoJMJhWa/rMK8g438jAbQjCrNuPgx/omU+iaP4o90Hqks1
         tGUQORUyF6gRngUkxFnmufECBSAyO9K1i6DydvBKr7ru6vo4n9C0gMzxZrSjQk8lb+KD
         yjMEzS1Qy51R8Bc9ouYornlDaoaH7/SufVgDYg13gPAWKpOfAvV6hL93s6f4a37KEV1F
         8xZqfUTxvH/+7BLeVfb0EBnpl1UQtLZJ9wQ43CCA6Qf7p33924obgvDV5hSzYI+rri4Y
         rLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018090; x=1758622890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Re0vwBhFoYzxGBDIw019v96czr5mGdxB5qY8UUQnmFA=;
        b=kl4fRPOTyh/BHGFeOsPnK+PW4DnKBD9ARi+0SQTI0njEb4y6SvoCzeB+RUqEays+cN
         wmx4OMICeBXyt6GZuRaqX2l3oBhyIjaO9XdquButFQBiKidWmSGUwIjusKhw3yUHb0++
         nYdLbbKVna17GvXqYWbIxTdfIHXVl4CQE2AgNq3+vPgbIoGmGB/CTyAQMA8VcEtFuQ6d
         5TMpXDNm04ZDsxxAuwpSiLUA+B23JFnvguufRviKjaOOTLJpLaLeiZu5ovkdT4/MZYXV
         xVeaoh2BpJM8rC3mFIF90bN1uFF4c5SUd7gigJe/A/3W4qyawZZBmat6miGF2Jm0kNk/
         y8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV04+GTje9x73ms/BW8lJL8je4vYj42OASwDrBafr+x9e8+CxdFkOpzY+9C9jt+QwNt5g0QyXhF0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLz6gfKTQRgyk7VhKJKVlMpybqOkzx50AaR2WL/vA3D4WZlmW
	rgYDlW5MK7tVkXOYPjrR1XBdwScADIRngpXBam4KFiFgmFkwWHu1mbBw26y8Itvc03PGYTVnRCL
	bmZTxVPiw75P9wI0rYm2MwRsb+PgIZXePQ2BfeySKDw==
X-Gm-Gg: ASbGncu44hatVV7XyUqsRnZqFttBpLpgJeWOJ4edZJ4+QAUx1JkcUiIdwAkpK+eozWt
	rjYgc64u5im0+/wrzHeQLI4eRebhs7TNKwocceAUk/VrPyGUxxl2ozydcUvdiK2D42jfO0uRiV1
	TpGEoVlqde4Y3ODTU3aaVul4SU5lGxAPLqP0V1Z/SIpz8Lcnr5vUYV+dxgGHROCWcODNGDmIZfC
	iLnrlamgTaJPjw2WHWn3qQ=
X-Google-Smtp-Source: AGHT+IHx4EFlvcoVm7IMS1KvyL2kcDkAM0OviNxHR5HnisZyh1I5tiFqYMpL8ereFr3MwguOvUPsE04E9UaKNDFFdWE=
X-Received: by 2002:a05:6512:4381:b0:571:ed63:2efa with SMTP id
 2adb3069b0e04-571ed63315emr3282580e87.19.1758018090344; Tue, 16 Sep 2025
 03:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark> <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
 <aMjjPV21x2M_Joi1@gondor.apana.org.au> <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
In-Reply-To: <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 16 Sep 2025 11:21:19 +0100
X-Gm-Features: AS18NWAFt1NkpGOxkt8CegfptpF0EMO4UxObNAn5Ipr_oFC3pDr1b8wfuP2uwPo
Message-ID: <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com>
Subject: Re: [V1 0/4] User API for KPP
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 9:22=E2=80=AFAM Rodolfo Giometti <giometti@enneenne=
.com> wrote:
>
> On 16/09/25 06:10, Herbert Xu wrote:
> > On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
> >>
> >> The main purpose of using this implementation is to be able to use the
> >> kernel's trusted keys as private keys. Trusted keys are protected by a=
 TPM
> >> or other hardware device, and being able to generate private keys that=
 can
> >> only be (de)encapsulated within them is (IMHO) a very useful and secur=
e
> >> mechanism for storing a private key.
> >
> > If the issue is key management then you should be working with
> > David Howell on creating an interface that sits on top of the
> > keyring subsystem.
> >
> > The Crypto API doesn't care about keys.
>
> No, the problem concerns the use of the Linux keyring (specifically, trus=
ted
> keys and other hardware-managed keys) with cryptographic algorithms.
>
>  From a security standpoint, AF_ALG and keyctl's trusted keys are a perfe=
ct
> match to manage secure encryption and decryption, so why not do the same =
with
> KPP operations (or other cryptographic operations)?

I generally find the AF_ALG API ugly to use, but I can see the use
case for symmetric algorithms, where one needs to encrypt/decrypt a
large stream in chunks. For asymmetric operations, like signing and
KPP it doesn't make much sense to go through the socket API. In fact
we already have an established interface through keyctl(2).

Now, in my opinion, the fundamental problem here is that we want to
use trusted keys as asymmetric keys, where currently they are just
binary blobs from a kernel perspective (so suitable only for symmetric
use). So instead of the AF_ALG extension we need a way to "cast" a
trusted key to an asymmetric key and once it is "cast" (or type
changed somehow) - we can use the established keyring interfaces both
for signatures and KPP. For example, what if we somehow extend the
add_key(2)/request_key(2) syscalls to be able to initialise an
asymmetric key from a trusted key payload instead of providing the
payload directly via a buffer (similar to how
ALG_SET_KEY_BY_KEY_SERIAL does it for symmetric keys for socket crypto
API)?

Ignat

> I know there might be issues with allowing user space to use this interfa=
ce, but:
>
> 1) I think this mechanism can get its best when implemented in hardware, =
and
>
> 2) (hey!) we're developers who know what they're doing! :)
>
> This patch series is just a sample of the improvements I'd like to make o=
n this
> front. Please tell me if you don't intend to add these mechanisms to the =
kernel
> at all, or if I have any chances, so I can decide whether to proceed or s=
top here.
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

