Return-Path: <keyrings+bounces-1633-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A459890F9C7
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1C51C2138F
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A32C15B145;
	Wed, 19 Jun 2024 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oER3nZY+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E3A762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839527; cv=none; b=pPwTswE8B0nOZOIFl+up2xgRNb+VoR0UMKe+C9Trml1Q/B6WxsA0iyw8EsQiviMSkTN3OfxAYFiMAlI3nDW4w5TIICBNalot7KCXGmKWu+SunO6TwCPhZHfUWpE0ryP5utoUpShppNf6zB+DV+nniAyP5QSkWhyfpacd2gtkM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839527; c=relaxed/simple;
	bh=zqmOG5dd4E6vCkadFjsSfUHiFU0o+C5c1x0SLOvpzlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZnGWzHlQlalZFcphwFm0i/HoWw4tal2kWxy4LcAzSbZ63kb0xrTpfz1H+XiGeHU15VCneTBOu14qUJV3e/u0t2I6smi8OQE+1KIZZp8eDIx1PSmIpC88NMvl1fTJlZ4D49Y+242GsuJ7mR05FNjRh+b2NIfW6aOsccRE+yHQU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oER3nZY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86FDC2BBFC;
	Wed, 19 Jun 2024 23:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839526;
	bh=zqmOG5dd4E6vCkadFjsSfUHiFU0o+C5c1x0SLOvpzlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oER3nZY+otXFUzeq/5WigjYzPgD/1LKIK2j2zevz2bh7igMszO0lX8ZfbjTS9RhTM
	 Z5MXtcshHG7lEJwhxJB7uBMSrdw/HvzDs4m1HMRzYIgNiOVcRIxzvjmgWCwgCAxlAW
	 0/bu/+Z7GBW1Flfz7RN22Qm2oxAKMyGk++vM7iRlX+Za8AB376yjb6Kj1/OIZLr6FY
	 BAnIrhsbpW96phytGf87zgNBZDmDqptbQJavz/mfH8mr7Juc0fXOKmGAUu00a+WF6W
	 HmrorQuTY9Q04OfP1CMhUoidZqzjoB1WU7RZyUPv0J9Z9JjzZt6uyyA7MXCMxcdOIO
	 z9Sexs+ajHz6g==
