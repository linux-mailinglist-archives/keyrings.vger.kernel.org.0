Return-Path: <keyrings+bounces-2551-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E8A75A29
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 15:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315353A9160
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 13:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FF51B423C;
	Sun, 30 Mar 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBcd2yWW"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8A1C69D;
	Sun, 30 Mar 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743340061; cv=none; b=dziVVUnZG7O6cv3NEaIJvp0BEtybDizv6NiMiRyzNIYh2qtmZFaUQwPIDX0Q7svA4xVrRanV4UBB25xuqMtc71zUppgVY6R8psSGuwZV1x4xCfrxZ0BkWHhesn+7dtm0MaMC9JE5h626cyKXAgzqtHWUPHMzzk2MD+fvk4Zhu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743340061; c=relaxed/simple;
	bh=4fkcn/ee0GBAw/wWJYEwRjJcNAIwUXCfEH3IvQv9uc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb0+Szwqat80bPqRjkX/4CrBe6J1kIQSv6gaeHEZBtMEPB4WI3jWvLqGfMzjSNXMFWVGihCO3VDKI9S4l6pXGXw/Fx6lKxLP6o20nDUpRC9BPnTbXDdEU5f1H1tX+Fuf8ZNhXEsn7SpVoIfvpVT8qDsR2MrvO5d/4O5WBXdzAu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBcd2yWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C3EC4CEE5;
	Sun, 30 Mar 2025 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743340061;
	bh=4fkcn/ee0GBAw/wWJYEwRjJcNAIwUXCfEH3IvQv9uc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RBcd2yWWFdUbUE5pjitkQm4oQJA+RmPYpQVqHY4Ajn//IhkkChvSX6NRYQrZLiauu
	 CV7ORi53lUlODd6Dl0oamWmzDIaO8DhA76LWfLFYWDHhyKz0a8EaL41wB5TXYGPwgu
	 9Ec5bJu8os8vb8r+cLnwpClBzwYoFk0MZS3snE8jrqZtQeNOOb65djdzl97/g1L2Go
	 4fzIMOqDw5snUBX7MEZqyN5e/AEAFkoZp+6YvJNw2Z/OUq+Z/dDoWcD3ipXwfbIllM
	 L3mKVe6Fv3sWrM5OJRsKL8Mg2f2u0WV9usvhoAvCrkVAeOrcEjKwyH4kA1UgiTC4rb
	 Ai8rFZDijNjPw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so599394466b.0;
        Sun, 30 Mar 2025 06:07:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWt1GHw65dPgi7xH0u6cVrOAmxlUoLgCjvl4/BvGF/g2GdB5ReUG+Dnoh/lk/PH1JFvl5fuc8Lr0+BWAd8s@vger.kernel.org, AJvYcCXNG+mTE58vKKT/jvZm/dwGCPqzvqZ4YcLDEZjC/g99f4rYlYw9ymSqr1ls295IERtMQNHMIjX6@vger.kernel.org, AJvYcCXbKV5o/Wo5KnxGiesOwycrNtM/BTWor3guUdg3DVI0SRGHoz0BS9RLimf80NIW8unziHR2+0nwfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCDV0+258y9kvoOn0tJLEPH2hjfqff0DIdr3kup4pD6rzEqLV
	B4DdENG/+rNofmfoYA8mgrPob3lJP1Qu8VGEggvqYPqwK65VjPKzbXUnekLU5b8nb5hYKEIwk4i
	ZC5ei12OuAc3aNzlBdVVKL2f268I=
X-Google-Smtp-Source: AGHT+IFAawyj1EZJacFB7lPOlHE/sLuxr6nqwGy8x4wXEm4WSPiqm8D8dRPwkV+ZuY/NFvlzmiHFfF+vy5pxguZo2lI=
X-Received: by 2002:a17:907:2d07:b0:ac3:ed4c:6a17 with SMTP id
 a640c23a62f3a-ac738a36df5mr452541766b.24.1743340059563; Sun, 30 Mar 2025
 06:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh> <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
In-Reply-To: <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 30 Mar 2025 21:07:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp3x96k66jg3TQPvsXg4rxU088H7mKXTpRrrpYUCQMd2JOJNB7bwpUNSpo
Message-ID: <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Jan Stancek <jstancek@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Sasha Levin <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 12:53=E2=80=AFAM Jan Stancek <jstancek@redhat.com> =
wrote:
>
> On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > >
> > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > >
> > > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > > Distros have started dropping support from headers and in future
> > > > > it will likely disappear also from library.
> > > > >
> > > > > It has been superseded by the PROVIDER API, so use it instead
> > > > > for OPENSSL MAJOR >=3D 3.
> > > > >
> > > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGINES=
.md
> > > > >
> > > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --st=
rict]
> > > > >
> > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > ---
> > > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------=
------
> > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++-----------=
-
> > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > >
> > > > This seems to differ from what is upstream by a lot, please documen=
t
> > > > what you changed from it and why when you resend this series again.
> > >
> > > Hunks are arranged differently, but code appears to be identical.
> > > When I apply the series to v6.6.83 and compare with upstream I get:
> >
> > If so, why is the diffstat different?  Also why are the hunks arranged
> > differently,
>
> He appears to be using "--diff-algorithm=3Dminimal", while you probably
> patience or histogram.
Hi, Jan,

I tried --diff-algorithm=3Dminimal/patience/histogram from the upstream
commit, they all give the same result as this patch. But Sasha said
the upstream diffstat is different, so how does he generate the patch?

Huacai

>
> $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
> grep -A3 -m1 -- "---"
> ---
>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>  2 files changed, 138 insertions(+), 58 deletions(-)
>
> Should be easy to regenerate with different diff-alg for v4.
>
> Regards,
> Jan
>
> > that's a hint to me that something went wrong and I can't
> > trust the patch at all.
> >
> > thanks,
> >
> > greg k-h
> >
>

