Return-Path: <keyrings+bounces-3306-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB165C3F66B
	for <lists+keyrings@lfdr.de>; Fri, 07 Nov 2025 11:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6CD04E16D7
	for <lists+keyrings@lfdr.de>; Fri,  7 Nov 2025 10:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DB13043B0;
	Fri,  7 Nov 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="GLewI4R3";
	dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b="5/2WW30r"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AC1E51EE;
	Fri,  7 Nov 2025 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511039; cv=pass; b=PIxBnUXUxGDleI8IkqIDKEVtVEFDZWs7tUE5ZJGRsjJoHjfWPGI7MY2Xpm16TTHsSlV3kVUVFpumXZ4TwSsQxCn1d4oQB7QAt6JnE1ca9QBiTueDjrOLhKKJvKGubD+PvOtO79Bb+8jD9/paykLmFtmFA7T5YIO22kny9Gg/t00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511039; c=relaxed/simple;
	bh=IfvDo4DJe7UiNB3LGseK57aJdtQyepnmkpfrGIgJmqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgaGsw8oZ57duyx0KQZlJ5g3K0gQbdkSNiUDUBky88dtbraOBvj/gyBAiyJ5WTo4sy/9j/jjNIxgEusb7psPxfUyuBT0nJ8p9aAQcH3cyKVu6XcU3pyPZRzI9UL/qfT7THNcvsT9J59rckiFCdhSBGV8XdsSCbD/Q6swlLkJkuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=GLewI4R3; dkim=permerror (0-bit key) header.d=chronox.de header.i=@chronox.de header.b=5/2WW30r; arc=pass smtp.client-ip=81.169.146.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1762511028; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WSeKpbqRA32meDqqfKW/ORlMun85BL1twqUu1y85rsAhXWyY1KYvmTZYRVo82Y0XA3
    6jv/DGLSoEinkXr658eqYUU4B1fCnV/KCXqXjtiROFMdiqBZzddbuwYANkWZyokacsa2
    pydkzy0jh9YIfeW5PsjqAr0OFeBW5wTNI4/P54K7T6UEEdG2OU8l9mGNmEyKsCgRlu5m
    sC2oJ7ZX0PwN5/rUoG6a3yhKw/HApmGZjGPIABYIqn2hTS1tqYVU2rcvPe160DDvMy4K
    7QupM1WpESsE/Fl4GS5t2CPPm9u1LHQ72sxMPDozuhV522NbO5z4IYxUtyjXZfEijmDV
    OkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1762511028;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=IfvDo4DJe7UiNB3LGseK57aJdtQyepnmkpfrGIgJmqo=;
    b=Ez0gm3GOcB2gjfv3NDznTRXPM99Y8g9U+Fi8lVH1zc6b3fD8rYxjtrVv1IMPN2aJ8r
    kinMhJ68hA2dnIWWQvSzGeKLnBoSFtIMYYICLn2xxA5yl6QoGh1bW7oDBWrkK9VlslG3
    wwQQ4nGbiq6TgWHY+MfT7C+KQ7purwGqEdBocsOGNlew6SiivNuVAFxCW3HjCHGZO009
    JsCvH1T959YrmYr0B4zHHTZ6j57uttIL2M4JdlLsIZ+++kPd4Qmvox3GI+wozTBQeyLV
    L2vJ/Q5GW0+AXZi15jSJ3KgwMN+331Qayih+9ZXBh6OIWLngH4RUFzvf8rO0u441WGpw
    xF3A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1762511028;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=IfvDo4DJe7UiNB3LGseK57aJdtQyepnmkpfrGIgJmqo=;
    b=GLewI4R3yTbYgXfczGE7AmPhjvr6QGNbEzKiRa7E60fnGMh8wsyBdRiwtAbmh8W7WF
    FhhvZphdMEPrI1Otf0xIaUUaST9A38fsn3gMOwcHL5mHvzlXq6IAzwJp0jPdvfbif7xs
    WtKhvboSsmBnPZAJlqfbkPlxSmzVgQWQiavbWFEjlk8d2cPX6/YgSJoZhuVDblwkxRDF
    LwNiv88+wgyIOMwGn5ec0aXt6Hkow5IVHFMZ1qEqO4ynH7qZDIzVabdUhxCwLV3aXmvn
    LN1Gsm+YNPXbe8KFtntm4XgSz1e3CCWKCwPkRhr2ZX3XallLmbQGa/+tH0wIH/TsYmoV
    YNAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1762511028;
    s=strato-dkim-0003; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=IfvDo4DJe7UiNB3LGseK57aJdtQyepnmkpfrGIgJmqo=;
    b=5/2WW30rYplD9tb1hPieiFCvpVFLWwvGcnQpXmAsjAHqiW/lpH5r/5Larq5QBgL9lh
    lgmZFjUM7CQt/Lg9O2Bg==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzHHXDYJPSfOH7S"
Received: from tauon.localnet
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id fd5b701A7ANk3FS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 7 Nov 2025 11:23:46 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: Stefan Berger <stefanb@linux.ibm.com>, David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, Simo Sorce <simo@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Ignat Korchagin <ignat@cloudflare.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, torvalds@linux-foundation.org,
 Paul Moore <paul@paul-moore.com>, Lukas Wunner <lukas@wunner.de>,
 Clemens Lang <cllang@redhat.com>, David Bohannon <dbohanno@redhat.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Module signing and post-quantum crypto public key algorithms
Date: Fri, 07 Nov 2025 11:23:46 +0100
Message-ID: <3917048.kQq0lBPeGt@tauon>
In-Reply-To: <61528.1762509829@warthog.procyon.org.uk>
References:
 <53e81761-47e1-400e-933d-0a53018c9cab@linux.ibm.com>
 <3d650cc9ff07462e5c55cc3d9c0da72a3f2c5df2.camel@redhat.com>
 <61528.1762509829@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 7. November 2025, 11:03:49 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb=20
David Howells:

Hi David,

> Stefan Berger <stefanb@linux.ibm.com> wrote:
> > On 6/16/25 1:27 PM, Simo Sorce wrote:
> > > Of course we can decide to hedge *all bets* and move to a composed
> > > signature (both a classic and a PQ one), in which case I would suggest
> > > looking into signatures that use ML-DSA-87 + Ed448 or ML-DSA-87 + P-5=
21
> > > ,ideally disjoint, with a kernel policy that can decide which (or bot=
h)
> > > needs to be valid/checked so that the policy can be changed quickly v=
ia
> > > configuration if any of the signature is broken.
> >=20
> > FYI: based on this implementation of ML-DSA-44/65/87
> >=20
> > https://github.com/IBM/mlca/tree/main/qsc/crystals
>=20
> The problem with that is that the Apache-2 licence is incompatible with
> GPLv2. Now, it might be possible to persuade IBM to dual-license their
> code.

The code used as a basis for the current approach (leancrypto.org) offers=20
hybrids with ED25519 and ED448) including the X.509/PKCS7 support.

However, please note that the X.509 specification for storing hybrid public=
=20
keys is not yet completed and there is still some work on the draft IETF=20
standard [1].

Side note: the leancrypto code base uses the Linux kernel X.509/PKCS7 parse=
r=20
code where the relevant handler functions (see [2]) could be relatively=20
quickly transplanted into the kernel if needed.

[1] https://lamps-wg.github.io/draft-composite-sigs/draft-ietf-lamps-pq-com=
posite-sigs.html

[2] https://github.com/smuellerDD/leancrypto/blob/master/asn1/src/
x509_cert_parser.c

Ciao
Stephan



