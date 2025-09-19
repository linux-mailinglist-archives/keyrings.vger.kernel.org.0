Return-Path: <keyrings+bounces-3044-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7ECB8B523
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 23:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899C93BCF46
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 21:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995032C11F1;
	Fri, 19 Sep 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="N5ZHmvb8"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E0223702;
	Fri, 19 Sep 2025 21:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316839; cv=pass; b=Ew9YUz2k/PYHG3jb/z4HmkplYEB33gtw6W3Mjc4hj/IPZhWQXHT/EXsf6kngmG+XXjhlFi4i2YH7YP5arnN9HGFQzpViD9nSpCKsuyqx0IVGmYQiGfhuOLKahw6/cfWRZ3/i7lFq4XigbjdMNw3ajbPwncTFwiAo/NaCDBp4yvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316839; c=relaxed/simple;
	bh=et7a0xIBeTVDYV6MTLXeECVFQkoVbXTTzVLxvFUQstQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqBomVl8dFOPvRQj7blE/IY3NdKlTe3gxs3zdNIckGc3+hyPN2IyT9QATKGcCOx7qm9Nn2L1tXfIUsyxAI3iXJ2lKhrohgFi8WcDBu+tszBfypE5DBVFDxK217CV8pfLhrtSmBW+EH32OaG2nIW+jzuMRJoB5z/n+UZrkp2eoew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=N5ZHmvb8; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1758316833; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G4j2I9OVl5BPNwLQ3yV4z8Hj70ZcrJeei6XyIgvmKZM2M2wEkIigu6T8x7dkznhQH+
    BWA4VG2z2BVLNN6nqM8Z1gQlrvcyRVKQgvQcGiJwpGiYHpGlz4cMrPLXVntSjptZHa0D
    Xm/7KWNbrxaGIAK6HS4SPQ+RV+wUEEAqUj83jMpacwM2xKg/bMq9lIRobs/HfNY/D1un
    jdGzoVKrWzRB54MVX6o2H112pHmxn3a0y7WDRVbwa/9ZctS7JvHKbWrCB273c4PXyqZR
    xLBfz79fLuZNRYV+G9V8YedtEmLldlq1i0MP/uRLdmg54zk7Qn5EYzzM3UVyzvwy99F7
    JdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1758316833;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vmheLRMDygrXWpSVmbnURUE2CG296RLm+NPL4yIwudE=;
    b=l6bXmkGnDElMl/256UFdkklSwYbvuHq2B6Yoqqr9TtooZjxV3Jhvl+3fJnSLJR0daB
    29pLPQh1L1teZRbBc2hQehXry3dBtZYaOYsxxuJucjCGyb1xX7Q/yuiDmvGF1jqqbX3z
    VeswnhqngXx/ap0sBJJZGvTxt9fN3UGa+WHviCj8qqPzdnM3XQL/J2cNbVtnw9ftutSG
    CGNDvbX1HjfS/muyMnvx30UdW1wN22D3B1AqZFGOmB64ipHICfstCoSQS0RrM4q8yPgV
    INxqoZSVMWdqgZcGgbaLD23Kz499eCzvoVZ03HXqxyxvP3aGHbSF/MyIeGd9zj4NA6QC
    prCg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758316833;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vmheLRMDygrXWpSVmbnURUE2CG296RLm+NPL4yIwudE=;
    b=N5ZHmvb8L2/6MzYtBXU7zVyUa96OQlicjdls2hJizBamT7bB3tvlwlMMDmmdsElmJA
    l0DEF7bpznyrDFQPtFLC4xn7vnJPlXUcVpLWPocD1k1Ex6U3lx5vaRuBImxPWKS0IgmZ
    r34SpnLp5rUer4PRZolAK85NOi2bu/9zDGHM2gRCXXePxWl1/jLLsoOhGe5CA7HAYd8q
    iD1uUNq679qMEWeQ+I+ekpbUeIe1RzqXz1ufOVdXwA6KGTnj0KP0I95VRb5XDzEW5tpP
    8R/QF3TDPhSMYVU0ZFqC0E+kNzlULay+HHDD9SrPwEavCwft1miDQDMZjhpC4ASjpX/c
    QdBw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zmwdP57PWmc+BP1jdA=="
Received: from tauon.localnet
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id f01e6318JLKTLOw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 19 Sep 2025 23:20:29 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Simo Sorce <simo@redhat.com>,
 linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
Date: Fri, 19 Sep 2025 23:20:28 +0200
Message-ID: <3030391.1BCLMh4Saa@tauon>
In-Reply-To: <20250919204749.GB8350@quark>
References:
 <20250919190413.GA2249@quark> <5078839.1IzOArtZ34@tauon>
 <20250919204749.GB8350@quark>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 19. September 2025, 22:47:49 Mitteleurop=C3=A4ische Sommerzeit =
schrieb=20
Eric Biggers:

Hi Eric,

> Yes.  But I'm still a bit puzzled why there suddenly seems to be
> interest in a FIPS pre-operational self-test for SHA-3 specifically.
> lib/ has had SHA-1 for two decades without a FIPS pre-operational
> self-test.  If someone actually needs this, surely they would also need
> it, and have already needed it, for other algorithms?

I just answered on the FIPS requirements as I interpreted your question in=
=20
this regard. I am not saying it needs to be added here.

I am currently a bit confused between crypto vs lib/crypto with its FIPS vs=
=20
non-FIPS support. That, perhaps, contributed to my answer.

Ciao
Stephan



