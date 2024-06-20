Return-Path: <keyrings+bounces-1637-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00C910DAC
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 18:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821EB1F22497
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491101B3F04;
	Thu, 20 Jun 2024 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ODwvZO3o"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EA1B3720
	for <keyrings@vger.kernel.org>; Thu, 20 Jun 2024 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902482; cv=none; b=pGvxE/vGjUAR/jI+I3TrQ8ZcHtA7Jd2kjiN5+E904c+2zKaAV9UiiZVoHC/+CY9ldTUf0Oe7pjU8U95nPdU0kG+5zESib56ZOw/+gD7h76INbZShaFU+DZ/gDOmp4zndfPYtX16Vf4nuifzc2+L9+FMTy2KqpYgHP1nhShqOjL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902482; c=relaxed/simple;
	bh=Wqp9vZOjGXxNeztCTRhZXaV/kM8U5SAYlJJa2Su7aFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CncMk/W1Jhe1sH/LKebTDvMVlMMlyPhR1jv4M69VWzaep/1tSZTlFPG73iYhTvxp/3R0XSSVkvRlNwMaJTuE5T5bEAg14VDGNDvtR29DFL3GS+RRv2bool0HTSVbUNXRxrIIxy113b+VXat2u39VgqDCo15spmqvKkLW0d14nNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ODwvZO3o; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff26b612a9so1006375276.1
        for <keyrings@vger.kernel.org>; Thu, 20 Jun 2024 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718902478; x=1719507278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU32yJqLVWlauO1MOjGbdfeZvhkP3RdEVxn5gIXcZPk=;
        b=ODwvZO3ogo2UMLwhPrtupguu3JIurgoLDcMxA3oKU5Abw+okdMRfgtCpGq/ZXLgioB
         uOrWl3X5Nx/efGnBlUSulgfd1mMyhre+nyHhLGGWqQZLYDcjzsR/P3Z9/JlNPEDopCSt
         clKO17sS7CI7lKviTQzMbOF+eQyR9ZsZVz1fwZsszoAdTpRvKmPWLrNWge3HgVIYGrVi
         W1tHg6pRNkmKQtgr2XBVMJZNBjbHi1iFyaoG0dIGmdc9ydgy3CC+Qw0F+/sYAuIfd1pM
         UyY2j6tb97KGh8EWdo7ooBHSuX5ETEyz8HAdf4dsJMQPIGQjW8wcIGZg4qOuQctnNEi/
         TB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902478; x=1719507278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU32yJqLVWlauO1MOjGbdfeZvhkP3RdEVxn5gIXcZPk=;
        b=Q8AlaTjbFbSRzNyObu7h8ank9bJ+hxqX2KRe+4Vr3rLmsOwh6DY2Q/TIu7eBYLemD2
         wjWnWzhpZiNfGsL5FQzkLa1eokZ7EVW9zerZylGqt4uBw6SYodPmIGjw3G39rR4F+BgY
         c/ieACXmGTVQP1tp6WhCeLfxKrIGDFIE0a8Te211DoewY7qgJF15mybXNDZAX6JZdkkE
         JCYhmCjtvmc6VRpFuFCmhmQu765LGn4zxhLLNgYq5vq2NFRDACZH+mLYNyJ5MsPhA0lM
         Q1act5hzKTgDjQMZDrugj1LUj4mdjrcYhDwaFH+xVi9k4SHSg1xeMSNPu3acV+T1+0xT
         n2Og==
X-Forwarded-Encrypted: i=1; AJvYcCUCITFL1Rk8zDuh/TEmnjUH0GKbSlD9msvlQSJVFDfCCf99xc+PBmmaGLB1Upq2D3XJJp8sUUA7N2xbY4sxBEDxRWXUQSr1Kas=
X-Gm-Message-State: AOJu0YzvgPPH9p4MF6Klkkgcnest/6ZqAB3P/6zu3RyucIHV33sK13em
	sUexXoxCLpkEFj69N0FBxZhc5TkWgPIVj2l9x/N0gGH2K6392eGwamrJPHEqLKpI3duGQX8CYFm
	TY075w5lBIwamjDgh9emAQEswvIu6EM7akKEW
X-Google-Smtp-Source: AGHT+IF13BHpoNYPwS4PQPx7j7170Xyxvk6ucDaOXGDhfaS1JKo7NId9A6sAy7bCJmw3neQ25h0P/Cwv0uX6xpzNWNQ=
X-Received: by 2002:a25:7442:0:b0:dfe:3e88:3649 with SMTP id
 3f1490d57ef6-e02be13b1e3mr6638405276.20.1718902478328; Thu, 20 Jun 2024
 09:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606-md-trusted-v3-0-42716f15e66e@quicinc.com>
 <20240606-md-trusted-v3-1-42716f15e66e@quicinc.com> <D24EWHXV14EM.S0NQ3H51R892@kernel.org>
In-Reply-To: <D24EWHXV14EM.S0NQ3H51R892@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 20 Jun 2024 12:54:26 -0400
Message-ID: <CAHC9VhSVSS46oCAz_NrUUGstmG3j0NVk70-SwwtCTVJ-R1Z+OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] KEYS: trusted: add missing MODULE_DESCRIPTION()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 8:19=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> On Fri Jun 7, 2024 at 4:47 AM EEST, Jeff Johnson wrote:
> > kbuild reports:
> >
> > WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted=
-keys/trusted.o
> >
> > Add the missing MODULE_DESCRIPTION() macro invocation.
> >
> > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > ---
> >  security/keys/trusted-keys/trusted_core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/=
trusted-keys/trusted_core.c
> > index 5113aeae5628..e2d9644efde1 100644
> > --- a/security/keys/trusted-keys/trusted_core.c
> > +++ b/security/keys/trusted-keys/trusted_core.c
> > @@ -395,4 +395,5 @@ static void __exit cleanup_trusted(void)
> >  late_initcall(init_trusted);
> >  module_exit(cleanup_trusted);
> >
> > +MODULE_DESCRIPTION("Trusted Key type");
> >  MODULE_LICENSE("GPL");
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Are you planning on taking these patches Jarkko?

--=20
paul-moore.com

