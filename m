Return-Path: <keyrings+bounces-2653-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DCA969EE
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 14:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B6EE7A77DD
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E143E28135E;
	Tue, 22 Apr 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0N2agaV"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286528134E;
	Tue, 22 Apr 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325052; cv=none; b=Yl3RIgw9mW47yqTa5bXWEeWiZ3fBrXs324JhMMrznr/14kK2TKYBVQaYzSKEBHlgLbvUuujdA/V2bl9qY+N+Yy9vfQ4cwnWigFSU0onkJFRgx/LQwRlKEXJmf4IYRYQXw8czLecvl62+aKHc6SN+N1WXiYYOKm4x8LXdovzNcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325052; c=relaxed/simple;
	bh=+xGHpnZfETb4tjUpz3mu6GNY/9R7BjlVlNDhNT5Wfds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX1iGDr5Ehxt49l+VhqYIRE1NQdgZ8pIqBlDxWlcKrC6ksz/JvcAYHyJ1ibpZB11ZUb0nmF2WW5PHuu6XvemzjvigJCNmF/SmGzmRiRf6RKjpCwB5PfEQJWgbEG0NBOTTpxupLGx7yy2J9hDcJ8t42/qXbXAlNG8SCDzK9Wca80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0N2agaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45519C4CEEC;
	Tue, 22 Apr 2025 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325052;
	bh=+xGHpnZfETb4tjUpz3mu6GNY/9R7BjlVlNDhNT5Wfds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W0N2agaVptFo5boKIVa/4m9nrAdDjXPLgMAznzn7Hg6fY9YKHKIIVx+j/+cQNz2IF
	 GhMO60oYBt/T2/W9bGjM69IOVnEIiTJehp9mV/KwvH2uZ8ve/JJq5izon6JMOsXiD6
	 On9UGBJgGS0MTOTWlZRzdPQxHQUvvSYkGvJ9TR5WEquhFcojeywDphziZixPMpPOGq
	 +iqhpkW4ecWG/mkn0Zxk6PFTC6PKSRMOffs+1lSif5E+NpzDkHXntZ9uQ/SNeIiCiB
	 gwlx2ecG3sqRzMp9RB2oSSDw6ip6qYLHx1xMDiWg6/LF8+cTVj3v8n7tyjWiAWTo1T
	 UedNGV33NF5lw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so6199225a12.1;
        Tue, 22 Apr 2025 05:30:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv+L87rJvQX7q/ry8QtBI/mVsxi2YJ4jnFWuCegGQMA5gHjwXnkZuWKN9keumhsAmEb9sURisoYfOsnYrG@vger.kernel.org, AJvYcCWEHcWcKUCwpz/I9zEXnRO//Q1B+Cvr4O/B7a9bkYFaIOrFyrdtF8gcxKXqLAsGpj8Ukhv6D7/l@vger.kernel.org, AJvYcCWS2XtPyFYm4aOsZVDV+Bc12TLbgmxM9Ah5qkHyPKQLMXbDlsoeb//85leBwenW6cWiwgUqqD9Ujg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cmcFmBTmKwIsm5EtU1vSWyIO9DFYUza+UO29H+W2O6ot3LJg
	3KTCM6TxYRQRJ/P7QD9D++H8xhFEYZqOywU/3wVpYpu08jayr1scpI13lF5TEanyUuwb0y35h81
	SoDSz/2YICSrPxUvamAEt7Krb6kQ=
X-Google-Smtp-Source: AGHT+IGfEBTaHRyUlz10z552U4a09AtElLy+HMb6/8nIVep6DEsI3SCMLMgnpZCb7VW60FmSJ6qxYwt2Km64sfYxYhA=
X-Received: by 2002:a17:907:3f96:b0:aca:b45a:7c86 with SMTP id
 a640c23a62f3a-acb74aa9323mr1428985766b.1.1745325050728; Tue, 22 Apr 2025
 05:30:50 -0700 (PDT)
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
 <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
 <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
 <CAAhV-H7h5SW40jDyJs2naBQ3ZLH9S_PLNeq=19P5+75jwT5eYQ@mail.gmail.com> <2025042213-throttle-destruct-004b@gregkh>
