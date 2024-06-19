Return-Path: <keyrings+bounces-1625-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A711490F9BD
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 025EAB21A8D
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D7D15B14F;
	Wed, 19 Jun 2024 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3dhYdEl"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20FC15B143
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839497; cv=none; b=tKUCpMUHNZMvZsQw9L8m0GkaBgqOyOwFOnK1Y/s2oIhdesE35D3H/OtQB3i9x4nB56FKcSp1YikAMzTNuKDmDD5DPMNDlOaCkwDO1/H8dRPVTJ+QAcJW4dAIpCY3vOCK+YpEcPV1DNI3YDjWcGDkns7qRJBw6VWxAz0U6wTBK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839497; c=relaxed/simple;
	bh=kOG0Ie2qMny2QMB9JQRB9RUOmlULolpomAbrP1D5Kgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7znj916LD+dNs9Wl6l+vhloVZz9AZJ59TGbbE34vP416Gz6dWCWTQcdIYpXZj5x+b2rq74j92A50L6DN5T53tLvdlwcdsrfnptzl4B/J/Hs2gmHQPaCzaO6wofI4swSzooAMcLXEPpZuaNa46TGCuPVLGVC7MRsAb/qUJSUmvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3dhYdEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A23C2BBFC;
	Wed, 19 Jun 2024 23:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839497;
	bh=kOG0Ie2qMny2QMB9JQRB9RUOmlULolpomAbrP1D5Kgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3dhYdEl1NC/J2ZKSJUq5SmV471kHxSqcVau3XaW8yso4oqbkE4YPKgRs6yoHOxLu
	 +fFAuvCSLbrHSmEIOKwJl7DhiSV9AkjQZ5terNPUL2DlLf+ScWLWxy77kuhGEhjYQ9
	 7L3z1CkObIkDXgiBfEfuismmWucx38vyJOYLYjHyyKH2ATqnI7leS6y/Mrpax1l6+H
	 nKR767TjOPhhHQncHNAnld0O5u55CtEe1JJTwWhiUPOJJQb63GQbSbYXYbm2BVBB3u
	 3H8CWCHkNTNKyppTIY2C5h/46ZFTV8aF3iu29VH/mqSmtKjANQTkUm/HeA4CdGzueF
	 YArsnwTuMi10g==
Date: Thu, 20 Jun 2024 01:24:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 02/10] man: Use the LIBRARY section
Message-ID: <20240619232444.36444-3-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4ka5giwujewu4vq"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--d4ka5giwujewu4vq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 02/10] man: Use the LIBRARY section
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

This is the de-facto standard way of documenting the library that
provides a function, and the linker option to link to it.

This LIBRARY section is used (at least) by FreeBSD and the Linux
man-pages project.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/find_key_by_type_and_name.3   |  9 ++++-----
 man/keyctl.3                      | 11 ++++-------
 man/keyctl_capabilities.3         | 11 ++++-------
 man/keyctl_chown.3                | 11 ++++-------
 man/keyctl_clear.3                | 11 ++++-------
 man/keyctl_describe.3             | 11 ++++-------
 man/keyctl_dh_compute.3           | 11 ++++-------
 man/keyctl_get_keyring_ID.3       | 11 ++++-------
 man/keyctl_get_persistent.3       | 11 ++++-------
 man/keyctl_get_security.3         | 11 ++++-------
 man/keyctl_instantiate.3          | 11 ++++-------
 man/keyctl_invalidate.3           | 11 ++++-------
 man/keyctl_join_session_keyring.3 | 11 ++++-------
 man/keyctl_link.3                 | 11 ++++-------
 man/keyctl_move.3                 | 11 ++++-------
 man/keyctl_pkey_encrypt.3         | 11 ++++-------
 man/keyctl_pkey_query.3           | 11 ++++-------
 man/keyctl_pkey_sign.3            | 11 ++++-------
 man/keyctl_read.3                 | 11 ++++-------
 man/keyctl_restrict_keyring.3     | 11 ++++-------
 man/keyctl_revoke.3               | 11 ++++-------
 man/keyctl_search.3               | 13 ++++---------
 man/keyctl_session_to_parent.3    | 11 ++++-------
 man/keyctl_set_reqkey_keyring.3   | 11 ++++-------
 man/keyctl_set_timeout.3          | 11 ++++-------
 man/keyctl_setperm.3              | 11 ++++-------
 man/keyctl_update.3               | 11 ++++-------
 man/keyctl_watch_key.3            | 11 ++++-------
 man/keyutils.7                    | 12 ++++--------
 man/recursive_key_scan.3          |  9 ++++-----
 30 files changed, 120 insertions(+), 209 deletions(-)

