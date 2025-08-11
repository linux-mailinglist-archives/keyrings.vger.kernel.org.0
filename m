Return-Path: <keyrings+bounces-2960-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986AB20B1A
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 16:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F384D1884B72
	for <lists+keyrings@lfdr.de>; Mon, 11 Aug 2025 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795571EDA26;
	Mon, 11 Aug 2025 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dJSC39Qh"
X-Original-To: keyrings@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D301BCA1C
	for <keyrings@vger.kernel.org>; Mon, 11 Aug 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920781; cv=none; b=oAbKes/n+Z2mYWF1172VF7XYHgQ2v5d2yuc8yVxPKOYu3K5GRV0Omr8wz48BGTtdGlvfKFWDUAw+cuVc9cBJfUTSyj53+FfwrAap4ekolD4e11JiUay/fMDTgLByje3tSZwKSGNYsggqJ4u2nqSIKtLxsrfV8nilNfwWVOqQ4qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920781; c=relaxed/simple;
	bh=UAscTaDLJpjUJjn63WsETxcBUCQ1U55JrLPS2Gcb5/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si1B4Yo0HIWqVPsFlcJzEFbsz40mrgHGNbX4PxtRg/pkODClmHxPvdMW5cNlM/RK7yuaaHxOrL4sCdQRKvyEKl6p2OODcHHhx9tMvLYQ/S8lZkSrTfe+cDksbmZhGiu1u315Fitax4VCHILytTi3d4pbvjebuWXwNJQG7vlHq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dJSC39Qh; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 11 Aug 2025 15:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754920767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwtuCWuAgeMBQsWTrVJdqoWZgJksA8+795i2PbVBNEI=;
	b=dJSC39Qh6JjQGKIvBi4kfCxWCDa5+5VxvVnQzJM084kCIzzpPyl6EQ49upFwxgXok58msY
	ocr3tqoBV6fUnnGisTNRuk4pt5CfY9JadaSEMikGZF/Dnue5w8myhCIRNBep3cTBLuOzYv
	VVunFAocyFjmk5YbmYai8NBF21nbGQ0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "longguang.yue" <bigclouds@163.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, masahiroy@kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re: [PATCH] Makefile: mrproper deletes signing_key.x509
Message-ID: <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64>
References: <20250809120405.22957-1-bigclouds@163.com>
 <aJerjQGmXXcpTtBB@fjasle.eu>
 <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zV5ruWp2aTrgxtDf"
Content-Disposition: inline
In-Reply-To: <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT


--zV5ruWp2aTrgxtDf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cc: certs/ people

[re-ordered quote]
On Mon, Aug 11, 2025 at 02:28:56PM +0800, longguang.yue wrote:
> At 2025-08-10 04:11:57, "Nicolas Schier" <nicolas.schier@linux.dev> wrote:
> > On Sat, Aug 09, 2025 at 08:04:05PM +0800 longguang.yue wrote:
> > > deletes temporary signing_key.x509 and reserves user-defined x509.gen=
key
> >=20
> > can you elaborate the actual problem with some more details?
> >=20
> > certs/signing_key.x509 is removed during 'make clean' which is a depend=
ency
> > of 'mrproper'.
> >=20
> > 'mrproper' is meant to remove everything that might influence a subsequ=
ent
> > call of kbuild for the sane architecture.
> >=20
> > Without further details I cannot see any problem here.
> >=20
> > Kind regards,
> > Nicolas
[...]
>=20
>   It should not delete x509.genkey because of its exsitence in gitignore.
> Normally, users want to keep  a self-defined x509.genkey,  but mrproper d=
eletes it, only default_x509.genkey is effective.=20
> After applying this patch, users just need to copy self-defined x509.genk=
ey into certs directory once.

'make mrproper' is meant to prepare the source tree to be as pristine as=20
possible for the given architecture.  This includes removal of any=20
configuration file(s) that influence subsequent builds.  From kbuild=20
point of view, certs/x509.genkey is also a kind of a configuration file,=20
as leaving it in tree after mrproper creates different build results=20
compared to a build from a really pristine source tree.

Iff the certs/ maintainers think that retaining a user x509.genkey file=20
over a mrproper makes sense, then we should probably adjust the rule for=20
generating $(objtree)/certs/x509.genkey, e.g. by allowing to provide one=20
by environment variable.

David or David, do you have an opinion on this?

Kind regards,
Nicolas

--zV5ruWp2aTrgxtDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmiZ9zUACgkQB1IKcBYm
Emk4jRAAnEX97cugjBpTlaaxDKycXtWvga7P6BVPAs7XTVay1JH0uYAWnS5e1J2O
zHYB4OeoB8F4+yWl1hSaEz0eGzAhpBpxkesJH58hm7kzb4ROaVkJTJ6ovUIzEmKr
sNnyUOEgV9wi9egYPiUTl81XEjp7JZUo9pGnA1IcUCFz6ovEFcRkyr7Y6rbsCY9g
wWmp5Sk6CGgXHlBrhB6ewoRbcSqPd/YKeytfknJ3ioOYeihdC44ntZdOIbTjQkHi
mE2wYhURVX8ze7takPmm7asK7IohWYehux9qv0/70hE5g92KCnW1dUqhrAKA/2jc
3D+ud8BKEIxvCYs2RG3OfuVK5lmrxlsiJTrs+umg8XpzlXNGcGZeSYqXBPadbh7l
G2aiVn+osRT57Hc/hZRG4MEZjpQD3slZ8oYzTVKCHrxwF/oJ+Vnq1WC8Rney0Aqo
BYGrM4e3lYbfRbCrMa/5ntUS7at4AAISaCATMkfafhpeXhkOXlGcOXciOtKhFd+8
EOJZrjl8GMJ3gsP0azZWVBlRoI3NWjO+VjVB6BCmSumopZg9G8eCRf4uD22mtPS5
Oyi/lvG/bYlUzGN+0j1RZHNm5Rkobo9ZlLtLmcnhPuU1O0tFVCmhMF8ZQSTCjyT+
XXGPLtM4k8TlQGbhiUbc3tiTO439ZBWq3Bt2TuE+LxDX1clN8TQ=
=hGB5
-----END PGP SIGNATURE-----

--zV5ruWp2aTrgxtDf--

