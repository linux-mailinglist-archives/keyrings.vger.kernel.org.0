Return-Path: <keyrings+bounces-1730-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5F92DA5E
	for <lists+keyrings@lfdr.de>; Wed, 10 Jul 2024 22:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F957B212F9
	for <lists+keyrings@lfdr.de>; Wed, 10 Jul 2024 20:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F25F83A18;
	Wed, 10 Jul 2024 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6HiHX3P"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5EDF71
	for <keyrings@vger.kernel.org>; Wed, 10 Jul 2024 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644337; cv=none; b=ALjj24r34IyWoBRIsuRzqh3Zdpp/QuqbUdWsKTNMunmpcQlHumUhE1ZT8Y1TqhJwSNB1rKEpLz2Wz11iNatvCcMsMZuIHhfvlRcI93I5lQfLh+l7JkeBQ9gX8DuJ5IsOv9hBgrCHn6G5asb2EkKuYBp0u3Vi0/u4/qUQgGb45nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644337; c=relaxed/simple;
	bh=jPDDfQgs/tXsOqHAKXZ1DSpfiDomn+XJ35er5FK1qCo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKmtuIjGGMPaBeggmq2LGMugYSAWpgEAWrAHLR8SPsLdxNOiJZxGTBqYal/eU2Y6tNT7TpjTXaA52FvDEV6ZMhD3cGdMj74UMbnmC/Zq7J+u3XrtKFfwhn8MNgpeuZBMbus9iOcTn6IhpfK8ifHgl6/bX/zHkVqeVc2xQB21xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6HiHX3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1B3C32781;
	Wed, 10 Jul 2024 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720644337;
	bh=jPDDfQgs/tXsOqHAKXZ1DSpfiDomn+XJ35er5FK1qCo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=V6HiHX3P1/n1jdMdRlnQftmkk0JhCJSKB5SItHoEnfV/F28cqMlvGk+WzVEaH6Sgx
	 dDJI89yPjSnYObmOtsTgC9LjW81AOygp7cwoHgXrovHAQSvwetLX7u3I/Z1Hs+VEHL
	 SzxyyF+a1D4g6LfJ5nT9mOhR6wJtW+PFj/g9y1/84uHmWuU9yIbiQPYgbBA7POl4qZ
	 vuBI87ZODjdiurRGxUYGmXCmyYaQ+S7CPXeoXkRF5STB9DSvK/pFXa0zAh7xz5Qgdu
	 KIPuY05186H5ASYsBxzseeG1oc+gXf2Th0A9RFOcrDnWfLKWl7LK+5S/1HOvfwb7j7
	 /TJbaCIix6C8g==
Date: Wed, 10 Jul 2024 22:45:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v1 00/10] Several fixes and improvements to the manual
 pages
Message-ID: <gm72s6v2mptwieg4beb6zor36aavux5n2tfduyq4nrtqwzaamu@tvodwkq3r7ox>
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="klehgjxa3zxhslrm"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--klehgjxa3zxhslrm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v1 00/10] Several fixes and improvements to the manual
 pages
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

On Thu, Jun 20, 2024 at 01:24:49AM GMT, Alejandro Colomar wrote:
> Hi David,
>=20
> Here's a set of fixes and improvements to the manual pages.  I'm
> preparing a lot more, but I'll send these already to taste the waters.

Ping.

