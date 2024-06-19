Return-Path: <keyrings+bounces-1629-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5C90F9C3
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26DB1F238AF
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294FA15B147;
	Wed, 19 Jun 2024 23:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oqwic8Br"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EDD762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839512; cv=none; b=FTkUHsB/nGAvCUzHedtDAXIFUwOWg8qMKhFVywlrjv4Ktjv7P9D+D0iIFDM+5QvXiNMZDq64UG93uI5wA1eFcBQMxSVIJl8zEFK5zo2wy5P6ww3BSXPgVBS9y3VqQPg5EQ6xXqrrsf2MpJiVcK86kMUGjYkufCx190Jt2n1TJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839512; c=relaxed/simple;
	bh=PrIbiM9cXPYfxcm5HJh2GxzF8CVL+ITwgnxG3U/BCx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0MznzNURbOnrn2wQseDIX7Jzjzr/YJP10DMY0f31zeXpj4m3BbGPuK/Zw7QSOaWfZPO8Q+RhHl6EFWeEUpXVh98QEjefWwrhPQalnf9eqJ/bk6claPQdWN66dRjyxF1IajG+OIcfECsqDpz6hln5ArTBDCTPTpmEfaaJhIDmxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oqwic8Br; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150DBC2BBFC;
	Wed, 19 Jun 2024 23:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839511;
	bh=PrIbiM9cXPYfxcm5HJh2GxzF8CVL+ITwgnxG3U/BCx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oqwic8BrHTC9GsXwUzSasjzyZ6Rjpjc7xQWcTkKfcKsEXGKvcTyrim44YjY4b3lSm
	 Vx4dlYoklNVzXwpQvGIBcwv9cOmk6JHiiAzR81qoH2Ao2yYYboyUPhCAP6fMh1qhch
	 Y0XbfUmj4cy248FtCyDQoqsJ+WM1DN1pCmy+71SD/DlS4EEIALds52x3UysKCw7mxW
	 yuK63sNiBnWdl15X9Ii2dq1fR3A21GGMk+GGgLX7GFwzR0qAKpJn31FNqF4JwL92Cz
	 BQYKMWc6tTdYxnJLJ7Fg4joXHt5FaBE/dgb8hCiDHe2PUQqrD1SXC2zfhyQMfVIvxA
	 BHun3XFPbD7Ww==
Date: Thu, 20 Jun 2024 01:25:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 06/10] man: Escape dashes in TH
Message-ID: <20240619232444.36444-7-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3n36meof7keqcwl2"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--3n36meof7keqcwl2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 06/10] man: Escape dashes in TH
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

When they document an identifier that uses a dash.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/request-key.8      | 2 +-
 man/request-key.conf.5 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man/request-key.8 b/man/request-key.8
index 1ce1761..d49ca78 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH request-key 8 2024-06-19 keyutils
+.TH request\-key 8 2024-06-19 keyutils
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
diff --git a/man/request-key.conf.5 b/man/request-key.conf.5
index fbee4df..c2e77d4 100644
--- a/man/request-key.conf.5
+++ b/man/request-key.conf.5
@@ -7,7 +7,7 @@
 .\" as published by the Free Software Foundation; either version
 .\" 2 of the License, or (at your option) any later version.
 .\"
-.TH request-key.conf 5 2024-06-19 keyutils
+.TH request\-key.conf 5 2024-06-19 keyutils
 .SH NAME
 request\-key.conf \- Instantiation handler configuration file
 .SH DESCRIPTION
--=20
2.45.2


--3n36meof7keqcwl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaNUACgkQnowa+77/
2zL61w/+KThtRHk1Z6N6NH9OJy6SMwZGKQrco66zfF3J5t9Fn73eK6vgyFmgyQZ2
HVMydI1IZVT5+f8/H3zghH2Ezs/Du28oLL8AMISgHovBQ/uD4Hq4KVQIHAwaLv3N
cneoi1tHSpQbEsqSlyju0BItshe+njP6cE+hiB4CNLwuy4mwBSQU9v4YRgEPWMi+
O18pwgNKGINbYU48J0t6CbAQMsRpojEBqxjU1PrrIPmOa75dFI457yjuD6CoGV68
VD96TZ6B7J4vwW6tF48fOQM0PSmyJ9xtvTxFvHy7383HX5qn/xj78uc+WSaj7p+S
7668cXCKIYSnaJizgViD0YJ6GXRT8SiRgulC9M2P/aYHE6EcDYfxXWNL/iuj6A4L
6Gf+R+Oi9PfAEnB1UE3mRNRZuidkNQqzXsdMUkHrfn0kKfHFh43lt+8oDqDVkB5f
C+odQT/tRMasIZlg6hvzBIygfVMd1xdgNsE4gMFJCY7DMHWZ9DuY2KbgQWjrA9Bq
FIhag9zfGJfnFk+W5gbBdxTqpIewem4TrezZpiHjvtEwZEg5EiutU5qW+haqvo7d
TeS+w9hdX7ng1pDCDFTfSXh2PkHtXv0eOHBekYtQM7JtF7dL41Ede2ZIZ93rero3
UZyvpv95R/WbbyGNc0D4LC2KUZ7KxsAg3AgMiDrT9Z+YL92r3ek=
=pqj+
-----END PGP SIGNATURE-----

--3n36meof7keqcwl2--

