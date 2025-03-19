Return-Path: <keyrings+bounces-2477-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98004A68436
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 05:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4911E3B231D
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 04:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6899120C02F;
	Wed, 19 Mar 2025 04:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrQpvrSj"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED18F4A;
	Wed, 19 Mar 2025 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742358868; cv=none; b=HcYk4UXTRCrLKhAWC79c5RPg8V4vwkROXcAvEwsCEKyjHNXtDlolCsMwIhaR+b7zsPFmexlKnf1tZlAEtjs6jnjzArAKVMowZfL1KDh0N6/HtrNEKTd0DatMU44kRBaJWySFe0r6+QpLnEn6ivJQFRMCUYDOKWBETNvqLwyRWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742358868; c=relaxed/simple;
	bh=tb219t++8fRJ9kz/h+J19vyhypnb0UhgT9+U8D020bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMSvvj6II1rfsXG7bl5qnWgl3SZqBTxAuynqtUy37jmfC3oXsVJcDV5WnZc3M84x9HVDeWiCW/wTDLW2hYZckVGbbUr6+CmnmPiozQxZuXym9tmMziXRjZkgRSLN0cRIrmw4tzsTIdBlYmGQPKQy+ro9+hH9I8GnS0pTVG/aegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrQpvrSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A01AC4CEEA;
	Wed, 19 Mar 2025 04:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742358867;
	bh=tb219t++8fRJ9kz/h+J19vyhypnb0UhgT9+U8D020bc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mrQpvrSjECT1KDry4PiFESBV34lOdssfJNpjEAfO7uXm8ESTAh4xXDvzw5DCvYPgn
	 eOU4361qPpKyro/JSd+bPuPwgjLWsuCXnLEsDr3orfgEv4MEL9YyaVXMwTTXeOSbYN
	 pLGoBwizlX6QC2YS/EWcGu0uVVkpTgtUwvvfb1wyG5lrNcebkrDKMzhxl70hdDYwY6
	 U3D3mucRR8kwGyDXmT55U9mqLevUaDIiK6uPXYFuWcclSifDVa2vcvkhtt8qXAH9K4
	 2H+8QiLygpewoOn9dPsZ7vleb7B01gMjPD2ObQKh3Juc+ePh9S71oVXru7dzJK6CLR
	 gBDCNAgvVv1EQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2963dc379so1087370166b.2;
        Tue, 18 Mar 2025 21:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcdSfRJMyd7lofI2IUFaJfSmLxHmHV2XoKHKmr2uHjxPrBKMqXfB5BXEP+GBEaDdrlbrEIpEywL1AKb3if@vger.kernel.org, AJvYcCWKUHV+8sNuRnPuF3r1AkDSAsJS/elgbjAh8vpxU8EKdrP+IGENdwXS1+KLu+xlTXoZfjVtMqr+@vger.kernel.org, AJvYcCX1dOfDwYm/ZptGNuUYNRkEbpt2Fb5oVIqHvXoBj+r434PyNiVc6N1+5UOtMz/Ds0dQAHtve+FCAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCJVnumVSk3Vf5AK00AVe7dG/Mqxo5fjWe9mFcjBoZyMmIX2Z
	H3y6TnrIx2kWFB17Ry94GCollTEvX222HCEZ9TYBVBPB4/Vx8rrGiDi7lDH7ZdJJuTIi5dKcKDv
	Mnz6C334eV/6qd1XROjMaNfSqTUg=
X-Google-Smtp-Source: AGHT+IEKrD5BVHlMH5cIfN9exRPHgKjBOjN4LuEaeAb1uQmrKcOZ45guA8zoWyTH6F5sw4ba/gyC/dA0IVDr8yKg6Bs=
X-Received: by 2002:a17:907:d7c7:b0:abf:68b5:f798 with SMTP id
 a640c23a62f3a-ac3b7a9bc3amr122518966b.9.1742358865242; Tue, 18 Mar 2025
 21:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318110124.2160941-1-chenhuacai@loongson.cn>
 <20250318110124.2160941-2-chenhuacai@loongson.cn> <2025031834-spotty-dipped-be36@gregkh>
 <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com> <2025031852-angelfish-mouth-f455@gregkh>
In-Reply-To: <2025031852-angelfish-mouth-f455@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Mar 2025 12:34:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ns+HQ30p++eG97iaDBm4pZB+8XpjhcaC1Czx_iex6FQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq1LpF2KOdiplv8HT0Ag3bf_-gr0IrAGadWDR9ZsBLQNMLwC9_sXBuayzA
Message-ID: <CAAhV-H4ns+HQ30p++eG97iaDBm4pZB+8XpjhcaC1Czx_iex6FQ@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 1/3] sign-file,extract-cert: move common SSL
 helper functions to a header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jan Stancek <jstancek@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	R Nageswara Sastry <rnsastry@linux.ibm.com>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 10:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 18, 2025 at 09:58:26PM +0800, Huacai Chen wrote:
> > Hi, Greg,
> >
> > On Tue, Mar 18, 2025 at 9:25=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Mar 18, 2025 at 07:01:22PM +0800, Huacai Chen wrote:
> > > > From: Jan Stancek <jstancek@redhat.com>
> > > >
> > > > commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
> > > >
> > > > Couple error handling helpers are repeated in both tools, so
> > > > move them to a common header.
> > > >
> > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > >
> > > Is this "v2" as well?  the threading is all confusing here.  This is
> > > what my inbox looks like right now:
> > Yes, this is also V2, I'm very sorry to confuse you.
>
> Great!  Please resend them all as a "v3" so I'm not confused :)
OK, thanks.

Huacai
>
> thanks,
>
> greg k-h