>=20
> Have a lovely day!
> Alex
>=20
> *** BLURB HERE ***
>=20
> Alejandro Colomar (10):
>   man/asymmetric-key.7: Use HISTORY instead of VERSIONS
>   man: Use the LIBRARY section
>   man: Fix TH arguments 4 and 5
>   man: Update date in TH
>   man: Use lowercase in TH 1st argument
>   man: Escape dashes in TH
>   man: Add SYNOPSYS section
>   man: Improve formatting of SYNOPSIS of commands
>   man/keyctl.1: Improve formatting
>   man: Organize manual pages in subdirectories
>=20
>  Makefile                                     |  10 +-
>  man/{ =3D> man1}/keyctl.1                      | 432 ++++++++++++++-----
>  man/{ =3D> man3}/find_key_by_type_and_name.3   |  11 +-
>  man/{ =3D> man3}/keyctl.3                      |  25 +-
>  man/{ =3D> man3}/keyctl_capabilities.3         |  13 +-
>  man/{ =3D> man3}/keyctl_chown.3                |  13 +-
>  man/{ =3D> man3}/keyctl_clear.3                |  13 +-
>  man/{ =3D> man3}/keyctl_describe.3             |  13 +-
>  man/{ =3D> man3}/keyctl_dh_compute.3           |  13 +-
>  man/{ =3D> man3}/keyctl_get_keyring_ID.3       |  13 +-
>  man/{ =3D> man3}/keyctl_get_persistent.3       |  13 +-
>  man/{ =3D> man3}/keyctl_get_security.3         |  13 +-
>  man/{ =3D> man3}/keyctl_instantiate.3          |  13 +-
>  man/{ =3D> man3}/keyctl_invalidate.3           |  13 +-
>  man/{ =3D> man3}/keyctl_join_session_keyring.3 |  13 +-
>  man/{ =3D> man3}/keyctl_link.3                 |  13 +-
>  man/{ =3D> man3}/keyctl_move.3                 |  13 +-
>  man/{ =3D> man3}/keyctl_pkey_decrypt.3         |   0
>  man/{ =3D> man3}/keyctl_pkey_encrypt.3         |  13 +-
>  man/{ =3D> man3}/keyctl_pkey_query.3           |  13 +-
>  man/{ =3D> man3}/keyctl_pkey_sign.3            |  13 +-
>  man/{ =3D> man3}/keyctl_pkey_verify.3          |   0
>  man/{ =3D> man3}/keyctl_read.3                 |  13 +-
>  man/{ =3D> man3}/keyctl_restrict_keyring.3     |  13 +-
>  man/{ =3D> man3}/keyctl_revoke.3               |  13 +-
>  man/{ =3D> man3}/keyctl_search.3               |  15 +-
>  man/{ =3D> man3}/keyctl_session_to_parent.3    |  13 +-
>  man/{ =3D> man3}/keyctl_set_reqkey_keyring.3   |  13 +-
>  man/{ =3D> man3}/keyctl_set_timeout.3          |  13 +-
>  man/{ =3D> man3}/keyctl_setperm.3              |  13 +-
>  man/{ =3D> man3}/keyctl_update.3               |  13 +-
>  man/{ =3D> man3}/keyctl_watch_key.3            |  13 +-
>  man/{ =3D> man3}/recursive_key_scan.3          |  11 +-
>  man/{ =3D> man5}/key.dns_resolver.conf.5       |   2 +-
>  man/{ =3D> man5}/request-key.conf.5            |   2 +-
>  man/{ =3D> man7}/asymmetric-key.7              |   4 +-
>  man/{ =3D> man7}/keyutils.7                    |  26 +-
>  man/{ =3D> man8}/key.dns_resolver.8            |   2 +-
>  man/{ =3D> man8}/request-key.8                 |  14 +-
>  39 files changed, 498 insertions(+), 381 deletions(-)
>  rename man/{ =3D> man1}/keyctl.1 (89%)
>  rename man/{ =3D> man3}/find_key_by_type_and_name.3 (92%)
>  rename man/{ =3D> man3}/keyctl.3 (89%)
>  rename man/{ =3D> man3}/keyctl_capabilities.3 (94%)
>  rename man/{ =3D> man3}/keyctl_chown.3 (91%)
>  rename man/{ =3D> man3}/keyctl_clear.3 (89%)
>  rename man/{ =3D> man3}/keyctl_describe.3 (93%)
>  rename man/{ =3D> man3}/keyctl_dh_compute.3 (95%)
>  rename man/{ =3D> man3}/keyctl_get_keyring_ID.3 (92%)
>  rename man/{ =3D> man3}/keyctl_get_persistent.3 (93%)
>  rename man/{ =3D> man3}/keyctl_get_security.3 (93%)
>  rename man/{ =3D> man3}/keyctl_instantiate.3 (96%)
>  rename man/{ =3D> man3}/keyctl_invalidate.3 (90%)
>  rename man/{ =3D> man3}/keyctl_join_session_keyring.3 (91%)
>  rename man/{ =3D> man3}/keyctl_link.3 (92%)
>  rename man/{ =3D> man3}/keyctl_move.3 (92%)
>  rename man/{ =3D> man3}/keyctl_pkey_decrypt.3 (100%)
>  rename man/{ =3D> man3}/keyctl_pkey_encrypt.3 (94%)
>  rename man/{ =3D> man3}/keyctl_pkey_query.3 (94%)
>  rename man/{ =3D> man3}/keyctl_pkey_sign.3 (95%)
>  rename man/{ =3D> man3}/keyctl_pkey_verify.3 (100%)
>  rename man/{ =3D> man3}/keyctl_read.3 (94%)
>  rename man/{ =3D> man3}/keyctl_restrict_keyring.3 (91%)
>  rename man/{ =3D> man3}/keyctl_revoke.3 (89%)
>  rename man/{ =3D> man3}/keyctl_search.3 (93%)
>  rename man/{ =3D> man3}/keyctl_session_to_parent.3 (91%)
>  rename man/{ =3D> man3}/keyctl_set_reqkey_keyring.3 (93%)
>  rename man/{ =3D> man3}/keyctl_set_timeout.3 (90%)
>  rename man/{ =3D> man3}/keyctl_setperm.3 (94%)
>  rename man/{ =3D> man3}/keyctl_update.3 (91%)
>  rename man/{ =3D> man3}/keyctl_watch_key.3 (95%)
>  rename man/{ =3D> man3}/recursive_key_scan.3 (95%)
>  rename man/{ =3D> man5}/key.dns_resolver.conf.5 (95%)
>  rename man/{ =3D> man5}/request-key.conf.5 (98%)
>  rename man/{ =3D> man7}/asymmetric-key.7 (99%)
>  rename man/{ =3D> man7}/keyutils.7 (89%)
>  rename man/{ =3D> man8}/key.dns_resolver.8 (95%)
>  rename man/{ =3D> man8}/request-key.8 (92%)
>=20
> Range-diff against v0:
>  -:  ------- >  1:  ec0c2fa man/asymmetric-key.7: Use HISTORY instead of =
VERSIONS
>  -:  ------- >  2:  8f02c27 man: Use the LIBRARY section
>  -:  ------- >  3:  e3e616f man: Fix TH arguments 4 and 5
>  -:  ------- >  4:  7762f59 man: Update date in TH
>  -:  ------- >  5:  7294951 man: Use lowercase in TH 1st argument
>  -:  ------- >  6:  3d6ef97 man: Escape dashes in TH
>  -:  ------- >  7:  5794916 man: Add SYNOPSYS section
>  -:  ------- >  8:  30c25a7 man: Improve formatting of SYNOPSIS of comman=
ds
>  -:  ------- >  9:  ae1e052 man/keyctl.1: Improve formatting
>  -:  ------- > 10:  93e44ce man: Organize manual pages in subdirectories
> --=20
> 2.45.2
>=20



