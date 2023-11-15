Return-Path: <keyrings+bounces-77-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C25077ED559
	for <lists+keyrings@lfdr.de>; Wed, 15 Nov 2023 22:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9AA280E14
	for <lists+keyrings@lfdr.de>; Wed, 15 Nov 2023 21:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB0E39FC0;
	Wed, 15 Nov 2023 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGHyJ667"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB235EED;
	Wed, 15 Nov 2023 21:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10ECC433CD;
	Wed, 15 Nov 2023 21:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700082247;
	bh=RLgv+/x8PezTzgTf5EKWZ+43AZJwvZAtVguxZqC4KQI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PGHyJ667Xq042YZ3Mse9gMLBm31ojzt3yYgoEdCkeYyEzrdVgSR4yLYqsUH/x6MSa
	 IWFFKhlnrW3i6/x89VtXDbCMTqc4vgNTDVrDq3CBdDq+jlhGaZ5sX9/SyOBmHpA/jK
	 HRVGe5feDnWSB5jYML/2/SF4zDw2kAp8Qtrusj7YewDuNbVRWvlfjALOS7/TO0jK95
	 vGyPjEydMBUJBHTg79d2D+6+5B+QGzoXuosTN9mSFrZ4bDYEadxoUQlmWvKklK5mCB
	 nDXKoJ5vC7FCiTjTEwTo66ymkPtjcj5HJpKI8yTaum1zq1PglOkEcGLzkYox16yhXu
	 YPoZDlWQKFVDw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 23:04:02 +0200
Message-Id: <CWZOUW5A0LET.R8N9JGS5M1W3@kernel.org>
Cc: <linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, "James
 Bottomley" <James.Bottomley@hansenpartnership.com>, "William Roberts"
 <bill.c.roberts@gmail.com>, "Stefan Berger" <stefanb@linux.ibm.com>, "David
 Howells" <dhowells@redhat.com>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Mimi
 Zohar" <zohar@linux.ibm.com>, "Peter Huewe" <peterhuewe@gmx.de>, "James
 Bottomley" <jejb@linux.ibm.com>, "Paul Moore" <paul@paul-moore.com>, "James
 Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, "Julien
 Gomes" <julien@arista.com>, "Mario Limonciello"
 <mario.limonciello@amd.com>, "open list" <linux-kernel@vger.kernel.org>,
 "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] tpm: Store TPM buffer length
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jerry Snitselaar" <jsnitsel@redhat.com>
X-Mailer: aerc 0.15.2
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-3-jarkko@kernel.org>
 <4gyb46g6makecsv7mq67qdp5hilytpymvdbffz5q64tday5dva@wjg3achi5rrv>
In-Reply-To: <4gyb46g6makecsv7mq67qdp5hilytpymvdbffz5q64tday5dva@wjg3achi5rrv>

On Mon Nov 6, 2023 at 9:36 PM EET, Jerry Snitselaar wrote:
> On Tue, Oct 24, 2023 at 04:15:20AM +0300, Jarkko Sakkinen wrote:
> > Both TPM commands and sized buffers (TPM2B) have a fixed size header, w=
hich
> > is followed by the body. Store TPM buffer length to a new field in the
> > struct tpm_buf.
> >=20
> > The invariant here is that the length field must always contain the tot=
al
> > length of the buffer, i.e. the sum header and body length. The value mu=
st
> > then be mapped to the length representation of the buffer type, and thi=
s
> > correspondence must be maintained.
> >=20
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> >  drivers/char/tpm/tpm-buf.c                | 36 ++++++++++++++++-------
> >  drivers/char/tpm/tpm-interface.c          | 18 +++++++++---
> >  include/linux/tpm.h                       | 10 +++----
> >  security/keys/trusted-keys/trusted_tpm1.c |  8 ++---
> >  4 files changed, 49 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
> > index 88ce1a5402de..8dc6b9db006b 100644
> > --- a/drivers/char/tpm/tpm-buf.c
> > +++ b/drivers/char/tpm/tpm-buf.c
> > @@ -18,6 +18,12 @@ int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 o=
rdinal)
> >  }
> >  EXPORT_SYMBOL_GPL(tpm_buf_init);
> > =20
> > +/**
> > + * tpm_buf_reset() - Initialize a TPM command
> > + * @buf:	A @tpm_buf
>
> One minor thing I meant to mention, did you intend this to be &tpm_buf li=
ke it
> is for tpm_buf_append?

Yep, thanks. I'll change it to &tpm_buf.

BR, Jarkko