diff --git a/man/find_key_by_type_and_name.3 b/man/find_key_by_type_and_nam=
e.3
index 2fbd21e..c961ece 100644
--- a/man/find_key_by_type_and_name.3
+++ b/man/find_key_by_type_and_name.3
@@ -12,6 +12,10 @@
 .SH NAME
 find_key_by_type_and_name \- find a key by type and name
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -52,11 +56,6 @@ .SH ERRORS
 .B writable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl.3 b/man/keyctl.3
index fda0363..708fcbe 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_*() \- key management function wrappers
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH DESCRIPTION
 The
 .BR keyctl ()
@@ -24,13 +28,6 @@ .SH DESCRIPTION
 .nf
 .B #include <keyutils.h>
 .RE
-.P
-and then telling the linker it should link in the library:
-.sp
-.RS
-.nf
-.B \-lkeyutils
-.RE
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH KEYCTL FUNCTIONS
 .BR keyctl_assume_authority (3)
diff --git a/man/keyctl_capabilities.3 b/man/keyctl_capabilities.3
index f816df6..86ec352 100644
--- a/man/keyctl_capabilities.3
+++ b/man/keyctl_capabilities.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_capabilities \- Query subsystem capabilities
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -104,13 +108,6 @@ .SH ERRORS
 .B EFAULT
 The buffer cannot be written to.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_chown.3 b/man/keyctl_chown.3
index f85840a..2006af4 100644
--- a/man/keyctl_chown.3
+++ b/man/keyctl_chown.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_chown \- change the ownership of a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -69,13 +73,6 @@ .SH ERRORS
 .B setattr
 permission to the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_clear.3 b/man/keyctl_clear.3
index 8da699e..34e7262 100644
--- a/man/keyctl_clear.3
+++ b/man/keyctl_clear.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_clear \- clear a keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -54,13 +58,6 @@ .SH ERRORS
 .B writable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_describe.3 b/man/keyctl_describe.3
index b4f100e..97d454b 100644
--- a/man/keyctl_describe.3
+++ b/man/keyctl_describe.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_describe \- describe a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -93,13 +97,6 @@ .SH ERRORS
 .B viewable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_dh_compute.3 b/man/keyctl_dh_compute.3
index 5b79378..befb83d 100644
--- a/man/keyctl_dh_compute.3
+++ b/man/keyctl_dh_compute.3
@@ -14,6 +14,10 @@ .SH NAME
 .br
 keyctl_dh_compute_kdf \- Derive key from a Diffie-Hellman shared secret
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -151,13 +155,6 @@ .SH ERRORS
 .I buflen
 is too big.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .BR keyctl (1),
 .br
diff --git a/man/keyctl_get_keyring_ID.3 b/man/keyctl_get_keyring_ID.3
index 6525292..4c2ca5c 100644
--- a/man/keyctl_get_keyring_ID.3
+++ b/man/keyctl_get_keyring_ID.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_get_keyring_ID \- get the ID of a special keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -77,13 +81,6 @@ .SH ERRORS
 The key quota for this user would be exceeded by creating this key or link=
ing
 it to the keyring.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_get_persistent.3 b/man/keyctl_get_persistent.3
index 8d79957..d878cbb 100644
--- a/man/keyctl_get_persistent.3
+++ b/man/keyctl_get_persistent.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_get_persistent \- get the persistent keyring for a user
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -93,13 +97,6 @@ .SH ERRORS
 .B write
 permission to the calling process.
=20
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
diff --git a/man/keyctl_get_security.3 b/man/keyctl_get_security.3
index a2c5b41..7113e2f 100644
--- a/man/keyctl_get_security.3
+++ b/man/keyctl_get_security.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_get_security \- retrieve a key's security context
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -83,13 +87,6 @@ .SH ERRORS
 .B viewable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_instantiate.3 b/man/keyctl_instantiate.3
index d436bf2..0d3b459 100644
--- a/man/keyctl_instantiate.3
+++ b/man/keyctl_instantiate.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_assume_authority, keyctl_instantiate, keyctl_instantiate_iov, keyct=
l_reject, keyctl_negate \- key instantiation functions
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -171,13 +175,6 @@ .SH ERRORS
 .B writable
 by the requester.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_invalidate.3 b/man/keyctl_invalidate.3
index 120da45..928319f 100644
--- a/man/keyctl_invalidate.3
+++ b/man/keyctl_invalidate.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_invalidate \- invalidate a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -57,13 +61,6 @@ .SH ERRORS
 .B searchable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_join_session_keyring.3 b/man/keyctl_join_session_ke=
