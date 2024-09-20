Return-Path: <keyrings+bounces-2111-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73797D9F1
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 22:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 143191F21FC5
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 20:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B703D18452E;
	Fri, 20 Sep 2024 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fi94N8eT"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2337181B82
	for <keyrings@vger.kernel.org>; Fri, 20 Sep 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726862774; cv=none; b=riSXPYSg5ds0G9fjGFaPfWRnSBcy4251daWzTNuadcXXuCWQaTPteEStdFUhkscHcVzrnnBjijWsdTMJ0Ti1+vFgINZ2iZvCKvS3VCuUhNEUcuWWHN+VbBIkP52ysxOtUBSLoaM7V5umomgMVjgZt2qcxLGtOPup4AEU91xwr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726862774; c=relaxed/simple;
	bh=CBzB9DegP9xT4r54u9lCf8GGxVgSTyGf0f4wQB/TSB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdxcleXQfYGsgIBin3urVxHQhUpBF5bQ2nU26x4/BtausxDKaaSoq7o7HNz6+2AQZ5hNPgUHhQFTpGVP/rZrzKtrTEe2UJ83N0V19lYHylBmwUeFir8IRa+0jpoU3o7R5jEuePncmy5YxpDI206P9cG1U8Ma+0Lj/d0fMklFWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fi94N8eT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726862772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B12ZD5DrYH7h8WzDfAk/iI3QEtMDIKemU/ORBWuCezM=;
	b=fi94N8eTmpuEf/SVlbXiGz3hHwRxur099eRfDU+byiQUaJt8ZEcVSXQL8qdpDKLQFigaOr
	w8CFReJxmR5g6AMAuORIU2+b0C7Ee9XQo2oljpenfkkDaSi9GXMEAKVjZdA8wwf97A89R1
	+hV6nyVDbkXuHg/gyYycQhON6IVVpnY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-ysLH3ZUNPdieGL0xjofsmQ-1; Fri, 20 Sep 2024 16:06:10 -0400
X-MC-Unique: ysLH3ZUNPdieGL0xjofsmQ-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-277e1146be5so2534598fac.1
        for <keyrings@vger.kernel.org>; Fri, 20 Sep 2024 13:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726862770; x=1727467570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B12ZD5DrYH7h8WzDfAk/iI3QEtMDIKemU/ORBWuCezM=;
        b=F50IjDsQ2XynlsA5dI6CtK6RKGldttlv1CAh7VG/7l5jPlS371i6QZZlskz+HKe9Hy
         ahXG39aeU3ZZnRylJDqpnmwChInfKGToc/I+Oihs9FQPmFGU0D9TNhQkA3aCyHtNmKnQ
         9o50ilaGW//AAc+UDZL28zC1OXPvxzvtO6+kkoDytuDDYUMc44zvIfhsgIGRE1UQApji
         1zpdHzs02YkZVxo4KpbpGStOzdij4Jo9HZhJ1djo1BTF9tQ36JxuJxp2cLdnUiP7FZtt
         DJIlBawxLPZu4HwK++TBCDf9In2US4Lpir1ot1EHxHrPD0o4LMB4grYaja1IBR/bzlN5
         45Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXbfFLXoO+bXkVDyy2H+Ybaxke7InvEBJSVVhhpe78BT0V6CC9Fgw9EbaILm3VdQ35w/ic4Z3tcXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxphKWFHirmgM8jt4wGWqDuCt02dcO7+arIXYIZvVm0QR+dCgTK
	mFaGq16265Cujt8ISFQ3ZMWsvnYwJBh6e08lEzr90y4B0yxm9c2qSd9qox145Etqt5Q+beQkO6w
	Y01s2imsIqrA9wa68rEVPGrGOLHlHLnuorD/nymNooA8cByEKv+ObXdntCkLwb3J76jnaVOXEXc
	Q5VO12GbeohXX7hPNTqS88LHW8e2b2aeI=
X-Received: by 2002:a05:6871:3386:b0:261:16da:decb with SMTP id 586e51a60fabf-2803cf16e10mr2878961fac.11.1726862769926;
        Fri, 20 Sep 2024 13:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzLMErzxKrlp5+s01Bs/w34iga0hgVQrzjiKIRpy3VgDl8ZH9K2nNWMJDRDpc/rwlHypFpOm8CN4+mcEVsWpU=
