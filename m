Return-Path: <keyrings+bounces-1628-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A990F9C2
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094C6B21C69
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826E015B147;
	Wed, 19 Jun 2024 23:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRWC8Cya"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D19E762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839508; cv=none; b=F0eMo39XL/mN8NyWEQfLigkS2gG/REZf3PLlQUnxZUueF4EYaTUB1zL6GLH34MmyWIyOxfQQqyYfpBpFHQYWMqj11urJt/flwmKwE8t5VccWGHx2bFoCK+UwnL6uScu6WTxeLKdAh9fj2MRFFywp/e2cLGyF7rfgAJG3OJq/7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839508; c=relaxed/simple;
	bh=uQpjNvmqr94RYtXfjBFOidvT2SIHvXqv6lAji58npmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+c798sGd07NJ0vSoFkjdC+hRc3vKYhtNff/8fLDgxBCun55yy7JpbDKsT0cwI/WnyjYY3OP0HXTvRkZGCXcrO4F+nG5dwTjITkJb1PUEzF/d3FBa71/qQmEAj5AOA1c/NEu00aX8+F7LIoPW9Oj1qKo0AHu3YnIuGozvN5Ni4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRWC8Cya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631ECC2BBFC;
	Wed, 19 Jun 2024 23:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839508;
	bh=uQpjNvmqr94RYtXfjBFOidvT2SIHvXqv6lAji58npmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRWC8CyaiywFeKR2UGa9DXdM5GpC1pNimOmAnEwQCRpRSjJh3dtDtF9Dm+e2H/OnB
	 ojm7s4l2Tyg2lh4gtaaSAOHmQkGLYQPvdU0+MuuVkp0yfYdV8Aql6lCuZ02mxHZ5z8
	 Yd9usBJfOSLPHP/q58MPa82vOMfhWsBLKZEsDQhdS6VnTB22S/ygHmZIL5gnXLLV1F
	 2zldoMm+lfg0tfSg05uW0MYVVG3LhujUC6a/T1T5hPukZDfgqJIA+/ruI0MyLRE/aw
	 RXVRZcaEB8nllh/AsfW1kxsvXQJC/KTiNBuQUSvEB9nofNrgGrMtPjNgvFy5watZus
	 juUHgDdFp5TwA==
Date: Thu, 20 Jun 2024 01:25:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 05/10] man: Use lowercase in TH 1st argument
Message-ID: <20240619232444.36444-6-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygwlhhjo6keozfql"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--ygwlhhjo6keozfql
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 05/10] man: Use lowercase in TH 1st argument
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

The maintainers of groff(1), mandoc(1), man(1), and the Linux man-pages
project, and several others have reached a consensus that using
upper case in the TH 1st argument is unnecessarily imprecise, and that
it would be more appropriate to use the same case that the name of the
thing to be documented: so for NULL, it would be upper case, but for
printf, it would be lower case.

The use of upper case seems to have been inertia from a time when there
was no bold face, so authors of the manual chose use upper case for
emphasis.  These days we can do better.

Link: <https://lore.kernel.org/linux-man/66c19a09-ef0f-0d85-0380-37a67ac483=
dd@gmail.com/T/#u>
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
 35 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/man/asymmetric-key.7 b/man/asymmetric-key.7
index 70ed935..bd338b4 100644
--- a/man/asymmetric-key.7
+++ b/man/asymmetric-key.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH ASYMMETRIC-KEY 7 2024-06-19 keyutils
+.TH asymmetric-key 7 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 asymmetric \- Kernel key type for holding asymmetric keys
diff --git a/man/find_key_by_type_and_name.3 b/man/find_key_by_type_and_nam=
e.3
index 802b9cd..c2e8130 100644
--- a/man/find_key_by_type_and_name.3
+++ b/man/find_key_by_type_and_name.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH FIND_KEY_BY_TYPE_AND_NAME 3 2024-06-19 keyutils
+.TH find_key_by_type_and_name 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 find_key_by_type_and_name \- find a key by type and name
diff --git a/man/key.dns_resolver.8 b/man/key.dns_resolver.8
index 383f5af..aef61db 100644
--- a/man/key.dns_resolver.8
+++ b/man/key.dns_resolver.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER 8 2024-06-19 keyutils
+.TH key.dns_resolver 8 2024-06-19 keyutils
 .SH NAME
 key.dns_resolver \- upcall for request\-key to handle dns_resolver keys
 .SH SYNOPSIS
diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
index 43668ca..052a7ff 100644
--- a/man/key.dns_resolver.conf.5
+++ b/man/key.dns_resolver.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEY.DNS_RESOLVER.CONF 5 2024-06-19 keyutils
+.TH key.dns_resolver.conf 5 2024-06-19 keyutils
 .SH NAME
 key.dns_resolver.conf \- Kernel DNS resolver config
 .SH DESCRIPTION
diff --git a/man/keyctl.1 b/man/keyctl.1
index bb4856e..59eabf7 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL 1 2024-06-19 keyutils
+.TH keyctl 1 2024-06-19 keyutils
 .SH NAME
 keyctl \- key management facility control
 .SH SYNOPSIS
diff --git a/man/keyctl.3 b/man/keyctl.3
index ef59397..f583640 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL 3 2024-06-19 keyutils
+.TH keyctl 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_*() \- key management function wrappers
diff --git a/man/keyctl_capabilities.3 b/man/keyctl_capabilities.3
index 6686143..c56b6b2 100644
--- a/man/keyctl_capabilities.3
+++ b/man/keyctl_capabilities.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CAPABILITIES 3 2024-06-19 keyutils
+.TH keyctl_capabilities 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_capabilities \- Query subsystem capabilities
diff --git a/man/keyctl_chown.3 b/man/keyctl_chown.3
index 09d5129..71b9332 100644
--- a/man/keyctl_chown.3
+++ b/man/keyctl_chown.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CHOWN 3 2024-06-19 keyutils
+.TH keyctl_chown 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_chown \- change the ownership of a key
diff --git a/man/keyctl_clear.3 b/man/keyctl_clear.3
index e17acac..c25cae3 100644
--- a/man/keyctl_clear.3
+++ b/man/keyctl_clear.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_CLEAR 3 2024-06-19 keyutils
+.TH keyctl_clear 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_clear \- clear a keyring
diff --git a/man/keyctl_describe.3 b/man/keyctl_describe.3
index 17573d0..409ec0a 100644
--- a/man/keyctl_describe.3
+++ b/man/keyctl_describe.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DESCRIBE 3 2024-06-19 keyutils
+.TH keyctl_describe 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_describe \- describe a key
diff --git a/man/keyctl_dh_compute.3 b/man/keyctl_dh_compute.3
index b986131..0f2326d 100644
--- a/man/keyctl_dh_compute.3
+++ b/man/keyctl_dh_compute.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_DH_COMPUTE 3 2024-06-19 keyutils
+.TH keyctl_dh_compute 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_dh_compute \- Compute a Diffie-Hellman shared secret or public key
diff --git a/man/keyctl_get_keyring_ID.3 b/man/keyctl_get_keyring_ID.3
index 39d2115..0e7f82d 100644
--- a/man/keyctl_get_keyring_ID.3
+++ b/man/keyctl_get_keyring_ID.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_KEYRING_ID 3 2024-06-19 keyutils
+.TH keyctl_get_keyring_ID 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_keyring_ID \- get the ID of a special keyring
diff --git a/man/keyctl_get_security.3 b/man/keyctl_get_security.3
index b0f87ab..f8d918b 100644
--- a/man/keyctl_get_security.3
+++ b/man/keyctl_get_security.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GET_SECURITY 3 2024-06-19 keyutils
+.TH keyctl_get_security 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_get_security \- retrieve a key's security context
diff --git a/man/keyctl_instantiate.3 b/man/keyctl_instantiate.3
index 08d0d37..c45a7cb 100644
--- a/man/keyctl_instantiate.3
+++ b/man/keyctl_instantiate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INSTANTIATE 3 2024-06-19 keyutils
+.TH keyctl_instantiate 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_assume_authority, keyctl_instantiate, keyctl_instantiate_iov, keyct=
l_reject, keyctl_negate \- key instantiation functions
diff --git a/man/keyctl_invalidate.3 b/man/keyctl_invalidate.3
index c7edf7b..e29e0b4 100644
--- a/man/keyctl_invalidate.3
+++ b/man/keyctl_invalidate.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_INVALIDATE 3 2024-06-19 keyutils
+.TH keyctl_invalidate 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_invalidate \- invalidate a key
diff --git a/man/keyctl_join_session_keyring.3 b/man/keyctl_join_session_ke=
yring.3
index 0d5793e..b9d5f1b 100644
--- a/man/keyctl_join_session_keyring.3
+++ b/man/keyctl_join_session_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_JOIN_SESSION_KEYRING 3 2024-06-19 keyutils
+.TH keyctl_join_session_keyring 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_join_session_keyring \- join a different session keyring
diff --git a/man/keyctl_link.3 b/man/keyctl_link.3
index bf57651..b24a03b 100644
--- a/man/keyctl_link.3
+++ b/man/keyctl_link.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_LINK 3 2024-06-19 keyutils
+.TH keyctl_link 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_link, keyctl_unlink \- link/unlink a key to/from a keyring
diff --git a/man/keyctl_move.3 b/man/keyctl_move.3
index 14259d1..ec6834d 100644
--- a/man/keyctl_move.3
+++ b/man/keyctl_move.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_MOVE 3 2024-06-19 keyutils
+.TH keyctl_move 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_move \- Move a key between keyrings
diff --git a/man/keyctl_pkey_encrypt.3 b/man/keyctl_pkey_encrypt.3
index d81c625..b3a4445 100644
--- a/man/keyctl_pkey_encrypt.3
+++ b/man/keyctl_pkey_encrypt.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_ENCRYPT 3 2024-06-19 keyutils
+.TH keyctl_pkey_encrypt 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_encrypt, keyctl_pkey_decrypt \- Encrypt and decrypt data
diff --git a/man/keyctl_pkey_query.3 b/man/keyctl_pkey_query.3
index 211aca7..ee194c7 100644
--- a/man/keyctl_pkey_query.3
+++ b/man/keyctl_pkey_query.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_QUERY 3 2024-06-19 keyutils
+.TH keyctl_pkey_query 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_query \- Query public key parameters
diff --git a/man/keyctl_pkey_sign.3 b/man/keyctl_pkey_sign.3
index 0351cfe..445114c 100644
--- a/man/keyctl_pkey_sign.3
+++ b/man/keyctl_pkey_sign.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYCTL_PKEY_SIGN 3 2024-06-19 keyutils
+.TH keyctl_pkey_sign 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_pkey_sign, keyctl_pkey_verify \- Generate and verify signatures
diff --git a/man/keyctl_read.3 b/man/keyctl_read.3
index a672526..cd0c117 100644
--- a/man/keyctl_read.3
+++ b/man/keyctl_read.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_READ 3 2024-06-19 keyutils
+.TH keyctl_read 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_read \- read a key
diff --git a/man/keyctl_restrict_keyring.3 b/man/keyctl_restrict_keyring.3
index 63f9f7e..b94c4c4 100644
--- a/man/keyctl_restrict_keyring.3
+++ b/man/keyctl_restrict_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_RESTRICT_KEYRING 3 2024-06-19 keyutils
+.TH keyctl_restrict_keyring 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_restrict_keyring \- restrict keys that may be linked to a keyring
diff --git a/man/keyctl_revoke.3 b/man/keyctl_revoke.3
index 22f8b4c..e07e708 100644
--- a/man/keyctl_revoke.3
+++ b/man/keyctl_revoke.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_REVOKE 3 2024-06-19 keyutils
+.TH keyctl_revoke 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_revoke \- revoke a key
diff --git a/man/keyctl_search.3 b/man/keyctl_search.3
index 7b56310..149bb3b 100644
--- a/man/keyctl_search.3
+++ b/man/keyctl_search.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SEARCH 3 2024-06-19 keyutils
+.TH keyctl_search 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_search \- search a keyring for a key
diff --git a/man/keyctl_session_to_parent.3 b/man/keyctl_session_to_parent.3
index 56d2c92..aedb6a3 100644
--- a/man/keyctl_session_to_parent.3
+++ b/man/keyctl_session_to_parent.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SESSION_TO_PARENT 3 2024-06-19 keyutils
+.TH keyctl_session_to_parent 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_session_to_parent \- set the parent process's session keyring
diff --git a/man/keyctl_set_reqkey_keyring.3 b/man/keyctl_set_reqkey_keyrin=
g.3
index 356a008..2f7d1f7 100644
--- a/man/keyctl_set_reqkey_keyring.3
+++ b/man/keyctl_set_reqkey_keyring.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_REQKEY_KEYRING 3 2024-06-19 keyutils
+.TH keyctl_set_reqkey_keyring 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_reqkey_keyring \- set the implicit destination keyring
diff --git a/man/keyctl_set_timeout.3 b/man/keyctl_set_timeout.3
index 36c3274..f29feb4 100644
--- a/man/keyctl_set_timeout.3
+++ b/man/keyctl_set_timeout.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SET_TIMEOUT 3 2024-06-19 keyutils
+.TH keyctl_set_timeout 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_set_timeout \- set the expiration timer on a key
diff --git a/man/keyctl_setperm.3 b/man/keyctl_setperm.3
index 30dff85..628d34c 100644
--- a/man/keyctl_setperm.3
+++ b/man/keyctl_setperm.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_SETPERM 3 2024-06-19 keyutils
+.TH keyctl_setperm 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_setperm \- change the permissions mask on a key
diff --git a/man/keyctl_update.3 b/man/keyctl_update.3
index d292c4f..11a65db 100644
--- a/man/keyctl_update.3
+++ b/man/keyctl_update.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_UPDATE 3 2024-06-19 keyutils
+.TH keyctl_update 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_update \- update a key
diff --git a/man/keyctl_watch_key.3 b/man/keyctl_watch_key.3
index 57534a8..f0087da 100644
--- a/man/keyctl_watch_key.3
+++ b/man/keyctl_watch_key.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH KEYCTL_GRANT_PERMISSION 3 2024-06-19 keyutils
+.TH keyctl_grant_permission 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyctl_watch_key \- Watch for changes to a key
diff --git a/man/keyutils.7 b/man/keyutils.7
index 08402e0..5bb1742 100644
--- a/man/keyutils.7
+++ b/man/keyutils.7
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH KEYUTILS 7 2024-06-19 keyutils
+.TH keyutils 7 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 keyutils \- in-kernel key management utilities
diff --git a/man/recursive_key_scan.3 b/man/recursive_key_scan.3
index fe690f9..aa78a25 100644
--- a/man/recursive_key_scan.3
+++ b/man/recursive_key_scan.3
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the Licence, or (at your option) any later version.
 .\"
