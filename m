Return-Path: <keyrings+bounces-3440-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7FC87295
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 21:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6908F3B0848
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 20:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304832E1C57;
	Tue, 25 Nov 2025 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="fuOlVC0P"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13589178372
	for <keyrings@vger.kernel.org>; Tue, 25 Nov 2025 20:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764103929; cv=none; b=nlhiix1WPLQQuPKloCQ+Qzxb9s89W54zhoBtOc68jwij9RzdvHmpIWfKHNx2pxJu71Sgz0XvvjtPS5Qenapyz8im3tvDXgp4FF/Z30OKEQcfPSXkXTnhRedeC+F3U5K+cYsxHQXBJ1+43Tmg7gR/ZiXgu0f4dbpSSiboeox8WoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764103929; c=relaxed/simple;
	bh=kiAUqFv308tsTC9XMP6J7L5wzi54M7ISRKjnfqA+O/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHbjlHWGWm1zg6G4uxQ3xDa1OG5srAtcS0aBvn28XpFOkaDtvGwqM1yHvXqWDVKj1Cf1QQC/rQaBXO7CW7WaTcdqpycYubMMBmekvrEkcvNGY0/8mWFaj79fYOtF+gQA6qMqroVhE732YR1GIzf4saPQGoU+JApdOOCwcdV84Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=fuOlVC0P; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59431f57bf6so6414198e87.3
        for <keyrings@vger.kernel.org>; Tue, 25 Nov 2025 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1764103925; x=1764708725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Veq6qGtZQdentDyLb41XD/n7T4wPrMoW41woL5oNso=;
        b=fuOlVC0PTT4djp/G3+RKbu/Pwl3hjypCeBhgr2cvzDrK63QLsrJZ/a7Loi+eaIY3zj
         QmTG3TZ3XEsCjZQC++aIh9LSm0IqtRauRqMgTyUNR/kmxmlwR3UuEqD2k/EW/1eaOD4D
         SDIv9z1modfzYazPDZrtafEfdBghhi4YmVvJrBDLN3Qw7aXLvzdPHmp/XNIokC8AZQHw
         puwDOaDKJTlXPDqWDVJ0W8Aucn9NGXqlT2sGvZo8/XOp9LvfwgTDF6ji6i+HGEZyuxvX
         141o8/tvxaCTqjjrAdqRxYWUUoMWTvg1iGzfwaIFuHdPgbwRFtEHLH7Ck2jw2oX2CXjJ
         peZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764103925; x=1764708725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Veq6qGtZQdentDyLb41XD/n7T4wPrMoW41woL5oNso=;
        b=kAc6yH3mRdwwicP/qEeWYldBfBc09cGZ6wz9ZshHePMBY7IMh8AnWVaFWbReL6XySh
         eYyF0BzZLHDXuheogHYHIN1TbSWu65ooHnLHd0+LAo6NXjhDG51vv5MKX38C/uA3QHaO
         lDXik+n6Vr6iUJa6+Un6u058PUw0e5zfnRB8DY/z7TWb4G+zhq+9f5whAY7w1fLdHH9F
         Grauu4bsDZVCpESNtrBQ1rlzVNxefHHmIsmr1o59LtqyG3rsNAMQl3CNrPdSVKHo2EuO
         +U3UiDvf2auLXoDaX6Et5VaM8XD1CsQRiU+vG480E+43qHnRq3anQcr2Z2jYaw4HJrlw
         SKJA==
X-Forwarded-Encrypted: i=1; AJvYcCVznIaV8HKjXQZLQQjk8m1ylB/ALJ+vOCSIfL6V0788eEZ3FJP1g+s5ciVxmqdJmxwZ+tUOCA6gAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiOp0yV+sVKnQESqwnQqwy2Sf2VQHh5Wdv0Yhm5jlvmx733po
	rd5/Z/kf0Jz+jpmG1vytxlADlF4nRi5B5ZrscKanXfvlvgwDjc/yq/XUQqPTAjq5ZH+bIJyAy4k
	zu3Fhdq+9UHvCwzXrjaF8GDzUX80wlYK6t9a9Z+v3QA==
X-Gm-Gg: ASbGnctCLt1vJB3DHvaSTKVr8juCj/DD0wz36COOaLyvqMNi+3L1zY1SH1owq4MpU3z
	2tIhnqpA8IeAtSFjY+oGJ1I+iq6C7SD7kjgye3EQGcZdIkbAe6PBXKOYvr55sOZPMk7+CyzIBxb
	Gcn4HH3aQkZtvxMfGfPPzgvakge3Z45dGSUICx5twOxQ7+7HEa5qpzY8/m/A4YcLrEXk1de11tY
	ycCdf8daPZmtNestPrKqQ+Dc6pkKJ72w51Xvq/cn0xmfFMpMjUX/PB/KLB2LVg3VldS96Cw7Awd
	CJo2cQ8t4Yd3FA==
