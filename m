Return-Path: <keyrings+bounces-2835-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A0AD92E3
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 18:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997D87B0C42
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 16:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B8D205AD7;
	Fri, 13 Jun 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="najrXMw2";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="p2LAhlLT"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1842E11B5;
	Fri, 13 Jun 2025 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832505; cv=pass; b=TKWUsrVTO5fSgU5WmXYpiZms7ornwYpix0wF9ATcGbKAgOhpnOmclrkCIEdeMf+u5SjC6w/ef1ShZ06ZT+fVBZPzYzRRf/+nM1o6ZvkxHt5rSoq3/GvfOFunxZiHxOkdxWiB1ZUSIjYIt6IVY0h+d3+SQ+05G+WkfU8Chc/+CTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832505; c=relaxed/simple;
	bh=JH7+5xcP0Gxy40aZWNJIxfN8DceUAl68OpLJLha0Qss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idE2JB9XRkaLo4n8RIuoDoW3Rx93FVq+Czz9QNKVtGrm0bfd+AgkaegJt87I+sqjZYj1e5w/nSOzWEKWnOkCVcd9+F8JN+ifu2ivICW6iL7QM8pa0fuSohybvBamD4WAOQj6HBWD4/XyWufW2fsefeDIQ//rOcNTnbi0DOzc2K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=najrXMw2; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=p2LAhlLT; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1749832488; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YEUIGp/kETBI6M2oLy+dhlduCnG1F194AG016SwkQHeKh4HLaVJXRsaYIM0UgMIO69
    w/nQXXBb1F4gAIq7ThOlX+oMw5ThXtG2ubJgwYz71I3RF/xkEe5IDFZFO1+UOybp+GrU
    AeOdoO9eCiyQBYbujA1RXMxeMoBCtgn/696mrdP7tPbNyLaaXPNUqYCKoy8KJehqLh+7
    PkbeRa4eYFj9fhR5dLBaQS5BfjP1CiEi+DPle1PAdkPqpTgk59DEVT62m54tsN5GeuQz
    pax4RZJCw6OL5B3f+7CCKqcgBf8X3qbKFS9PJIV7ErXgzkIN2SaFlnBp2FNcNHVk2jOK
    xThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749832488;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7ay36h4xp3J0JHjWRZu5rdj9y5vlRyjYR8YhExn3xUI=;
    b=OGk9EFcSNu4xyt9f6Lk1dESSWi5DN8DIE0zaHAzSi2Dp0mK6YIRkEmgd7iF6IVgIrE
    SG6CS2GApLkKrJU9fWP9nsfc1otA/WriPqJczVZ07e3BFjP0KbgZK6Jc066/C+tpqmcK
    X/9Yk2Rt75mhDafsQXPhQwihhv581gHmyQBCFtJV5ZCVRNezWqpztk1mTvNbsgFPul90
    fG8QP01S3QIaABmbaFfU58+IZuvUc6CLWrr+KS2pnxrrb6fpl8japOn1+q/HVlqk+9gU
    SiTnPU5og/jbKJA3VM+MwGvi1CzTi6BV87b6s3MjFmmd8b5fbnTCIMu7RBvBYv3KbJkT
    a2lw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749832488;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7ay36h4xp3J0JHjWRZu5rdj9y5vlRyjYR8YhExn3xUI=;
    b=najrXMw2MMFXu4+7P4o+wnKQsGj2uJTlbmLMLMEwn8gAlSIzdbgtrCdOnYBd99+KI+
    sl4Il0zJJolSo265Gf4OAfAokOgigZFO4v05AbqHjfVv83O6Hv09fy61EUVBmWN7td+F
    U6lzQrqqayoTbixcm8bJm5unM1tP4zwdyrMJhkcE5aT1CtIfMPeKESRQEPny5yS+sOVp
    6HyWTUGpblzXL9gCjQRe9m9zP1rRHtPzMQ3OYw/J2mou5t8SXtAHCBmdc0QnHNBdkWej
    vn7v7R8r0/yfNz9tM0y+ZxUACCARI79Lc2F/LkBw4CFJ4iF0CDHDkMd3JNO2v91Nrzu/
    qKJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749832488;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7ay36h4xp3J0JHjWRZu5rdj9y5vlRyjYR8YhExn3xUI=;
    b=p2LAhlLTCa+gMKHcYr86RN4e9cQeYSyoTMaeQDccLU6W0Lv5q3R0kK18SZhTsfJeWF
    EM2oiw/oYzen8dgWSDAQ==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYJfScBm5T"
Received: from tauon.localnet
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id f29bbf15DGYkxsw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 13 Jun 2025 18:34:46 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Simo Sorce <simo@redhat.com>,
 torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
 Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Module signing and post-quantum crypto public key algorithms
Date: Fri, 13 Jun 2025 18:34:46 +0200
Message-ID: <11297298.5MRjnR8RnV@tauon>
In-Reply-To:
 <01f2f3171dd0f1cd9dcb496ac66bc6903767a2d2.camel@HansenPartnership.com>
References:
 <501216.1749826470@warthog.procyon.org.uk>
 <01f2f3171dd0f1cd9dcb496ac66bc6903767a2d2.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 13. Juni 2025, 18:13:43 Mitteleurop=C3=A4ische Sommerzeit schri=
eb James=20
Bottomley:

Hi James,

> > The good news is that Stephan Mueller has an implemementation that
> > includes
> >=20
> > kernel bits that we can use, or, at least, adapt:
> > 	https://github.com/smuellerDD/leancrypto/
>=20
> So the only hybrid scheme in there is dilithium+25519 which doesn't
> quite fit the bill (although I'm assuming dilithium+448 could easily be
> implemented)

Dilithium-ED448 just landed. One bug to squash though.

Ciao
Stephan



