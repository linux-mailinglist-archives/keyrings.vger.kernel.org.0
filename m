Return-Path: <keyrings+bounces-1623-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE290F9BC
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EF13B21ACF
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289C215B143;
	Wed, 19 Jun 2024 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiTphedG"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E7762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839490; cv=none; b=aNR4tK2kY5YflQKXSs76Wrigp1oSoLdiEjXLLailLdgJArS49mH6rptF0vn1thhmPNLxInRSD1LJUIRa0OAEGqxYPA6uV1wA9/SbtkzHtoe5vxYAjP3KfRlPRKjw/Wt9ZOwxSOkppGETHf1x/yVHOG8phdxPw041k5ZtgP0rYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839490; c=relaxed/simple;
	bh=qNce/350YpVRRxpaUnyqIqiLdAG42ix/dthjyuQAnog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PG2+vUKgqJN8/Pf8mEMfOQxvHe9bgCI0H4yz6AaTYp5mY4ItE8XHz2UaA1AHLK/e+yPzlDiEKJ1CJ79Hpe9gSBkADbWN8ekYLck2Tl+Gzv8tMxiDcGDlrfAWAIRfHh/O81IYrfL/9eMwde9X6VGfDO/C8GOgxGlf70oM+r4A0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiTphedG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8231C2BBFC;
	Wed, 19 Jun 2024 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839489;
	bh=qNce/350YpVRRxpaUnyqIqiLdAG42ix/dthjyuQAnog=;
	h=Date:From:To:Cc:Subject:From;
	b=qiTphedGMrVZ2MacZPQhleCwlO8ptATBYwTin4VosqRPoQdlk1WoH1LyDcpKuk7wZ
	 0k/yQDxycFiNKBWCpOS+unA9JV23QZVn6Z+dCImOTJA8xKSD8vLS2RNhN7WgONFmVT
	 eDwcOoKseJuQ2rIfNEk+B8H2OpSbS2sgomXhn/Ol99iaVos2uk3a9V1TmeA9RpXL4f
	 3j6lk+ZEjI8moVpkS8BY2uvFy6nvQIfsm2RSEjoAvQ+tA3L7I7NRv5xYNvJIS1u3SH
	 LgFHlVG3GexqwZtQZKyuhkLwaU4HNaeAy8vNrS8KUHhTtYzDXcsK8srlAHJhpJUZNh
	 dV2wmoSUxCedg==
Date: Thu, 20 Jun 2024 01:24:46 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 00/10] Several fixes and improvements to the manual pages
Message-ID: <20240619232444.36444-1-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iikaefzdjqo5bbdb"
Content-Disposition: inline


--iikaefzdjqo5bbdb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 00/10] Several fixes and improvements to the manual pages
MIME-Version: 1.0

Hi David,

Here's a set of fixes and improvements to the manual pages.  I'm
preparing a lot more, but I'll send these already to taste the waters.

Have a lovely day!
Alex

*** BLURB HERE ***

