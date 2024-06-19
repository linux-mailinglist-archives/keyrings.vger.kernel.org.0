Return-Path: <keyrings+bounces-1627-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3D90F9C0
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D8B1C21BA5
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C604615B145;
	Wed, 19 Jun 2024 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLdozA+y"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A036E762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839504; cv=none; b=KextAjWIuFhfM3GGse2mk/L2T9xwfBymGBInVFIqN0owbGWOqr5vrhPodV1nRRfHp+QggqeqZwtkY9/lbgFnmtyyg3Fbo4SvdtllPDKvI7M5iWK2xrz6pM2nv1FYJ8Ao5S4hXemWkmfRYjebamtZRyw0Ib1Y0ALkXOJG2m6lT24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839504; c=relaxed/simple;
	bh=A7/xWVLDOwmmR0U9v5350HQknLdyXmlKywxJ6vjDArw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MF9intr+BDi2oKhb4Vn8ATY9rM205sEJniAep6BsRKJrYNInlUgBwSWLImtMdOHbOawoZ6ZS983NR7CKLaE+i9h4arMWqMsMmUTKB2F/SjZ02K+H5JWkmPCLgRE5CAJq5NDzplwCuMYEZZfSLEtan/ow/xJ2QILYFJk/lWtmLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLdozA+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE77DC2BBFC;
	Wed, 19 Jun 2024 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839504;
	bh=A7/xWVLDOwmmR0U9v5350HQknLdyXmlKywxJ6vjDArw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLdozA+y5bXNgsevVrZzsSAy3R/Pa32U3CbVvUz3Www4x4f4V80gUG6/6hl2kDH7R
	 wS6zt/o56MrDTVbXaYUYQczx9qRg7ec9q4CBLiZb45LYi3JsoQJxQd7d4R2neYnRnY
	 l2zwarjVKNlhY/6Lxi3Mr3HiowDnYUgwhTmwMGlLZsYUy6XWla4jC0sswz1XKynTcU
	 DLNj65/xqy86WNx/ySISPKlERkYOneZ13mu7OhQQ4uUQ/d2719jZPU7CKhN75Ef/lS
	 MC0pxEqXAhsCI8Aozo+ec3AzHmubLYZMHk3wTOGmnitqLA+St8oW+WhHrx7qfWSHqs
	 +gB//5NL9aCCw==
Date: Thu, 20 Jun 2024 01:25:02 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 04/10] man: Update date in TH
Message-ID: <20240619232444.36444-5-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cni673xxmcd5xuws"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--cni673xxmcd5xuws
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 04/10] man: Update date in TH
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

The date in the TH line is meant to be the date of last modification
of the page.  Also, the recommended date format is YYYY-MM-DD, which
conforms to ISO-8601, so switch to it.

mandoc_man(7) says:

     TH   Set the name of the manual page for use in the page header
          and footer with the following syntax:

                .TH name section date [source [volume]]

          [...].  The recommended date format is YYYY=E2=80=90MM=E2=80=90DD=
 as
          specified in the ISO=E2=80=908601 standard; if the argument does =
not
          conform, it is printed verbatim.  If the date is empty or not
          specified, the current date is used.  [...]

groff_man_style(7) says:

         .TH identifier section [footer=E2=80=90middle [footer=E2=80=90insi=
de [header=E2=80=90middle]]]

                [...]

            By convention, footer=E2=80=90middle is the date of the most re=
cent
            modification to the man page source document, [...]

       [...]

       In the title heading (.TH), the date of the page=E2=80=99s last revi=
sion
       is more important than packaging information; it should  not  be
       omitted.  Ideally, a page maintainer will keep both up to date.

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
index 273f930..70ed935 100644
--- a/man/asymmetric-key.7
+++ b/man/asymmetric-key.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH ASYMMETRIC-KEY 7 "8 Nov 2018" keyutils
+.TH ASYMMETRIC-KEY 7 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 asymmetric \- Kernel key type for holding asymmetric keys
diff --git a/man/find_key_by_type_and_name.3 b/man/find_key_by_type_and_nam=
e.3
index 2a338e8..802b9cd 100644
--- a/man/find_key_by_type_and_name.3
+++ b/man/find_key_by_type_and_name.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH FIND_KEY_BY_TYPE_AND_NAME 3 "10 Sep 2013" keyutils
+.TH FIND_KEY_BY_TYPE_AND_NAME 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 find_key_by_type_and_name \- find a key by type and name
diff --git a/man/key.dns_resolver.8 b/man/key.dns_resolver.8
index c67df97..383f5af 100644
--- a/man/key.dns_resolver.8
+++ b/man/key.dns_resolver.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER 8 "18 May 2020" keyutils
+.TH KEY.DNS_RESOLVER 8 2024-06-19 keyutils
 .SH NAME
 key.dns_resolver \- upcall for request\-key to handle dns_resolver keys
 .SH SYNOPSIS
diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
index c395b8e..43668ca 100644
--- a/man/key.dns_resolver.conf.5
+++ b/man/key.dns_resolver.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER.CONF 5 "18 May 2020" keyutils
+.TH KEY.DNS_RESOLVER.CONF 5 2024-06-19 keyutils
 .SH NAME
 key.dns_resolver.conf \- Kernel DNS resolver config
 .SH DESCRIPTION
diff --git a/man/keyctl.1 b/man/keyctl.1
index 7aa0cb7..bb4856e 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL 1 "20 Feb 2014" keyutils
+.TH KEYCTL 1 2024-06-19 keyutils
 .SH NAME
 keyctl \- key management facility control
 .SH SYNOPSIS
diff --git a/man/keyctl.3 b/man/keyctl.3
index 0d04ea6..ef59397 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL 3 "21 Feb 2014" keyutils
+.TH KEYCTL 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_*() \- key management function wrappers
diff --git a/man/keyctl_capabilities.3 b/man/keyctl_capabilities.3
index c687faa..6686143 100644
--- a/man/keyctl_capabilities.3
+++ b/man/keyctl_capabilities.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CAPABILITIES 3 "30 May 2019" keyutils
+.TH KEYCTL_CAPABILITIES 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_capabilities \- Query subsystem capabilities
diff --git a/man/keyctl_chown.3 b/man/keyctl_chown.3
index 1c8fa9a..09d5129 100644
--- a/man/keyctl_chown.3
+++ b/man/keyctl_chown.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CHOWN 3 "4 May 2006" keyutils
+.TH KEYCTL_CHOWN 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_chown \- change the ownership of a key
diff --git a/man/keyctl_clear.3 b/man/keyctl_clear.3
index 010b175..e17acac 100644
--- a/man/keyctl_clear.3
+++ b/man/keyctl_clear.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CLEAR 3 "4 May 2006" keyutils
+.TH KEYCTL_CLEAR 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_clear \- clear a keyring
diff --git a/man/keyctl_describe.3 b/man/keyctl_describe.3
index 198f1b7..17573d0 100644
--- a/man/keyctl_describe.3
+++ b/man/keyctl_describe.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DESCRIBE 3 "4 May 2006" keyutils
+.TH KEYCTL_DESCRIBE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_describe \- describe a key
diff --git a/man/keyctl_dh_compute.3 b/man/keyctl_dh_compute.3
index 8a2d29f..b986131 100644
--- a/man/keyctl_dh_compute.3
+++ b/man/keyctl_dh_compute.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DH_COMPUTE 3 "07 Apr 2016" keyutils
+.TH KEYCTL_DH_COMPUTE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_dh_compute \- Compute a Diffie-Hellman shared secret or public key
diff --git a/man/keyctl_get_keyring_ID.3 b/man/keyctl_get_keyring_ID.3
index a754aa1..39d2115 100644
--- a/man/keyctl_get_keyring_ID.3
+++ b/man/keyctl_get_keyring_ID.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_KEYRING_ID 3 "4 May 2006" keyutils
+.TH KEYCTL_GET_KEYRING_ID 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_keyring_ID \- get the ID of a special keyring
diff --git a/man/keyctl_get_persistent.3 b/man/keyctl_get_persistent.3
index 71d8626..4f81ade 100644
--- a/man/keyctl_get_persistent.3
+++ b/man/keyctl_get_persistent.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_PERSISTENT 3 "20 Feb 2014" keyutils
+.TH KEYCTL_GET_PERSISTENT 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_persistent \- get the persistent keyring for a user
diff --git a/man/keyctl_get_security.3 b/man/keyctl_get_security.3
index b9b05c2..b0f87ab 100644
--- a/man/keyctl_get_security.3
+++ b/man/keyctl_get_security.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_SECURITY 3 "26 Feb 2010" keyutils
+.TH KEYCTL_GET_SECURITY 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_security \- retrieve a key's security context
diff --git a/man/keyctl_instantiate.3 b/man/keyctl_instantiate.3
index ff1dea5..08d0d37 100644
--- a/man/keyctl_instantiate.3
+++ b/man/keyctl_instantiate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INSTANTIATE 3 "4 May 2006" keyutils
+.TH KEYCTL_INSTANTIATE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_assume_authority, keyctl_instantiate, keyctl_instantiate_iov, keyct=
l_reject, keyctl_negate \- key instantiation functions
diff --git a/man/keyctl_invalidate.3 b/man/keyctl_invalidate.3
index e54f505..c7edf7b 100644
--- a/man/keyctl_invalidate.3
+++ b/man/keyctl_invalidate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INVALIDATE 3 "29 Aug 2013" keyutils
+.TH KEYCTL_INVALIDATE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_invalidate \- invalidate a key
diff --git a/man/keyctl_join_session_keyring.3 b/man/keyctl_join_session_ke=
yring.3
index 65233f8..0d5793e 100644
--- a/man/keyctl_join_session_keyring.3
+++ b/man/keyctl_join_session_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_JOIN_SESSION_KEYRING 3 "20 Feb 2014" keyutils
+.TH KEYCTL_JOIN_SESSION_KEYRING 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_join_session_keyring \- join a different session keyring
diff --git a/man/keyctl_link.3 b/man/keyctl_link.3
index 7b607bf..bf57651 100644
--- a/man/keyctl_link.3
+++ b/man/keyctl_link.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_LINK 3 "4 May 2006" keyutils
+.TH KEYCTL_LINK 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_link, keyctl_unlink \- link/unlink a key to/from a keyring
diff --git a/man/keyctl_move.3 b/man/keyctl_move.3
index 894e76d..14259d1 100644
--- a/man/keyctl_move.3
+++ b/man/keyctl_move.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_MOVE 3 "29 May 2019" keyutils
+.TH KEYCTL_MOVE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_move \- Move a key between keyrings
diff --git a/man/keyctl_pkey_encrypt.3 b/man/keyctl_pkey_encrypt.3
index f3c5478..d81c625 100644
--- a/man/keyctl_pkey_encrypt.3
+++ b/man/keyctl_pkey_encrypt.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_ENCRYPT 3 "8 Nov 2018" keyutils
+.TH KEYCTL_PKEY_ENCRYPT 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_encrypt, keyctl_pkey_decrypt \- Encrypt and decrypt data
diff --git a/man/keyctl_pkey_query.3 b/man/keyctl_pkey_query.3
index 837b9db..211aca7 100644
--- a/man/keyctl_pkey_query.3
+++ b/man/keyctl_pkey_query.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_QUERY 3 "8 Nov 2018" keyutils
+.TH KEYCTL_PKEY_QUERY 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_query \- Query public key parameters
diff --git a/man/keyctl_pkey_sign.3 b/man/keyctl_pkey_sign.3
index 5997046..0351cfe 100644
--- a/man/keyctl_pkey_sign.3
+++ b/man/keyctl_pkey_sign.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_SIGN 3 "8 Nov 2018" keyutils
+.TH KEYCTL_PKEY_SIGN 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_sign, keyctl_pkey_verify \- Generate and verify signatures
diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
index 8b767a3..a672526 100644
--- a/man/keyctl_read.3
+++ b/man/keyctl_read.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_READ 3 "21 Feb 2014" keyutils
+.TH KEYCTL_READ 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_read \- read a key
diff --git a/man/keyctl_restrict_keyring.3 b/man/keyctl_restrict_keyring.3
index 1f3d1eb..63f9f7e 100644
--- a/man/keyctl_restrict_keyring.3
+++ b/man/keyctl_restrict_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_RESTRICT_KEYRING 3 "28 Feb 2017" keyutils
+.TH KEYCTL_RESTRICT_KEYRING 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_restrict_keyring \- restrict keys that may be linked to a keyring
diff --git a/man/keyctl_revoke.3 b/man/keyctl_revoke.3
index a00b1f8..22f8b4c 100644
--- a/man/keyctl_revoke.3
+++ b/man/keyctl_revoke.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_REVOKE 3 "4 May 2006" keyutils
+.TH KEYCTL_REVOKE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_revoke \- revoke a key
diff --git a/man/keyctl_search.3 b/man/keyctl_search.3
index c779fb0..7b56310 100644
--- a/man/keyctl_search.3
+++ b/man/keyctl_search.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SEARCH 3 "4 May 2006" keyutils
+.TH KEYCTL_SEARCH 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_search \- search a keyring for a key
diff --git a/man/keyctl_session_to_parent.3 b/man/keyctl_session_to_parent.3
index e208459..56d2c92 100644
--- a/man/keyctl_session_to_parent.3
+++ b/man/keyctl_session_to_parent.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SESSION_TO_PARENT 3 "20 Feb 2014" keyutils
+.TH KEYCTL_SESSION_TO_PARENT 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_session_to_parent \- set the parent process's session keyring
diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/keyctl_set_reqkey_keyrin=
g.3
index e742f13..356a008 100644
--- a/man/keyctl_set_reqkey_keyring.3
+++ b/man/keyctl_set_reqkey_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_REQKEY_KEYRING 3 "4 May 2006" keyutils
+.TH KEYCTL_SET_REQKEY_KEYRING 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_reqkey_keyring \- set the implicit destination keyring
diff --git a/man/keyctl_set_timeout.3 b/man/keyctl_set_timeout.3
index b5d055b..36c3274 100644
--- a/man/keyctl_set_timeout.3
+++ b/man/keyctl_set_timeout.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_TIMEOUT 3 "4 May 2006" keyutils
+.TH KEYCTL_SET_TIMEOUT 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_timeout \- set the expiration timer on a key
diff --git a/man/keyctl_setperm.3 b/man/keyctl_setperm.3
index f246946..30dff85 100644
--- a/man/keyctl_setperm.3
+++ b/man/keyctl_setperm.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SETPERM 3 "4 May 2006" keyutils
+.TH KEYCTL_SETPERM 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_setperm \- change the permissions mask on a key
diff --git a/man/keyctl_update.3 b/man/keyctl_update.3
index 4cff75c..d292c4f 100644
--- a/man/keyctl_update.3
+++ b/man/keyctl_update.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_UPDATE 3 "4 May 2006" keyutils
+.TH KEYCTL_UPDATE 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_update \- update a key
diff --git a/man/keyctl_watch_key.3 b/man/keyctl_watch_key.3
index b8ed158..57534a8 100644
--- a/man/keyctl_watch_key.3
+++ b/man/keyctl_watch_key.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GRANT_PERMISSION 3 "28 Aug 2019" keyutils
+.TH KEYCTL_GRANT_PERMISSION 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_watch_key \- Watch for changes to a key
diff --git a/man/keyutils.7 b/man/keyutils.7
index f17ee35..08402e0 100644
--- a/man/keyutils.7
+++ b/man/keyutils.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYUTILS 7 "21 Feb 2014" keyutils
+.TH KEYUTILS 7 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyutils \- in-kernel key management utilities
diff --git a/man/recursive_key_scan.3 b/man/recursive_key_scan.3
index daf75f1..fe690f9 100644
--- a/man/recursive_key_scan.3
+++ b/man/recursive_key_scan.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH RECURSIVE_KEY_SCAN 3 "10 Mar 2011" keyutils
+.TH RECURSIVE_KEY_SCAN 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 recursive_key_scan, recursive_session_key_scan \- apply a function to all =
keys in a keyring tree
diff --git a/man/request-key.8 b/man/request-key.8
index 1db6ebc..242db77 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY 8 "15 Nov 2011" keyutils
+.TH REQUEST-KEY 8 2024-06-19 keyutils
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
diff --git a/man/request-key.conf.5 b/man/request-key.conf.5
index dde6295..29ba977 100644
--- a/man/request-key.conf.5
+++ b/man/request-key.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY.CONF 5 "15 November 2011" keyutils
+.TH REQUEST-KEY.CONF 5 2024-06-19 keyutils
 .SH NAME
 request\-key.conf \- Instantiation handler configuration file
 .SH DESCRIPTION
