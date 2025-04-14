Return-Path: <keyrings+bounces-2628-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F9A8848E
	for <lists+keyrings@lfdr.de>; Mon, 14 Apr 2025 16:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0AB717EE46
	for <lists+keyrings@lfdr.de>; Mon, 14 Apr 2025 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1FF2522B7;
	Mon, 14 Apr 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0NuMVO2"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8556D25229C;
	Mon, 14 Apr 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638758; cv=none; b=Tm/6l+ecNzb5eAbwS4eFvgAxCwsgwyMAGoZWVGh2xzXjFNfwjgOCqcnehS5jymLTPcI3MBn7PDgl3xDsgi/SaI6CDCKqr4mzJZSaedmT+iNYCNaSBG9Vx7fsMnR30z1jkyjVFSDgmSqMskqW17S5RKX5hrIBBeD5hULGo5D33V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638758; c=relaxed/simple;
	bh=ua8cASNkPaWRfa3lb5p4l80TaaxTdU9VK5enTPHP22U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmcLoCYPMx8bP9D0Ut79TVHPMYX8OqLizKZI7QgewbXbTb7mi3+wMk4eCrqasDQdFlEdmZEup005TfaS5n76webK8u7aOPqvmQMDK+KHJa/z48kyt0LADBVI3GBv0gqxQPQwVWsjWzVPGsNwm0poYjHgK41OK8bpTng4XLQ4ytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0NuMVO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04825C4CEED;
	Mon, 14 Apr 2025 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638758;
	bh=ua8cASNkPaWRfa3lb5p4l80TaaxTdU9VK5enTPHP22U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m0NuMVO26ktidw9tegT2dsWUHdlydwNaqfHnjdcVc3u1AdX3nP9ymx5Yx06eUhAwr
	 d5dyW7yEEDBPaPPmzrmDTVJ1JO5U37iebS9J1aE0dza8PPSYHV45YQAWvC9HXptWuf
	 Xc/J7GIVQ0DuAtZEdNVfceNsTYUo58uxOYb36I7wbU3wRgULo+V55zl2Cn1CdI1bx8
	 719McGg+A+Z/fXu+j+7BaYwLhkBPlXhO8cgIbmMqS9f5+eFeuJatPjShhFU2yImCre
	 UAZaMrZ6+7mttz6LxuaVizP40/4XYFBRyDttkKJrXTx5Lq4XLLpvng3oqnvopkrvWq
	 tTXnVrA7V3Gfw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac29fd22163so690414966b.3;
        Mon, 14 Apr 2025 06:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMLlrzCqqppRRknQ8FHCrxRUVe2RGw6LGjwmfXsZzch+mHAEKHqxlPeUD0tNBZo40nj7ZvV3eACw==@vger.kernel.org, AJvYcCVptBw6O/LLy4Iq8hl8iVu+4VrarZ4qn8cP+5sO/XexJ6ZX3H5R4d+4G/ONpR68vYpPaFSCUUHk@vger.kernel.org, AJvYcCX47vhs1m6BqYYvPk1IlHye9tAMHFYRCSzZWZh56vZyF74mFRv7lj6Yp4b7jpCfRaCJUHNRM5hRIsBiHuJO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy54qMwCfx0gsPsDkB3Aj5cIZ7gy4n3+6wPr2xQ0ElOOoRUG3P
	qZo7LrGGPPNZdp5EguieOHvVDfCJ9Hw1dQlDzeCTnN40Z7XmVkh/FKKH5Tvi4SBBSJY7eMT0UaL
	5KBZ23X55yiOWsXPqEeJgONNMWzI=
X-Google-Smtp-Source: AGHT+IEb9cXahzO8rO6tTtsRYaxmrd0g3AGSHrWP5pO4nON1SGuxFGxFHtpFDvEAu9sp8G1Us6/u8WHw7IosPBIF6N0=
X-Received: by 2002:a17:906:f585:b0:ac7:3912:5ea8 with SMTP id
 a640c23a62f3a-acad371af0amr1104496566b.61.1744638756467; Mon, 14 Apr 2025
 06:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh>
 <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
 <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com> <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
