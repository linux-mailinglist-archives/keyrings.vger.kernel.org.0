Return-Path: <keyrings+bounces-1856-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFA94633A
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 20:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7D861C21AA9
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 18:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AACD1547C0;
	Fri,  2 Aug 2024 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NH9xcces"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0301547C7
	for <keyrings@vger.kernel.org>; Fri,  2 Aug 2024 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722623259; cv=none; b=e0GrOMVTgYSgGAErOLmEE9tiYVPAQvmXtLPx2T92huqbDJDqQXaNHkG8LM9IjHuWV7GfinLeALDpHa4VxIgBRyGEdsDTsCLENH+HinJsez/tp2HP8dxxF2NAmQvjEPQDxSQ8uMC4ry9u9sEvEUCNtbCvm3ODGbd0QVA/V+1SyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722623259; c=relaxed/simple;
	bh=KFqyW8VyRJjw06PhvyHoMLnwuQfZyKEuICjCjT51uEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q80Kd3B26Y081PiWQC+pdJyE57vSRAbKJl+KDgrydXfiL0jwKhHw2oSMqD4UdOJfbLht1XXlJ7AtmGirgyqfkU/s6FolEVs7BDqBTQ8a2Iwz9sLgP0LWLcLBrnwkipxOUMK6vshqvlQ567P/6YGgW4VvnJIq6ydv37zjbxukiIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NH9xcces; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722623256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+dmxbpR/4oI0waxMPR+7txTP17MN5O29+dFvBWzm2c=;
	b=NH9xccesBBU+s3wZSCdsFlt1fM3QTEm228b1pfqFDWb6H+N/75vHaJSFOUBX9XyH0jbnNW
	COaSsxcUSSyABdyNVoh7D88y7xtHWkPnbxVwtrCwGB1FWxaytzTRXdVS79RTnNrmHz8ak7
	DQXUSYzNN3rpYUHiuU2T2+zAyyJtMcQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-5L-v2JzWN1Cz8qovcjlnHw-1; Fri, 02 Aug 2024 14:27:35 -0400
X-MC-Unique: 5L-v2JzWN1Cz8qovcjlnHw-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5d5fbe16046so4586157eaf.1
        for <keyrings@vger.kernel.org>; Fri, 02 Aug 2024 11:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722623254; x=1723228054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+dmxbpR/4oI0waxMPR+7txTP17MN5O29+dFvBWzm2c=;
        b=KQKwFDQWjbtfeMAcyvYVE7w7aufoC1fwm5gceUahjCoXL2Pp2YvbdNhfmGp27j5eoj
         IM5oWuZcnDkr2jN6ZUkET3nH4PG4LzR4Yy8nKpXsR2YokB1+8Dny4gVQKZIoxnUcOO/q
         RiUe9qi39AnNTBdBetwR2TRi6HuTu/E3BGGpVAMbSK2B+MBoMQUUUmscJGn5bxwdt6Hs
         Qjrl6skh9kqGFNoGTDQTbQP8eycW3oF4dZr1LjumDv4U//bSAP+zRGAK7t9gKE88DCd5
         IPjLAs1m21FdvcKTGRmEX/gU/tUvPTr+CpXP7YgLEDgnIHyFLE6MqF368O4K7Ui7mp+L
         FArg==
X-Forwarded-Encrypted: i=1; AJvYcCWuMR4whQy+neq6J3I07kgB5oIIhMiEusAmfs8hGMs1SOF6Ub3qTZFgbaG3sP4wMxcUOkQxmfR+QdRPKVMpeAYQTM1xghrUVzE=
X-Gm-Message-State: AOJu0Yw/yQkp9kzipBiIwcanL4bllgudX0U1kHQJke1ZqJrJaKqAQh8k
	hijxxxEKYCpoPrCga/CQTIotXsFE5rr7VOWSgScV1maIFKxbFM3ubS93hvVVtYEPs5t1g5qF8rg
	dzaLt14rZcvpXJUtgj8+75wqA7w0xT1H+y7MpinO1r8Hj4mES9chU1iNECjDyHiqxmJBGCYEwzH
	D9E6FhdWSJcK9klGURhS4ev/xPb8/54HA=
X-Received: by 2002:a05:6820:1ca5:b0:5d5:6733:ca74 with SMTP id 006d021491bc7-5d655447235mr5848286eaf.2.1722623254717;
        Fri, 02 Aug 2024 11:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFtCTI5Ag8OdAPcqoLtAhD39boEqLL1L+HG0du0LU4QnQm3qLHoDKEpABDmRlfk5HP1Adkn+xvxE0B6HhjP40=
X-Received: by 2002:a05:6820:1ca5:b0:5d5:6733:ca74 with SMTP id
 006d021491bc7-5d655447235mr5848265eaf.2.1722623254458; Fri, 02 Aug 2024
 11:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720728319.git.jstancek@redhat.com> <Zqzarrjxrt8A5QE2@gondor.apana.org.au>
 <D35ME25EZWYG.2G7BARLXC4UOO@iki.fi>
In-Reply-To: <D35ME25EZWYG.2G7BARLXC4UOO@iki.fi>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 2 Aug 2024 20:27:17 +0200
Message-ID: <CAASaF6zA4MDZ-jW8OCp6WrrKD_QkxFrA5CUCtZV8JzyXdr9Orw@mail.gmail.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, dhowells@redhat.com, dwmw2@infradead.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 8:07=E2=80=AFPM Jarkko Sakkinen <jarkko.sakkinen@iki=
.fi> wrote:
>
> On Fri Aug 2, 2024 at 4:10 PM EEST, Herbert Xu wrote:
> > On Fri, Jul 12, 2024 at 09:11:13AM +0200, Jan Stancek wrote:
> > > The ENGINE interface has its limitations and it has been superseded
> > > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > > Some distros have started removing it from header files.
> > >
> > > Update sign-file and extract-cert to use PROVIDER API for OpenSSL Maj=
or >=3D 3.
> > >
> > > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs=
11-0.4.12-4
> > > and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comp=
aring that
> > > the result is identical.
> > >
> > > Jan Stancek (3):
> > >   sign-file,extract-cert: move common SSL helper functions to a heade=
r
> > >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
> > >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D =
3
> > >
> > >  MAINTAINERS          |   1 +
> > >  certs/Makefile       |   2 +-
> > >  certs/extract-cert.c | 138 +++++++++++++++++++++++------------------=
--
> > >  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
> > >  scripts/ssl-common.h |  32 ++++++++++
> > >  5 files changed, 178 insertions(+), 129 deletions(-)
> > >  create mode 100644 scripts/ssl-common.h
> >
> > Adding Cc to Jarkko Sakkinen <jarkko@kernel.org>.
>
> I can download this but is it likely that there will be v2? If so,
> I'll hoold on for that. If not, I'll download it.

Noone requested any changes to v1 so far, so if you can have a look,
it would be much appreciated.

Thanks,
Jan

>
> BR, Jarkko
>