Date: Thu, 20 Jun 2024 01:25:24 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 10/10] man: Organize manual pages in subdirectories
Message-ID: <20240619232444.36444-11-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jhup2j64rn4gfwfw"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--jhup2j64rn4gfwfw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 10/10] man: Organize manual pages in subdirectories
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 Makefile                                     | 10 +++++-----
 man/{ =3D> man1}/keyctl.1                      |  0
 man/{ =3D> man3}/find_key_by_type_and_name.3   |  0
 man/{ =3D> man3}/keyctl.3                      |  0
 man/{ =3D> man3}/keyctl_capabilities.3         |  0
 man/{ =3D> man3}/keyctl_chown.3                |  0
 man/{ =3D> man3}/keyctl_clear.3                |  0
 man/{ =3D> man3}/keyctl_describe.3             |  0
 man/{ =3D> man3}/keyctl_dh_compute.3           |  0
 man/{ =3D> man3}/keyctl_get_keyring_ID.3       |  0
 man/{ =3D> man3}/keyctl_get_persistent.3       |  0
 man/{ =3D> man3}/keyctl_get_security.3         |  0
 man/{ =3D> man3}/keyctl_instantiate.3          |  0
 man/{ =3D> man3}/keyctl_invalidate.3           |  0
 man/{ =3D> man3}/keyctl_join_session_keyring.3 |  0
 man/{ =3D> man3}/keyctl_link.3                 |  0
 man/{ =3D> man3}/keyctl_move.3                 |  0
 man/{ =3D> man3}/keyctl_pkey_decrypt.3         |  0
 man/{ =3D> man3}/keyctl_pkey_encrypt.3         |  0
 man/{ =3D> man3}/keyctl_pkey_query.3           |  0
 man/{ =3D> man3}/keyctl_pkey_sign.3            |  0
 man/{ =3D> man3}/keyctl_pkey_verify.3          |  0
 man/{ =3D> man3}/keyctl_read.3                 |  0
 man/{ =3D> man3}/keyctl_restrict_keyring.3     |  0
 man/{ =3D> man3}/keyctl_revoke.3               |  0
 man/{ =3D> man3}/keyctl_search.3               |  0
 man/{ =3D> man3}/keyctl_session_to_parent.3    |  0
 man/{ =3D> man3}/keyctl_set_reqkey_keyring.3   |  0
 man/{ =3D> man3}/keyctl_set_timeout.3          |  0
 man/{ =3D> man3}/keyctl_setperm.3              |  0
 man/{ =3D> man3}/keyctl_update.3               |  0
 man/{ =3D> man3}/keyctl_watch_key.3            |  0
 man/{ =3D> man3}/recursive_key_scan.3          |  0
 man/{ =3D> man5}/key.dns_resolver.conf.5       |  0
 man/{ =3D> man5}/request-key.conf.5            |  0
 man/{ =3D> man7}/asymmetric-key.7              |  0
 man/{ =3D> man7}/keyutils.7                    |  0
 man/{ =3D> man8}/key.dns_resolver.8            |  0
 man/{ =3D> man8}/request-key.8                 |  0
 39 files changed, 5 insertions(+), 5 deletions(-)
 rename man/{ =3D> man1}/keyctl.1 (100%)
 rename man/{ =3D> man3}/find_key_by_type_and_name.3 (100%)
 rename man/{ =3D> man3}/keyctl.3 (100%)
 rename man/{ =3D> man3}/keyctl_capabilities.3 (100%)
 rename man/{ =3D> man3}/keyctl_chown.3 (100%)
 rename man/{ =3D> man3}/keyctl_clear.3 (100%)
 rename man/{ =3D> man3}/keyctl_describe.3 (100%)
 rename man/{ =3D> man3}/keyctl_dh_compute.3 (100%)
 rename man/{ =3D> man3}/keyctl_get_keyring_ID.3 (100%)
 rename man/{ =3D> man3}/keyctl_get_persistent.3 (100%)
 rename man/{ =3D> man3}/keyctl_get_security.3 (100%)
 rename man/{ =3D> man3}/keyctl_instantiate.3 (100%)
 rename man/{ =3D> man3}/keyctl_invalidate.3 (100%)
 rename man/{ =3D> man3}/keyctl_join_session_keyring.3 (100%)
 rename man/{ =3D> man3}/keyctl_link.3 (100%)
 rename man/{ =3D> man3}/keyctl_move.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_decrypt.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_encrypt.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_query.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_sign.3 (100%)
 rename man/{ =3D> man3}/keyctl_pkey_verify.3 (100%)
 rename man/{ =3D> man3}/keyctl_read.3 (100%)
 rename man/{ =3D> man3}/keyctl_restrict_keyring.3 (100%)
 rename man/{ =3D> man3}/keyctl_revoke.3 (100%)
 rename man/{ =3D> man3}/keyctl_search.3 (100%)
 rename man/{ =3D> man3}/keyctl_session_to_parent.3 (100%)
 rename man/{ =3D> man3}/keyctl_set_reqkey_keyring.3 (100%)
 rename man/{ =3D> man3}/keyctl_set_timeout.3 (100%)
 rename man/{ =3D> man3}/keyctl_setperm.3 (100%)
 rename man/{ =3D> man3}/keyctl_update.3 (100%)
 rename man/{ =3D> man3}/keyctl_watch_key.3 (100%)
 rename man/{ =3D> man3}/recursive_key_scan.3 (100%)
 rename man/{ =3D> man5}/key.dns_resolver.conf.5 (100%)
 rename man/{ =3D> man5}/request-key.conf.5 (100%)
 rename man/{ =3D> man7}/asymmetric-key.7 (100%)
 rename man/{ =3D> man7}/keyutils.7 (100%)
 rename man/{ =3D> man8}/key.dns_resolver.8 (100%)
 rename man/{ =3D> man8}/request-key.8 (100%)