In-Reply-To: <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 14 Apr 2025 21:52:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7h5SW40jDyJs2naBQ3ZLH9S_PLNeq=19P5+75jwT5eYQ@mail.gmail.com>
X-Gm-Features: ATxdqUG1icZREjZMGI3uSy2brC-wqNFlBfkcadOO9-HvQ5kt1SjX-qscPsLmFhE
Message-ID: <CAAhV-H7h5SW40jDyJs2naBQ3ZLH9S_PLNeq=19P5+75jwT5eYQ@mail.gmail.com>
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

Hi, Greg and Sasha,

On Sun, Mar 30, 2025 at 9:40=E2=80=AFPM Jan Stancek <jstancek@redhat.com> w=
rote:
>
> On Sun, Mar 30, 2025 at 3:08=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Thu, Mar 20, 2025 at 12:53=E2=80=AFAM Jan Stancek <jstancek@redhat.c=
om> wrote:
> > >
> > > On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrot=
e:
> > > > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > > > >
> > > > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > > > >
> > > > > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > > > > Distros have started dropping support from headers and in fut=
ure
> > > > > > > it will likely disappear also from library.
> > > > > > >
> > > > > > > It has been superseded by the PROVIDER API, so use it instead
> > > > > > > for OPENSSL MAJOR >=3D 3.
> > > > > > >
> > > > > > > [1] https://github.com/openssl/openssl/blob/master/README-ENG=
INES.md
> > > > > > >
> > > > > > > [jarkko: fixed up alignment issues reported by checkpatch.pl =
--strict]
> > > > > > >
> > > > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > ---
> > > > > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++---=
----------
> > > > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++-------=
-----
> > > > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > > > >
> > > > > > This seems to differ from what is upstream by a lot, please doc=
ument
> > > > > > what you changed from it and why when you resend this series ag=
ain.
> > > > >
> > > > > Hunks are arranged differently, but code appears to be identical.
> > > > > When I apply the series to v6.6.83 and compare with upstream I ge=
t:
> > > >
> > > > If so, why is the diffstat different?  Also why are the hunks arran=
ged
> > > > differently,
> > >
> > > He appears to be using "--diff-algorithm=3Dminimal", while you probab=
ly
> > > patience or histogram.
> > Hi, Jan,
> >
> > I tried --diff-algorithm=3Dminimal/patience/histogram from the upstream
> > commit, they all give the same result as this patch. But Sasha said
> > the upstream diffstat is different, so how does he generate the patch?
>
> Hi,
>
> I don't know how he generates the patch, but with git-2.43 I get noticabl=
e
> different patches and diff stats for minimal vs. histogram. "minimal" one
> matches your v3 patch. I don't know details of Greg's workflow, just offe=
red
> one possible explanation that would allow this series to progress further=
.
>
> $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
> grep -A3 -m1 -- "---"
Could you please tell me how you generate patches? I always get the
same result from the upstream repo.

Huacai

> ---
>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>  2 files changed, 138 insertions(+), 58 deletions(-)
>
> $ git format-patch -1 --stdout --diff-algorithm=3Dhistogram 558bdc45dfb2
> | grep -A3 -m1 -- "---"
> ---
>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>  scripts/sign-file.c  |  95 +++++++++++++++++++++++++++------------
>  2 files changed, 139 insertions(+), 59 deletions(-)
>
> Regards,
> Jan
>
> >
> > Huacai
> >
> > >
> > > $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb=
2 |
> > > grep -A3 -m1 -- "---"
> > > ---
> > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-----------=
--
> > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > >
> > > Should be easy to regenerate with different diff-alg for v4.
> > >
> > > Regards,
> > > Jan
> > >
> > > > that's a hint to me that something went wrong and I can't
> > > > trust the patch at all.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > > >
> > >
> >
>
>

