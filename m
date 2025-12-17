Return-Path: <keyrings+bounces-3673-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B4CC694B
	for <lists+keyrings@lfdr.de>; Wed, 17 Dec 2025 09:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA4C6300F31C
	for <lists+keyrings@lfdr.de>; Wed, 17 Dec 2025 08:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB7C22F76F;
	Wed, 17 Dec 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tKg28GRE"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418583168E7
	for <keyrings@vger.kernel.org>; Wed, 17 Dec 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959709; cv=none; b=NwpaeltlXw4Y5Jsdqj1s6whzgXl9bSzjzKeEqsNIIeej5l2bwvnDbXSpYA5/63nTZVVE9JDikkdS1x3CUQlyAddUkT3A1wI7zUhetGCX4+NIqsLPO0G3d/EDT6oE3VRJe4a7GzKOUtKWqmdTUp/pUnCFomVuvPh8NMCEH9g2Heo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959709; c=relaxed/simple;
	bh=WuQeI+WkXQSWQInmvdcHjxfQ36N4wXa/UmX/Y1u7BWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDkxeYY7I5Zp+1bPKzu4+5trt2OlTwezDvQ8O/nKSIbGeGRVUvhhzLePDq6do9rL9QMtmn3mISKhph9qpMebE0fiwFslf9E2R2LEZnFdL1QOualrSB8UlsbVQMB8XSn00VLFctFi93d5ekBvUpzSOpN+mOVu2RxLmIBaFl4Z3Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tKg28GRE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b73161849e1so1267496566b.2
        for <keyrings@vger.kernel.org>; Wed, 17 Dec 2025 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765959703; x=1766564503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
        b=tKg28GREQe5lulh5QpQRqYXGF/NStwtvQV/wsg7RPUMi5PZwIT8kfVKdqo83NPM54J
         1KerTy2h4+3tvbMX8ysqEA7rUpVCC+Ii+aDny/tIB6E3QUNXTCPCSew0Bs/F2hQ3ojUx
         aF3DQIaaywmS8xePYp9DtxBHL9pw6W9uP3eatkQX25U+n9FHWnGDVW2lcsgbhjGWeEpF
         n0KxcxSvPydtKAIeuCAW20YFG48YVsH0oDpFE3MVarShjFIfbgi34+LQzIgHH2cTuh+t
         SElz7H4lJ8YbuprC3vrWpJjTR5p8zh4i+hzMb58wcNU/mrHDS917566dJsiSsgzEYmMB
         /XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765959703; x=1766564503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
        b=LGMZE7hI9tViIodlW3acN/NrYGdv5i/cTgllKhRv7YxpS7s7sdJKVj40XUkjeQ7DHs
         7x6S6K+uzuZbIByuQsAzNoL47qxzTH4vXGNivnr3TppDAavaz43xcuV0k6Xac9P9G2Au
         uzcqP7S1jOevwCK9LVZb4hXptGJV1cDpDwnFhNttqqf3N3jp0T8Nu6m5mOnwop4xQxD5
         sDtABkpee+UFj5lu+JiCVLn1OcndYzgPIZeDqZsz2arn9yihWuxxB3iZgGeLomSr9YfO
         KD0O1PVltuAxozG8223FjwD310JE8B72hYUlq6I19eIORghdVYSimzXJzQ6yNHsi/Hly
         3r0A==
X-Forwarded-Encrypted: i=1; AJvYcCW7hB7k1O6AYK852offoK62HCO1MYfbrFkkkZQ7TL9aStzZU63kleRAAGIJQOA1Sx42PZcflX+w5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPlZBYBJ4ENKQfTz73JgoTP01QhVZ1yOF/UTZhzDrA8AOSlr0
	MbyTxqBeB5PiMlAqE+U4YNwwoh3iwJi7bbDHTEDzAPAvKksjBQ0lFnspufcifqvci0Q=
