Return-Path: <keyrings+bounces-2492-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB967A69E97
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 04:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F3C1890E68
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 03:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3FD374EA;
	Thu, 20 Mar 2025 03:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCOywEWC"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3C4690;
	Thu, 20 Mar 2025 03:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742439705; cv=none; b=e5whHvIunyqYNZsZ151zA0J7gFHmWFNx+3LM1xkofi4vHeVqHXXrsV1ov+N2IpKPEyVcTBdWLuHH3b4v6uM3bJLvuVkFxj32x8YMpeY57OjlFJORg9NZUfyEuWa8DF0bhlbomPz9SA2dgvNspB+75CpDE4AMsUjNaWYT4iO6CQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742439705; c=relaxed/simple;
	bh=c0OVR0nfnZkRWysIpPR89Iqk1G7jQnsqPpst6EHgn+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLZtoiY4TiFBPBquIfHGiLgCk5+P4pXWvc9W5+BT/EA5hBxeQpEbE97LZbG7oUz5U7iEVebBoxcXcRi9HN/xQ0iGAGNqoz6PpdTZw3u5e+Myw7lOhavo2hw7nmlAnAcD4Upj3i0gnB3tX4gvoNI0+KIqzkrS7M96HxcgaipVx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCOywEWC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FFBC4CEE4;
	Thu, 20 Mar 2025 03:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742439705;
	bh=c0OVR0nfnZkRWysIpPR89Iqk1G7jQnsqPpst6EHgn+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fCOywEWC8hsTk1aoRHzQ52l8BWo7neTLdqYqX3JJYjXLHwB6sDYKlPTzyyizODc5k
	 2Y/ihlh8w4EOz7t7Bqe68tTBu6wYl4WCvhfbmyv30wR8JwNEh5I3ABHC33BAXJHOjX
	 B/WrlIhZceIXIlRSvvBFbfyA0qclpy1BMWNluIbk86wkLs6YUzQbDWge5a68tJM5PS
	 FUth/Z+nf04nkO65CCwcfFtPK4FVFXDij/aTM/JI/WXzK/G4zKgqQwesJXM8iC8/h0
	 VpPM52Ax7ghnGeWClj1ch86NpW5g9DG7jTmh+RVEVzala+qDaoBrf6LgokG6WN+IQk
	 G7SEQHBelOOhw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so601713a12.2;
        Wed, 19 Mar 2025 20:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV02CBN2boRXKBe76dsVwDEUhfLw8+PTJDH7mJZzo6Rbwxp58GX1BaHhNNVES9YszrwlMGyn1nq@vger.kernel.org, AJvYcCVbzAsDFNfi3S1iGKd/Vh/B/Wk6gJz1A7R/N+WqdYeJsbO0z/I2j/Hp/5SIMyZcOTq8TB1ARrFGUCRhzkb0@vger.kernel.org, AJvYcCXKtM5G6MaT6vFCDXRyuL5F+wKyFET38rxP59ogIE9FOZxoUpgwVqhKRP5LXjtE22Y7asfQJbzItA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRtuFlieBOL3LZ3BHbYkxScuKAxHXq8mJ510/4Q+ycJkXf1sD
	QJfl6fAl1f7t3b5S68UCcbZeHw2ZauC3NkjWcQAeGw1QatoIKcCd67DvSWAizn9Q/P+L5dgC2xW
	BlMZ7uxnvxE15DrkduJQn8nIpgU0=
X-Google-Smtp-Source: AGHT+IHqWokcgREOirPHE31mMWzf5yAqDBsDiehm2ro+I/2WbRrfdrFc22+YmYMAdH+fNLU8SlaD6kHofdbWyes0A54=
X-Received: by 2002:a05:6402:1d54:b0:5e5:49af:411d with SMTP id
 4fb4d7f45d1cf-5eb80d487b5mr5702524a12.17.1742439703352; Wed, 19 Mar 2025
 20:01:43 -0700 (PDT)
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
Date: Thu, 20 Mar 2025 11:01:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4-GnvqJrnJu_Z6EBKBH5WBTiZ9xRh1vGhBmuoYNw=r9w@mail.gmail.com>
X-Gm-Features: AQ5f1JpRALxCtqgxc8zE1UNEpDT5tsnLLr1ILnleluG0qpKgmpr6B4OtD1rd5lQ
Message-ID: <CAAhV-H4-GnvqJrnJu_Z6EBKBH5WBTiZ9xRh1vGhBmuoYNw=r9w@mail.gmail.com>
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

Hi, all,

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
>
> $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
> grep -A3 -m1 -- "---"
> ---
>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>  2 files changed, 138 insertions(+), 58 deletions(-)
>
> Should be easy to regenerate with different diff-alg for v4.
I use the default configuration to generate patches, and since the
code is identical, should I really send a V4?

Huacai

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

