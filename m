Return-Path: <keyrings+bounces-1858-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FC946426
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 21:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88695283B84
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 19:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9784D8A1;
	Fri,  2 Aug 2024 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Sh0sCuER"
X-Original-To: keyrings@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800B6D1B9;
	Fri,  2 Aug 2024 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722628461; cv=pass; b=YeA8jeQT9ZCYSHAsnsADoqtMWlMPBj5/CbyYWXv2AD3AMTM4K4yJYtgMsJ1Whkj+54g0JOyy/GUmIA+besyWGqS0yzYK6aibMW+0BCVdJMVxP6dLKET3x8xXUJz9BoNI47IvKfcOkNq9S84ACLJ9/aVawARagOKpHY40wo0etzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722628461; c=relaxed/simple;
	bh=iT6acgNgd5/PO8a0CzUf8rxOToX4TX3THEx4k2TYdF4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dFVZ94UQ6/r8f1+/bL8Ys9YIntDUUQg40f/alak6sLlpvaWAGragwvy4r7AdthfY1BG1ZNZhvTTG2TsyDt285z6jcscrlHP70IISdRNgoOazyw2BgCVFx3NuLuzWoHKE/0iGDwIteaP9XS3kF7c/DLw3/oRXEyAM7QH6mAtKEr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Sh0sCuER; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (91-154-92-171.elisa-laajakaista.fi [91.154.92.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WbGkH2ptWz49Pv3;
	Fri,  2 Aug 2024 22:54:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722628455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHK97y9FZ+Wa9pnrK8vjYPO/mSFFDETpIessOb3b9EM=;
	b=Sh0sCuERVfrbUKTYfjCYMrLOzOYh/umSCrSa5pigKk8oR33PPpo3Py6wZ968br81L6L+5T
	Wo/Exp5q9+85t1fzsyZomHHjkal8NOqb6FntbpQiQX1Ry6QMTSOIW+iHY9BbNQu2znaAof
	iUhUz9OGtCenDtfuJuQSvXtWuT8Vr+x1QxH2PbGtT1C7NY/Nq824js2YQlJf7xXKFXt96e
	k+tpn2Q6qSlIf2mO6lUU82r7kfMEWRocYajHVfVkp7aWLOVECCOxelhyXE2WT5KAisZtM6
	9mBg0h74fCP66OIWFnMn1td9AFWGyr3nJLVLBZBYylNZB3AC40nAlbZa3L6DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722628455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHK97y9FZ+Wa9pnrK8vjYPO/mSFFDETpIessOb3b9EM=;
	b=PA6pkgix2YVjOnnZFSK4TZPIKG5IjKAv82FXVcZWW8zS2bttDSiiH/AY8h0wB5RJyx38nX
	TzO1jlKX566ovAqZ5ph/6pUMzY6CJpaYSXLG936z/Lci0LbrsEj5vM/lifLsCPcv1J0piF
	Ctf3AzmvDsGjiHV3Ca/JKvWGwRtE1sQpEU8RCijclvkxTSKFGXeogzZU/xho3ZOEIkTYYn
	lMoEuWVFXmQijMgIRDScKSHFEFvbp3Evv1ClHLmFxgCK6LSNY8DT8rvSYoD+8NscLCLLy7
	Eoj9/78CN6kakxyPXuqhIw+vS24WTt2N9U9bEcbQGvghWXpDNIU1FC8BKhJJ9g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722628455; a=rsa-sha256;
	cv=none;
	b=vRI294C/zi2YRZKmvULdE3RnQ8exFQuO6c0aPrdBGvrdZeLY9hddxuoP2mgsDeIuXJW+Jt
	mfclQGqaT40Hgljn5zZnaJ2gHzI5Ms4avE+fw31bvqJm6fMHSX1vFlAHVrvUo2+DSoUKKB
	aImMaslpyhLJ/4dO5otlGnEwE7fUgvRhk16YMofk7uPj4IXsnVIQtgbV9XeEc40FrXVwk/
	toOIe51UYw3JYLUXg8lCJw1+xuzmouieEa3DlMEqtedkp4XUlG64eOwt4oP/HJLxIsymyQ
	Uy9gvxrzw9JL7ziQ2c0F1x01yHNvVhFypse+UgP3WEzy1M3Vo9s7aAu3CTiliQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 22:54:14 +0300
Message-Id: <D35OTMURG4E8.36GJXFQM6JR5C@iki.fi>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, <dhowells@redhat.com>,
 <dwmw2@infradead.org>, <keyrings@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Jarkko Sakkinen" <jarkko@kernel.org>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jan Stancek" <jstancek@redhat.com>
X-Mailer: aerc 0.17.0
References: <cover.1720728319.git.jstancek@redhat.com>
 <Zqzarrjxrt8A5QE2@gondor.apana.org.au> <D35ME25EZWYG.2G7BARLXC4UOO@iki.fi>
 <CAASaF6zA4MDZ-jW8OCp6WrrKD_QkxFrA5CUCtZV8JzyXdr9Orw@mail.gmail.com>
In-Reply-To: <CAASaF6zA4MDZ-jW8OCp6WrrKD_QkxFrA5CUCtZV8JzyXdr9Orw@mail.gmail.com>

On Fri Aug 2, 2024 at 9:27 PM EEST, Jan Stancek wrote:
> On Fri, Aug 2, 2024 at 8:07=E2=80=AFPM Jarkko Sakkinen <jarkko.sakkinen@i=
ki.fi> wrote:
> >
> > On Fri Aug 2, 2024 at 4:10 PM EEST, Herbert Xu wrote:
> > > On Fri, Jul 12, 2024 at 09:11:13AM +0200, Jan Stancek wrote:
> > > > The ENGINE interface has its limitations and it has been superseded
> > > > by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> > > > Some distros have started removing it from header files.
> > > >
> > > > Update sign-file and extract-cert to use PROVIDER API for OpenSSL M=
ajor >=3D 3.
> > > >
> > > > Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pk=
cs11-0.4.12-4
> > > > and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and co=
mparing that
> > > > the result is identical.
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
> > > Adding Cc to Jarkko Sakkinen <jarkko@kernel.org>.
> >
> > I can download this but is it likely that there will be v2? If so,
> > I'll hoold on for that. If not, I'll download it.
>
> Noone requested any changes to v1 so far, so if you can have a look,
> it would be much appreciated.

OK that is totally fine! I'm just prioritizing and postponing stuff
that I can (WHEN it makes sense pragmatically)  to get back in the=20
phase ;-)

I take a look at this next week.

> Thanks,
> Jan

BR, Jarkko

