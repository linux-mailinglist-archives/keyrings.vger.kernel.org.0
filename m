Return-Path: <keyrings+bounces-2037-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF172976F68
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 19:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CDF81C23700
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 17:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2156C1BF7EC;
	Thu, 12 Sep 2024 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnNvTxX6"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD981BE25C;
	Thu, 12 Sep 2024 17:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161290; cv=none; b=Fi/zGFc5hHdONlB1Fw7HqZh2zetcispvJ5Z1Rwyl80aHza1rTWMt999KYJ4uKjfLAmVSNYh7SDtJa9Crlq+x2/BCpKdWXbblDWo92J7++eez1kGWzi5ptt42lNVBFvqt4HWA8xig7ioyRA8xbqQ7hQWp8vmcc4OaQuLDtSGvXx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161290; c=relaxed/simple;
	bh=rv1KRQUc4V5e0StvAg5FcHMB1kJjMJp/Ufr6rb7z5TE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWc56OTq1QTE59Iv2qcERsaYIRR9+7p8Z+KEbFDiDq7a5erveVffJJVypC6c+0rVfFEu5Ty0PWhV82BjzQg2XCO6Rb6PxTUNKDHfYETiAePT3vW3rX4NO7gV12mjCeDMpziCxxDRw4k4abnRqKEPrl+UHnMACp3OE86qQHM7xOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnNvTxX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20418C4CEC3;
	Thu, 12 Sep 2024 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161289;
	bh=rv1KRQUc4V5e0StvAg5FcHMB1kJjMJp/Ufr6rb7z5TE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mnNvTxX6nyRu5NQ08snn8TtLnlZXwPiiTr6HSFeMI6Dzdk6mpFCmEh4gDq+168LvW
	 xkhm+gzsNgeiIpvOJwC0ZMSk51SHfXyHXwhok9a8QMeaeUknjplLRQBYohp9luB9JJ
	 zMaTMc/t8m/YchwVRh3i4+KvEKGARHxYFl96NM2AE6W16cfa/NJMtnJ8Vsx28dm4WJ
	 KfO/NuQeWPJrX76naoI5MXYENzNz+OWboD97bRXDGycY8YdwEfbSKj74yOwEquxlRV
	 oe7h5dCCseVE6qzFeSlgSQbaiD4Bapyar0CxsDDTlZaI9XBSByHWV/9H9mbw9AW/3n
	 iVIhd9CE8x7Zg==
Message-ID: <cb28e9344203ab68a13e0223c66fe256630c9f58.camel@kernel.org>
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger
 <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
 <tstruk@gigaio.com>, David Howells <dhowells@redhat.com>, Andrew Zaborowski
 <andrew.zaborowski@intel.com>, Saulo Alessandre
 <saulo.alessandre@tse.jus.br>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>,
 Marek Behun <kabel@kernel.org>,  Varad Gautam <varadgautam@google.com>,
 Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Date: Thu, 12 Sep 2024 20:14:45 +0300
In-Reply-To: <ZuMIaEktrP4j1s9l@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
	 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
	 <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org> <ZuKeHmeMRyXZHyTK@wunner.de>
	 <D44DDHSNZNKO.2LVIDKUHA3LGX@kernel.org> <ZuMIaEktrP4j1s9l@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-09-12 at 17:27 +0200, Lukas Wunner wrote:
> On Thu, Sep 12, 2024 at 05:19:15PM +0300, Jarkko Sakkinen wrote:
> > I try to understand these in detail because I rebase later on my TPM2
> > ECDSA patches (series last updated in April) on top of this. I'll hold
> > with that for the sake of less possible conflicts with this larger
> > series.
> >=20
> > Many of the questions rised during the Spring about akcipher so now is
> > my chance to fill the dots by asking them here.
>=20
> I assume you're referring to:
> https://lore.kernel.org/all/20240528210823.28798-1-jarkko@kernel.org/
>=20
> Help me understand this:
> Once you import a private key to a TPM, can you get it out again?
> Can you generate private keys on the TPM which cannot be retrieved?

It is for implementing TPM2 bits of

https://www.ietf.org/archive/id/draft-woodhouse-cert-best-practice-00.html

The main use case is to protect signing key coming from outside CA
infrastructure.

> It would be good if the cover letter or one of the commits in your
> series explained this.=C2=A0 Some of the commit messages are overly terse
> and consist of just two or three bullet points.

I keep this in mind for the next version. Thanks!

>=20
> The reason I'm asking is, there are security chips such as ATECC508A
> which allow generating private ECDSA keys on the chip that cannot
> be retrieved.=C2=A0 One can send a message digest to the chip and get
> a signature back.=C2=A0 One can also use the chip for signature verificat=
ion,
> but that's less interesting because it's attached via i2c, which is
> usually slower than verifying on the CPU:
>=20
> https://cdn.sparkfun.com/assets/learn_tutorials/1/0/0/3/Microchip_ATECC50=
8A_Datasheet.pdf
>=20
> If TPMs support unretrievable, maybe even on-device created
> private keys, they would offer comparable functionality to the
> ATECC508A and that would suggest adding an asymmetric_key_subtype
> which uses some kind of abstraction that works for both kinds of
> devices.
>=20
> I note there are ASN.1 modules in your series.=C2=A0 Please provide a
> spec reference in the .asn1 file so that one knows where it's
> originating from.=C2=A0 If it's originating from an RFC, please add
> an SPDX identifier as in commit 201c0da4d029.

OK this is good to know and I can address this as follows:

1. I explicitly state that the feature that in the scope of the patch set
   it supports the original use case (or at least how I understood
   David's specification).
2. It is probably then better make sure that the implementation
   does not set any possible roadblocks for the possible use cases
   you described.

Also one thing I'm going to do in order to have better focus is to cut
out RSA part because they don't have to be in the same patch set and it
is way more important to have ECDSA. OFC I'll work on RSA right after
that but I think this is the right order :-)

>=20
> Thanks,
>=20
> Lukas

BR, Jarkko

