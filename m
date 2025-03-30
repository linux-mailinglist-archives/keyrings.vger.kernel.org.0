Return-Path: <keyrings+bounces-2552-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08223A75A36
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 15:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6457D3A9558
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 13:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795BB1C3F34;
	Sun, 30 Mar 2025 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/HrX/XA"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD601C6FFD
	for <keyrings@vger.kernel.org>; Sun, 30 Mar 2025 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743342045; cv=none; b=Khsbmkmn3eG+o8q0Yfze5vJ8Oqtk5/xiAkEBgHxKNET7fqbmgRCK/H8UhpWLYUV8YSm6ZWaaXZW+Bj0NBmzOwP3Yie/AZVALh4oZjF0ZsBRYb2E5pofiBFKmKDlx3Au31FoDLtztXiiZKgTqVft/Q/uTTrr6Pk+vv4tPmX4z2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743342045; c=relaxed/simple;
	bh=AzbIDTURk1/ZlCJhxGl4l2okaIBkk6ggWWvSj3ORjU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhHRH7Us6v5YqjPJBSBJpX6RonS33ERGZOulgAdeYEPV3LJZNlOiEQpqNGYV2MovRNbvAkn3tNjmZuPNeKoF7zG3Uo6cFtUTaHXrcgztg4zgGKDv9Iu4fUxHFBetA74+VO3/wGqxpg0NThPri0rK5NcG9NP9vb+Mi1NVUw4WSaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e/HrX/XA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrzbGR6N+hFcHlPVzb3NUni2wGtFwScmRug3LxSD4IA=;
	b=e/HrX/XAE/OftcuKCQDI3bnfdzJGvYTnE772mOBR9akVq5o0UhYFc+oL7FKcNGzIFb/hrs
	UY9R7iBIYvxGF90yD3iUB7iC9QExb1liMrlLk/DRI4HUSMlAcsGiuVRFVKjJYh3Kt0+RMl
	lyHqrouuISmO8yZIUQa9IqZ+bROEIt4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-mjXoa7d0Ori0tgel1GvQNw-1; Sun, 30 Mar 2025 09:40:40 -0400
X-MC-Unique: mjXoa7d0Ori0tgel1GvQNw-1
X-Mimecast-MFC-AGG-ID: mjXoa7d0Ori0tgel1GvQNw_1743342040
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-524021ac776so1014696e0c.2
        for <keyrings@vger.kernel.org>; Sun, 30 Mar 2025 06:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342040; x=1743946840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrzbGR6N+hFcHlPVzb3NUni2wGtFwScmRug3LxSD4IA=;
        b=ZkX9eHmhGuJRKvRIw4yw5sEcsu8/dV1xLkNUcOnJq8Igny2W9lmaH2Hts+FtSg4Jq+
         hnAmLaKqwb9iQPxl59JQdLxZGv0oEoPo6l0NtfShKH4ciwXif74qf2eKoLcE+cxh2j2F
         2bZJrKt/W+b8u+7TsI077+9tZj7igEXcd/sdDttI32rWvX9on5fnljfwD2j87iQ+dF78
         PkgyeAirZN2uPS8XYYigJGwTW9J3MEWoKThO28oO6zimmFDTkIfVYhcnAaxft+3TvAr4
         kECwHUmx/GXqT+bSlpkFFQ85N1ejR1uP4/idE5DRZ106xKD29DVPF9SmIKRIqt0KfSA9
         TEqw==
X-Forwarded-Encrypted: i=1; AJvYcCUnKyQwQfKxoJcPSGYrtRk44Y96jVYAZxU0sw7hqELo/a/pVHr9kWzI5hti2K42sFi1ymbIk+dx0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4grf+Jf2X16nARw+OcA+01SjtbEBnao+S1sN0unAYR7t9nA1G
	HLdseUmBW6UjjJCuAvyc6v9OjVRzIccegQK6DyBgc8/l37VFNXU0ppoCmFQDSwDt+qM8eAmmHG+
	YJJB26o7UeqVeycRxOog1QW9uwL0qnhvRPG7r8q5g9Gga+G6QMzDlN9eZHToNrChLXwA/0gSNul
	kg5D+FNAE4CcAftPRKULr9Hw2owe/sygU=