--=20
2.45.2


--cni673xxmcd5xuws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaM0ACgkQnowa+77/
2zKKwhAAiZgGZvo95LXw5dlXHatjYRJsxthq+c/dd27tkP7FOnjyo5oSCqQ7VwS7
F6tcolnG0zq6mUmXAYVJhNZH+39w539nElGblGLFpNE5rIa21IfrZMVmxM6IenQB
59In1gdLCR55D2btP8iZ3LjjxppipX97E3pAVn7MEN1M44c4qzvkdMBzvOGIuw7K
pY6b5J2v+o5pzV1BDtU6ir2HMh+81ZCW+pbeMTiurK7yLD0tBxNy32qp9RoQIGry
xqf4t/Hw8pxoOGtfE/QwGZOzbhSIXAZOCbTby4DarSTfhj+oNJPmXNjHDWwaoehK
ecQKsPFkq7VWbxXCrvtvJgwDSsG2/LwQXIG1dyDr9h5MON9ObsRPQRSP8c25aT4m
fQvQ6SA4XZq7U6a0w4vo0+IWG5VZ8JlbTHsjwc1+BgTExqFDis5tHV+VAwl+fvkR
DP28Ib/LD5uaUG7C34194e7I4e8C6dQTnJdX98rnfgjjlnvFWdGfarATXQ4LUP+X
PpuArbDlFBajSyUhWck2ZGkfP0/xOHummE5MtUy2O583Yz/vF2FrKxq3HAxIrCcL
UMiObiDbY4nLUoaS2J5dLIwIwUSYoulUY8t8aGSZqFlTdc524i+1sG5CR0zjkseo
BVmMQpKTN4hTJnQkZAlMaBwU6nIdTPiQT0RIBJBMQrTozOlYCN4=
=P/hX
-----END PGP SIGNATURE-----

--cni673xxmcd5xuws--