Alejandro Colomar (10):
  man/asymmetric-key.7: Use HISTORY instead of VERSIONS
  man: Use the LIBRARY section
  man: Fix TH arguments 4 and 5
  man: Update date in TH
  man: Use lowercase in TH 1st argument
  man: Escape dashes in TH
  man: Add SYNOPSYS section
  man: Improve formatting of SYNOPSIS of commands
  man/keyctl.1: Improve formatting
  man: Organize manual pages in subdirectories

 Makefile                                     |  10 +-
 man/{ =3D> man1}/keyctl.1                      | 432 ++++++++++++++-----
 man/{ =3D> man3}/find_key_by_type_and_name.3   |  11 +-
 man/{ =3D> man3}/keyctl.3                      |  25 +-
 man/{ =3D> man3}/keyctl_capabilities.3         |  13 +-
 man/{ =3D> man3}/keyctl_chown.3                |  13 +-
 man/{ =3D> man3}/keyctl_clear.3                |  13 +-
 man/{ =3D> man3}/keyctl_describe.3             |  13 +-
 man/{ =3D> man3}/keyctl_dh_compute.3           |  13 +-
 man/{ =3D> man3}/keyctl_get_keyring_ID.3       |  13 +-
 man/{ =3D> man3}/keyctl_get_persistent.3       |  13 +-
 man/{ =3D> man3}/keyctl_get_security.3         |  13 +-
 man/{ =3D> man3}/keyctl_instantiate.3          |  13 +-
 man/{ =3D> man3}/keyctl_invalidate.3           |  13 +-
 man/{ =3D> man3}/keyctl_join_session_keyring.3 |  13 +-
 man/{ =3D> man3}/keyctl_link.3                 |  13 +-
 man/{ =3D> man3}/keyctl_move.3                 |  13 +-
 man/{ =3D> man3}/keyctl_pkey_decrypt.3         |   0
 man/{ =3D> man3}/keyctl_pkey_encrypt.3         |  13 +-
 man/{ =3D> man3}/keyctl_pkey_query.3           |  13 +-
 man/{ =3D> man3}/keyctl_pkey_sign.3            |  13 +-
 man/{ =3D> man3}/keyctl_pkey_verify.3          |   0
 man/{ =3D> man3}/keyctl_read.3                 |  13 +-
 man/{ =3D> man3}/keyctl_restrict_keyring.3     |  13 +-
 man/{ =3D> man3}/keyctl_revoke.3               |  13 +-
 man/{ =3D> man3}/keyctl_search.3               |  15 +-
 man/{ =3D> man3}/keyctl_session_to_parent.3    |  13 +-
 man/{ =3D> man3}/keyctl_set_reqkey_keyring.3   |  13 +-
 man/{ =3D> man3}/keyctl_set_timeout.3          |  13 +-
 man/{ =3D> man3}/keyctl_setperm.3              |  13 +-
 man/{ =3D> man3}/keyctl_update.3               |  13 +-
 man/{ =3D> man3}/keyctl_watch_key.3            |  13 +-
 man/{ =3D> man3}/recursive_key_scan.3          |  11 +-
 man/{ =3D> man5}/key.dns_resolver.conf.5       |   2 +-
 man/{ =3D> man5}/request-key.conf.5            |   2 +-
 man/{ =3D> man7}/asymmetric-key.7              |   4 +-
 man/{ =3D> man7}/keyutils.7                    |  26 +-
 man/{ =3D> man8}/key.dns_resolver.8            |   2 +-
 man/{ =3D> man8}/request-key.8                 |  14 +-
 39 files changed, 498 insertions(+), 381 deletions(-)
 rename man/{ =3D> man1}/keyctl.1 (89%)
 rename man/{ =3D> man3}/find_key_by_type_and_name.3 (92%)
 rename man/{ =3D> man3}/keyctl.3 (89%)
 rename man/{ =3D> man3}/keyctl_capabilities.3 (94%)
 rename man/{ =3D> man3}/keyctl_chown.3 (91%)
 rename man/{ =3D> man3}/keyctl_clear.3 (89%)
 rename man/{ =3D> man3}/keyctl_describe.3 (93%)
 rename man/{ =3D> man3}/keyctl_dh_compute.3 (95%)
 rename man/{ =3D> man3}/keyctl_get_keyring_ID.3 (92%)
 rename man/{ =3D> man3}/keyctl_get_persistent.3 (93%)
 rename man/{ =3D> man3}/keyctl_get_security.3 (93%)
 rename man/{ =3D> man3}/keyctl_instantiate.3 (96%)
 rename man/{ =3D> man3}/keyctl_invalidate.3 (90%)
 rename man/{ =3D> man3}/keyctl_join_session_keyring.3 (91%)
 rename man/{ =3D> man3}/keyctl_link.3 (92%)
 rename man/{ =3D> man3}/keyctl_move.3 (92%)
 rename man/{ =3D> man3}/keyctl_pkey_decrypt.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_encrypt.3 (94%)
 rename man/{ =3D> man3}/keyctl_pkey_query.3 (94%)
 rename man/{ =3D> man3}/keyctl_pkey_sign.3 (95%)
 rename man/{ =3D> man3}/keyctl_pkey_verify.3 (100%)
 rename man/{ =3D> man3}/keyctl_read.3 (94%)
 rename man/{ =3D> man3}/keyctl_restrict_keyring.3 (91%)
 rename man/{ =3D> man3}/keyctl_revoke.3 (89%)
 rename man/{ =3D> man3}/keyctl_search.3 (93%)
 rename man/{ =3D> man3}/keyctl_session_to_parent.3 (91%)
 rename man/{ =3D> man3}/keyctl_set_reqkey_keyring.3 (93%)
 rename man/{ =3D> man3}/keyctl_set_timeout.3 (90%)
 rename man/{ =3D> man3}/keyctl_setperm.3 (94%)
 rename man/{ =3D> man3}/keyctl_update.3 (91%)
 rename man/{ =3D> man3}/keyctl_watch_key.3 (95%)
 rename man/{ =3D> man3}/recursive_key_scan.3 (95%)
 rename man/{ =3D> man5}/key.dns_resolver.conf.5 (95%)
 rename man/{ =3D> man5}/request-key.conf.5 (98%)
 rename man/{ =3D> man7}/asymmetric-key.7 (99%)
 rename man/{ =3D> man7}/keyutils.7 (89%)
 rename man/{ =3D> man8}/key.dns_resolver.8 (95%)
 rename man/{ =3D> man8}/request-key.8 (92%)

