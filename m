Return-Path: <keyrings+bounces-3180-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FABBFA3D
	for <lists+keyrings@lfdr.de>; Tue, 07 Oct 2025 00:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D03363C2261
	for <lists+keyrings@lfdr.de>; Mon,  6 Oct 2025 22:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E841DF99A;
	Mon,  6 Oct 2025 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T28ejsoa"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048B1D432D
	for <keyrings@vger.kernel.org>; Mon,  6 Oct 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788590; cv=none; b=GBOwka7c44d83uxqBM52jyI2HDEaju8dLeDLYG2VM32mTesg16xy/R3+0UF30aTB4cEPEIpXl1SkSNBUhnnYEPvcLJFs70e7exaQzqKvAbbqH8B14MvGJDjcB3lL6OlP0IQSn547S1p8x9FrugzUQuXWEghwWzE3eGPUI36snvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788590; c=relaxed/simple;
	bh=CHD0J+xjJcGVkTXfHKoo2fZhpHdZNaSK3j/FMipOEMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBt+lSHlm3U+KMFbqxOlZ1Q8KrcXmLY0ldyYuvzAZf7E58AQxEVDjwxl+fy63jgfBmzv8pBjW7b75yoK84s9Kovn4eUbsArLKldMYk68n3NYfzONrKZAyNg7GT+soOB7ILKaHIf2XHC37jlYHFYXWOy3ClKpDLtt+vsHG6IIKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T28ejsoa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-637ef0137f7so9007191a12.1
        for <keyrings@vger.kernel.org>; Mon, 06 Oct 2025 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759788587; x=1760393387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6uGao8D5BSZy4tBpGeUoA8r3hr67oWCrLy7wILsVxn4=;
        b=T28ejsoam+4zzalJ2z2lAnDekJEwWPyjQ3gw+jwOWBJHNGU0ohQ6dznY/xOO8iGaUO
         2tSaCQWQZ3yCjQsmBTEuw3YM3a/hM93OTvxIbjSy/PxSuzRqrrJnELnfAbzp2mWpwxCE
         I2+/5YW+EmNWjqZwL5c6TGqJ2d1ocfS2E2QRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759788587; x=1760393387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uGao8D5BSZy4tBpGeUoA8r3hr67oWCrLy7wILsVxn4=;
        b=NLJqR7SxZNCW8XzHB6Y/oelLmNFSlbkkiwocl8colOkvR/HL/hxKgP5Asfbmn18N48
         yA1XHUlLylsy3Uk9qxu1tuBL93wRW924bAMMhrJV6SzQWBb+4jC4rM/k+X0JxpXQmbqd
         T+GP76b3llzApkVEUghzt/J6HB5WHwJmIsDqla4CllqYd/PYrdtAbyAf1RHDWVMa0bap
         58m43sylXluSOmk3lIR024IBI/ch2kasEtEbIEiLu3fxRMqWaFjRky1LAh2IA+yEf7lx
         3ISWL28mi/Et7CoDJthndge2OnAK210+vjqpOTLEmq6vulVZ/7broB46FrmTPFkePclB
         myYg==
X-Forwarded-Encrypted: i=1; AJvYcCVRq/avtOZdIP1+ikqFPaP8reQftJLKeCIorEIQd8lyNbqnkNFi+sGO8GgfS0JegxwBrM0/40DgVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXXrQghhrNzeD+AtzCXG+37mPcgiJ3S+/6cMvK2PtYAyUtK8a
	2duz626eon4mtybBTNmU52abCjBjX9saC8myoRs90sEvpNKTTSedkJOOXcqhSsaFB/xGmQ70u6l
	JTVmK5Hg=
X-Gm-Gg: ASbGncshPDAbK81KEz3gXXSdHjQziudhhL5mJLcShTopShV9UhcB7OPoyEs9C4GF9EY
	BmYNWUTnlPF4eKKruEKHw4vCrWP3lrh+jzQVcsMOZMjonFB8DN/A+lBaYLVciiDCOScgLaqWCMT
	bNbtm5iOq2T7GZbJBABpj22pnRVYWP0sPx9S5tIcskmE+7dfLZaA8OX0i6uWIJgEuN8lemlHcbQ
	xMBxfPEw2/lTNs7Xf32aePfBp4/nt4o+POJ9xC58+2zKP4/0MP/S9b6ysLk4OAUpQBYhTGYGZX8
	25gaW4CEUqO04PhgWzlV7QQFqMzLEk51IWyUI56QQqiCyGl22jcAkmFyEUvIVX5GOrh2ulB2iei
	ypNelpiGpKJKa+QBxxlEj40PG5lZOytswDvVHx9gyE9zdYKVGJAK4BG8SJBDDls3WwWYBA7NYFj
	5lAXk6Z0t5jerWG9DLvyvQ2huG0hjI6I0=
