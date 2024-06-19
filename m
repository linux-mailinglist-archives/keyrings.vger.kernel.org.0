Return-Path: <keyrings+bounces-1626-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89490F9BF
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01741F2390A
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBB915B147;
	Wed, 19 Jun 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIHadh1D"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D415B145
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839501; cv=none; b=MN32ZBLTab3RQMEcco8Kpgo2aUv122DuFiIrj8XFskYccP7q7Us/xdv8KjA33dTrM2MItRS6dDWMxo+SRWGEqK7xmSt+UOycq9cT25n7BFfN30sPWvNYKNCklOsOgM/FS9ngMTZ+vFjN5WY7+NCuVzGmuVJhnSPdVCJT00SWn34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839501; c=relaxed/simple;
	bh=nbXQDsFi5e40L98y2QzXaWpV4nOAiyayF2HAmQa0zRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taiEimaQyMLv7AU7PrYGRqWaoBK4SdG5Setrlh3AnM9OoxhXDTju8NaSLNuF7ps/uHMs8gRCDo1+ZeR8d2vW1SlvAu+bT7v0FL0TPb+PL+ZcYKAiQqwjWUnGWJJL0ZVJwMIl6ocdZsZCr1E5b4HC+RhAFQyY7gDgYhNRoBAKOjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIHadh1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B90FC2BBFC;
	Wed, 19 Jun 2024 23:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839500;
	bh=nbXQDsFi5e40L98y2QzXaWpV4nOAiyayF2HAmQa0zRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIHadh1DvC4Q3cXuQ5L1U1BQtcJKqpgCdkA5iAFrMmQn8NXZTywwHHvZ3UfAbTsJd
	 L5jDd7uzDb6tACdnJczw0uzzdKVaXrACxc/RGAfZVp1iQqKbrOF7bZzVmOaPEqcOeH
	 yU76mJEASsxQr0Fzj5TQWGyTHRNx8z0H0KmdWgEgpg0SuZdc9VAb8qLY2b/K4mllPp
	 gU0BNnLkNBtGo6RgMgb5iAADoVX3jAeHLKdFnWlcZPqixHkfcWinXR3YW2M792bLA/
	 mHfdBlgbwn+n6Db7WsotlcqKQGy1bx2pJdk2Kx4sxwf90O07FkRnoMOiWURsnD2h0d
	 TMQSQOjhyvZ6w==
Date: Thu, 20 Jun 2024 01:24:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 03/10] man: Fix TH arguments 4 and 5
Message-ID: <20240619232444.36444-4-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6fx7ojz2eyoxihp"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--y6fx7ojz2eyoxihp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 03/10] man: Fix TH arguments 4 and 5
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

mandoc_man(7) says:

     TH   Set the name of the manual page for use in the page header
          and footer with the following syntax:

                .TH name section date [source [volume]]

          [...].  The recommended date format is YYYY=E2=80=90MM=E2=80=90DD=
 as
          specified in the ISO=E2=80=908601 standard; if the argument does =
not
          conform, it is printed verbatim.  If the date is empty or not
          specified, the current date is used.  The optional source
          string specifies the organisation providing the utility.
          When unspecified, mandoc(1) uses its -Ios argument.  The
          volume string replaces the default volume title of the
          section.

groff_man_style(7) says:

     .TH identifier section [footer=E2=80=90middle [footer=E2=80=90inside [=
header=E2=80=90middle]]]

            [...]

            By convention, footer=E2=80=90middle is the date of the most re=
cent
            modification to the man page source document,  and  footer=E2=
=80=90
            inside  is  the  name and version or release of the project
            providing it.

The 5th argument is usually to be omitted, and it will default to the
description of the chapter of the manual, that is, for man3 it will be
"Library Functions Manual".

The 4th argument should be the name of the project providing the manual
page, possibly including the version of it.  For example, in the Linux
man-pages project, we use the following in the git repository:

	.TH keyctl 2 (date) "Linux man-pages (unreleased)"

and the following on a release:

	.TH keyctl 2 2024-06-15 "Linux man-pages 6.9.1"