Range-diff against v0:
 -:  ------- >  1:  ec0c2fa man/asymmetric-key.7: Use HISTORY instead of VE=
RSIONS
 -:  ------- >  2:  8f02c27 man: Use the LIBRARY section
 -:  ------- >  3:  e3e616f man: Fix TH arguments 4 and 5
 -:  ------- >  4:  7762f59 man: Update date in TH
 -:  ------- >  5:  7294951 man: Use lowercase in TH 1st argument
 -:  ------- >  6:  3d6ef97 man: Escape dashes in TH
 -:  ------- >  7:  5794916 man: Add SYNOPSYS section
 -:  ------- >  8:  30c25a7 man: Improve formatting of SYNOPSIS of commands
 -:  ------- >  9:  ae1e052 man/keyctl.1: Improve formatting
 -:  ------- > 10:  93e44ce man: Organize manual pages in subdirectories
--=20
2.45.2


--iikaefzdjqo5bbdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaL4ACgkQnowa+77/
2zKhWw//TnstyMGtuoR+lIQKQH0/UlUVYRj7n3tZSSwEpGaEJpEXnRJxnfdEY+9f
UyJKt40NfpZrbxa4oLVLH6i90elcEqZC24Dy8h3/+R1qOtefi/0A03BEVlIGYUpu
EJlVsiV8TAaOEv455sF/Ka+lOsS2gQmdDhfXPvVG+xmZrbUQctkA3achiPChIjEg
B/0M22grV8kWMJ3C1zt2yStUu4e1ialf9rXQuQGqorlcP94t31LfVqlvkY4Rdcw5
1Q9s4YWLcUTpDs+m+kDp/S6ZJAzx23OAP4ge91+3dmxgxp+3+kjZIyDkw5UESJMi
ZmGryRkF/1oOQGqp2GwV7Hahs8ZO72idCyeZTqLLVtbV21Yz60MLQ8fVqRQIBSpl
/H5I3ySA9s+kjGTCqcG3Ht8puzAsgB9uEK4/lygqG1m5/44RG1TggiUhIKr/Uffh
jXE6OB0rNwEzfY3wHDw7ULsT8YDjWlOelpooGDHvTvoMFfvh1yEYKTjUciVZfrVU
E8Rkyzb0eiz2BTdi2LbJuLlFAtwXFq9uvNUFqiiLKXfjEHP7nd7e4onMn5NRQW97
bTWzhAyQ15IXoOzJkYRJzSDJoOUmjMdFgdkHGQUyE1j0DV/h/n1vj4gsRQ6qx27W
wSpMAWR32G0jA0Z3FDB14YdLNvRyuFfqPehsR51cj7BrqCxsDL0=
=JpcV
-----END PGP SIGNATURE-----

--iikaefzdjqo5bbdb--

