Return-Path: <keyrings+bounces-1556-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF78FB8F8
	for <lists+keyrings@lfdr.de>; Tue,  4 Jun 2024 18:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A3D31F21DF4
	for <lists+keyrings@lfdr.de>; Tue,  4 Jun 2024 16:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A401474D9;
	Tue,  4 Jun 2024 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfKXckxj"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F624135A51;
	Tue,  4 Jun 2024 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518633; cv=none; b=OeCSkQBZMpiVagHX2ayFuw5qmglo87Ttjlk7gnyMIGVZqFtcvJgIXIwQvYa1/AZMPTklUkXImrpyCHzwJMIWOruGkL4O7oXYyxq1GAWvOei9aQjvnpg04bLqiFiozt0ho0MEsdTOEIi1gNBMcxzHKeNsMmVnIhIp36l8vuVFs8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518633; c=relaxed/simple;
	bh=VYfxBurXHxczP7ZhLOxXOA47hVbiObZ0mU1zWkMrQyQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=f6Q9tf+mhxe3nmk+yNftRDL8Vur40Blt9YyH6XueWLPIrAr+nrQByMC0YVEYaN8MngyCMWP4N1Kx/KvcaMYe/7J4dmwPfNlXbs6a+zDpP01W4hYYmYIRgg/zhoqv1S91gFf9m3HpbgEqwN1mfmb4SLQU0XFUVOqqDb/W36UatbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfKXckxj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126E3C2BBFC;
	Tue,  4 Jun 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717518632;
	bh=VYfxBurXHxczP7ZhLOxXOA47hVbiObZ0mU1zWkMrQyQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=qfKXckxjQLUqiYOxFkKaC03gn8b9ipaeDRcL6JGuedSSW5cOK1snl8pAGCLTwfltl
	 kWfLOK2/E3ee29537Gn3hX2MWiKlzSR/gWOy3/zgQjDlMyukkrDuZFqcLznwbpRrrE
	 Stz/BhKKTY/1Ns2bH8Wh+5vzeXu3XhiT0rUgFbUS8og3IWNcxvbvadyQgwq2ir0OgY
	 fACud7eB8Hn1NyVv4R7OvtiAvM6oOIAaYFORPwk5w7F6G6S6hT4hZ3fybbbU5J8yqW
	 epTmfBNGwLBZcDzcBX9Ka5kgIX8NcT+qp8BxyDhnq/zHi2J/+hdGQl/HdaB9ADblWQ
	 D8BE5g+I2TftQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 19:30:29 +0300
Message-Id: <D1RDJHOKPWC2.HFDE4WLHATVA@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>
Cc: <linux-kernel@vger.kernel.org>, <lukas@wunner.de>
Subject: Re: [PATCH 0/2] ecdsa: Use ecc_digits_from_bytes to simplify code
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
 <D1MPWI6C2ZCW.F08I9ILD63L4@kernel.org>
 <435d756d-2404-4f66-9ce3-363813997629@linux.ibm.com>
In-Reply-To: <435d756d-2404-4f66-9ce3-363813997629@linux.ibm.com>

On Thu May 30, 2024 at 3:16 PM EEST, Stefan Berger wrote:
>
>
> On 5/30/24 01:08, Jarkko Sakkinen wrote:
> > On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
> >> Simplify two functions that were using temporary byte arrays for
> >> converting too-short input byte arrays to digits. Use ecc_digits_from_=
bytes
> >> since this function can now handle an input byte array that provides
> >> less bytes than what a coordinate of a curve requires - the function
> >> provides zeros for the missing (leading) bytes.
> >>
> >> See: c6ab5c915da4 ("crypto: ecc - Prevent ecc_digits_from_bytes from r=
eading too many bytes")
> >>
> >> Regards,
> >>     Stefan
> >>
> >> Stefan Berger (2):
> >>    crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits arr=
ay
> >>    crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
> >>
> >>   crypto/ecdsa.c | 29 ++++++-----------------------
> >>   1 file changed, 6 insertions(+), 23 deletions(-)
> >=20
> > BTW, would it make sense split ecdsa signature encoding to its own patc=
h
> > in my next patch set version and name it ecdsa_* style and put it to
> > ecdsa.c?
>
> I would only put it into ecdsa.c if functions inside this file (can)=20
> make use of it, otherwise leave it in your file.

Yep, that specific part has no binding per se to anything related to
TPM2. It is also dead easy to detach.

Here I would suggest to take a similar angle as with CRYPTO_LIB_AES so
that it is easily and directly callable from either side with no fuss.

I'll mangle it that way at least for the next version and we can see
then how it looks like.

BR, Jarkko

