Return-Path: <keyrings+bounces-3438-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D0C8460E
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 11:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2023A4672
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 10:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA9E2EA156;
	Tue, 25 Nov 2025 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QWXQs0BP"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610A2BF001
	for <keyrings@vger.kernel.org>; Tue, 25 Nov 2025 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065434; cv=none; b=oDOFUt1BWs6AjhIDZEPVjIELc09BTRSM+WcXz98qH+PXgZpMZk1RBszFYcZUaEeP9cXt1a/5rjOnnE0bfVoLaJaGPwDm2rMlIHWlgzDjfI+AHJOivqaP3e5sV20hHF724Dib1GJ4GAk94vmjBpumUVdH81jxzcg3bHPaF5Re1r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065434; c=relaxed/simple;
	bh=xrTIXClxXhCfJ28KXDtYmccizc1PI2Sren1VLiZ82WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUFJhPA3zlWBuHmtfFt3WSYkT0FNuPYGMAo9LzoiP7UuXDddneuYJESqkxyf0Ru6Z7s+03Iu2qTpiPCyWsLRJqu/wNXZ86wU1/vREbhGgiXKg5gy0mBtEh3wcXXO0uptUKxJlexdUEaL8bHZKr5/cyuXnOt66ES45IO21ybUjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QWXQs0BP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59428d2d975so5659688e87.3
        for <keyrings@vger.kernel.org>; Tue, 25 Nov 2025 02:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1764065431; x=1764670231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoaJM3tbP6s0WEBHNB87IlUePi5s/wLQQ5WO7asb+Os=;
        b=QWXQs0BPpp1xVA5x5sw4CPgqFWYLuAq6OGtktZmgDyNDV6G6fBXrGWFDQMFzL+lT5O
         xhaD07z+Y4KNFkwI1OFeX0wPHhX3gIRM3wX8lsN1NNy7vkAQTFJQP/LeRFfH0vkqfrZn
         vAdQOUR1PZJtVlr5JwtEWBax/ZYfAz0k7sX0sk4qHhWKZDCIvwGhi2JC+wEQYn944/lk
         RES42lhFIgpib5mXymsLDNDDquXO3k7/+JXtp8oGqd/gzQWNFKaxoz27FYeT+CeSfK/H
         YelYyQsmmQ+IP1iRCsfZnxRtDZxfFCeQmt5Eg/dPGHnVZ3idmWHmFpGPgHJg4Y5AoghY
         AKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065431; x=1764670231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CoaJM3tbP6s0WEBHNB87IlUePi5s/wLQQ5WO7asb+Os=;
        b=UyLS0bFS/OkW0rIGjnMugzPg/70t9ZO7515NO0z38Cxm/ByS0TI+33DSMxG2M0JjnQ
         2e+gnt5DTF2hqoaQ21p2Ml+4xoGOheNrVftqMBC+neOs2m6+2gcPKILeqC6VDIAA7RG1
         UDlu0D7IZ8nhvxrrTT4Jc6RguyWdJSAKrNl8yU3/CZl0BgkjDiw0cCuLmYrhOhpQkqJk
         FqfFPd0Ijx69rt2qeC26FiNLBc5sIZ1He938y/8LSkyenatg+nPUpzeX1NpYVD9EPA4L
         o5G3t3949+rEjjjUGjrmBO5xpKvGJmqJ/XKMq8xrtbYvzgq64wexNR5rz6yLKe5Vfyat
         oaJw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/7t+hC4zMtFct2BagMkKkwkgk4C1j34GhslcosCWyGHO/x4Qk85ybV6qpsVYNNZsCW79LfSX0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PINL7P3ujOt1n4/F2Yzd7MtQsMTceBuu1XOvms59QS51MqnG
	0i0gIrSGsvgpcYEmz5l4ajNP8AJY02eh6H0FOK9j50JhrF5UA2teoC4Hn22FwiZLpVrdfr8i89b
	5oj2xTGOffUg9SPvXTPf2XumzlPmErSSZs7/r2DMlsk1xN1ln0Ajh4HU=
X-Gm-Gg: ASbGncsfq0Ch3jhcdyuHIQkQ7lXJYjGCzBlpjS1esxGI27LTsrQptBQ6kGfD4t4VsGB
	B48ozNEL4b0u1NiD5+s83n3jtblqxTXpUGHT6aBC+VF6I4+AALcI8zij+ZPYhKQq8rJHC+89U3e
	+DlQF5AO6GuPA3LtQvxrBRrm9pi9CzlBJyXWQLuXuQPQYZX0wsWG4M0s3/0Ld++L7Vw7wm3Yvin
	y0oR9WVQhG22KRzeyt9DWiDvXSHoI1/JCHXbJSrLxv551aMVoyqlnwNR713I3F121BapHPBy8En
	uz4KCyNgFYd4
X-Google-Smtp-Source: AGHT+IFvSGCTLekIhr+vTYlBkAUyih+Shu03vLozC1zL2Y/ubyb161xSSgTppX7gvmMsmnA2cdjWMijm+7drjmcnv7w=
X-Received: by 2002:a05:6512:3d87:b0:57d:6fca:f208 with SMTP id
 2adb3069b0e04-596b5298c92mr989113e87.45.1764065430967; Tue, 25 Nov 2025
 02:10:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117145606.2155773-1-dhowells@redhat.com> <20251117145606.2155773-3-dhowells@redhat.com>
 <20251117171003.GC1584@sol>
