Return-Path: <keyrings+bounces-1630-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1A90F9C4
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9011F238AF
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA1A15B145;
	Wed, 19 Jun 2024 23:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKZ3RQ3A"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B2762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839515; cv=none; b=CLrVrbqd6IPU/ji+usnalpZTmJyLVTm1ZuvipiRs9xX52ws/iBzpXtFIP84xgwdrrOKphxNS8ZjAknqck6nvphMEQs+EWl1LtRm4Rs3ZlqUmzrHb0bSjSrzxCXPQaw5mSkX6/JXs0d4LjNeH4I5IJzDRd3XAb++IbYjDSflE4oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839515; c=relaxed/simple;
	bh=OTyEfod0n6GaPTMy+FfJyNifU9qCfuguwDaKVtyJYVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCOgPEyf7eR0KKQXaUlaLhHqYGHQQM7TAGj6Ucv4QJqK9PUl19M+lKgc7iZh5NCzxp1oekthAde+rb0mWG08mikT/NZwGAtAuoHqqQEQMaNDeJ4PRDy3pUHAMuyw1iXLs9f67JjmivEA/eBp4DX04DAaTPYtmSd3fadgmq/hCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKZ3RQ3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CBEC2BBFC;
	Wed, 19 Jun 2024 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839515;
	bh=OTyEfod0n6GaPTMy+FfJyNifU9qCfuguwDaKVtyJYVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKZ3RQ3AUZmacEHwEapRILi1aLntQ6BX1YW26Z/qeqsLWFrFIicDAFqkPfTXWUYol
	 SeKtw0tAb8YiBy7T8TYa+y2rbvTJofMojeFkF0yR6R0RaA2NX2mrnS8fzG4eF+JKAV
	 zThVSA81bsH8KIv9X1MmJ4sjsXY9Zai1Zksck7zKjjJN/hUVpiQ4lb8M83MqsogQX1
	 QHdyRjtfYuvOqVytmnvNPHu2mgGjM/wA1aELOpdMrxqvjsxqTA99QB2TJIlB1BcVKO
	 nK6pv/Hd828q16UZbkLM7+0Qw7HxEAjgsMYGO4kaATd+9tZLRmgonROP2t7u6dQdJb
	 DXp2R2czHwp/Q==
Date: Thu, 20 Jun 2024 01:25:13 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 07/10] man: Add SYNOPSYS section
Message-ID: <20240619232444.36444-8-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hamwbnkumrk4khkw"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--hamwbnkumrk4khkw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 07/10] man: Add SYNOPSYS section
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

This is a simpler and more standard way of documenting the header that
provides these functions.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/keyctl.3   | 12 +++++-------
 man/keyutils.7 | 12 +++++-------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/man/keyctl.3 b/man/keyctl.3
index f583640..352b0c4 100644
--- a/man/keyctl.3
+++ b/man/keyctl.3
@@ -16,18 +16,16 @@ .SH LIBRARY
 Key management utilities library
 .RI ( libkeyutils ,\~ \-lkeyutils )
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH SYNOPSIS
+.nf
+.B #include <keyutils.h>
+.fi
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH DESCRIPTION
 The
 .BR keyctl ()
 system call is a multiplexor for a number of key management functions.  Th=
ese
 should be called via the wrappers in the libkeyutils library.
-.P
-The functions can be compiled in by including the \fBkeyutils\fR header fi=
le:
-.sp
-.RS
-.nf
-.B #include <keyutils.h>
-.RE
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH KEYCTL FUNCTIONS
 .BR keyctl_assume_authority (3)
diff --git a/man/keyutils.7 b/man/keyutils.7
index 5bb1742..33811e7 100644
--- a/man/keyutils.7
+++ b/man/keyutils.7
@@ -16,19 +16,17 @@ .SH LIBRARY
 Key management utilities library
 .RI ( libkeyutils ,\~ \-lkeyutils )
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
+.SH SYNOPSIS
+.nf
+.B #include <keyutils.h>
+.fi
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""=
"""""
 .SH DESCRIPTION
 The
 .B keyutils
 package is a library and a set of utilities for accessing the kernel
 \fBkeyrings\fP facility.
 .P
-A header file is supplied to provide the definitions and declarations requ=
ired
-to access the library:
-.P
-.RS
-.B #include <keyutils.h>
-.RE
-.P
 Three system calls are provided:
 .TP
 .BR add_key (2)
--=20
2.45.2


--hamwbnkumrk4khkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaNgACgkQnowa+77/
2zIRYRAAhZEG6D1KDrYg6z3l44GwUsu65wz8pvmt+9zchIAyH0yQBwMzqaxE+uva
PXJ3S/dNvrGr6CWIzr9fXxHUQGyAp+OztEu/Z1GLMnK1XkM1CFl+nLvUlk7DJr+R
2MjFeVFkKo79S/R0WPoFgwf61veLlcqi1QcQOfzfhDpLynrPkYoEA4/3qxo4wBQy
3xqWVdepRZ6HAw5njExpVA2IlIs1DihGZIedl6xlGw6FvNSJ330ZmxMzKu0Lk/Zz
gkX3oihMdaUPCA6NTxHkHMuiRKmh0UpiQ0qCkOmis31KMOuEaIjPgNATPIZPnBHd
ycBVWl/s9LoHFkPkEgrxc6PF6nqsTERNjP115WGGCUqQY31BHKyr6jQbk9qpblTA
R3Ht2WbSRzSzGJogbod7Z/EEV/FND5s1N+3zkwCtF8Eu1VQaNxUkjpzeGQef8KrF
Xrewezd2YKe/OKsFMCgNCPmmnwwLGTFf+gcHBLCJV/Ux0C0+QSxaAQskVw7IWbHE
5/wL5alfj7rDe3Ufv1m/zXK0xVCF3k5hXXveyttwWaK+0/JuvyXToHv4Ew+NO+mW
aqSS3wmB+P7r/3UXRVVrhTk+wUySbPepZTtNM1yHNETVMXW1xHcz142jmSGGkQKr
TKpNjLABl6a1mhyIJwC9VDWmD+NU3UNmPCeclGrnWKWr7LnFyrg=
=06/n
-----END PGP SIGNATURE-----

--hamwbnkumrk4khkw--