X-Google-Smtp-Source: AGHT+IHB1XT1j6ogJ8J0r/Cp4YyDwKoWMJH5bcQnr9ufM6rkWLD8KmRTppkmR+1Kgn6cYgO/dmIaCDDZnMsdIWvOsXE=
X-Received: by 2002:a05:6512:308a:b0:592:f818:9bde with SMTP id
 2adb3069b0e04-596b50598aamr1850177e87.1.1764103925047; Tue, 25 Nov 2025
 12:52:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117145606.2155773-1-dhowells@redhat.com> <20251117145606.2155773-3-dhowells@redhat.com>
 <20251117171003.GC1584@sol> <CALrw=nG6X5Opjb1H4VVzCNpJ4QtmHUK3nQ1XQ5GKMvnE9NnZsQ@mail.gmail.com>
 <20251125202419.GB3061247@google.com>
In-Reply-To: <20251125202419.GB3061247@google.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 25 Nov 2025 20:51:51 +0000
X-Gm-Features: AWmQ_bnvxBAK5ZG3x1nUtVEXK9eSB6SwFv-HxkEqdz_PCr-Ol9dbfVbV3x0xwpc
Message-ID: <CALrw=nFYE8yP6ZjVmDCv36g4zHBtJZet1m55Rkv3firv=-QB3w@mail.gmail.com>
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

On Tue, Nov 25, 2025 at 8:24=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Nov 25, 2025 at 10:10:18AM +0000, Ignat Korchagin wrote:
> > Hi all,
> >
> > On Mon, Nov 17, 2025 at 5:11=E2=80=AFPM Eric Biggers <ebiggers@kernel.o=
rg> wrote:
> > >
> > > On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
> > > >  lib/crypto/Kconfig                            |   1 +
> > > >  lib/crypto/Makefile                           |   2 +
> > > >  lib/crypto/mldsa/Kconfig                      |  29 ++
> > > >  lib/crypto/mldsa/Makefile                     |  20 +
> > > >  lib/crypto/mldsa/crypto_mldsa_44.c            | 166 ++++++++
> > > >  lib/crypto/mldsa/crypto_mldsa_65.c            | 166 ++++++++
> > > >  lib/crypto/mldsa/crypto_mldsa_87.c            | 166 ++++++++
> > > >  lib/crypto/mldsa/dilithium.h                  | 304 ++++++++++++++
> > > >  lib/crypto/mldsa/dilithium_44.c               |  33 ++
> > > >  lib/crypto/mldsa/dilithium_44.h               | 291 ++++++++++++++
> > > >  lib/crypto/mldsa/dilithium_65.c               |  33 ++
> > > >  lib/crypto/mldsa/dilithium_65.h               | 291 ++++++++++++++
> > > >  lib/crypto/mldsa/dilithium_87.c               |  33 ++
> > > >  lib/crypto/mldsa/dilithium_87.h               | 291 ++++++++++++++
> > > >  lib/crypto/mldsa/dilithium_common.c           | 117 ++++++
> > > >  lib/crypto/mldsa/dilithium_debug.h            |  49 +++
> > > >  lib/crypto/mldsa/dilithium_ntt.c              |  89 +++++
> > > >  lib/crypto/mldsa/dilithium_ntt.h              |  35 ++
> > > >  lib/crypto/mldsa/dilithium_pack.h             | 119 ++++++
> > > >  lib/crypto/mldsa/dilithium_poly.c             | 377 ++++++++++++++=
++++
> > > >  lib/crypto/mldsa/dilithium_poly.h             | 181 +++++++++
> > > >  lib/crypto/mldsa/dilithium_poly_c.h           | 141 +++++++
> > > >  lib/crypto/mldsa/dilithium_poly_common.h      |  35 ++
> > > >  lib/crypto/mldsa/dilithium_polyvec.h          | 343 ++++++++++++++=
++
> > > >  lib/crypto/mldsa/dilithium_polyvec_c.h        |  81 ++++
> > > >  lib/crypto/mldsa/dilithium_reduce.h           |  85 ++++
> > > >  lib/crypto/mldsa/dilithium_rounding.c         | 128 ++++++
> > > >  lib/crypto/mldsa/dilithium_service_helpers.h  |  99 +++++
> > > >  lib/crypto/mldsa/dilithium_signature_c.c      | 279 +++++++++++++
> > > >  lib/crypto/mldsa/dilithium_signature_c.h      |  37 ++
> > > >  lib/crypto/mldsa/dilithium_signature_impl.h   | 370 ++++++++++++++=
+++
> > > >  lib/crypto/mldsa/dilithium_type.h             | 108 +++++
> > > >  lib/crypto/mldsa/dilithium_zetas.c            |  68 ++++
> > > >  .../mldsa/signature_domain_separation.c       | 204 ++++++++++
> > > >  .../mldsa/signature_domain_separation.h       |  30 ++
> > > >  35 files changed, 4801 insertions(+)
> > >
> > > Over the past week I've been starting to review this massive addition=
.
> > >
> > > I don't think this is on the right track.  This implementation is rea=
lly
> > > messy, with lots of unused functionality and unnecessary abstractions=
,
> > > and code that doesn't follow kernel conventions.
> > >
> > > In comparison, BoringSSL has an entire implementation of ML-DSA,
> > > *including key generation and signing*, in a bit over 3000 lines in o=
ne
> > > file.  But about half of that code is specific to key generation or
> > > signing, which the kernel doesn't need, so in principle
> > > verification-only shouldn't be much more than a thousand.  I find it =
to
> > > be much easier to understand than leancrypto as well.
> > >
> > > Historically we've had a lot of problems with people integrating code
> > > from external sources into the kernel, like mpi, with properly "ownin=
g"
> > > it because they feel like it's not their code and someone else is
> > > responsible.  I feel like that's going to be a big problem here.
> > >
> > > I think we can do better here and put together a smaller implementati=
on
> > > for the kernel that we'll actually be able to maintain.
> >
> > I was thinking about this lately for some time - even put forward a
> > small discussion proposal for upcoming Plumbers (which wasn't accepted
> > unfortunately). Should we consider somehow safely "outsourcing" at
> > least some (asymmetric - potentially slow anyway) crypto
> > implementations to userspace? Something similar to
> > request_module/request_firmware/request_key usermode helpers or an
> > io_uring interface or a crypto socket? This way we can bring any
> > well-maintained crypto library (and even multiple ones) to the kernel:
> >   * it can have any software license
> >   * can be written in any programming language
> >   * can use architecture vector instructions more easily
> >   * can have any certifications out of the box (looking at you - FIPS)
> >   * distros would have the ability to plug their own
> >   * maybe it can even do private key crypto (which I personally would
> > really like more support of and it would be acceptable to Herbert)
> >
> > Given the past experience of RSA and mpi - it is not that difficult to
> > port something to the kernel, but quite hard to maintain it over time
> > in a secure manner. With a userspace approach the kernel can
> > piggy-back on proven vendors like any other piece of open source
> > software out there.
> >
> > I understand that there probably still be a need for some in-kernel
> > crypto, so the proposal here is not to fully replace things, but
> > rather complement the current offerings with an interface, which could
> > enable faster adoption of newer (and more secure versions of existing)
> > crypto algorithms.
>
> The performance cost of that would be very high, so it would only have
> any chance at possibly being reasonable for some of the asymmetric
> algorithms.  It would also introduce reliability issues.