In-Reply-To: <20251117171003.GC1584@sol>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 25 Nov 2025 10:10:18 +0000
X-Gm-Features: AWmQ_bkMV41j6i3d0klYOD3P3cdE9Dv5lpAQaEMNsXklzABWM8NTcersdE3Dzog
Message-ID: <CALrw=nG6X5Opjb1H4VVzCNpJ4QtmHUK3nQ1XQ5GKMvnE9NnZsQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	Lukas Wunner <lukas@wunner.de>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, Nov 17, 2025 at 5:11=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
> >  lib/crypto/Kconfig                            |   1 +
> >  lib/crypto/Makefile                           |   2 +
> >  lib/crypto/mldsa/Kconfig                      |  29 ++
> >  lib/crypto/mldsa/Makefile                     |  20 +
> >  lib/crypto/mldsa/crypto_mldsa_44.c            | 166 ++++++++
> >  lib/crypto/mldsa/crypto_mldsa_65.c            | 166 ++++++++
> >  lib/crypto/mldsa/crypto_mldsa_87.c            | 166 ++++++++
> >  lib/crypto/mldsa/dilithium.h                  | 304 ++++++++++++++
> >  lib/crypto/mldsa/dilithium_44.c               |  33 ++
> >  lib/crypto/mldsa/dilithium_44.h               | 291 ++++++++++++++
> >  lib/crypto/mldsa/dilithium_65.c               |  33 ++
> >  lib/crypto/mldsa/dilithium_65.h               | 291 ++++++++++++++
> >  lib/crypto/mldsa/dilithium_87.c               |  33 ++
> >  lib/crypto/mldsa/dilithium_87.h               | 291 ++++++++++++++
> >  lib/crypto/mldsa/dilithium_common.c           | 117 ++++++
> >  lib/crypto/mldsa/dilithium_debug.h            |  49 +++
> >  lib/crypto/mldsa/dilithium_ntt.c              |  89 +++++
> >  lib/crypto/mldsa/dilithium_ntt.h              |  35 ++
> >  lib/crypto/mldsa/dilithium_pack.h             | 119 ++++++
> >  lib/crypto/mldsa/dilithium_poly.c             | 377 ++++++++++++++++++
> >  lib/crypto/mldsa/dilithium_poly.h             | 181 +++++++++
> >  lib/crypto/mldsa/dilithium_poly_c.h           | 141 +++++++
> >  lib/crypto/mldsa/dilithium_poly_common.h      |  35 ++
> >  lib/crypto/mldsa/dilithium_polyvec.h          | 343 ++++++++++++++++
> >  lib/crypto/mldsa/dilithium_polyvec_c.h        |  81 ++++
> >  lib/crypto/mldsa/dilithium_reduce.h           |  85 ++++
> >  lib/crypto/mldsa/dilithium_rounding.c         | 128 ++++++
> >  lib/crypto/mldsa/dilithium_service_helpers.h  |  99 +++++
> >  lib/crypto/mldsa/dilithium_signature_c.c      | 279 +++++++++++++
> >  lib/crypto/mldsa/dilithium_signature_c.h      |  37 ++
> >  lib/crypto/mldsa/dilithium_signature_impl.h   | 370 +++++++++++++++++
> >  lib/crypto/mldsa/dilithium_type.h             | 108 +++++
> >  lib/crypto/mldsa/dilithium_zetas.c            |  68 ++++
> >  .../mldsa/signature_domain_separation.c       | 204 ++++++++++
> >  .../mldsa/signature_domain_separation.h       |  30 ++
> >  35 files changed, 4801 insertions(+)
>
> Over the past week I've been starting to review this massive addition.
>
> I don't think this is on the right track.  This implementation is really
> messy, with lots of unused functionality and unnecessary abstractions,
> and code that doesn't follow kernel conventions.
>
> In comparison, BoringSSL has an entire implementation of ML-DSA,
> *including key generation and signing*, in a bit over 3000 lines in one
> file.  But about half of that code is specific to key generation or
> signing, which the kernel doesn't need, so in principle
> verification-only shouldn't be much more than a thousand.  I find it to
> be much easier to understand than leancrypto as well.
>
> Historically we've had a lot of problems with people integrating code
> from external sources into the kernel, like mpi, with properly "owning"
> it because they feel like it's not their code and someone else is
> responsible.  I feel like that's going to be a big problem here.
>
> I think we can do better here and put together a smaller implementation
> for the kernel that we'll actually be able to maintain.

I was thinking about this lately for some time - even put forward a
small discussion proposal for upcoming Plumbers (which wasn't accepted
unfortunately). Should we consider somehow safely "outsourcing" at
least some (asymmetric - potentially slow anyway) crypto
implementations to userspace? Something similar to
request_module/request_firmware/request_key usermode helpers or an
io_uring interface or a crypto socket? This way we can bring any
well-maintained crypto library (and even multiple ones) to the kernel:
  * it can have any software license
  * can be written in any programming language
  * can use architecture vector instructions more easily
  * can have any certifications out of the box (looking at you - FIPS)
  * distros would have the ability to plug their own
  * maybe it can even do private key crypto (which I personally would
really like more support of and it would be acceptable to Herbert)

Given the past experience of RSA and mpi - it is not that difficult to
port something to the kernel, but quite hard to maintain it over time
in a secure manner. With a userspace approach the kernel can
piggy-back on proven vendors like any other piece of open source
software out there.

I understand that there probably still be a need for some in-kernel
crypto, so the proposal here is not to fully replace things, but
rather complement the current offerings with an interface, which could
enable faster adoption of newer (and more secure versions of existing)
crypto algorithms.

> - Eric

Ignat