--=20
<https://www.alejandro-colomar.es/>

--klehgjxa3zxhslrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmaO8u0ACgkQnowa+77/
2zLwnw/9H4NwhchEHbOkYnss9faO+Vk6gw8C0d2yipQMIzMYOP557W+cUQ1lrpPg
iXpKhaoIH5dgbL2AJ/1op0mhUkXNnjKahw5ecxOIhl7uA068rfWXg29iGJsxoIfn
p6tOgCKyVzj2di6G4XgTXe7a5l2pgLxjj2wBd5yrv/AC/HRDSrgnvmMBCmand4H3
IypWof6CIXR+YW19EGm7eQS+szxB3yfGwZ2aaMxCAZpwGBtJmOnLNrUhrQBgQtzx
QSQ+vDfuAN1zeFWgDnj32q+bVDjAsxX7il7Vod5Mesuiv2ofsx3ArecFKCwvrkn1
TD58vB8QYptIFMZtycMqnwn9DWWuJbEmXrx3gBnsPO9fvqaaz17/L+zOn/RqSKsM
6hfnYGOKYNFumIJaoGSORN0fni/xTb7UBw85som6fYIUQzw3HPawi5ttDLJn7VsD
wDjNX9PMof5vjYcPazVg7v4jQuDI+to37Ws5Vajw4iLXtpySDD83xTSHzjmViI0s
1wT4w0JSUL0A5EMb3tfcnvXzDm4H7w0CBHkwxd7yPP1sfqb5PoPk03lODT4z30Ab
aCwGDKiaakCjiieyQOKHlFG/6KqZwbUDoZhoINSvX1D+InkkYPODsHeAAdud+Xsm
Odx9imU05E7CqX+qHmiifACpfIW9vFcs/qId7+ZIzV7pOTCNIJk=
=AYZ6
-----END PGP SIGNATURE-----

--klehgjxa3zxhslrm--

