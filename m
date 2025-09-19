Return-Path: <keyrings+bounces-3037-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51366B8A5BD
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 17:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C225F7E55CE
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 15:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2F031BC9A;
	Fri, 19 Sep 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="HbJCcQnU"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA87731A7FC;
	Fri, 19 Sep 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296471; cv=pass; b=o5THEbtYyOMy8B65qrxM9K/lKZWegk4kx020XDPiLfxNEKCeRbPA3iJZPSy2eMsHELEZIGf6ujt1MbSkLx0nPP0n5RUeS51JZprojhAE+ps799S0n3e915kmdQ4ze9LuvtNaK3X3bzvijkt/h/BJxzrj72ojl/1AOAYeTku0d2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296471; c=relaxed/simple;
	bh=dLLSUAplUoNQA5aiUeRF8Hi4vrmrWMWmQNmpzTQouB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoAubqLUU/1JXKBYf2/NQxjdr8TIPpyRyZw5OZey5zd4VqmRJYHQxkxRHw49yYr4vTpI8ErX70TOk+6CFS85eEMUV128BVYqT8HV1fC22+lmNCl00/pqzsXt4QtZw2ugVjdR02VGiuAtFAyvIP8me9BtRMw6+PdzX8FkGgs8xFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=HbJCcQnU; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1758296459; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oFUxzum3+k4pMRPF8QasaDiIl/DfcUGpzA66TBK54wPmhBn33p9+vDPfkOOckU0WeZ
    2TxD8dZOXPVQMnGm5ZHy/iPSaSYxzT0WuOfiJSD8BKvJrMmwSIiBR5hh43P+lNh4fauY
    rpAVht70EjvPThIbZt3h0rZ0NOwDjlKRbIocIOVfBzh9wAzP3JQSNQB3lTL7YFOdy9Pk
    x207yhaOxE9bVPX8P9oAKzz7nTrlaIJSZHso5ZiXYhDClub/O4nL4wy6AJq6HJPjpHSK
    xvv91X1r8EHXG/5Vkw5QW3DB3R3WxjXN5gBJnojzqZB6H4Zjr5Vtzr6YEx3N4B6To5hu
    TZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1758296459;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=dLLSUAplUoNQA5aiUeRF8Hi4vrmrWMWmQNmpzTQouB8=;
    b=ihwRcnLIU2v2/la6jyElIqZkdukehFjDAzpOfdHU8tujb4zvlntfU7N7M9geMV4kAg
    acIpIRpka3i2aEm7ZEPYu9u2GkIFfTKG8rNDpNJAiAOQXNK72AOqYy/TFPtl4CUgP1cQ
    yDl7ceGq5slajDU8Kwn2w/p+6o191nQPgGn+99PTIQwJXUzWd+4v9Kd+SBilAMevbaBK
    mreq01j0BOmKykQs9sjFOHERRArYGpxpaNa1XW7VdmAWEydtk5wanjoJFMW0uToYhFfG
    HCW+6W+4+pXYMwcBVFytZqUYflTgIPjgHmv0ZrGszsYmJxnOTnyng1nRicHeilv1FyfR
    wAwA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758296459;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=dLLSUAplUoNQA5aiUeRF8Hi4vrmrWMWmQNmpzTQouB8=;
    b=HbJCcQnUyVtxC9x6tJjdJmx8dMUHUH2EKL9iTaAXnUvyPc9KQOMZS40LicIrHGdEsp
    mnJ79mckNbPcD0zXTal1rEotTvPB5iSonRZQZXh4e8Ai8mbmMJuv/yDWtYn0+9FeBmI+
    BpMD5KpW/wJpL8kuewnnzNitzT32z+idQ8UpRpxxtIxWoE59cdUHRclmIzwBCg25OJbW
    6dx9CN/RmKy+NF+ECgHwm+lSiNFcVp0MoClPeJ9vyRsNt+lNIBiL2yr3wvZvklfvkjMq
    wRWkDyCGk/VXPVHzDHN3Mb4zc7SAFQejpKwNQ9u7O+jsNKSAqn/2VhSL2t5U3Bk1ERRM
    +TaA==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zmwdP57PWmc+BP1jdA=="
