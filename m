Return-Path: <keyrings+bounces-1779-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098B933B12
	for <lists+keyrings@lfdr.de>; Wed, 17 Jul 2024 12:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD2BD1F21ADF
	for <lists+keyrings@lfdr.de>; Wed, 17 Jul 2024 10:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649F13BBC5;
	Wed, 17 Jul 2024 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="HY4PEGoc"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18AC335A7
	for <keyrings@vger.kernel.org>; Wed, 17 Jul 2024 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721211587; cv=none; b=FATuxu36dnjmuu/0brPozpYt5zVMxcMbMyLPCu9ufLEMDUX2zqvIiZP9JZpBJo+rl3LJGXODeoFtBxZ3xyiH++9SIO74bzUoE67Ryb3VHruY3p+3PGBWjgLGdg3Q7U0X0G5c4Un1jALV8PYj9Fa5x4r+xT+LoxX6b8OQ1gmylc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721211587; c=relaxed/simple;
	bh=dmPrErveI9QrEh/ALH738QNw0Bhaor1QfQBU+noYS6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXiPHIQpjUKoZKvvzLj8eUFo9Drt1a7uneqIQE7uiWv3CA6prbcpJk0z+QlEvs0pg4n25boEQIC8Y79GzF01XDdgMuyX9KHWD7oiS5VC0aVAmZ3lr7EYYPaHT8pJF/ckqhnzNYK1paaO4DiHPhYHUKt2L9JAX5MoCE8Qask1zdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=HY4PEGoc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e9a920e73so7457229e87.2
        for <keyrings@vger.kernel.org>; Wed, 17 Jul 2024 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1721211582; x=1721816382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmPrErveI9QrEh/ALH738QNw0Bhaor1QfQBU+noYS6o=;
        b=HY4PEGocempt1P+ryYqkk1AM94AKzkbBNlvkmAgPPxSq/ij3kfJi7J3Av0koHdXFhN
         w7uWUY6P2bEVeF0C83d6uAbHwfzjtT8N5wZI9RffbRinSidZnyMU5g5kvYXRNDeJ0MUX
         BHr3axV37gQ+cGC5uBiIhHTgMprM3GUXbg+jYyQCaK/49YWI2M6m0QFy0mat/yrqk9js
         AZZBjvShvCOcL+oBImJW+he3oXWZbkQ/i6+1m0izB6RPQJ7TFbWLhAL9ajTyV1MrT/9h
         jFGVkEZKsr0CD4t6e/tNwHwSO0JQ7Ckv4vy4+ep+JBzOTeCHyVVDEDElaZtLG1AYij0t
         r1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721211582; x=1721816382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmPrErveI9QrEh/ALH738QNw0Bhaor1QfQBU+noYS6o=;
        b=Oml2nhlyZL7w68hI8ycchjaFSXQNasXmBi4NiUhg8GEKKxIjATFgvdiuHG+u+gbkNP
         vMCyTKPPycHszNrkaecXvHvQkV3F2u/sJVr34/hyE5CTtt1xikq4Tn3FFzkiZ0BsfcBR
         iPFKKvj/hVvRPI7zh6DPrt3KVAo/jCI+o1aCY/VrOUxpI19+oJupE22VcznnR1fw+bF6
         OSn7RwrX+sdHKYToo2XJ4tbfRXckoq6pYqk+A6rPOwFH1Tlt8kZQz2WO3D1peNEWtk2w
         AbBtYEFgElJa94+/csMvIBIUWov/h2T03/axgbP/xqF30FmZ/+q0MOuMoB2RtnBFK5St
         9Ywg==
X-Forwarded-Encrypted: i=1; AJvYcCV4QyMBBLUE9PPtHdbidbeh4j4YMty9jPlZRhQ8U0HBuKnK4hBgg0337sOJ9AGxSzm3QySpPmUQR8pMtxHjSqdoQ2x0KLfM6dw=
X-Gm-Message-State: AOJu0Yyt4Pkutph1FfbBZD2RSckjSvHGA+LCN4xEJjufHLCBFJOT7RYb
	M1wvqFIwKQaAEfgQrfaezVlcUEfMs4uQbjYrUAE/1gVT1+H7jTtWs/m+Is8ehlA=
X-Google-Smtp-Source: AGHT+IEag26CiKDtnt6JUIWKttV5gz23VEY2V5rBdKxFWabZZE7cd1oBzs2oKhgA0HlG8qxYhwdSaA==
X-Received: by 2002:ac2:4e10:0:b0:52c:d834:4f2d with SMTP id 2adb3069b0e04-52ee53bbf6amr986059e87.18.1721211581711;
        Wed, 17 Jul 2024 03:19:41 -0700 (PDT)
Received: from blindfold.localnet (84-115-238-31.cable.dynamic.surfer.at. [84.115.238.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm164072005e9.12.2024.07.17.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:19:41 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: David Gstir <david@sigma-star.at>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, Richard Weinberger <richard@nod.at>, upstream@sigma-star.at
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH 1/2] KEYS: trusted: fix DCP blob payload length assignment
Date: Wed, 17 Jul 2024 12:19:39 +0200
Message-ID: <2351895.22IY78Rhhi@somecomputer>
In-Reply-To: <D2RQC1H7N1JI.1W4JT8FI0R8L4@kernel.org>
References: <20240703125353.46115-1-david@sigma-star.at> <D2RQC1H7N1JI.1W4JT8FI0R8L4@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Mittwoch, 17. Juli 2024, 12:07:58 CEST schrieb Jarkko Sakkinen:
> On Wed Jul 3, 2024 at 3:53 PM EEST, David Gstir wrote:
> > The DCP trusted key type uses the wrong helper function to store
> > the blob's payload length which can lead to the wrong byte order
> > being used in case this would ever run on big endian architectures.
> >
> > Fix by using correct helper function.
> >
> > Signed-off-by: David Gstir <david@sigma-star.at>
> > Suggested-by: Richard Weinberger <richard@nod.at>
>=20
> You cannot suggest a change that you author yourself.

Well, I suggested the change, not David.
So, I think you're implying that David's s-o-b cannot be before
the Suggested-by tag but after?
=20
Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT
UID/VAT Nr: ATU 66964118 | FN: 374287y