X-Google-Smtp-Source: AGHT+IGvBLgw6m0MY1rmvleBkb/X3LfWdj6s6pL9/RztR8QVq8Bvq2n/YEE/saz2eDwKb7jYIglXNw==
X-Received: by 2002:a17:907:7284:b0:b47:de64:df26 with SMTP id a640c23a62f3a-b49c373ed08mr1522767266b.35.1759788586917;
        Mon, 06 Oct 2025 15:09:46 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6396b09746csm5913543a12.19.2025.10.06.15.09.45
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 15:09:46 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso11354739a12.2
        for <keyrings@vger.kernel.org>; Mon, 06 Oct 2025 15:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUViqTPUzip0kzVFlKf3vJ8mOEnHcEWat6dfQYC75TTk0JvRX0eX+uXaZ6+BqN4c1eta8+JnI9V/A==@vger.kernel.org
X-Received: by 2002:a05:6402:34c6:b0:638:1599:6c34 with SMTP id
 4fb4d7f45d1cf-63939c24f04mr14265679a12.21.1759788584720; Mon, 06 Oct 2025
 15:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOKTFv1vh1cvvcLk@kernel.org> <CAHk-=whSe9AGigVydkwo=ewE6_GFTJ_rU=XzO=v1N1sWyfVmAw@mail.gmail.com>
 <aOO3NKegSrUQ4ewg@kernel.org> <aOQ3V6M-wWQxxCWK@earth.li>
In-Reply-To: <aOQ3V6M-wWQxxCWK@earth.li>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Oct 2025 15:09:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEszQD56Q2EZ83EhzJK+OnqPaAkUavfPWako2rA8Z4uA@mail.gmail.com>
X-Gm-Features: AS18NWC-seoJUwFefSk_kijwQa6IpywQiR1JR3Kf97fiLCY3_kM93cgcwAVjtWw
Message-ID: <CAHk-=wgEszQD56Q2EZ83EhzJK+OnqPaAkUavfPWako2rA8Z4uA@mail.gmail.com>
Subject: Re: [GIT PULL] TPM DEVICE DRIVER: tpmdd-next-v6.18
To: Jonathan McDowell <noodles@earth.li>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan McDowell <noodles@meta.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 14:40, Jonathan McDowell <noodles@earth.li> wrote:
>
> I'm not sure _reads_ make sense for the TPM device files at all. It's a
> command + response interface.

Yeah, I won't disagree. My main worry was one of "existing users doing
odd things shouldn't then get new semantics"

I don't actually _expect_ people to do odd things wrt /dev/tpm and
friends, but I've so often been surprised by the odd things that do
happen that...

> What should we do if we get O_EXCL and O_RDONLY? Return an error? Ignore
> the O_EXCL flag?

Either of those likely is perfectly fine. Just ignoring it is the one
that adds the smallest possible ABI change, so in that sense it's the
"safer" option.

But you are probably right that there aren't any users that open that
thing read-only in the first place, much less then using O_EXCL.

Except I've seen programs that "work" by virtue of having done
entirely the wrong thing that just happened to work. Things like using
the wrong values entirely for 'flags' to open(), but the bits we cared
about happened to be ok, so...

And we have *traditionally* very much ignored O_EXCL when not paired
with O_CREAT (and even then it's iffy with NFS).

So people might just have random crud in the flags. That's why I
reacted originally: O_EXCL does make sense as a "open exclusively"
based on the name, but realistically we never actually *use* it that
way except for block devices.

So we *have* had those semantics for block devices, and they make
sense, and I don't mind the change at all per se.

But this is the kind of thing that I react to just because we have had
unexpected behavior in the past when a bit goes from "don't care" to
"meaningful".

Put another way: I'm probably just being unreasonably worried.

                     Linus

