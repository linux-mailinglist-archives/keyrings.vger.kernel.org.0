Return-Path: <keyrings+bounces-1443-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018768CDCC6
	for <lists+keyrings@lfdr.de>; Fri, 24 May 2024 00:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EFA1F24DBC
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 22:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B89127E3A;
	Thu, 23 May 2024 22:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSnhl9Z0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F682D9A;
	Thu, 23 May 2024 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716501771; cv=none; b=mCXQRFyPiv7ZgkD/0zQEPD5UB4+wqp/b5g3L8v53PNnLeozvls1d3vsvNBjhe39Cz1zsZlocG/q6+MGR/sPDl00HaT6FgFOVn340kMSfXaI3q1n3qajbErXn+yf6tLcZmnJi/UZ/LsuKBZEcVT4OsbbXdbK259IIG3/s7J2+wQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716501771; c=relaxed/simple;
	bh=MkxHSfTiHM+Phs6yvFjdnUfl4fNZsmBCrS3G4WLC9yA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RrJ7FeeMY7yMfqwqeRMltpjPDdXVOyjPPrTDdA8MA3DrHWwOz1VuKhdWbLymgxQw8SSkm2gCOLDTf0FUaRClPAxOAWDcfw4V/VrecRsygAun2fXm21cSptp57bizpg/BEiECSd4CJ3Jt0pvKd39Megt7s3weGrmMq6sk48ZqtuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSnhl9Z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0648C2BD10;
	Thu, 23 May 2024 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716501770;
	bh=MkxHSfTiHM+Phs6yvFjdnUfl4fNZsmBCrS3G4WLC9yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSnhl9Z0jhBQu9KzKaFJyVrRTIFvATUsrIKLnfrcI+nx/QP8EQVlnfLmfeRUaSo4B
	 8jvghvNNpuKcMsGWXeHfR68oat6DzbfT6y70dFzveqgCeQetzMU+cRh/p/viAhSaA9
	 uJpgD2B7BdvLcWupM62XOQrxC7N9DpEezCmrPrwaEHalXGRCh05Y/39fRgMpN9xz87
	 Eg5xR34cupGUvqHq2Qqh8VedsEQmEKmtFz+IBjlAL3u1Qm47fkWJswh5Ma7cDiyMtC
	 ssi+CishOGjcDohlUr15JO6D27+/PI089/R4Cf0YIIdfrDgXpdsTpEbyzvqZQIXKE4
	 jd22eg6ekW+6g==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 May 2024 01:02:45 +0300
Message-Id: <D1HD3CW2C38O.3DTAGBUHF8AO9@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>
Cc: <linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <Andreas.Fuchs@infineon.com>, "James Prestwood" <prestwoj@gmail.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Eric Biggers"
 <ebiggers@kernel.org>, "James Bottomley"
 <James.Bottomley@hansenpartnership.com>, <linux-crypto@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "open list"
 <linux-kernel@vger.kernel.org>, "David Howells" <dhowells@redhat.com>,
 "James Bottomley" <James.Bottomley@HansenPartnership.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Ard Biesheuvel" <ardb@kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: Re: [PATCH v5 5/5] keys: asymmetric:
 ASYMMETRIC_TPM2_KEY_RSA_SUBTYPE
X-Mailer: aerc 0.17.0
References: <20240523212515.4875-1-jarkko@kernel.org>
 <20240523212515.4875-6-jarkko@kernel.org>
 <D1HCLFMAEXX5.17QYXMTZQCRYE@kernel.org>
 <D1HCVOZ1IN7S.1SUZ75QRE8QUZ@kernel.org>
In-Reply-To: <D1HCVOZ1IN7S.1SUZ75QRE8QUZ@kernel.org>

On Fri May 24, 2024 at 12:52 AM EEST, Jarkko Sakkinen wrote:
> On Fri May 24, 2024 at 12:39 AM EEST, Jarkko Sakkinen wrote:
> > On Fri May 24, 2024 at 12:25 AM EEST, Jarkko Sakkinen wrote:
> > > +	/*
> > > +	 * ABI requires this according include/crypto/akcipher.h, which say=
s
> > > +	 * that there is epilogue with algorithm OID and parameters length.
> > > +	 * Neither size nor semantics is documented *anywhere*, and there's=
 no
> > > +	 * struct to hold them.
> > > +	 *
> > > +	 * So zeroing out the last eight bytes after the key blob seems lik=
e the
> > > +	 * best bet, given no better (or any) information. The size of the
> > > +	 * parameters (two u32's) was found from crypto/asymmetric/public_k=
ey.c.
> > > +	 */
> > > +	memset(work, 0, 8);
> >
> > This is a mystery (or nightmare).
>
> This is from akchiper_alg documentation:
>
>  * @set_pub_key: Function invokes the algorithm specific set public key
>  *		function, which knows how to decode and interpret
>  *		the BER encoded public key and parameters
>
> No struct, no size information and no description what they are used for.
>
> Can we get these properly documented? My documentation at the moment
> is grep and kprobes, literally.

That said, zero issues with the interface, just pointing out the
part that is not right, and should be fixed.

I mean I have three layers: this, rsa-pcks1 and rsa. How I can be
sure that either of two layers below never ever up until sun melts
will do any changes that would break, with the data that I put
there? Is this a contract that will hold forever?

This is concerning so I have to point this out.

BR, Jarkko