Here, I'd use keyutils, or possibly keyutils-X.Y.  For now, I've made it
just contain the project name.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/asymmetric-key.7              | 2 +-
 man/find_key_by_type_and_name.3   | 2 +-
 man/key.dns_resolver.8            | 2 +-
 man/key.dns_resolver.conf.5       | 2 +-
 man/keyctl.1                      | 2 +-
 man/keyctl.3                      | 2 +-
 man/keyctl_capabilities.3         | 2 +-
 man/keyctl_chown.3                | 2 +-
 man/keyctl_clear.3                | 2 +-
 man/keyctl_describe.3             | 2 +-
 man/keyctl_dh_compute.3           | 2 +-
 man/keyctl_get_keyring_ID.3       | 2 +-
 man/keyctl_get_persistent.3       | 2 +-
 man/keyctl_get_security.3         | 2 +-
 man/keyctl_instantiate.3          | 2 +-
 man/keyctl_invalidate.3           | 2 +-
 man/keyctl_join_session_keyring.3 | 2 +-
 man/keyctl_link.3                 | 2 +-
 man/keyctl_move.3                 | 2 +-
 man/keyctl_pkey_encrypt.3         | 2 +-
 man/keyctl_pkey_query.3           | 2 +-
 man/keyctl_pkey_sign.3            | 2 +-
 man/keyctl_read.3                 | 2 +-
 man/keyctl_restrict_keyring.3     | 2 +-
 man/keyctl_revoke.3               | 2 +-
 man/keyctl_search.3               | 2 +-
 man/keyctl_session_to_parent.3    | 2 +-
 man/keyctl_set_reqkey_keyring.3   | 2 +-
 man/keyctl_set_timeout.3          | 2 +-
 man/keyctl_setperm.3              | 2 +-
 man/keyctl_update.3               | 2 +-
 man/keyctl_watch_key.3            | 2 +-
 man/keyutils.7                    | 2 +-
 man/recursive_key_scan.3          | 2 +-
 man/request-key.8                 | 2 +-
 man/request-key.conf.5            | 2 +-
 36 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/man/asymmetric-key.7 b/man/asymmetric-key.7
index 82193f6..273f930 100644
--- a/man/asymmetric-key.7
+++ b/man/asymmetric-key.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH ASYMMETRIC-KEY 7 "8 Nov 2018" Linux "Asymmetric Kernel Key Type"
+.TH ASYMMETRIC-KEY 7 "8 Nov 2018" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 asymmetric \- Kernel key type for holding asymmetric keys
diff --git a/man/find_key_by_type_and_name.3 b/man/find_key_by_type_and_nam=
e.3
index c961ece..2a338e8 100644
--- a/man/find_key_by_type_and_name.3
+++ b/man/find_key_by_type_and_name.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH FIND_KEY_BY_TYPE_AND_NAME 3 "10 Sep 2013" Linux "Linux Key Utility Cal=
ls"
+.TH FIND_KEY_BY_TYPE_AND_NAME 3 "10 Sep 2013" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 find_key_by_type_and_name \- find a key by type and name
diff --git a/man/key.dns_resolver.8 b/man/key.dns_resolver.8
index 0b17edd..c67df97 100644
--- a/man/key.dns_resolver.8
+++ b/man/key.dns_resolver.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER 8 "18 May 2020" Linux "Linux Key Management Utilities"
+.TH KEY.DNS_RESOLVER 8 "18 May 2020" keyutils
 .SH NAME
 key.dns_resolver \- upcall for request\-key to handle dns_resolver keys
 .SH SYNOPSIS
diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
index c944ad5..c395b8e 100644
--- a/man/key.dns_resolver.conf.5
+++ b/man/key.dns_resolver.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER.CONF 5 "18 May 2020" Linux "Linux Key Management Util=
ities"
+.TH KEY.DNS_RESOLVER.CONF 5 "18 May 2020" keyutils
 .SH NAME
 key.dns_resolver.conf \- Kernel DNS resolver config
 .SH DESCRIPTION
diff --git a/man/keyctl.1 b/man/keyctl.1
index c1d067f..7aa0cb7 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL 1 "20 Feb 2014" Linux "Linux Key Management Utilities"
+.TH KEYCTL 1 "20 Feb 2014" keyutils
 .SH NAME
 keyctl \- key management facility control
 .SH SYNOPSIS
