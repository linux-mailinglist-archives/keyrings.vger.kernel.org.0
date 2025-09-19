Return-Path: <keyrings+bounces-3041-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7FB8B21B
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 21:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BC81B28CB1
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 19:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E630322766;
	Fri, 19 Sep 2025 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b="fHBcDeJ2"
X-Original-To: keyrings@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739633218BD;
	Fri, 19 Sep 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311608; cv=pass; b=OOmxSD7WzWcxQuHEVHqFsGjW2HPDo2C2O3gMbYdcuAXno73ldG4+dnEm37ajvPvsvyoUCaokRGuc6/5KXowChjmCSMsxkdImn5Sbf5i94Nl/5VyZt/Qyd1fme4PFCjNkN43DG2ogT7anPeoTCBZrtgbyZZI2NC9gBM0zlXJvwfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311608; c=relaxed/simple;
	bh=Pq9X+lzYebnml6GtBl/DnIz15ReRkpXpxgdzc+0/qDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRRiSJJ7621wJGXNnm1HzcyZrxKxTXERNsAP0cArv6p6mgTxxBPMIh3adXxlzD0EBMsaSvcjKTwI1a5gQzPe7aBKF1OE3SaZV/GtuztGEpLymliW9SbWDniw5l1MZcx3M2/SmHcv7sLAZce0Z9zOMoHdD8WddsLjnqHWfrvsmHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de; spf=none smtp.mailfrom=chronox.de; dkim=pass (2048-bit key) header.d=chronox.de header.i=@chronox.de header.b=fHBcDeJ2; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chronox.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chronox.de
ARC-Seal: i=1; a=rsa-sha256; t=1758311601; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QE8EMeh62/hxLti9rI32MudkKJfiSIFSNagSBipgW2ZeHzPKkvT/7sVn3uoKT1qxOO
    yVtTPTbNe41TVonFoE6Q/zmKU6hdmY0Jb//IN00OGkt0wSW1/tkEpAxPjIB262dyyBXP
    X7S+lgRFZ2DXloB/bEdol6NlUAM/Q7aP3sm8HocHxxv0/zZwbncfGL8KAZ6VA2FMhEtY
    CLM+9OB8MsipK6SlJGVhTW51ZKLD/udKXmbAs1ON6Q6VYdCaSPw+NhRv1A8181ehB1II
    voxL3wsZ4S9c3NVLb7jB6fLFp5oDM2ssTpHkbe0jCgvH/KKjnTrHJds+CzprHmZwwc1T
    EkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1758311601;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eygAQsogKh92dDpjZePkGfKQTnXGhtadOvm/e5nG+Dg=;
    b=PtpBx/xk2w6Wio5NMB/KqXUdtVUYDrEtY1qBNEDVig9rWceIeGujhycpfDbQPJSV/T
    NarBo0pUb0ATDfrqyRlha0bIMWB7ihuFJNNM0GRD7RM6kZmKPagISHT+8KERn4hK0J6O
    6JT4ThVEbQxsGxOQnstuPxFLWC7aEZTokeZs7IJ7cf1l7qJeYKr5WI9fJd+ZeB5tYJzg
    VrWkUzdTWJNxFPbOpqNqEcgouHTfN6MHXV5ASiKqYcRzDDQs2LY+WGUDzuQU0GgaxhVd
    ZNcZ9hjwM+9uDyruJbH5rR4zUMoB2JiizjPewgCLD6+56Gz4am1WE8CwpMh9S7myRtiM
    +NSw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758311601;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=eygAQsogKh92dDpjZePkGfKQTnXGhtadOvm/e5nG+Dg=;
    b=fHBcDeJ2ub7JCNUPBHJ9q/UcwjtJ3VPSmJIG9McxVcE1njd32u7yd6uTUIhoa5+gQO
    vmLDmr5eK2CmgarZO7JGNJ09TyBD0vio2T+P2nLD5fQVdFesQryA9jvUFEZiRz9bdlZC
    yUD9Ot58Tx79sfvaD+giYMaXnF58fU62OvPgmgfFhifNPOClxxfJqODpeXBcXbcVKPlR
    RmI5hI0K0Jfv74phHDVxP39lnN72jEwchuJK3r2aQFBL/zNSUd892qmk+JynPFH0S69O
    EVU3ZYIVq5ERDJARQ0QSeFAMxesscZ5WWywMJgEkogT/j8tGtzLajBtw1a8hKzS2iVxk
    WMuw==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9zmwdP57PWmc+BP1jdA=="
Received: from tauon.localnet
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id f01e6318JJrILK7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 19 Sep 2025 21:53:18 +0200 (CEST)
From: Stephan Mueller <smueller@chronox.de>
To: Eric Biggers <ebiggers@kernel.org>, David Howells <dhowells@redhat.com>
Cc: dhowells@redhat.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Simo Sorce <simo@redhat.com>,
 linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512,
 SHAKE128, SHAKE256
Date: Fri, 19 Sep 2025 21:53:17 +0200
Message-ID: <5078839.1IzOArtZ34@tauon>
In-Reply-To: <3975735.1758311280@warthog.procyon.org.uk>
References:
 <20250919190413.GA2249@quark> <3936580.1758299519@warthog.procyon.org.uk>
 <3975735.1758311280@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 19. September 2025, 21:48:00 Mitteleurop=C3=A4ische Sommerzeit=
=20
schrieb David Howells:

Hi David,

> > I see you also have a test in sha3_mod_init(), which doesn't make=20
sense.
> > The tests should be in the KUnit test suite(s).  If you intended for=20
the
> > sha3_mod_init() test to be a FIPS pre-operational self-test, then (1)=20
it
> > would first need to be confirmed with the people doing FIPS
> > certifications that a FIPS pre-operational self-test is actually
> > necessary here, (2) it would need to be fixed to actually fulfill the
> > requirements for that type of test such as panicing the kernel on
> > failure, and (3) it would need to come in its own patch with its own
> > explanation.  But, unless you are sure you actually need the FIPS test,
> > just omit it out for now and focus on the real tests.
>=20
> I disagree.  It should have at least a single self-test.  If we fail to=20
load
> any modules because the hash is broken on a particular CPU, it would be
> useful to have a note in dmesg.  Loading kunit test modules becomes=20
tricky
> in such a case.

Just for clarifications of the FIPS requirements: One test of any of the=20
SHA3/SHAKE algorithms during startup is sufficient for *one* Keccak=20
implementation. FIPS wants the actual Keccak sponge being tested, it does=20
not care for the miniscule differences between the different SHA/SHAKE=20
definitions.

Yet, if we have multiple Keccak sponge implementations, then each needs its=
=20
own self test.

Ciao
Stephan