yring.3
index 4e27717..b8ed639 100644
--- a/man/keyctl_join_session_keyring.3
+++ b/man/keyctl_join_session_keyring.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_join_session_keyring \- join a different session keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -63,13 +67,6 @@ .SH ERRORS
 .B searchable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_link.3 b/man/keyctl_link.3
index 2cbc104..9046121 100644
--- a/man/keyctl_link.3
+++ b/man/keyctl_link.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_link, keyctl_unlink \- link/unlink a key to/from a keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -88,13 +92,6 @@ .SH ERRORS
 .B linkable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_move.3 b/man/keyctl_move.3
index 6f144df..a8f0c7f 100644
--- a/man/keyctl_move.3
+++ b/man/keyctl_move.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_move \- Move a key between keyrings
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -89,13 +93,6 @@ .SH ERRORS
 .B EDQUOT
 Expanding to_keyring would exceed the keyring owner's quota.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_pkey_encrypt.3 b/man/keyctl_pkey_encrypt.3
index 5a5b71b..b199a05 100644
--- a/man/keyctl_pkey_encrypt.3
+++ b/man/keyctl_pkey_encrypt.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_pkey_encrypt, keyctl_pkey_decrypt \- Encrypt and decrypt data
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -93,13 +97,6 @@ .SH ERRORS
 .B EFAULT
 Bad address.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_pkey_query.3 b/man/keyctl_pkey_query.3
index e70665f..e7613c8 100644
--- a/man/keyctl_pkey_query.3
+++ b/man/keyctl_pkey_query.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_pkey_query \- Query public key parameters
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -116,13 +120,6 @@ .SH ERRORS
 .B EFAULT
 Bad address.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_pkey_sign.3 b/man/keyctl_pkey_sign.3
index 4fb6a14..2f0b106 100644
--- a/man/keyctl_pkey_sign.3
+++ b/man/keyctl_pkey_sign.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_pkey_sign, keyctl_pkey_verify \- Generate and verify signatures
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -114,13 +118,6 @@ .SH ERRORS
 .B EFAULT
 Bad address.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
index 97b0e24..6728b5b 100644
--- a/man/keyctl_read.3
+++ b/man/keyctl_read.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_read \- read a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -92,13 +96,6 @@ .SH ERRORS
 .B EOPNOTSUPP
 The key type does not support reading of the payload data.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_restrict_keyring.3 b/man/keyctl_restrict_keyring.3
index 468d5b4..9e4d023 100644
--- a/man/keyctl_restrict_keyring.3
+++ b/man/keyctl_restrict_keyring.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_restrict_keyring \- restrict keys that may be linked to a keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -66,13 +70,6 @@ .SH ERRORS
 .B ENOENT
 The key type exists but does not support restrictions.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_revoke.3 b/man/keyctl_revoke.3
index 622f1ac..a973d39 100644
--- a/man/keyctl_revoke.3
+++ b/man/keyctl_revoke.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_revoke \- revoke a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -54,13 +58,6 @@ .SH ERRORS
 .B writable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_search.3 b/man/keyctl_search.3
index f3e7bc5..f7db46d 100644
--- a/man/keyctl_search.3
+++ b/man/keyctl_search.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_search \- search a keyring for a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -117,15 +121,6 @@ .SH ERRORS
 .B link
 permission to the caller.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-Although this is a Linux system call, it is not present in
-.I libc
-but can be found rather in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_session_to_parent.3 b/man/keyctl_session_to_parent.3
index 829b3be..b05c030 100644
--- a/man/keyctl_session_to_parent.3
+++ b/man/keyctl_session_to_parent.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_session_to_parent \- set the parent process's session keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -56,13 +60,6 @@ .SH ERRORS
 .B linkable
 by the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/keyctl_set_reqkey_keyrin=
g.3
index 6e6725e..e8d6afa 100644
--- a/man/keyctl_set_reqkey_keyring.3
+++ b/man/keyctl_set_reqkey_keyring.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_set_reqkey_keyring \- set the implicit destination keyring
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -81,13 +85,6 @@ .SH ERRORS
 .I reqkey_defl
 is invalid.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_set_timeout.3 b/man/keyctl_set_timeout.3
index 24c7049..ec8b364 100644
--- a/man/keyctl_set_timeout.3
+++ b/man/keyctl_set_timeout.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_set_timeout \- set the expiration timer on a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -62,13 +66,6 @@ .SH ERRORS
 .B setattr
 permission to the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_setperm.3 b/man/keyctl_setperm.3
