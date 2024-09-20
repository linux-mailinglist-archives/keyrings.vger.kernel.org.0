Return-Path: <keyrings+bounces-2109-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7C97D783
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3BAA1F21E0A
	for <lists+keyrings@lfdr.de>; Fri, 20 Sep 2024 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482E113F454;
	Fri, 20 Sep 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="KdzG15aP"
X-Original-To: keyrings@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E025F4ED;
	Fri, 20 Sep 2024 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846472; cv=pass; b=Jy8/HDtBUiB8ZrtNSDdcRepQaYY7vCnMqWxXmT7CxZ4lvFJlKj1CR9FC5QfMLmDzgFtNQAhIIYxLxK5JbjL5Q6513rhXrRKlA1+/dZhH8CCUECA4sG2vqIFcdwzKzXGyj/z+GnoSlAJA1EAJdLEb2HoTbc4VswdkAVxVGrjlZG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846472; c=relaxed/simple;
	bh=gbyIZVZnbcw7+bZPXXeG07noug9qNa0booEz2wBF6JU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=t4W/ZCNYNRO7bnT+aSBdiA94mXfbUBPqQ6IMETrhXCtwOSZfSFnrUMqpNkm3oDzqekmuJlhv7H+kXIMUB4tThmn6nLXYfgNZV6vu+s1iNk5S8IJXGWBhLL2KBE0YRy9Bu102DS+5JnYHHwop79iki0N1ceFocsxx6uFQCL6FRk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=KdzG15aP; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (83-245-197-106.elisa-laajakaista.fi [83.245.197.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4X9Gdp58hCzyPT;
	Fri, 20 Sep 2024 18:34:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1726846466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMSeBKczlfKSdUKSUaROX2phkD9MdqepiGiKR31Gj68=;
	b=KdzG15aPW4EcKfRGSq5P5CrV0tf1A2f1mdElokm8wRaE/FTG29OcXFd3/G9eKFFCbuEs+m
	NAOKCrhzmFBHwcYOimJB2sdjAairgJm15of4cEOnJ+zQzEbBalgsp0A8OykkboHSGFtq6o
	zvAkTF/lRwjIfsYM0GD8ZlmdJDpW2pw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1726846466; a=rsa-sha256; cv=none;
	b=qDc193Fm46QPiNEJ51JYG6LYeKRqA6UiA1vZEtdG+LGiACLQOg1UftjsXdMSKJaHwJC2nx
	ssysaNPsRfAscwloftPfP2/NrB6ttWfbHUE5AAwGP+z8HN18f0VGIEUH0i90Wkt6nm6FQT
	aoCAqJfCh5+GEPt0iVL9RMKjEcdQwiE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1726846466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMSeBKczlfKSdUKSUaROX2phkD9MdqepiGiKR31Gj68=;
	b=Emkzlh3IuZI8+Jxzf9Zgmh9ufCZUkhaV2jzKd09u+mCu0hmyJypGBnxxOOiGK8h8bEofIE
	YLo+jE16vC3migaqytD/NPzvKyAl9TRGFn0hMRucscKU/VlxAvnUBP+8mZkE5BTMAoWbdm
	EV1kMC6+u4ybFBX1mnUO0ao0Qxt49Ao=
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Sep 2024 18:34:21 +0300
Message-Id: <D4B7ZCR4XWCT.3TWNN24TA8PSF@iki.fi>
To: "Neal Gompa" <neal@gompa.dev>, "David Howells" <dhowells@redhat.com>,
 <dwmw2@infradead.org>, <zxu@redhat.com>, <keyrings@vger.kernel.org>, "Jan
 Stancek" <jstancek@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, "Asahi Linux" <asahi@lists.linux.dev>,
 "Hector Martin" <marcan@marcan.st>, "Janne Grunau" <j@jannau.net>, "Jarkko
 Sakkinen" <jarkko@kernel.org>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
X-Mailer: aerc 0.18.2
References: <cover.1720728319.git.jstancek@redhat.com>
 <27899413.1r3eYUQgxm@skuld-framework>
 <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>
In-Reply-To: <CAEg-Je_MXyP_PNj_QOu66SW_XYHy0zv0PnTTxX2qWELRG+xM_w@mail.gmail.com>

On Fri Sep 20, 2024 at 2:42 PM EEST, Neal Gompa wrote:
> On Tue, Aug 6, 2024 at 4:27=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
> >
> > On Friday, July 12, 2024 3:11:13=E2=80=AFAM EDT Jan Stancek wrote:
> > > The ENGINE interface has its limitations and it has been superseded
> > > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > > Some distros have started removing it from header files.
> > >
> > > Update sign-file and extract-cert to use PROVIDER API for OpenSSL Maj=
or >=3D
> > > 3.
> > >
> > > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2,
> > > openssl-pkcs11-0.4.12-4 and softhsm-2.6.1-5 by using same key/cert as=
 PEM
> > > and PKCS11 and comparing that the result is identical.
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
> > The code looks fairly reasonable to me and behaves as expected.
> >
> > I have been actively using this patch set for several weeks now across
> > linux-6.9.y and now linux-6.10.y with good success.
> >
> > It is in use in production for Fedora Asahi Linux kernels with good suc=
cess.
> > Thanks for the fixes. :)
> >
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> >
>
> Jarkko, could you please consider submitting this for inclusion into
> 6.12? I've been carrying this for three Linux kernel rebases now
> (6.9.y, 6.10.y, and now 6.11.y) and it seems to be just fine, and
> without it, I cannot build kernels anymore with the OpenSSL engine API
> disabled in Fedora and CentOS/RHEL. I also expect that the engine API
> will disappear on other platforms in the near future given its
> deprecated status and recently accelerated conversion of engine
> backends to the newer provider API.
>
> Thanks in advance! :)

Yes, I think I can. And I've yet to do 6.12 PR because I've been
busy sorting out perf regression in the TPM driver.

ERROR: need consistent spacing around '*' (ctx:WxV)
#66: FILE: certs/extract-cert.c:69:
+	OSSL_STORE_CTX *store;
 	              ^

ERROR: need consistent spacing around '*' (ctx:WxV)
#93: FILE: certs/extract-cert.c:96:
+		ENGINE *e;
 		      ^

ERROR: need consistent spacing around '*' (ctx:WxV)
#199: FILE: scripts/sign-file.c:114:
+	OSSL_STORE_CTX *store;
 	              ^

ERROR: need consistent spacing around '*' (ctx:WxV)
#229: FILE: scripts/sign-file.c:141:
+	ENGINE *e;
 	      ^
Any ideas of these? My guess is that they are unfixable and related
to non-kernel-standard code.

BR, Jarkko