Received: from graviton.chronox.de
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id f01e6318JFeuL0j
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 19 Sep 2025 17:40:56 +0200 (CEST)
From: Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>
To: Simo Sorce <simo@redhat.com>, David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
Date: Fri, 19 Sep 2025 17:40:53 +0200
Message-ID: <2400141.9o76ZdvQCi@graviton.chronox.de>
In-Reply-To: <3878472.1758296076@warthog.procyon.org.uk>
References:
 <2df4e63a5c34354ebeb6603f81a662380517fbc4.camel@redhat.com>
 <3788819.1758262666@warthog.procyon.org.uk>
 <3878472.1758296076@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=smueller@chronox.de;
 keydata=
 mFIEZZK4/xMIKoZIzj0DAQcCAwTDaDnchhDYEXH6dbfhyHMkiZ0HPYDF5xwHuMB8Z24SuXYdMfh
 pnovdsgwpi6LNAvnI/lGPrvDc/Mv0GQvHDxN0tCVTdGVwaGFuIE3DvGxsZXIgPHNtdWVsbGVyQG
 Nocm9ub3guZGU+iJYEExMIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQQ0LE46O
 epfGZCb44quXQ2j/QkjUwUCZZK6YwIZAQAKCRCuXQ2j/QkjU/bVAP9CVqPG0Pu6L0GxryzpRkvj
 uifi4IzEoACd5oUIGmUX7AD8DxesdicM2ugqAxHgEZKl9xhi36Eq7usa/A6c6kFmyHK0HVN0ZXB
 oYW4gTcO8bGxlciA8c21AZXBlcm0uZGU+iJMEExMIADsWIQQ0LE46OepfGZCb44quXQ2j/QkjUw
 UCZZK6QgIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRCuXQ2j/QkjU8HNAQDdTmzs+
 Cls6FMoFrzoWdYtOGCW5im7x1G5M/L0L3VOvgEA6m9edpqCc0irbdNXVjoZwTXkSsLOxs2t7aDX
 2vFX54m0KVN0ZXBoYW4gTcO8bGxlciA8c211ZWxsZXJAbGVhbmNyeXB0by5vcmc+iJMEExMIADs
 WIQQ0LE46OepfGZCb44quXQ2j/QkjUwUCZb+zewIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBw
 IXgAAKCRCuXQ2j/QkjU1pIAQDemuxTaZdMGsJp/7ghbB7gHwV5Rh5d1wghKypI0z/iYgEAxdR7t
 6KrazO07Ia9urxEAQWqi0nf6yKluD0+gmOCmsW4UgRlkrj/EwgqhkjOPQMBBwIDBBo6QjEMU/1V
 DD+tVj9qJ39qtZe5SZKFetDzXtyqRpwL+u8IbdIjv0Pvz/StziFMeomh8chRB7V/Hjz19jajK3C
 IeAQYEwgAIBYhBDQsTjo56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsgAAoJEK5dDaP9CSNTLQwA/1
 WxGz4NvAj/icSJu144cMWOhyeIvHfgAkG9sg9HZXGdAPsGzKo4SezAYCwqgFKnyUIAjKYl1EW79
 pSCOFS36heQvbhWBGWSuP8SCCqGSM49AwEHAgMEiEhJatNBgxidg8XJFTy8Ir7EsTCeoVY2vJAN
 rysZeAAmSaUWFD4pvXE5RYQFeCYTWTG419H7ocNGUz5u1dgKhAMBCAeIeAQYEwgAIBYhBDQsTjo
 56l8ZkJvjiq5dDaP9CSNTBQJlkrj/AhsMAAoJEK5dDaP9CSNTGCAA/A2i1CxhQJmYh2MwfeM5Hy
 Wk6EeWruSA1OgSWmaJaoGaAP4mARD2CviJgz8s3Gw07ZTk8SYHOTnv70hUbaziZ3/tjA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 19. September 2025, 17:34:36 Mitteleurop=C3=A4ische Sommerzeit =
schrieb=20
David Howells:

Hi David,

> Simo Sorce <simo@redhat.com> wrote:
> > I strongly suggest creating a test vector where multiple absorb and
> > squeeze operations are done in intermixed order, and then use that test
> > vector in your Kunit tests to ensure changes to the code do not break
> > this fundamental property of the keccak sponge algorithm.
>=20
> I'm putting such a beast in the module init function at least.
>=20
> Annoyingly, Eric's hash-test-template.h makes some unwarranted assumptions
> about the hashes it is testing - such as the final function zeroing out t=
he
> hash struct.

If it is of help, here is such test that I use:

https://github.com/smuellerDD/leancrypto/blob/master/hash/tests/
shake_squeeze_more_tester.c#L92

Ciao
Stephan



