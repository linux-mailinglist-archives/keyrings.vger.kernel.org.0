Return-Path: <keyrings+bounces-1624-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2990F9BB
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7691D282CDE
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0716E15B145;
	Wed, 19 Jun 2024 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWcQ6AzO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55BC762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839493; cv=none; b=GNAF0aSkE+l5hLS9O3vwCpR0P6njrfFUmXWsXZCXhBD5C2oCvhqFR+cdzfwlZzVy2S4rZOO1HxQc7GgGu4uXFRyrUh8iuiiuy8Y3yV2yKhJ04Fzdwmb0/9lbTgZn+rxYvsThdW7ftWTYQ22RiQ9VH7AwKLc07VfBVEmS1iVeBRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839493; c=relaxed/simple;
	bh=GIvxGJro2OWFybe+l7M86CcTbxtDK8CcZJZkjh8inpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs3D34AkilOVXV8/nqSVEXa6N/mxystCmlWIpuYm7RUNQNYQNYCpu5H7nLt+Vsws/TDDfGfE7vGYV/JETZn2/oLnXAi73igkEK2Mm2SvMFnzqrmsMvw4SM7Tefui3Sf2Ea6uisWgFfrBUEqTNtRiYB7Ot9kByd8ZZzJv57k7CW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWcQ6AzO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B50FC2BBFC;
	Wed, 19 Jun 2024 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839493;
	bh=GIvxGJro2OWFybe+l7M86CcTbxtDK8CcZJZkjh8inpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWcQ6AzO4fmnm/nNCgctWDIyMxo6yBCiUmJnUde+g+02ctUgu+ga0RfRmMvio1WJc
	 +8eIajBaJv9ENJ1Wdjpi5X3oYGhiTSjeCxbBUq1Aoz5MYs4lI0DCF7hF77O4pK/sIh
	 Bub2xp7qQM4GG/gxPSENN0nZAaGtq9tOFtNW0PryhkT4GjkXewDyEy3Zrnhejnk8T5
	 SB0TpncAF9Ofn+9/I+kMGnCLJN8Ktg1R1lOSSkGdKf5ePojz+HbU290G+LNptZ5e9a
	 VsCxeV0SGEqgUz0rLDJnDaxa3wdUYUPnC7vTkwADVoViD7322OT5NOeNafiWsVU9HS
	 umvPAvcVmzf1g==
Date: Thu, 20 Jun 2024 01:24:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 01/10] man/asymmetric-key.7: Use HISTORY instead of
 VERSIONS
Message-ID: <20240619232444.36444-2-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="365aqwvybeoim3lf"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--365aqwvybeoim3lf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 01/10] man/asymmetric-key.7: Use HISTORY instead of
 VERSIONS
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

The VERSIONS section is usually used to describe differences
in different systems, focusing on portability to other current systems.

The HISTORY section is used to describe the history of an API, such as
when it appeared, or when it was standardized, focusing on portability
to older versions of the same system.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/asymmetric-key.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/asymmetric-key.7 b/man/asymmetric-key.7
index 5fc78cb..82193f6 100644
--- a/man/asymmetric-key.7
+++ b/man/asymmetric-key.7
@@ -211,7 +211,7 @@ .SH BLACKLISTING
 that blacklisting is not retroactive, so an asymmetric key that is already=
 on
 the system cannot be blacklisted by adding a matching blacklist entry late=
r.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH VERSIONS
+.SH HISTORY
 The
 .B asymmetric
 key type first appeared in v3.7 of the Linux kernel, the
--=20
2.45.2


--365aqwvybeoim3lf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaMIACgkQnowa+77/
2zIj2A/+O8drbxgxZxLGomkJS38xOnDm4n98ce5bwGUAb7wWLpjZ6PRFBstaSPm2
Tu57QfMcnItzy/+dDV5+pN+ZtV6uYCPOKX/2CyR2unnt6AqSU0H1CZGs6ML6cUZ3
ce75cTOwbMEXXGSbqWw+VRlgUfAVzxCXSwW3EJ/6OA87A1Ac5j8zsiA5aJM5ZIAB
puehH55tle+iFO2Bwzw5Q/zKtUVAgZhRgiYc7danA9mCasEBx+Qg6A+aqXXSrUoH
TtrGVVLUIoSE2qjJkfmMCTw2kokgSFG/o6tdxACayTJYu47g047SRJulQ1p4GnPF
7cbbUD3cWwYy3TAn3a/9oqV4B5whGqmOJidotZnE/oC0BOPqEpoxE+x5JtIncDkj
qDr5c3v/VdDtdGmHS0r1eoVaxt4aqxToPp0YFGVXWzoLvy0QMzvMzCLSPpPK3/sn
UK6CwrfXmQPekJL93iYG0t0xm4mqmg7RczoB4r4uK3COCxhnPDEeJzvNRL4ENcmH
UxBqMYtR88Q0CCuHVoelQxzeh3OamC/Y360K64w6Dy5A7fLNZRymfn7SmuspeR+B
UzcW8Xiq873ppSbFStqI3zsEZF9HCcOC/ZDNxPrUem2lGy9j/leqMMQMr8eg8pPm
aD6GYKpCg9tuW+wxja8Y0+5xeQpm7TDX+tLxXKlvIsX1b1ADeUY=
=djfW
-----END PGP SIGNATURE-----

--365aqwvybeoim3lf--