Yes, definitely. For the userspace approach I would think only
asymmetric algorithms. For "reliability issues" I don't know if it is
a problem of the kernel itself, or the user/admin of the system. The
kernel supports network-based and userspace-based filesystems and
userspace-based block devices even and users successfully use them as
root filesystems. Surely a small crypto agent running locally would
not be worse than this.

> I'll also note that the main reason that people seem to want private key
> operations in the kernel is for the keyctl() UAPIs for userspace, which
> is already a bad idea.  So I guess we end up with userspace calling into

Can you elaborate on this? (I want to understand for myself). I think
keyctl UAPIs for private keys are a great idea and allows building
good (and relatively simple) secure architectures. So I want to enable
more of this, not less.

> the kernel, which calls back into userspace to use some userspace crypto
> library which the original userspace program refused to use in the first
> place for some reason?  It makes no sense to me, sorry.

It does make sense for userspace programs (apart from potential keyctl
users which don't want to have private keys in their address space),
but what about in-kernel services? How is this fundamentally different
from request_module, for example? If the kernel needs a module, it
tells userspace and there is a userspace helper, which provides it. It
is an "external service" to the kernel. So crypto can be another
service. After all, microkernels have been doing this forever.

> There is the opportunity to share more code with userspace projects at
> the source code level.  Just it doesn't always work out due to different
> languages, licences, requirements, conventions, and implementation
> qualities.  For ML-DSA verification I didn't see a good alternative to
> just writing it myself.  But in other cases a different conclusion could
> be reached.  The kernel uses a lot of the assembly files from

What about sharing code at the binary level? At Cloudflare we have an
internal kernel crypto driver, which just imports its implementation
directly from compiled BoringSSL into the kernel space. So in the end
it is fully in-kernel and fast, but the advantage is that the code
itself comes from BoringSSL (and we regularly update it). There are
rough edges of course (like using vector instructions, different stack
alignment etc), but it kinda works and I think with some investment we
can make such an approach upstream. We even considered open sourcing
it, but not sure about licensing as we effectively have a bespoke
"module loader" for BoringSSL, which is Apache (I hope James is right
that Apache may be considered GPL-2 compatible in the future).

While I think such an approach is much more technically challenging,
it provides "best of both worlds" by having fast in-kernel crypto
directly from established libraries.

> CRYPTOGAMS, for example, and some of the Curve25519 code (including
> formally verified code) is imported from other sources.
>
> - Eric

Ignat