diff --git a/man/keyctl.3 b/man/keyctl.3
index 708fcbe..0d04ea6 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL 3 "21 Feb 2014" Linux "Linux Key Management Calls"
+.TH KEYCTL 3 "21 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_*() \- key management function wrappers
diff --git a/man/keyctl_capabilities.3 b/man/keyctl_capabilities.3
index 86ec352..c687faa 100644
--- a/man/keyctl_capabilities.3
+++ b/man/keyctl_capabilities.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CAPABILITIES 3 "30 May 2019" Linux "Linux Key Management Calls"
+.TH KEYCTL_CAPABILITIES 3 "30 May 2019" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_capabilities \- Query subsystem capabilities
diff --git a/man/keyctl_chown.3 b/man/keyctl_chown.3
index 2006af4..1c8fa9a 100644
--- a/man/keyctl_chown.3
+++ b/man/keyctl_chown.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CHOWN 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_CHOWN 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_chown \- change the ownership of a key
diff --git a/man/keyctl_clear.3 b/man/keyctl_clear.3
index 34e7262..010b175 100644
--- a/man/keyctl_clear.3
+++ b/man/keyctl_clear.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CLEAR 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_CLEAR 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_clear \- clear a keyring
diff --git a/man/keyctl_describe.3 b/man/keyctl_describe.3
index 97d454b..198f1b7 100644
--- a/man/keyctl_describe.3
+++ b/man/keyctl_describe.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DESCRIBE 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_DESCRIBE 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_describe \- describe a key
diff --git a/man/keyctl_dh_compute.3 b/man/keyctl_dh_compute.3
index befb83d..8a2d29f 100644
--- a/man/keyctl_dh_compute.3
+++ b/man/keyctl_dh_compute.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DH_COMPUTE 3 "07 Apr 2016" Linux "Linux Key Management Calls"
+.TH KEYCTL_DH_COMPUTE 3 "07 Apr 2016" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_dh_compute \- Compute a Diffie-Hellman shared secret or public key
diff --git a/man/keyctl_get_keyring_ID.3 b/man/keyctl_get_keyring_ID.3
index 4c2ca5c..a754aa1 100644
--- a/man/keyctl_get_keyring_ID.3
+++ b/man/keyctl_get_keyring_ID.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_KEYRING_ID 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_GET_KEYRING_ID 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_keyring_ID \- get the ID of a special keyring
diff --git a/man/keyctl_get_persistent.3 b/man/keyctl_get_persistent.3
index d878cbb..71d8626 100644
--- a/man/keyctl_get_persistent.3
+++ b/man/keyctl_get_persistent.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_PERSISTENT 3 "20 Feb 2014" Linux "Linux Key Management Call=
s"
+.TH KEYCTL_GET_PERSISTENT 3 "20 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_persistent \- get the persistent keyring for a user
diff --git a/man/keyctl_get_security.3 b/man/keyctl_get_security.3
index 7113e2f..b9b05c2 100644
--- a/man/keyctl_get_security.3
+++ b/man/keyctl_get_security.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_SECURITY 3 "26 Feb 2010" Linux "Linux Key Management Calls"
+.TH KEYCTL_GET_SECURITY 3 "26 Feb 2010" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_security \- retrieve a key's security context
diff --git a/man/keyctl_instantiate.3 b/man/keyctl_instantiate.3
index 0d3b459..ff1dea5 100644
--- a/man/keyctl_instantiate.3
+++ b/man/keyctl_instantiate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INSTANTIATE 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_INSTANTIATE 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_assume_authority, keyctl_instantiate, keyctl_instantiate_iov, keyct=
l_reject, keyctl_negate \- key instantiation functions
diff --git a/man/keyctl_invalidate.3 b/man/keyctl_invalidate.3
index 928319f..e54f505 100644
--- a/man/keyctl_invalidate.3
+++ b/man/keyctl_invalidate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INVALIDATE 3 "29 Aug 2013" Linux "Linux Key Management Calls"
+.TH KEYCTL_INVALIDATE 3 "29 Aug 2013" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_invalidate \- invalidate a key
diff --git a/man/keyctl_join_session_keyring.3 b/man/keyctl_join_session_ke=
yring.3
index b8ed639..65233f8 100644
--- a/man/keyctl_join_session_keyring.3
+++ b/man/keyctl_join_session_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_JOIN_SESSION_KEYRING 3 "20 Feb 2014" Linux "Linux Key Managemen=
t Calls"
+.TH KEYCTL_JOIN_SESSION_KEYRING 3 "20 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_join_session_keyring \- join a different session keyring
diff --git a/man/keyctl_link.3 b/man/keyctl_link.3
index 9046121..7b607bf 100644
--- a/man/keyctl_link.3
+++ b/man/keyctl_link.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_LINK 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_LINK 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_link, keyctl_unlink \- link/unlink a key to/from a keyring
diff --git a/man/keyctl_move.3 b/man/keyctl_move.3
index a8f0c7f..894e76d 100644
--- a/man/keyctl_move.3
+++ b/man/keyctl_move.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_MOVE 3 "29 May 2019" Linux "Linux Key Management Calls"
+.TH KEYCTL_MOVE 3 "29 May 2019" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_move \- Move a key between keyrings
diff --git a/man/keyctl_pkey_encrypt.3 b/man/keyctl_pkey_encrypt.3
index b199a05..f3c5478 100644
--- a/man/keyctl_pkey_encrypt.3
+++ b/man/keyctl_pkey_encrypt.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_ENCRYPT 3 "8 Nov 2018" Linux "Linux Public-Key Encryption"
+.TH KEYCTL_PKEY_ENCRYPT 3 "8 Nov 2018" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_encrypt, keyctl_pkey_decrypt \- Encrypt and decrypt data
diff --git a/man/keyctl_pkey_query.3 b/man/keyctl_pkey_query.3
index e7613c8..837b9db 100644
--- a/man/keyctl_pkey_query.3
+++ b/man/keyctl_pkey_query.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_QUERY 3 "8 Nov 2018" Linux "Linux Key Management Calls"
+.TH KEYCTL_PKEY_QUERY 3 "8 Nov 2018" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_query \- Query public key parameters
diff --git a/man/keyctl_pkey_sign.3 b/man/keyctl_pkey_sign.3
index 2f0b106..5997046 100644
--- a/man/keyctl_pkey_sign.3
+++ b/man/keyctl_pkey_sign.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_SIGN 3 "8 Nov 2018" Linux "Linux Public-Key Signatures"
+.TH KEYCTL_PKEY_SIGN 3 "8 Nov 2018" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_sign, keyctl_pkey_verify \- Generate and verify signatures
diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
index 6728b5b..8b767a3 100644
--- a/man/keyctl_read.3
+++ b/man/keyctl_read.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_READ 3 "21 Feb 2014" Linux "Linux Key Management Calls"
+.TH KEYCTL_READ 3 "21 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_read \- read a key
diff --git a/man/keyctl_restrict_keyring.3 b/man/keyctl_restrict_keyring.3
index 9e4d023..1f3d1eb 100644
--- a/man/keyctl_restrict_keyring.3
+++ b/man/keyctl_restrict_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_RESTRICT_KEYRING 3 "28 Feb 2017" Linux "Linux Key Management Ca=
lls"
+.TH KEYCTL_RESTRICT_KEYRING 3 "28 Feb 2017" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_restrict_keyring \- restrict keys that may be linked to a keyring
diff --git a/man/keyctl_revoke.3 b/man/keyctl_revoke.3
index a973d39..a00b1f8 100644
--- a/man/keyctl_revoke.3
+++ b/man/keyctl_revoke.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_REVOKE 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_REVOKE 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_revoke \- revoke a key
diff --git a/man/keyctl_search.3 b/man/keyctl_search.3
index f7db46d..c779fb0 100644
--- a/man/keyctl_search.3
+++ b/man/keyctl_search.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SEARCH 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_SEARCH 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_search \- search a keyring for a key
diff --git a/man/keyctl_session_to_parent.3 b/man/keyctl_session_to_parent.3
index b05c030..e208459 100644
--- a/man/keyctl_session_to_parent.3
+++ b/man/keyctl_session_to_parent.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SESSION_TO_PARENT 3 "20 Feb 2014" Linux "Linux Key Management C=
alls"
+.TH KEYCTL_SESSION_TO_PARENT 3 "20 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_session_to_parent \- set the parent process's session keyring
diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/keyctl_set_reqkey_keyrin=
g.3
index e8d6afa..e742f13 100644
--- a/man/keyctl_set_reqkey_keyring.3
+++ b/man/keyctl_set_reqkey_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_REQKEY_KEYRING 3 "4 May 2006" Linux "Linux Key Management C=
alls"
+.TH KEYCTL_SET_REQKEY_KEYRING 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_reqkey_keyring \- set the implicit destination keyring
diff --git a/man/keyctl_set_timeout.3 b/man/keyctl_set_timeout.3
index ec8b364..b5d055b 100644
--- a/man/keyctl_set_timeout.3
+++ b/man/keyctl_set_timeout.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_TIMEOUT 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_SET_TIMEOUT 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_timeout \- set the expiration timer on a key
diff --git a/man/keyctl_setperm.3 b/man/keyctl_setperm.3
index 8607680..f246946 100644
--- a/man/keyctl_setperm.3
+++ b/man/keyctl_setperm.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SETPERM 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_SETPERM 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_setperm \- change the permissions mask on a key
diff --git a/man/keyctl_update.3 b/man/keyctl_update.3
index cdf0a8e..4cff75c 100644
--- a/man/keyctl_update.3
+++ b/man/keyctl_update.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_UPDATE 3 "4 May 2006" Linux "Linux Key Management Calls"
+.TH KEYCTL_UPDATE 3 "4 May 2006" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_update \- update a key
diff --git a/man/keyctl_watch_key.3 b/man/keyctl_watch_key.3
index 0cfba6f..b8ed158 100644
--- a/man/keyctl_watch_key.3
+++ b/man/keyctl_watch_key.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GRANT_PERMISSION 3 "28 Aug 2019" Linux "Linux Key Management Ca=
lls"
+.TH KEYCTL_GRANT_PERMISSION 3 "28 Aug 2019" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_watch_key \- Watch for changes to a key
diff --git a/man/keyutils.7 b/man/keyutils.7
index 3ab193c..f17ee35 100644
--- a/man/keyutils.7
+++ b/man/keyutils.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYUTILS 7 "21 Feb 2014" Linux "Kernel key management"
+.TH KEYUTILS 7 "21 Feb 2014" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyutils \- in-kernel key management utilities
diff --git a/man/recursive_key_scan.3 b/man/recursive_key_scan.3
index 4e38d4a..daf75f1 100644
--- a/man/recursive_key_scan.3
+++ b/man/recursive_key_scan.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH RECURSIVE_KEY_SCAN 3 "10 Mar 2011" Linux "Linux Key Utility Calls"
+.TH RECURSIVE_KEY_SCAN 3 "10 Mar 2011" keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 recursive_key_scan, recursive_session_key_scan \- apply a function to all =
keys in a keyring tree
diff --git a/man/request-key.8 b/man/request-key.8
index 50a7506..1db6ebc 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY 8 "15 Nov 2011" Linux "Linux Key Management Utilities"
+.TH REQUEST-KEY 8 "15 Nov 2011" keyutils
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
diff --git a/man/request-key.conf.5 b/man/request-key.conf.5
index 276c771..dde6295 100644
--- a/man/request-key.conf.5
+++ b/man/request-key.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY.CONF 5 "15 November 2011" Linux "Linux Key Management Util=
ities"
+.TH REQUEST-KEY.CONF 5 "15 November 2011" keyutils
 .SH NAME
 request\-key.conf \- Instantiation handler configuration file
 .SH DESCRIPTION
