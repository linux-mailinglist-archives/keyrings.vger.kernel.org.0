Return-Path: <keyrings+bounces-3396-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC71C7350A
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 052A52A324
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 09:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDD32EA177;
	Thu, 20 Nov 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gkb2OsFo"
X-Original-To: keyrings@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29582F12AB;
	Thu, 20 Nov 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632428; cv=none; b=ZYoJcHWPHRS24p7E6gb4CjzC+9N1ghI9mIrhTBorssWh/RfGtVOqnpQCuzSSyXOtJufY2q26BI65pIIP/Xbr1OHL3MIBjPlmHGaRtNkLkrCSZItQUTSGZn7eFDnMK+VGFqb7JOoYbA/TW9RCPr44hYbXKvdCx9l1cEW7MEwUvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632428; c=relaxed/simple;
	bh=8X6/rp86r5koJBjcqTTV1sKKYtSCyipAihJvDmupTqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBgXyMpRgX8h3fRyCzBbRr9uhi+Nkm7onyo4PQTF9M0Qhp2MAGMmoLuaAsU5IOIM01Yl3g8vP7xuig/ycuJ5lv5jWTttrPLvHgEXCCFbkehaKhxySWFFo++ntToyxqJ2Zuca3CJdnnIow4jEjCFLv8XZ9a0YiVCSK7fVX0S9amw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gkb2OsFo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763632422;
	bh=l5sPvkcb6hwumL8z7oy1Qn76aRqBbE+o0V/15atHVcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gkb2OsFo6NFNzMLukhy4qKDJoyVIXD4bpLDjjWNibcUHiBJkHBoH4XLGx6GlZYPUK
	 KDBFm6VTDdayC0yj0agvev9cBQtlSPaQkBdPrJsOVz2TvuZ8/0V3D2G2y95pzxX1oE
	 kYoozfhhWnc4q4Dq3RCZ6IFafBUy/kqTzmv8BseS5HYr3nQo/HueiMn5ZBThx8Ty5l
	 XymiE6z1JiY35MpGI9WEg82RZJ4XoKOaq4ByzhkUfso+zLRRnA48Ng4QUyv4YoLspB
	 jE/NjV+ZvUSdyPjjIRwemD7+hgyq/a2v0x7TSIWSzeQleGqqjgwcGtMdy4te5547jH
	 vTIaNvmKfjT1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBtw64HLnz4wHY;
	Thu, 20 Nov 2025 20:53:42 +1100 (AEDT)
Date: Thu, 20 Nov 2025 20:53:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Mark Brown <broonie@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Pick up keys-pqc branch for linux-next?
Message-ID: <20251120205341.7e28927b@canb.auug.org.au>
In-Reply-To: <20251117171126.GD1584@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
	<2157243.1763392923@warthog.procyon.org.uk>
	<20251117171126.GD1584@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ac5Fti=c_+fnaTwn8T=zj0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3ac5Fti=c_+fnaTwn8T=zj0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 17 Nov 2025 09:11:26 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Nov 17, 2025 at 03:22:03PM +0000, David Howells wrote:
> >=20
> > Can you pick up my keys-pqc branch for linux-next please?  It can be fo=
und at:
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
> > 	keys-pqc
> >=20
> > Note that it's based on Eric Bigger's libcrypto/lbcrypto-next branch wh=
ich I
> > believe you already have in order to get SHA-3/SHAKE support.
>=20
> I don't really see the point yet, since this isn't going to be ready for
> the next merge window anyway.

Yeah, if it is not going into the next merge window, then I don't want
it until after that merge window closes, OK?

--=20
Cheers,
Stephen Rothwell

--Sig_/3ac5Fti=c_+fnaTwn8T=zj0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmke5SUACgkQAVBC80lX
0Gy9owgAhWypmsLm2u95euyWHQMnQ6Qm4NioY1lYce+9yg+rih1YmxlMd/qmIobI
SndEHPS9v6/+Rw+kpqqxfUiM6ywIeS8LPlskrFyCg/rleH3u+j3U6Q3mAKA1EajA
Xla6Y3NHWv7U9jirxGDOrPGVeIRwnS9q1foW0OpAZ+3bl20wQyMlxZsqviAJGuDK
XSBreOnHlDTia7lkdV1/+kwchp/O9Gc5mrfS0Pk5MJVoFAsxAo3fPA25hHyfGar+
r2CHINQns5FEFwqRCv6L9C1Zj46R5yucvg1Wm5IB7qLTB5VrtVEdpZ8OrGK6lpZT
iWtmoNO2+2dyB2/sjXdcHBxk0ZuqIQ==
=TFDP
-----END PGP SIGNATURE-----

--Sig_/3ac5Fti=c_+fnaTwn8T=zj0--