diff --git a/Makefile b/Makefile
index d8d4ee3..d8d058d 100644
--- a/Makefile
+++ b/Makefile
@@ -221,15 +221,15 @@ endif
 	mkdir -p $(DESTDIR)$(ETCDIR)/request-key.d
 	mkdir -p $(DESTDIR)$(ETCDIR)/keyutils
 	mkdir -p $(DESTDIR)$(MAN1)
-	$(INSTALL) -m 0644 $(wildcard man/*.1) $(DESTDIR)$(MAN1)
+	$(INSTALL) -m 0644 $(wildcard man/man1/*.1) $(DESTDIR)$(MAN1)
 	mkdir -p $(DESTDIR)$(MAN3)
-	$(INSTALL) -m 0644 $(wildcard man/*.3) $(DESTDIR)$(MAN3)
+	$(INSTALL) -m 0644 $(wildcard man/man3/*.3) $(DESTDIR)$(MAN3)
 	mkdir -p $(DESTDIR)$(MAN5)
-	$(INSTALL) -m 0644 $(wildcard man/*.5) $(DESTDIR)$(MAN5)
+	$(INSTALL) -m 0644 $(wildcard man/man5/*.5) $(DESTDIR)$(MAN5)
 	mkdir -p $(DESTDIR)$(MAN7)
-	$(INSTALL) -m 0644 $(wildcard man/*.7) $(DESTDIR)$(MAN7)
+	$(INSTALL) -m 0644 $(wildcard man/man7/*.7) $(DESTDIR)$(MAN7)
 	mkdir -p $(DESTDIR)$(MAN8)
-	$(INSTALL) -m 0644 $(wildcard man/*.8) $(DESTDIR)$(MAN8)
+	$(INSTALL) -m 0644 $(wildcard man/man8/*.8) $(DESTDIR)$(MAN8)
 	$(LNS) keyctl_describe.3 $(DESTDIR)$(MAN3)/keyctl_describe_alloc.3
 	$(LNS) keyctl_get_security.3 $(DESTDIR)$(MAN3)/keyctl_get_security_alloc.3
 	$(LNS) keyctl_instantiate.3 $(DESTDIR)$(MAN3)/keyctl_instantiate_iov.3
diff --git a/man/keyctl.1 b/man/man1/keyctl.1
similarity index 100%
rename from man/keyctl.1
rename to man/man1/keyctl.1
diff --git a/man/find_key_by_type_and_name.3 b/man/man3/find_key_by_type_an=
d_name.3
similarity index 100%
rename from man/find_key_by_type_and_name.3
rename to man/man3/find_key_by_type_and_name.3
diff --git a/man/keyctl.3 b/man/man3/keyctl.3
similarity index 100%
rename from man/keyctl.3
rename to man/man3/keyctl.3
diff --git a/man/keyctl_capabilities.3 b/man/man3/keyctl_capabilities.3
similarity index 100%
rename from man/keyctl_capabilities.3
rename to man/man3/keyctl_capabilities.3
diff --git a/man/keyctl_chown.3 b/man/man3/keyctl_chown.3
similarity index 100%
rename from man/keyctl_chown.3
rename to man/man3/keyctl_chown.3
diff --git a/man/keyctl_clear.3 b/man/man3/keyctl_clear.3
similarity index 100%
rename from man/keyctl_clear.3
rename to man/man3/keyctl_clear.3
diff --git a/man/keyctl_describe.3 b/man/man3/keyctl_describe.3
similarity index 100%
rename from man/keyctl_describe.3
rename to man/man3/keyctl_describe.3
diff --git a/man/keyctl_dh_compute.3 b/man/man3/keyctl_dh_compute.3
similarity index 100%
rename from man/keyctl_dh_compute.3
rename to man/man3/keyctl_dh_compute.3
diff --git a/man/keyctl_get_keyring_ID.3 b/man/man3/keyctl_get_keyring_ID.3
similarity index 100%
rename from man/keyctl_get_keyring_ID.3
rename to man/man3/keyctl_get_keyring_ID.3
diff --git a/man/keyctl_get_persistent.3 b/man/man3/keyctl_get_persistent.3
similarity index 100%
rename from man/keyctl_get_persistent.3
rename to man/man3/keyctl_get_persistent.3
diff --git a/man/keyctl_get_security.3 b/man/man3/keyctl_get_security.3
similarity index 100%
rename from man/keyctl_get_security.3
rename to man/man3/keyctl_get_security.3
diff --git a/man/keyctl_instantiate.3 b/man/man3/keyctl_instantiate.3
similarity index 100%
rename from man/keyctl_instantiate.3
rename to man/man3/keyctl_instantiate.3
diff --git a/man/keyctl_invalidate.3 b/man/man3/keyctl_invalidate.3
similarity index 100%
rename from man/keyctl_invalidate.3
rename to man/man3/keyctl_invalidate.3
diff --git a/man/keyctl_join_session_keyring.3 b/man/man3/keyctl_join_sessi=
on_keyring.3
similarity index 100%
rename from man/keyctl_join_session_keyring.3
rename to man/man3/keyctl_join_session_keyring.3
diff --git a/man/keyctl_link.3 b/man/man3/keyctl_link.3
similarity index 100%
rename from man/keyctl_link.3
rename to man/man3/keyctl_link.3
diff --git a/man/keyctl_move.3 b/man/man3/keyctl_move.3
similarity index 100%
rename from man/keyctl_move.3
rename to man/man3/keyctl_move.3
diff --git a/man/keyctl_pkey_decrypt.3 b/man/man3/keyctl_pkey_decrypt.3
similarity index 100%
rename from man/keyctl_pkey_decrypt.3
rename to man/man3/keyctl_pkey_decrypt.3
diff --git a/man/keyctl_pkey_encrypt.3 b/man/man3/keyctl_pkey_encrypt.3
similarity index 100%
rename from man/keyctl_pkey_encrypt.3
rename to man/man3/keyctl_pkey_encrypt.3
diff --git a/man/keyctl_pkey_query.3 b/man/man3/keyctl_pkey_query.3
similarity index 100%
rename from man/keyctl_pkey_query.3
rename to man/man3/keyctl_pkey_query.3
diff --git a/man/keyctl_pkey_sign.3 b/man/man3/keyctl_pkey_sign.3
similarity index 100%
rename from man/keyctl_pkey_sign.3
rename to man/man3/keyctl_pkey_sign.3
diff --git a/man/keyctl_pkey_verify.3 b/man/man3/keyctl_pkey_verify.3
similarity index 100%
rename from man/keyctl_pkey_verify.3
rename to man/man3/keyctl_pkey_verify.3
diff --git a/man/keyctl_read.3 b/man/man3/keyctl_read.3
similarity index 100%
rename from man/keyctl_read.3
rename to man/man3/keyctl_read.3
diff --git a/man/keyctl_restrict_keyring.3 b/man/man3/keyctl_restrict_keyri=
ng.3
similarity index 100%
rename from man/keyctl_restrict_keyring.3
rename to man/man3/keyctl_restrict_keyring.3
diff --git a/man/keyctl_revoke.3 b/man/man3/keyctl_revoke.3
similarity index 100%
rename from man/keyctl_revoke.3
rename to man/man3/keyctl_revoke.3
diff --git a/man/keyctl_search.3 b/man/man3/keyctl_search.3
similarity index 100%
rename from man/keyctl_search.3
rename to man/man3/keyctl_search.3
diff --git a/man/keyctl_session_to_parent.3 b/man/man3/keyctl_session_to_pa=
rent.3
similarity index 100%
rename from man/keyctl_session_to_parent.3
rename to man/man3/keyctl_session_to_parent.3
diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/man3/keyctl_set_reqkey_k=
eyring.3
similarity index 100%
rename from man/keyctl_set_reqkey_keyring.3
rename to man/man3/keyctl_set_reqkey_keyring.3
diff --git a/man/keyctl_set_timeout.3 b/man/man3/keyctl_set_timeout.3
similarity index 100%
rename from man/keyctl_set_timeout.3
rename to man/man3/keyctl_set_timeout.3
diff --git a/man/keyctl_setperm.3 b/man/man3/keyctl_setperm.3
similarity index 100%
rename from man/keyctl_setperm.3
rename to man/man3/keyctl_setperm.3
diff --git a/man/keyctl_update.3 b/man/man3/keyctl_update.3
similarity index 100%
rename from man/keyctl_update.3
rename to man/man3/keyctl_update.3
diff --git a/man/keyctl_watch_key.3 b/man/man3/keyctl_watch_key.3
similarity index 100%
rename from man/keyctl_watch_key.3
rename to man/man3/keyctl_watch_key.3
diff --git a/man/recursive_key_scan.3 b/man/man3/recursive_key_scan.3
similarity index 100%
rename from man/recursive_key_scan.3
rename to man/man3/recursive_key_scan.3
diff --git a/man/key.dns_resolver.conf.5 b/man/man5/key.dns_resolver.conf.5
similarity index 100%
rename from man/key.dns_resolver.conf.5
rename to man/man5/key.dns_resolver.conf.5
diff --git a/man/request-key.conf.5 b/man/man5/request-key.conf.5
similarity index 100%
rename from man/request-key.conf.5
rename to man/man5/request-key.conf.5
diff --git a/man/asymmetric-key.7 b/man/man7/asymmetric-key.7
similarity index 100%
rename from man/asymmetric-key.7
rename to man/man7/asymmetric-key.7
diff --git a/man/keyutils.7 b/man/man7/keyutils.7
similarity index 100%
rename from man/keyutils.7
rename to man/man7/keyutils.7
diff --git a/man/key.dns_resolver.8 b/man/man8/key.dns_resolver.8
similarity index 100%
rename from man/key.dns_resolver.8
rename to man/man8/key.dns_resolver.8
diff --git a/man/request-key.8 b/man/man8/request-key.8
similarity index 100%
rename from man/request-key.8
rename to man/man8/request-key.8
--=20
2.45.2


--jhup2j64rn4gfwfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaOQACgkQnowa+77/
2zL/mw//QNQeKDIwydw3bJC0iB99tjsnmBa/0Ot28y+2rRj6i9XBq+g29PYt3knA
ST4P5C22GKa4PZIreswp0wnwoEg3x1ELdksa0xRAKyAkV0iLcyvUH6yG08ad/6MB
BUT2qh58yKByN8xq4uMgB1ykaTW1d5reswglrrAIEFYQF0+zGxtKBb7KHUeHMogD
nRhoCAmjQAOnihLzZbqpQ8Z6Vzw5xChEf1CQjhlvu5+zapls+YqePr5KpDYU9IYy
CoBIYRZkZg2nHoY6DiQ4HPtEz2hiWW33gsRqKpmWQ9Mm6fTDxQkR/73nxnhuej6w
EkYdre9ECfnqMDDyvrRqPOf7iplXD2f3AYWFIk7soE494eDv9/MtWaX02G4xf8oC
uP6uKnttXlr8D97/VPmbRYKfUSsUHLcg9QpeiAJ4X66BtRVS2MXafBVbVCjWPjeC
bYp7Fii/7TXupwruor97Myz3lcvOMfnmN8XM7VoqW6TdLTzVbjPHn+QbDbx6aw1s
1JjrUkf6yrqQwnBcVkOWd1BVRzw6GKx7ldxxhYEkHp3ot1KZdWG7QLksvLIAH0pR
kZhqDey+yVD9aKq+UTzQvJ7xR16D5itgfbqhF+2+qR1Adz4xPs4UbQcvmQU8vMOl
xgvl3rnEbREzPzlOS8u6u5Fnc/6Hu2kqfCozJmLXQFcFgYjc1QA=
=968k
-----END PGP SIGNATURE-----

--jhup2j64rn4gfwfw--