-.TH RECURSIVE_KEY_SCAN 3 2024-06-19 keyutils
+.TH recursive_key_scan 3 2024-06-19 keyutils
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH NAME
 recursive_key_scan, recursive_session_key_scan \- apply a function to all =
keys in a keyring tree
diff --git a/man/request-key.8 b/man/request-key.8
index 242db77..1ce1761 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY 8 2024-06-19 keyutils
+.TH request-key 8 2024-06-19 keyutils
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
diff --git a/man/request-key.conf.5 b/man/request-key.conf.5
index 29ba977..fbee4df 100644
--- a/man/request-key.conf.5
+++ b/man/request-key.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH REQUEST-KEY.CONF 5 2024-06-19 keyutils
+.TH request-key.conf 5 2024-06-19 keyutils
 .SH NAME
 request\-key.conf \- Instantiation handler configuration file
 .SH DESCRIPTION
--=20
2.45.2


--ygwlhhjo6keozfql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaNEACgkQnowa+77/
2zIgtg//e+VllLWhLKykP3Nntkv1AFThVG7WD8XBtcZhgBiDtqqMBCOOsU7/UsvL
3awaq8+f1+K4KfNQlzwlFkrgFy8esfHeJTHZYKYd4KYNr/IPeI9FdBURM3fjaC7R
G2OtvmCd2O1Oo1pQ7nkWbiUA1iGXdRKrvOgcCdkXSGcainTmeMAn1lKSrkPcnEk8
uMV4Ooda8j3RIxzEQEHV+lOpBwSYgVzX+dbN5gmM0nmNZuSELgTaZCkBX27QPGCe
YPU4+2jf+AD+ZyGwtG8nsSfC/cPZ4tnH8pQU/sHmh9NUK29GcTzedpjmFBSYkFt2
O9dMQD8/fDfm9t2DsH85tuUvARc+AEF6twfeDKX0w0R6pb00F1jmuJAhASNcrPrg
PZAqVPLsYUz7sSkZjr7osS6uxKWZVjOZoWhd5eka9LnqXiy9r3If1Qh1u3PzoS38
pWZDyW0QeXTttYcSHqpvZqPshLEIV+oUcSkEp2oChzqhD8vJCV9dBlqX1nQILCow
TtzvR75QZWJOb6jp7bQNh+WIRF4lYDk+E1kv4ml8KARCNCin0hCbl0iw1aaLGqP/
NcYHRoMgW1nRXTwTbSMkM335oQwW5fhFO6ob9GjYCTYUaAe5EKWHpacqhxmUGrxy
OKd6zk98HSqc3TIw+vq7Jqv6yZndnsgXwTYVhsTCBM/QuOwMSEw=
=oj6P
-----END PGP SIGNATURE-----

--ygwlhhjo6keozfql--

