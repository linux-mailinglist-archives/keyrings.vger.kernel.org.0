Return-Path: <keyrings+bounces-2475-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4652A675C0
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 15:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A528803EB
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D60420E009;
	Tue, 18 Mar 2025 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXZJmEli"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1316C20E003;
	Tue, 18 Mar 2025 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306328; cv=none; b=XE32ob+DPAYdOPMt0PErPPYkyCee+ZaXIprPwLlOC7XqeXzz5gVsgw4Io3RQBDwsyz+o7ulDztYqFjLkJxxuP/hpMcwt4yg1qqcYND3+ACvKbUXuSoWQRsBU/K1JtFor+RBHolBbXtYkEukf2/57GnXTT5ARDS2ZwucFgtloOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306328; c=relaxed/simple;
	bh=okAI5xect5YoGoMJm+SSYguV7ij0XhWYpvWkpZ9mSNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwgR87qzVXManRRsPpFj4dgXixDQVhoIoNWs+kpX3J+CC0pyFOuARzsVjv4pN5dFjFtlOODyKjhC8oWc+55+O1d5MuUZPRceRYC55eA+TNRoE4hIbB5NTc9UsKR3ojqyC83j5SDrlClA6n/9npOvKq2esZjpN4FgwwkWsnxIbCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXZJmEli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE341C4CEF3;
	Tue, 18 Mar 2025 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306327;
	bh=okAI5xect5YoGoMJm+SSYguV7ij0XhWYpvWkpZ9mSNI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mXZJmEliUJSXvouqoB2Hc0ojwh2dkS9ApuTqOomkSQKYq+6hc9STqGpUkUJJiBGE/
	 QzW2qgGMjSmdCAGzxbxXzMccxn4iI4WZcPwxZKXuZ39b3elhQaQ7mp5Y5v2KWD0Adv
	 Cbzx5lRJSSPoBxGecHpMytq4b7Yhs/5vmYnaTEzVvcf9N6nKNWgi9ZY5WxufDpno31
	 9Bucu05lZgzyxSwkaRPWjzjhPCAb+4OO0hsk+XxlAWKdyCWTkdmTlCWU2P5LQE2UA1
	 9qJDFQd6tzolFsCJhgIo1E4JPqmO3qbyO/ZUfA5TrfGKrTlH5S3lImp3AhkRsLm9oC
	 Z/bFFYpKox4ww==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf3d64849dso936100666b.3;
        Tue, 18 Mar 2025 06:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL9RwknIttYqH7owdYZ55clzR5yvfi3eF162EeqEKluTZhIVBlBoO0yLeBb6kQv7ROujCOc90sh8SGkNMv@vger.kernel.org, AJvYcCW1KstbKO4pZf/lHBZvs4ffp99dV+Y3WhGQCM427UgxRcdNTSiVBLC14Ns5own3Agb35KgCpWnV@vger.kernel.org, AJvYcCWO667APjqAGY2eAhs7JEA0hUmhzek7uUEZBl1MzilWz26xSTPulDMl2h7pterfXz3EJvh4MjHDZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaRPOI9nZ0GboFXpFEr4qbrN170msAg2on3FD2OFDbd2ZCK1XP
	Nycln8F3pGGN/6ozOSQ1Zgh5Js2BM9JCcUDvPNfmOzSNB7diIDNcwc+OJVW8GIxfCDGtwqeTfT+
	12lCkqo5IFG0b1/x6EZBVOQvASiM=
X-Google-Smtp-Source: AGHT+IE7YlisJrMTzVcREBpQG1FxhWyYZgujmE0dhYcPDNWZ/tCZXtAHev1364mDDmLJfbnSJW9TCvdw+fFtJwSdQmc=
X-Received: by 2002:a17:907:96a1:b0:ac2:88d5:770b with SMTP id
 a640c23a62f3a-ac3302d1178mr1851030166b.25.1742306326013; Tue, 18 Mar 2025
 06:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318110124.2160941-1-chenhuacai@loongson.cn>
 <20250318110124.2160941-2-chenhuacai@loongson.cn> <2025031834-spotty-dipped-be36@gregkh>
In-Reply-To: <2025031834-spotty-dipped-be36@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Mar 2025 21:58:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrlKqFQVz_RplvwKX2x93lPclA7QVuwsdwgLRloL8BWzAwJXxyFW_tu4Vs
Message-ID: <CAAhV-H4y88jfpKp1mFytEjX4L0CErF=XFashZ9dXfwM58dPGGQ@mail.gmail.com>
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

Hi, Greg,

On Tue, Mar 18, 2025 at 9:25=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 18, 2025 at 07:01:22PM +0800, Huacai Chen wrote:
> > From: Jan Stancek <jstancek@redhat.com>
> >
> > commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
> >
> > Couple error handling helpers are repeated in both tools, so
> > move them to a common header.
> >
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
>
> Is this "v2" as well?  the threading is all confusing here.  This is
> what my inbox looks like right now:
Yes, this is also V2, I'm very sorry to confuse you.

Huacai

>
>
>   32 N T Mar 18 Huacai Chen     (2.9K) [PATCH 6.1&6.6 V2 0/3] sign-file,e=
xtract-cert: switch to PROVIDER API for OpenSSL >=3D 3.0
>   33 N T Mar 18 Huacai Chen     (7.9K) =E2=94=9C=E2=94=80>[PATCH 6.1&6.6 =
V2 3/3] sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D =
3
>   34 N T Mar 18 Huacai Chen     (3.4K) =E2=94=9C=E2=94=80>[PATCH 6.1&6.6 =
V2 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>   35 N T Mar 18 Huacai Chen     (4.8K) =E2=94=94=E2=94=80>[PATCH 6.1&6.6 =
1/3] sign-file,extract-cert: move common SSL helper functions to a header
>   46 N T Mar 18 Huacai Chen     (2.9K) [PATCH 6.1&6.6 0/3] sign-file,extr=
act-cert: switch to PROVIDER API for OpenSSL >=3D 3.0
>   47 N T Mar 18 Huacai Chen     (3.3K) =E2=94=9C=E2=94=80>[PATCH 6.1&6.6 =
2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>   48 N T Mar 18 Huacai Chen     (4.8K) =E2=94=9C=E2=94=80>[PATCH 6.1&6.6 =
1/3] sign-file,extract-cert: move common SSL helper functions to a header
>   50 N T Mar 18 Huacai Chen     (7.8K) =E2=94=94=E2=94=80>[PATCH 6.1&6.6 =
3/3] sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
>
> What would you do if you saw that?
>
> greg k-h

