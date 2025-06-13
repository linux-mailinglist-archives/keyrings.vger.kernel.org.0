Return-Path: <keyrings+bounces-2840-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C062BAD9401
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 19:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E50BF3BB876
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 17:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2611F30A9;
	Fri, 13 Jun 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="MJsQo9AQ";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="Ndo0S8cQ"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D0226D1E;
	Fri, 13 Jun 2025 17:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837329; cv=pass; b=KHzjdlILD8avmmmIgTYA7UW5M18HHmOR+a6GlNvGUMQ2yaqpY0Wecy+elFVcOiXY3fGmQu2cBn7IUJqJopShIRCVPj8FpsNQHP0d1eUxVh6AW8x2RHW/C24lIhJEHJu+CuaVEIGwsPgkVZ2yZK3IYpW1Bp7B1Ln3advGChdwdfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837329; c=relaxed/simple;
	bh=ofr+fvQbblYayi+b6RtbvNLe46eCfV6/Q2We6eydfN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSgEfeajIHWMelmtWdTLOKl20vQRmGr1irc0V3q2fNAh/BdeRjzzczXoQBO/CcgOulGLzfkY3OmQuD0rxq9ox1qaJ1Qb2KSRwEpZNKZQeZ+zqRob83UTSLOLgpvrcfCE80ACw/Iv5C+jzsl3SzUI5PCCRiFIEElJeiKpT2HtMbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=MJsQo9AQ; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=Ndo0S8cQ; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1749837314; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=X6WxiaTf1eWL8+ivP3OTpzZB4FCb9jVDhhwGjwe25qKtiS0JBd1pEarbkYa+Q3ONpZ
    cV0tSKLiw5E8iB31YaB/yV92yekzN++6Bnf7A3z9K3tou2BspLtD4v80dNSWTM6+3SRd
    H96GdzVrRJrjYxyGt7KnE/5vF5kjfqB9QXJHyHVgjFYqtFVrprrK+3KJcxvB4wJdP8CW
    xNWOXn7MoWdWKU9tEJjt+0jDN9Jih2E+5mg6jg5rKSJLLve0c85UqWFCPXhT8SwLSDDN
    Su5aRJrI0XZzlx21kfPCZZILOCTihdnQQEvA2R2IqzRRxMsSsa3soex+whNEzhPH3nmv
    LpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749837314;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ofr+fvQbblYayi+b6RtbvNLe46eCfV6/Q2We6eydfN0=;
    b=lGByFhG90J7+WGmxaFo3PKQpskzdWJKaClC1LBxQiXoTzZL0UZ/R0h+W8l2y/nQu7J
    j+zIC51yjSScTuZLmA+1eMxGpnEpXYNQtX9kUymrGGlr0hqeNtcVZCSD6IcGYHQl/IUo
    bUy8/H/zLuWT3gkYrzTKDw6E9eZL1UTzOf3PzpB2Rh453aMC/waT78ZcKlgJuL0Lcy4I
    x7671bePlUSnDqRtOD+ADffwp7F/JAfUrdW3KJBSjbOuaddKd/6LJpNnXmP1F956TJS3
    7/MyhHZYNgwOs6V27/sS8HEYxfta+kIqIDTY+wh0qY7NdO6KO/b6J782eQde1WPUxTEa
    +C5A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749837314;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ofr+fvQbblYayi+b6RtbvNLe46eCfV6/Q2We6eydfN0=;
    b=MJsQo9AQ6ACFPZdMfRxS3MoyVMcMV3qBpsRZgKoT9XQp9bOOoi3nmhRGj8n3cgIKXU
    PYPu70Zdgee4pwx0teEN3LhVZKvgxo1i2FiaXWjPXHhJ2F9EXa2x5CrrRBBTDNKtoFso
    bNxwt4qzjw6vMO4skKMXh7HJsgqX0FBFyhe9KEAWIc/ronvXnyUkRQeuXw8v8YEQdUHi
    M3Vrbh/V2Igcr8n3NOG8R9+49jA8IkoShQRAilKd3VKmnf4l6wqzwTSACfiAX/G3P2ul
    qb1bhDU8d5ztBnrgj2LjBBt/Vd1fpbxTMH+skSKX83ci7OtUtK9iEfT0hkfaQUnaTZKJ
    SdcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749837314;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ofr+fvQbblYayi+b6RtbvNLe46eCfV6/Q2We6eydfN0=;
    b=Ndo0S8cQNoboJ8bgQijqYjzmdQP1YnhKAqZjZrPChzeHKia3BAQ2pUDHt7fD9sGD/E
    RO71IVAkGwF4ZEZ7zcBw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYJfScBm5T"
Received: from tauon.localnet
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id f29bbf15DHtCxyu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 13 Jun 2025 19:55:12 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Simo Sorce <simo@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>,
 David Howells <dhowells@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, torvalds@linux-foundation.org,
 Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>,
 Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Module signing and post-quantum crypto public key algorithms
Date: Fri, 13 Jun 2025 19:55:12 +0200
Message-ID: <13066544.VsHLxoZxqI@tauon>
In-Reply-To:
 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
References:
 <501216.1749826470@warthog.procyon.org.uk>
 <de070353cc7ef2cd6ad68f899f3244917030c39b.camel@redhat.com>
 <3081793dc1d846dccef07984520fc544f709ca84.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 13. Juni 2025, 19:50:22 Mitteleurop=C3=A4ische Sommerzeit schri=
eb James=20
Bottomley:

Hi James,

> On Fri, 2025-06-13 at 13:33 -0400, Simo Sorce wrote:
> > Premise: this problem can't be ignored, even if you think Quantum
> > Computers are BS, various government regulations are pushing all
> > commercial entities to require PQ signatures, so we have to deal with
> > this problem.
>=20
> I agree it's coming, but there's currently no date for post quantum
> requirement in FIPS, which is the main driver for this.

Perhaps [1] should be considered if you refer to FIPS?

=46urther, [2] also gives a timeline.

[1] https://csrc.nist.gov/pubs/ir/8547/ipd

[2] https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/3148990/
nsa-releases-future-quantum-resistant-qr-algorithm-requirements-for-nationa=
l-
se/

Ciao
Stephan



