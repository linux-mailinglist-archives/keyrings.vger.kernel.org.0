Return-Path: <keyrings+bounces-1854-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD09462CC
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 20:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D720E1F2151C
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 18:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED51215C126;
	Fri,  2 Aug 2024 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GpcdaXBc"
X-Original-To: keyrings@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3861AE021;
	Fri,  2 Aug 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621598; cv=pass; b=cUK9mrHD24KlzSMGhW2RAt6YK3urG4YYN1mlpts4NSRyYrtmXznQxAQ4fgDIn2A/gL96bFsXsPANb7dJG/hu+iJyrYminoaJwknkw1YWh3KtmVJkj+M+vw1vbZFabnEUhOCqek1mbCUiuk0AWPab8/pcLZByr03WEZ29071FL/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621598; c=relaxed/simple;
	bh=me/Eakw+xTK6kHsTdcjNAkhbWagQTE8xh0qLAPaNdcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=AVWd1hVGVPkDjuBMgvwdRoQbRP/8hrRP5EjtjPs1XBu/7xKySsBPRJxMnyc7ATBrAd0VPECKV6l6styLyOve00oBrKx6m3V8c8Cpx40k54IFt5ZaQ1bpQOq/ORmYlTcEhXa6yU9kdpwRoKn62fLP3JKPgjAAzALcAqV/OdaSjE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GpcdaXBc; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (91-154-92-171.elisa-laajakaista.fi [91.154.92.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WbDBK137Jz49Pv3;
	Fri,  2 Aug 2024 20:59:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722621594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNM1tIAU+W7tXSnmO+P1QhSHHf1UVmkplkL+yg4Ty4o=;
	b=GpcdaXBcYG65Kefw0GsK3uFYOnXU9vripZihswZqWkx8W6uiBJh2uI8O3d4S9q+0HmajNM
	ThrZ85Q5l7HRAfOOUU8YGw9RxP9EK9lS3ryWDpi+erHO5z88m+ntPQKDgpeMehtwV1W90f
	6r9AjkQmq7YSqj7SvWEu7G8X5hvCnARS3e2WDeY/MUYGzT4fQxMvFjwd35OjW/hQW+CmLL
	9CIa3tixYzYYOtculUovueFU2svtIqd7Bmlm9xi2Mk5NcBy7sPIDiNqazPlmsMs9h7VXwo
	0FBrkonObzxJJXqIhJjgH5o0tB3wnSmgenPKL6eVIz8fzQErCk4CDo9vuYEHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722621594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNM1tIAU+W7tXSnmO+P1QhSHHf1UVmkplkL+yg4Ty4o=;
	b=As1ySAIaKTGHO0t/zcxq8nLqRbgFf+JTpS9oDykaRaoTxJ7DQM5n0IV5/t4Ia38Nfc8est
	K9i8PuUdWzr9gwg1sMNCVjnX6OGNKkKE4k39NFQ0uL8AuIL1pqQbRObtx8iGUpv807kvUK
	wyIfo8iqAu7BMD6EsLPFhoV/AZYyE+OJU7d+gR42on5jwgpVGZ8BXu4pbe0iLvV0Z/24gG
	x60wcS8pegiiLqxCQEJYZdM7TNpfUsIzpmUUTFbRW6DtNbQVSMgJpe0eA5ExVI6hQogwuO
	T6qz5r1w+CJ98IICxXWPh2Li6ovmlh2st7kp+pnbap1RaNmvs2vSFKYz8ALg9Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722621594; a=rsa-sha256;
	cv=none;
	b=m+30M7KLmUT8wKUotCOET3JH1cy82jjb3cB3RoaKTs6wWIntwNKi46SHhZ0vzjQLD4I0tM
	UjfscsnW5FN6AVrOIyQ488QQCrw9gQbvda1kljUHQyqjSXqRmjAa1F/9f7sCcMNsPc9esr
	5Fa8VBDekGmdNPxeFdf1eODcVMgNhj/I7mWz9rz1bdL9aJ4yx1C/WST/j4KU5BYEd0LOmq
	pY35Ihcl/sqgvzQOQiptUSXLes2p5hyn7isfT3+ZKSWyZ89i1H82L4CrorMjtyFNqrQXkV
	bGVvSQcmsAiWaRwlYWDk5pVLOCdR1n4bi01/4FTYIx/4V22oeKeULeDuQ04sag==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 20:59:51 +0300
Message-Id: <D35ME25EZWYG.2G7BARLXC4UOO@iki.fi>
To: "Herbert Xu" <herbert@gondor.apana.org.au>, "Jan Stancek"
 <jstancek@redhat.com>
Cc: <dhowells@redhat.com>, <dwmw2@infradead.org>,
 <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jarkko
 Sakkinen" <jarkko@kernel.org>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
X-Mailer: aerc 0.17.0
References: <cover.1720728319.git.jstancek@redhat.com>
 <Zqzarrjxrt8A5QE2@gondor.apana.org.au>
In-Reply-To: <Zqzarrjxrt8A5QE2@gondor.apana.org.au>

On Fri Aug 2, 2024 at 4:10 PM EEST, Herbert Xu wrote:
> On Fri, Jul 12, 2024 at 09:11:13AM +0200, Jan Stancek wrote:
> > The ENGINE interface has its limitations and it has been superseded
> > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > Some distros have started removing it from header files.
> >=20
> > Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major=
 >=3D 3.
> >=20
> > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11=
-0.4.12-4
> > and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and compar=
ing that
> > the result is identical.
> >=20
> > Jan Stancek (3):
> >   sign-file,extract-cert: move common SSL helper functions to a header
> >   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
> >   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >=3D 3
> >=20
> >  MAINTAINERS          |   1 +
> >  certs/Makefile       |   2 +-
> >  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
> >  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
> >  scripts/ssl-common.h |  32 ++++++++++
> >  5 files changed, 178 insertions(+), 129 deletions(-)
> >  create mode 100644 scripts/ssl-common.h
>
> Adding Cc to Jarkko Sakkinen <jarkko@kernel.org>.

I can download this but is it likely that there will be v2? If so,
I'll hoold on for that. If not, I'll download it.

BR, Jarkko

