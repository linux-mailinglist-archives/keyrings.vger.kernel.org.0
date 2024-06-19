Return-Path: <keyrings+bounces-1632-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53D90F9C6
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4454282CBD
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5981515B147;
	Wed, 19 Jun 2024 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zep8O9iI"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645A762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839523; cv=none; b=cWZUVk5fIazieqk4yWYmXE+mPhnMc1RlTtv8LDo7XDs19yIXHmYBNKfTaYuc+AXSgTAFwNTyDsQJa12aYQyvEbNSP8305JVfkHNXCMhH2qPwovdqO2QaFHZ81eoyvUHZRaPcA1w8s4AvWKaiEy94qcG290ffscFsPwn3LVZUT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839523; c=relaxed/simple;
	bh=nVdUWJZqh6agLFHDFBCsvVmmjvGY2icPIJAw3+Fs8dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFEhW5FcRyEhDKHLuZSFPdtnX/8S4SuYGRZCtEy2fqYzxa/6qV11GR9uurOfoqyPdxs1T0xk5x26VOh0j9gL44kgmmY8g4wYDwNORfSerhcdhBcnNEeHXdDkyhlPixkr578CstweAz7ADv8aefozHEXhLAoLBLQbSyLa0wYBxiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zep8O9iI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4A4C2BBFC;
	Wed, 19 Jun 2024 23:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839523;
	bh=nVdUWJZqh6agLFHDFBCsvVmmjvGY2icPIJAw3+Fs8dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zep8O9iIrPCELU6sVpY8F9BUpUHyZupjrXjnuSU0cnbmPvCA6DIPijiCes+ywkGb/
	 Y9244vkFFxL5rzt5CqVox2vKAX+NZp+FUHJS7Lp5XApRnq0zwl3XS+AoCSe6rR5DSr
	 2T1sdIwH2keErfBOTK7ZY3OOKRpa/uviAJoKvvMRD39dY/RRI40FWPEZFDU00rAQi5
	 IgfT9+C6fFYBvB8rx2NKGnaVGOneheEQRe0xDqBSuVZrYSVxxNMpb7N1N7bEYSk+S2
	 DONMJO30YZF+iZREk3xWDtRe52sBiBGqpeU3K5nkhmdghmPDFwKiLOdKe6t7sxvjV9
	 8xxrF6M4SnFRg==
Date: Thu, 20 Jun 2024 01:25:20 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 09/10] man/keyctl.1: Improve formatting
Message-ID: <20240619232444.36444-10-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5xn46wgnnnn7ax3m"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--5xn46wgnnnn7ax3m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 09/10] man/keyctl.1: Improve formatting
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/keyctl.1 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/keyctl.1 b/man/keyctl.1
index 59172d4..828223b 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -369,11 +369,11 @@ .SH KEY IDENTIFIERS
 helper to
 permit it to access the callers keyrings and instantiate the target key.
 .TP
-Keyring by name: \fB%:<name>\fR
+Keyring by name: \f[B]%:\f[BI]name\f[R]
 A named keyring.  This will be searched for in the process's keyrings and =
in
 .IR /proc/keys .
 .TP
-Key by name: \fB%<type>:<name>\fR
+Key by name: \f[B]%\f[BI]type\f[B]:\f[BI]name\f[R]
 A named key of the given type.  This will be searched for in the process's
 keyrings and in
 .IR /proc/keys .
--=20
2.45.2


--5xn46wgnnnn7ax3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaOAACgkQnowa+77/
2zJtyRAAqxFKQFUYyg7uRwApQrINFH7nz0VIhiEDOmX2UKpY3zxj+mcGyXY6PkXR
5Rjvb1XInPO1Ufu8FV1rJAw73nE8xlFtN2joZRQaZJCL9CyKuXglqDLGjXg1kWKn
7Op2YEm2lnSRDVi93R5/d9ywIi97LbEbuyjyKXoYRWx99XOjpIclfqfwH9PYKI4n
+KwOlYep/Duf2/QGcE3LGPXVWjGSw0/QSD3UhBEH5WXfdzTu+zUotoD+AynqdPWI
NRyS7rxwL40msZw+K7Z2a3jaf3jQeb5eiKSvPxQWBy1hcryv3k7Ph1+Ng+bkd/QD
0AcGyr/om+Ci4kTuSwMpEqm0qF6ivr7eVPQUsr6iPmbkMLne/FHX/j5QTUA830ll
wxUuZonvllUvTBoWZxtc84XhqQuNVsdwe1KdBW03vDayzT/dZUEaA3vFNfjcaWKS
NQ/I5h9bW4PoJGUVNqtFVk0nGFwq8zy62X8Uf5EvrGKRcNB6XqObywRJSR59HexU
Xo8WaEVcaKmoHekbtLStW0nWLWAjCfRvDENVuUQ2PDMhzMkrHXjhezoENMuAf7hT
3PKBjryMB9tbJrVVGRUXkgxib9Itdz+5/NLef9aP9obHt2HZknH7yK8ouXozmbw5
jzhlrOboy77J207vSyFEpwZQ4XX7gdTkJzLw9vIeQcP4YxCb5LU=
=Cj5U
-----END PGP SIGNATURE-----

--5xn46wgnnnn7ax3m--