In-Reply-To: <2025042213-throttle-destruct-004b@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Apr 2025 20:30:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5A+GL0B7Mkv67W1XLmMeh4v0GrHfbq=HHa5WPixvvVpg@mail.gmail.com>
X-Gm-Features: ATxdqUGCwdjqOQpt6bT5EIQqJKUX6C8yqQBALzT_CAtxV5HvWZHQ_1yXsHWqUuY
Message-ID: <CAAhV-H5A+GL0B7Mkv67W1XLmMeh4v0GrHfbq=HHa5WPixvvVpg@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jan Stancek <jstancek@redhat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Sasha Levin <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 3:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 14, 2025 at 09:52:35PM +0800, Huacai Chen wrote:
> > Hi, Greg and Sasha,
> >
> > On Sun, Mar 30, 2025 at 9:40=E2=80=AFPM Jan Stancek <jstancek@redhat.co=
m> wrote:
> > >
> > > On Sun, Mar 30, 2025 at 3:08=E2=80=AFPM Huacai Chen <chenhuacai@kerne=
l.org> wrote:
> > > >
> > > > On Thu, Mar 20, 2025 at 12:53=E2=80=AFAM Jan Stancek <jstancek@redh=
at.com> wrote:
> > > > >
> > > > > On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > > > > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman =
wrote:
> > > > > > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote=
:
> > > > > > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > > > > > >
> > > > > > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > > > > > >
> > > > > > > > > ENGINE API has been deprecated since OpenSSL version 3.0 =
[1].
> > > > > > > > > Distros have started dropping support from headers and in=
 future
> > > > > > > > > it will likely disappear also from library.
> > > > > > > > >
> > > > > > > > > It has been superseded by the PROVIDER API, so use it ins=
tead
> > > > > > > > > for OPENSSL MAJOR >=3D 3.
> > > > > > > > >
> > > > > > > > > [1] https://github.com/openssl/openssl/blob/master/README=
-ENGINES.md
> > > > > > > > >
> > > > > > > > > [jarkko: fixed up alignment issues reported by checkpatch=
.pl --strict]
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > > ---
> > > > > > > > >  certs/extract-cert.c | 103 +++++++++++++++++++++++++++++=
+-------------
> > > > > > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++---=
---------
> > > > > > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > > > > > >
> > > > > > > > This seems to differ from what is upstream by a lot, please=
 document
> > > > > > > > what you changed from it and why when you resend this serie=
s again.
> > > > > > >
> > > > > > > Hunks are arranged differently, but code appears to be identi=
cal.
> > > > > > > When I apply the series to v6.6.83 and compare with upstream =
I get:
> > > > > >
> > > > > > If so, why is the diffstat different?  Also why are the hunks a=
rranged
> > > > > > differently,
> > > > >
> > > > > He appears to be using "--diff-algorithm=3Dminimal", while you pr=
obably
> > > > > patience or histogram.
> > > > Hi, Jan,
> > > >
> > > > I tried --diff-algorithm=3Dminimal/patience/histogram from the upst=
ream
> > > > commit, they all give the same result as this patch. But Sasha said
> > > > the upstream diffstat is different, so how does he generate the pat=
ch?
> > >
> > > Hi,
> > >
> > > I don't know how he generates the patch, but with git-2.43 I get noti=
cable
> > > different patches and diff stats for minimal vs. histogram. "minimal"=
 one
> > > matches your v3 patch. I don't know details of Greg's workflow, just =
offered
> > > one possible explanation that would allow this series to progress fur=
ther.
> > >
> > > $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb=
2 |
> > > grep -A3 -m1 -- "---"
> > Could you please tell me how you generate patches? I always get the
> > same result from the upstream repo.a
>
> A simple 'git show' is all I use.  Try it again and submit what you have
> if you can't get anything different here.
>
> Note, my algorithm is set to "algorithm =3D histogram" in my .gitconfig
> file.
OK, it seems I can generate the correct patches as yours now, I will
send V4 later.

Huacai

>
> thanks,
>
> greg k-h