X-Received: by 2002:a05:6871:3386:b0:261:16da:decb with SMTP id
 586e51a60fabf-2803cf16e10mr2878942fac.11.1726862769636; Fri, 20 Sep 2024
 13:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720728319.git.jstancek@redhat.com> <27899413.1r3eYUQgxm@skuld-framework>
 <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com> <D4B7ZCR4XWCT.3TWNN24TA8PSF@iki.fi>
In-Reply-To: <D4B7ZCR4XWCT.3TWNN24TA8PSF@iki.fi>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 20 Sep 2024 22:05:51 +0200
Message-ID: <CAASaF6zhiDdbfYkgg7wENih2Lp309eUgeu=FHZm0yYaEBt2gRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: Neal Gompa <neal@gompa.dev>, David Howells <dhowells@redhat.com>, dwmw2@infradead.org, 
	zxu@redhat.com, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Asahi Linux <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 5:34=E2=80=AFPM Jarkko Sakkinen <jarkko.sakkinen@ik=
i.fi> wrote:
>
> On Fri Sep 20, 2024 at 2:42 PM EEST, Neal Gompa wrote:
> > On Tue, Aug 6, 2024 at 4:27=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrot=
e:
> > >
> > > On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> > > > The ENGINE interface has its limitations and it has been superseded
> > > > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > > > Some distros have started removing it from header files.
> > > >
> > > > Update sign-file and extract-cert to use PROVIDER API for OpenSSL M=
ajor >=3D
> > > > 3.
> > > >
> > > > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> > > > openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert =
as PEM
> > > > and PKCS11 and comparing that the result is identical.
> > > >
> > > > Jan Stancek (3):
> > > >   sign-file,extract-cert: move common SSL helper functions to a hea=
der
> > > >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line=
()
> > > >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=
=3D 3
> > > >
> > > >  MAINTAINERS          |   1 +
> > > >  certs/Makefile       |   2 +-
> > > >  certs/extract-cert.c | 138 +++++++++++++++++++++++----------------=
----
> > > >  scripts/sign-file.c  | 134 +++++++++++++++++++++------------------=
--
> > > >  scripts/ssl-common.h |  32 ++++++++++
> > > >  5 files changed, 178 insertions(+), 129 deletions(-)
> > > >  create mode 100644 scripts/ssl-common.h
> > >
> > > The code looks fairly reasonable to me and behaves as expected.
> > >
> > > I have been actively using this patch set for several weeks now acros=
s
> > > linux-6.9.y and now linux-6.10.y with good success.
> > >
> > > It is in use in production for Fedora Asahi Linux kernels with good s=
uccess.
> > > Thanks for the fixes. :)
> > >
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > >
> >
> > Jarkko, could you please consider submitting this for inclusion into
> > 6.12? I've been carrying this for three Linux kernel rebases now
> > (6.9.y, 6.10.y, and now 6.11.y) and it seems to be just fine, and
> > without it, I cannot build kernels anymore with the OpenSSL engine API
> > disabled in Fedora and CentOS/RHEL. I also expect that the engine API
> > will disappear on other platforms in the near future given its
> > deprecated status and recently accelerated conversion of engine
> > backends to the newer provider API.
> >
> > Thanks in advance! :)
>
> Yes, I think I can. And I've yet to do 6.12 PR because I've been
> busy sorting out perf regression in the TPM driver.
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #66: FILE: certs/extract-cert.c:69:
> +       OSSL_STORE_CTX *store;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #93: FILE: certs/extract-cert.c:96:
> +               ENGINE *e;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #199: FILE: scripts/sign-file.c:114:
> +       OSSL_STORE_CTX *store;
>                       ^
>
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #229: FILE: scripts/sign-file.c:141:
> +       ENGINE *e;
>               ^
> Any ideas of these? My guess is that they are unfixable and related
> to non-kernel-standard code.

This looks like false-positive. Following will produce same error:
+#if TEST
+       ENGINE *e;
+#endif
+
$ git diff > 1.patch; ./scripts/checkpatch.pl 1.patch
ERROR: need consistent spacing around '*' (ctx:WxV)
#10: FILE: scripts/sign-file.c:217:
+       ENGINE *e;
               ^

total: 1 errors, 0 warnings, 10 lines checked

but if first type in #if block is something checkpatch recognizes,
then it reports no issues:
+#if TEST
+       int i;
+       ENGINE *e;
+#endif
+

$ git diff > 1.patch; ./scripts/checkpatch.pl 1.patch
total: 0 errors, 0 warnings, 11 lines checked

Regards,
Jan