X-Gm-Gg: AY/fxX6IqCbt1r4ZhMorrKtywklUkNhMI12S534qOaSnByUtIC0qkg0q9LFOhHAP7tc
	BJcAPGDbKvIxDc5ALzxcnmgErE5NGaanWsaMqnIBs2nvz5wT3dHvlHQpFhG6O9wMCQ39BffzOpk
	nYu8SeVsryZohnqUpX4Su/+AsA2nust4LwqUkWk7jW3CI34T30uENrBxSxE4g6STlDPJFM22vYL
	XzTg4tCay1waD2ZUOQLwsBHovoFPOuyxyeciDqUqAjR1SRvfOILcSHyQmnNSQbE0E/UiC0+JqU2
	uuoL+FGPbF11kAM4CIBRJsadj8xKH0M1j1NU7zkrxIafUvkEYTmNpRoPZ+Had/luYwADcVZv52l
	MZtNI36/PyZtq6JLYglTNMmuoxuMzr3wNS5gCHFlWO3kbTFTbCUQxqn5RusBxhmYgXrgCqlYDEe
	6RmBorKN8oyPxst9PJ
X-Google-Smtp-Source: AGHT+IFCoak6awfsvNzuanPNEFvtnm4npy82/7GDiD4hlE+WRwlv0VOch5efQB3V/p3Rq/g2NEI9Nw==
X-Received: by 2002:a17:907:d94:b0:b73:5f5e:574d with SMTP id a640c23a62f3a-b7d23a89c52mr1790501866b.59.1765959703434;
        Wed, 17 Dec 2025 00:21:43 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7ffacd9192sm337793366b.70.2025.12.17.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 00:21:42 -0800 (PST)
Date: Wed, 17 Dec 2025 09:21:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
 <aUJh--HGVeJWIilS@sumit-xelite>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6kfp3quyfb6lwgz"
Content-Disposition: inline
In-Reply-To: <aUJh--HGVeJWIilS@sumit-xelite>


--p6kfp3quyfb6lwgz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello Sumit,

On Wed, Dec 17, 2025 at 01:25:39PM +0530, Sumit Garg wrote:
> On Tue, Dec 16, 2025 at 12:08:38PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> > > On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister=
 all
> > > >    optee devices in its error path (optee_unregister_devices())?
> > >=20
> > > This is mostly to take care of if any device got registered before the
> > > failure occured. Let me know if you have a better way to address that.
> >=20
> > Without understanding the tee stuff, I'd say: Don't bother and only undo
> > the things that probe did before the failure.
>=20
> True, but this is special case where if there is any leftover device
> registered from the TEE implementation then it is likely going to cause
> the corresponding kernel client driver crash.

You are aware that this is racy? So if a driver crashes e.g. after
teedev_close_context() it might happen that it is registered just after
optee_unregister_devices() returns.

Best regards
Uwe

--p6kfp3quyfb6lwgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlCaBIACgkQj4D7WH0S
/k7jZwf/S32gHxmpuL9ts6Dq9pI9CDW9KNDwfTzIptzaNQEofHnz2Ph9Ejs/bZAl
1skNWxxt2vGIVP016BxUqi9V0RyKNUV0GCk23ZMdeGE09A47y9N0bT00HDJrrZYp
FYCoNNwL8vICQzfAti/0+DHGI1uHwrXCwQWf/VaNggCAhb3eTCfcmUtogT7hhbtH
+6bLk0/LEYmrIg1pkq6m4Y4vxBOEwnSZVDa4/15mxJ7jExJeoQmha2Y2whq5WZtY
TEMgHL6KNg7ifbee+/Y0HUJizQ45rf4pJo2bvrbwXc+3KaEqfzNpD3jKVcKJSNBx
jL7uprws5c1kFtHG4vp8QjaZRNJtpw==
=trcC
-----END PGP SIGNATURE-----

--p6kfp3quyfb6lwgz--

