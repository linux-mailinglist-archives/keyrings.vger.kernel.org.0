Return-Path: <keyrings+bounces-1444-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C07898CE33D
	for <lists+keyrings@lfdr.de>; Fri, 24 May 2024 11:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30A4FB22686
	for <lists+keyrings@lfdr.de>; Fri, 24 May 2024 09:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0528527B;
	Fri, 24 May 2024 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExULWq+D"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FAA83CAE;
	Fri, 24 May 2024 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716542288; cv=none; b=M6aHf5pHaNOmqDil1hPhwsZPZk8vHQSquTKM11Rf87uc9e6hzosU7jgcayrC2YBh5pdymULOakclbQDFEWoOZ9YnZ5PTeTMs5rlu3joX5DXYwNFJkBNyOcJ1aZlaNsFWnMkPR9IvtDiyV/AOrj5XWXIApcKT1RQ3SDm06oj+Iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716542288; c=relaxed/simple;
	bh=QXBDfBTQ6SvU3OzM7OF0LeXsDtpvLic3l/yHUSbrv1k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GlpqX4gMQv26qzvE60/EoOuO6z927TeQ4eHAGC5a7+YoyZEy6I82riRjA1qbrMm+V3JUuevz7t1auhaeveWU1FR684hAjPz4ZlF+GzuWrZXroNM78S8bzsUbvm6Bo5jNyDu7k2WUnBRM6DKYcGX06XpB05tjq95jrCT/Fc8axqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExULWq+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AB7C2BBFC;
	Fri, 24 May 2024 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716542287;
	bh=QXBDfBTQ6SvU3OzM7OF0LeXsDtpvLic3l/yHUSbrv1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExULWq+DL7Ly/Ig2hnMERo7+ZkvZmbbWtBtxkrorvBTAEKfsu8yFcozaoFf9ijVK3
	 bYEZoYytcdQ7vFGojzIAts9UoMaanm6d3EFvwiQPxbm9lwUNcJkxrDs5WIk8+i/c+l
	 JGsaBiXRZZsyPjoZSKeIT2rcntP+i9rzApp7VXtnt8X7DMQ5sfYmAuNTQLHJbBDFKw
	 fEDoXLyOMUBlJXLZ+FCRNs0vyNHLdi/Mdn5STjyhCJVVmwmxN9lnHynaHbsHahpjvh
	 FSqeD1Ct+YkRkdZfPT/Q4vOihui6jGo7cK4pmKI0j2I1S52bO9LD7+DHntoSA0MO84
	 y008KspEcz8eA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 May 2024 12:18:02 +0300
Message-Id: <D1HRGEEB313K.NFAX1EFJKJPU@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>
Cc: <linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <Andreas.Fuchs@infineon.com>, "James Prestwood" <prestwoj@gmail.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Eric Biggers"
 <ebiggers@kernel.org>, "James Bottomley"
 <James.Bottomley@hansenpartnership.com>, <linux-crypto@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] KEYS: asymmetric: tpm2_key_rsa
X-Mailer: aerc 0.17.0
References: <20240523212515.4875-1-jarkko@kernel.org>
In-Reply-To: <20240523212515.4875-1-jarkko@kernel.org>

On Fri May 24, 2024 at 12:25 AM EEST, Jarkko Sakkinen wrote:
> ## Overview
>
> Introduce tpm2_key_rsa module, which implements asymmetric TPM2 RSA key.
> The feature can be enabled with the CONFIG_ASYMMETRIC_TPM2_KEY_RSA_SUBTYP=
E=20
> kconfig option. This feature allows the private key to be uploaded to
> the TPM2 for signing, and software can use the public key to verify
> the signatures.

Since barely v6.9 is out I wrote over night also tpm2_key_ecdsa i.e.
ECC/ECDSA based module :-)

It was a good idea. I realized e.g. actually documented in the API
fact that I should return -EBADMSG as legit undetected. Also found
a memory corruption bugs.

I renamed extract_pub to probe because that made me sort of realized
the role better too. Some of the code could later on put to up-level
struct tpm2_key but it is not a functional requirement.

I.e. top-level does raw parsing and then these modules check each
that if this is for them (e.g. ECDSA) then eat it. Otherwise, pass
over.

I did do some rudimentary testing and it seems to be quite good, and
my pattern seems to work. I.e. different modules for RSA and ECDSA
fit well how asymmetric keys are probed and allows to do as a sysadmin
appropriate configuration for the use case.

My biggest concern is undocumented parameters API in akcipher.

BR, Jarkko

