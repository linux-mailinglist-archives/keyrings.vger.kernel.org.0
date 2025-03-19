Return-Path: <keyrings+bounces-2489-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D1A69587
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 17:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF56016F0C0
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCE71E2843;
	Wed, 19 Mar 2025 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xa193cTt"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DE1E0B66
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742403202; cv=none; b=IN5BmOurGg0rmunnX6JbKb2Rs8qvpw83zGYSH8sPxopLxLnPK9MltUOCf7PaXweZ/iU9ha5P+Ynp2fdtgyzdOh099Fjw1L1/8TXsnfJude1qQycziGaojj/Zeczr7D9aJx0J/QErHYCXJ9fqvbtw6+8608//9hBKMsPEA7ZAL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742403202; c=relaxed/simple;
	bh=gZ91fGn4VM1jhjIigc/roNld//H+y2pnwO3JvtN5t1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUodD0Xl1HgPJV8Mzfsjcg8nQhUfFORDgk96z/vUIPObp15KlQnomNTw2JkQ8WQF2ojvAM9Ghbf81FNvfoHQgSWO7bGt5xKFv9+5PhSBT8Tu43zW2Ca+RBYZBmX4lK1ZDbWDwhV4016B2ZuHieqWXY4OEV3MD+FzCALQ2wRkVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xa193cTt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742403199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMYidfuF22qqOjt7R1FtIa+eC5SY/DINipfXYLFNQ3c=;
	b=Xa193cTtLwB6J+31fN+oeph9eGd+cvGcGoI+G+Ar3/BTKeEMfllAoXdhCauWJx/0hNdjeC
	AsxsXW8OnEXZALYm8ygHu41vSAkbpowr8HN6t783GZAoNHhyvfea+FcQ4vP2bSV3UfB/ud
	6laHbXx0CZZoJqlD03fh/7el54yTOaI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-KVJPzf0oNSilw85-SGWKiA-1; Wed, 19 Mar 2025 12:53:18 -0400
X-MC-Unique: KVJPzf0oNSilw85-SGWKiA-1
X-Mimecast-MFC-AGG-ID: KVJPzf0oNSilw85-SGWKiA_1742403197
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-86c428a6b92so1722645241.0
        for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 09:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403197; x=1743007997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMYidfuF22qqOjt7R1FtIa+eC5SY/DINipfXYLFNQ3c=;
        b=bcwCkjIEn5mJ7iVfh09fLzFjiB+cQoZqWL+Y4sZkRGQ8dSC22/oIsJEkj1FIarhfM6
         vwhnriIKPyZwNvl9TTpAZiheSTxJRZN7kHJtDNzqG0GV2qisitCDFiUI/Z0NO8j+Xllp
         WK9NC/5cV1hPDliSstFsFWdsna5HjkPzfhENohJ4M30jx6GTVHnTagFNgkqc23J+iBTf
         +BTOlkK5LnjvKfue1KEAjyltFXICRwEHzf7WjL6epbJ+ckVtmeZi6KKjtApRWuiHTiIs
         URO9F1XQx3H6qb3RTVPCjcu+xX976uAO9U/Onjbire53WGXXM0FykvhkquGnnAEI8wBt
         RcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFueqCi1n+FI75urUgbf3E0chYaNcBNFmTnniRVQSpLdPOr6swXNRIwvE1qzTPbgJo/360eztcug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy304t4HFdYvba2zIf/SoXFnPJE/f2+sXuaOtYFv5lvgw+LduPK
	+HmdEnOGebaHaEGBVEuQ3LnrkJSgQaUuFmLuN7mcZCfPe7YiGUojncTI8lamoVTQ7gmDw29Jqm7
	Lq6Gd/05SsYe8LFgYrbTwptqvZ5NKu8ZnphF4kTfGs2xXKCu9CF6AjxH857pJTNbt6lWQ6mR8aF
	8OntkkCOkOsYq/gZGscRp8D413zGiYMhQ=
X-Gm-Gg: ASbGncu14sWPkqn4c7tUzE9/BlKtXpT0Sr1uuDEQb5K4v/tADqe0VIIXtB9UixiXn09
	BsmUkBCKFp0gOJ3bZlMIcNZ6JF8UaY+K38qcjvIJS4QlrHheTpwr+VWBrQ8aU33Q2ku+w0/dp
X-Received: by 2002:a05:6102:c04:b0:4bb:d062:455 with SMTP id ada2fe7eead31-4c4ec2f2e0cmr3397553137.0.1742403197623;
        Wed, 19 Mar 2025 09:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBaHItzcn4FKUvbMcp1OcW2oWpcGSy2J17LaT6TvPL1Qm1q4Ep4ILwSlmKbFP+qP7MGksmGbNbt7PDdKxGz40=
X-Received: by 2002:a05:6102:c04:b0:4bb:d062:455 with SMTP id
 ada2fe7eead31-4c4ec2f2e0cmr3397539137.0.1742403197256; Wed, 19 Mar 2025
 09:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh>
In-Reply-To: <2025031942-portside-finite-34a9@gregkh>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 19 Mar 2025 17:53:02 +0100
X-Gm-Features: AQ5f1Jq9puc3zDkRAXP8CifSCOyuo9iakTiG2zcMin5No34Rk7G5vb8HVg7uT8A
Message-ID: <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > From: Jan Stancek <jstancek@redhat.com>
> > > >
> > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > >
> > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > Distros have started dropping support from headers and in future
> > > > it will likely disappear also from library.
> > > >
> > > > It has been superseded by the PROVIDER API, so use it instead
> > > > for OPENSSL MAJOR >=3D 3.
> > > >
> > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.m=
d
> > > >
> > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --stri=
ct]
> > > >
> > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++---------=
----
> > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > >
> > > This seems to differ from what is upstream by a lot, please document
> > > what you changed from it and why when you resend this series again.
> >
> > Hunks are arranged differently, but code appears to be identical.
> > When I apply the series to v6.6.83 and compare with upstream I get:
>
> If so, why is the diffstat different?  Also why are the hunks arranged
> differently,

He appears to be using "--diff-algorithm=3Dminimal", while you probably
patience or histogram.

$ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
 2 files changed, 138 insertions(+), 58 deletions(-)

Should be easy to regenerate with different diff-alg for v4.

Regards,
Jan

> that's a hint to me that something went wrong and I can't
> trust the patch at all.
>
> thanks,
>
> greg k-h
>