index d5d9015..8607680 100644
--- a/man/keyctl_setperm.3
+++ b/man/keyctl_setperm.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_setperm \- change the permissions mask on a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -111,13 +115,6 @@ .SH ERRORS
 .B setattr
 permission to the calling process.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_update.3 b/man/keyctl_update.3
index 2d44740..cdf0a8e 100644
--- a/man/keyctl_update.3
+++ b/man/keyctl_update.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_update \- update a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -77,13 +81,6 @@ .SH ERRORS
 .B EOPNOTSUPP
 The key type does not support the update operation on its keys.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyctl_watch_key.3 b/man/keyctl_watch_key.3
index 044b7a3..0cfba6f 100644
--- a/man/keyctl_watch_key.3
+++ b/man/keyctl_watch_key.3
@@ -12,6 +12,10 @@
 .SH NAME
 keyctl_watch_key \- Watch for changes to a key
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -187,13 +191,6 @@ .SH ERRORS
 .B EBADSLT
 The specified key doesn't have a watch on it (removal only).
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-This is a library function that can be found in
-.IR libkeyutils .
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
diff --git a/man/keyutils.7 b/man/keyutils.7
index e17253b..3ab193c 100644
--- a/man/keyutils.7
+++ b/man/keyutils.7
@@ -12,6 +12,10 @@
 .SH NAME
 keyutils \- in-kernel key management utilities
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH DESCRIPTION
 The
 .B keyutils
@@ -25,14 +29,6 @@ .SH DESCRIPTION
 .B #include <keyutils.h>
 .RE
 .P
-To link with the library, the following:
-.P
-.RS
-.B \-lkeyutils
-.RE
-.P
-should be specified to the linker.
-.P
 Three system calls are provided:
 .TP
 .BR add_key (2)
diff --git a/man/recursive_key_scan.3 b/man/recursive_key_scan.3
index 8658002..4e38d4a 100644
--- a/man/recursive_key_scan.3
+++ b/man/recursive_key_scan.3
@@ -12,6 +12,10 @@
 .SH NAME
 recursive_key_scan, recursive_session_key_scan \- apply a function to all =
keys in a keyring tree
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH LIBRARY
+Key management utilities library
+.RI ( libkeyutils ,\~ \-lkeyutils )
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SYNOPSIS
 .nf
 .B #include <keyutils.h>
@@ -77,11 +81,6 @@ .SH RETURN VALUE
 .SH ERRORS
 Ignored.
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
-.SH LINKING
-When linking,
-.B \-lkeyutils
-should be specified to the linker.
-.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH SEE ALSO
 .ad l
 .nh
--=20
2.45.2


--d4ka5giwujewu4vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaMYACgkQnowa+77/
2zJnMg/+IqlpN6OA2WQTV/fbTA9EZgj6YdxOe4oxLXqqJfzagF3nJQv5gS+niaMN
6l8sE1sre8uXwBpo/ZTbAWt+QkdxXXFyakRyOi+G5MsXSI1rNp197y3MfiitfxyB
YkNwcJwAokDE8pAuIgzRInQRfOkHcKTf0qo9aOE0/+v5S7o5qcla9b328LMslsSP
JfdjxEVnn714NsZgpTSiGWQp00ZdhXw1AFqphaERRivc20j4SHPRxZ59nBHTSj3P
ONYRspxE0btWjh3BP3PRKzikxRadT30nIF/tSsj2tXGQWFhuSXD/SbkMquCU71Y0
Dm7ijqUApKEwIH5rrnsvd3dMgqULtignx7+reFZqx4VNtPbkLWP2RosO9yvKDww9
Sj1WFwj9KYCqZ2gGGcqCXm5xnTvSgom9YWrzBU1B2qEiSggZgGAIWHoWFB9/8hk4
HlGb/8bDd0q7U9OQRBwaEnMC83MLenC0FvRrXt3Fv/NJf2wRw9rpWFi50+r5j91X
bckGwKPXfSl+ze/J1wdKrs68+Tel8a7qPUwNFEH4DEFPv0FPNK6oGF2K3TTS4k9K
CMuXwM9YA+gYy4U1eYBiOAHyl+l3/apsJIYQ+9XVbDSprUPe/wsWcQHDC6M9BBT6
IImje6pNswfXKvch9wmaGL30Q0dnw7Z3qt7LVY/IDSTMbThRd5c=
=uypp
-----END PGP SIGNATURE-----

--d4ka5giwujewu4vq--