X-Gm-Gg: ASbGncuk2KTRr5XT/ky2/Tc19J/LoEaaHseZMVtCehzc2SQQF1x1SuiKvRXsm+LhECc
	2cc7sko6GVDply+taHrAZ5j4qKApDQqOxw8ncrkANeikLTBhwsi3lNKZcWxGGD4XMkk2ckQs=
X-Received: by 2002:a05:6102:5123:b0:4c5:1c2e:79f5 with SMTP id ada2fe7eead31-4c6d396cec5mr3005393137.16.1743342039420;
        Sun, 30 Mar 2025 06:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4c9QW2IwAFyXx28tQjmaxC/xPN5DsLHbqF8VtB4EE/5P1E4VbuQsBZkrB9jqFfoUq3Aft081vmQFhfs6rbbw=
X-Received: by 2002:a05:6102:5123:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4c6d396cec5mr3005384137.16.1743342039085; Sun, 30 Mar 2025
 06:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh>
 <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com> <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
In-Reply-To: <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Sun, 30 Mar 2025 15:40:23 +0200
X-Gm-Features: AQ5f1JqlN49O0YbAefe9zsMhgmZfVN4so5yqycLf8bVS7fVGBKegjWIhLF_QxkU
Message-ID: <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Sasha Levin <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 3:08=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Mar 20, 2025 at 12:53=E2=80=AFAM Jan Stancek <jstancek@redhat.com=
> wrote:
> >
> > On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > > >
> > > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > > >
> > > > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > > > Distros have started dropping support from headers and in futur=
e
> > > > > > it will likely disappear also from library.
> > > > > >
> > > > > > It has been superseded by the PROVIDER API, so use it instead
> > > > > > for OPENSSL MAJOR >=3D 3.
> > > > > >
> > > > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGIN=
ES.md
> > > > > >
> > > > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --=
strict]
> > > > > >
> > > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > ---
> > > > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-----=
--------
> > > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++---------=
---
> > > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > > >
> > > > > This seems to differ from what is upstream by a lot, please docum=
ent
> > > > > what you changed from it and why when you resend this series agai=
n.
> > > >
> > > > Hunks are arranged differently, but code appears to be identical.
> > > > When I apply the series to v6.6.83 and compare with upstream I get:
> > >
> > > If so, why is the diffstat different?  Also why are the hunks arrange=
d
> > > differently,
> >
> > He appears to be using "--diff-algorithm=3Dminimal", while you probably
> > patience or histogram.
> Hi, Jan,
>
> I tried --diff-algorithm=3Dminimal/patience/histogram from the upstream
> commit, they all give the same result as this patch. But Sasha said
> the upstream diffstat is different, so how does he generate the patch?

Hi,

I don't know how he generates the patch, but with git-2.43 I get noticable
different patches and diff stats for minimal vs. histogram. "minimal" one
matches your v3 patch. I don't know details of Greg's workflow, just offere=
d
one possible explanation that would allow this series to progress further.

$ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
 2 files changed, 138 insertions(+), 58 deletions(-)

$ git format-patch -1 --stdout --diff-algorithm=3Dhistogram 558bdc45dfb2
| grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  95 +++++++++++++++++++++++++++------------
 2 files changed, 139 insertions(+), 59 deletions(-)

Regards,
Jan

>
> Huacai
>
> >
> > $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 =
|
> > grep -A3 -m1 -- "---"
> > ---
> >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
> >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> >  2 files changed, 138 insertions(+), 58 deletions(-)
> >
> > Should be easy to regenerate with different diff-alg for v4.
> >
> > Regards,
> > Jan
> >
> > > that's a hint to me that something went wrong and I can't
> > > trust the patch at all.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> >
>