--=20
2.45.2


--y6fx7ojz2eyoxihp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaMoACgkQnowa+77/
2zJyaBAAgmQpPBgMKa+npm15YDXqlIsdEoPkEheEK9as5Fm16c5/9CRoHRcT701j
jcaurYIuGHNdtQdBOpBLcFU1K5pHWyXp3Jo0/aa42b4g527R6Wl1RD/YVzMx03oT
z9GFuwGehp2zWD7DUv4HmWuq8lGIcQ9m8ca4pRTPNvMFCPwdTmCSalYqL9fTNfS8
qhE1r05sJf9QcRiRysrTL0wd7Dp7e/oTn9R8/4aWLdM770mPXOFTevGLkpqW1cL7
8NR760/OXPOKdZthu7pgveor1V6u5BwIywSCsxYfB+uGcroHjGbcHtIuKaaJoI7z
UfODWQgARGg70A9Y+IW9oGJNo1avTGDmi8CgPJKIkm5kVKOrKPRdT3aW4ktiQ03y
g2EuhFxfu5giAJqBXGivNQuGmWYGHTnKP6TL5usDm31zm2y/leTVrRfLny7aEjKD
bdFca2A/940Cak4qP9qq1mQlYudtU/rOqkKznsMm/mfi54kGM/mhlswBPeOEBLAF
4yMUsBP9GhSTG84Vrb80zU0ZviZQbhqBA2xL/kDnIaPe8Is/kztnfNxGUk2Ohdyk
eZ2GR55+4znEaiXFQOPkdAx40ySpia8DBFbgdDcMFGx18Dxn3P1jZ1w+oH/AB1EK
EneRl0c77mFq38GtrIUHyqdCji4xdRePrkwoLyoBlwFLV8weaZY=
=2M/V
-----END PGP SIGNATURE-----

--y6fx7ojz2eyoxihp--

