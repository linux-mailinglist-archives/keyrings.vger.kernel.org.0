Return-Path: <keyrings+bounces-1631-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA690F9C5
	for <lists+keyrings@lfdr.de>; Thu, 20 Jun 2024 01:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AC11C21331
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2024 23:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D8115B145;
	Wed, 19 Jun 2024 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4tjnLpV"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE264762C1
	for <keyrings@vger.kernel.org>; Wed, 19 Jun 2024 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839519; cv=none; b=XJGmivZQnaIxX7KjJYR5nWFaUf1FJKb82NN1zJo3+4F2rcHXoIl+9PvdA2FzkoZpczGYrfxQSZvnbvJE/ffnyslQABZJRLw5T1AE5glxZlg44CF1EVEOw7OHpzJZ5pIVo60NjCwSkonF5tW4t98Ul7ir5N91LWayCwFBbW+wm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839519; c=relaxed/simple;
	bh=ClFxDF/rVkPAXxxcP6pKi94V6NXq87GnrM7oCvFaxEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQo5xZ48v3IajP2+gLgoVWonRKBgTYvQGUlrh7TTu1YHSBY+Mtizh4jhuGDI1EXpTBVGikDeHKT5/krs7KI2NC6A4AcAu58ECSTjhml9RZYlRjwAAMW0bdxpIgtRWm6fKMQPA69mAwyXoOmfePQX6PiWnZeGqs4FTP6OYCt16pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4tjnLpV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7831EC2BBFC;
	Wed, 19 Jun 2024 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718839519;
	bh=ClFxDF/rVkPAXxxcP6pKi94V6NXq87GnrM7oCvFaxEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4tjnLpVwlo8IMfjkTn1oMtr5CiLQ396HeesDjYmPcDK0Y6oeX0LULemPXgUgSw0l
	 ULRAOOxfISgGsV7uwcB2+ogU95Y0vwc5jeCY8HDEhFGoADcLsw9f2ieF+iiwYfbxzv
	 /QJjNdiSu/fkN2OI5NWQ4lz3eKAwCllKRHJ7dZ6fFRvjvv7ciQyIeb9FTF6AYnqRRC
	 mkiP3owHyDKrCqfbCmHYNYvopE7pFNXpy5ERJOVstIOsfBszAwRhsAJZJGtB/6MCqy
	 CEv8hL2qRdDYVTvXX4RipTUbSGnkPSYrR0xLSyQ0SQmrUEpprKH5POKL3MGwQcXzsr
	 vWTOsaxcRAkzQ==
Date: Thu, 20 Jun 2024 01:25:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 08/10] man: Improve formatting of SYNOPSIS of commands
Message-ID: <20240619232444.36444-9-alx@kernel.org>
X-Mailer: git-send-email 2.45.2
References: <20240619232444.36444-1-alx@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p3s4cepzebtc4ity"
Content-Disposition: inline
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>


--p3s4cepzebtc4ity
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v1 08/10] man: Improve formatting of SYNOPSIS of commands
References: <20240619232444.36444-1-alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240619232444.36444-1-alx@kernel.org>

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man/keyctl.1      | 426 ++++++++++++++++++++++++++++++++++------------
 man/request-key.8 |  12 +-
 2 files changed, 324 insertions(+), 114 deletions(-)

diff --git a/man/keyctl.1 b/man/keyctl.1
index 59eabf7..59172d4 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -11,118 +11,320 @@
 .SH NAME
 keyctl \- key management facility control
 .SH SYNOPSIS
-\fBkeyctl\fR \-\-version
-.br
-\fBkeyctl\fR supports [<cap> | --raw]
-.br
-\fBkeyctl\fR id [<keyring>]
-.br
-\fBkeyctl\fR show [\-x] [<keyring>]
-.br
-\fBkeyctl\fR add [\-x] <type> <desc> <data> <keyring>
-.br
-\fBkeyctl\fR padd [\-x] <type> <desc> <keyring>
-.br
-\fBkeyctl\fR request <type> <desc> [<dest_keyring>]
-.br
-\fBkeyctl\fR request2 <type> <desc> <info> [<dest_keyring>]
-.br
-\fBkeyctl\fR prequest2 <type> <desc> [<dest_keyring>]
-.br
-\fBkeyctl\fR update [\-x] <key> <data>
-.br
-\fBkeyctl\fR pupdate [\-x] <key>
-.br
-\fBkeyctl\fR newring <name> <keyring>
-.br
-\fBkeyctl\fR revoke <key>
-.br
-\fBkeyctl\fR clear <keyring>
-.br
-\fBkeyctl\fR link <key> <keyring>
-.br
-\fBkeyctl\fR unlink <key> [<keyring>]
-.br
-\fBkeyctl\fR move [-f] <key> <from_keyring> <to_keyring>
-.br
-\fBkeyctl\fR search <keyring> <type> <desc> [<dest_keyring>]
-.br
-\fBkeyctl\fR restrict_keyring <keyring> [<type> [<restriction>]]
-.br
-\fBkeyctl\fR read <key>
-.br
-\fBkeyctl\fR pipe <key>
-.br
-\fBkeyctl\fR print <key>
-.br
-\fBkeyctl\fR list <keyring>
-.br
-\fBkeyctl\fR rlist <keyring>
-.br
-\fBkeyctl\fR describe <keyring>
-.br
-\fBkeyctl\fR rdescribe <keyring> [sep]
-.br
-\fBkeyctl\fR chown <key> <uid>
-.br
-\fBkeyctl\fR chgrp <key> <gid>
-.br
-\fBkeyctl\fR setperm <key> <mask>
-.br
-\fBkeyctl\fR new_session [<name>]
-.br
-\fBkeyctl\fR session
-.br
-\fBkeyctl\fR session \- [<prog> <arg1> <arg2> ...]
-.br
-\fBkeyctl\fR session <name> [<prog> <arg1> <arg2> ...]
-.br
-\fBkeyctl\fR instantiate [\-x] <key> <data> <keyring>
-.br
-\fBkeyctl\fR pinstantiate [\-x] <key> <keyring>
-.br
-\fBkeyctl\fR negate <key> <timeout> <keyring>
-.br
-\fBkeyctl\fR reject <key> <timeout> <error> <keyring>
-.br
-\fBkeyctl\fR timeout <key> <timeout>
-.br
-\fBkeyctl\fR security <key>
-.br
-\fBkeyctl\fR reap [\-v]
-.br
-\fBkeyctl\fR purge <type>
-.br
-\fBkeyctl\fR purge [\-i] [\-p] <type> <desc>
-.br
-\fBkeyctl\fR purge \-s <type> <desc>
-.br
-\fBkeyctl\fR get_persistent <keyring> [<uid>]
-.br
-\fBkeyctl\fR dh_compute <private> <prime> <base>
-.br
-\fBkeyctl\fR dh_compute_kdf <private> <prime> <base> <output_length> <hash=
_type>
-.br
-\fBkeyctl\fR dh_compute_kdf_oi [\-x] <private> <prime> <base> <output_leng=
th> <hash_type>
-.br
-\fBkeyctl\fR pkey_query <key> <pass> [k=3Dv]*
-.br
-\fBkeyctl\fR pkey_encrypt <key> <pass> <datafile> [k=3Dv]* ><encfile>
-.br
-\fBkeyctl\fR pkey_decrypt <key> <pass> <encfile> [k=3Dv]* ><datafile>
-.br
-\fBkeyctl\fR pkey_sign <key> <pass> <datafile> [k=3Dv]* ><sigfile>
-.br
-\fBkeyctl\fR pkey_decrypt <key> <pass> <datafile> <sigfile> [k=3Dv]*
-.br
-\fBkeyctl\fR watch [\-f<filters>] <key>
-.br
-\fBkeyctl\fR watch_add <fd> <key>
-.br
-\fBkeyctl\fR watch_rm <fd> <key>
-.br
-\fBkeyctl\fR watch_session [\-f <filters>] [-n <name>] \\
-                <notifylog> <gclog> <fd> <prog> [<arg1> <arg2> ...]
+.SY keyctl
+.B \-\-version
+.YS
+.SY keyctl
+.B supports
+.RI [ cap \~|\~\fB--raw\fP]
+.YS
+.SY keyctl
+.B id
+.RI [ keyring ]
+.YS
+.SY keyctl
+.B show
+.RB [ \-x ]
+.RI [ keyring ]
+.YS
+.SY keyctl
+.B add
+.RB [ \-x ]
+.I type
+.I desc
+.I data
+.I keyring
+.YS
+.SY keyctl
+.B padd
+.RB [ \-x ]
+.I type
+.I desc
+.I keyring
+.YS
+.SY keyctl
+.B request
+.I type
+.I desc
+.RI [ dest_keyring ]
+.YS
+.SY keyctl
+.B request2
+.I type
+.I desc
+.I info
+.RI [ dest_keyring ]
+.YS
+.SY keyctl
+.B prequest2
+.I type
+.I desc
+.RI [ dest_keyring ]
+.YS
+.SY keyctl
+.B update
+.RB [ \-x ]
+.I key
+.I data
+.YS
+.SY keyctl
+.B pupdate
+.RB [ \-x ]
+.I key
+.YS
+.SY keyctl
+.B newring
+.I name
+.I keyring
+.YS
+.SY keyctl
+.B revoke
+.I key
+.YS
+.SY keyctl
+.B clear
+.I keyring
+.YS
+.SY keyctl
+.B link
+.I key
+.I keyring
+.YS
+.SY keyctl
+.B unlink
+.I key
+.RI [ keyring ]
+.YS
+.SY keyctl
+.B move
+.RB [ -f ]
+.I key
+.I from_keyring
+.I to_keyring
+.YS
+.SY keyctl
+.B search
+.I keyring
+.I type
+.I desc
+.RI [ dest_keyring ]
+.YS
+.SY keyctl
+.B restrict_keyring
+.I keyring
+.RI [ type
+.RI [ restriction ]]
+.YS
+.SY keyctl
+.B read
+.I key
+.YS
+.SY keyctl
+.B pipe
+.I key
+.YS
+.SY keyctl
+.B print
+.I key
+.YS
+.SY keyctl
+.B list
+.I keyring
+.YS
+.SY keyctl
+.B rlist
+.I keyring
+.YS
+.SY keyctl
+.B describe
+.I keyring
+.YS
+.SY keyctl
+.B rdescribe
+.I keyring
+.RB [ sep ]
+.YS
+.SY keyctl
+.B chown
+.I key
+.I uid
+.YS
+.SY keyctl
+.B chgrp
+.I key
+.I gid
+.YS
+.SY keyctl
+.B setperm
+.I key
+.I mask
+.YS
+.SY keyctl
+.B new_session
+.RI [ name ]
+.YS
+.SY keyctl
+.B session
+.YS
+.SY keyctl
+.B session
+.B \-
+.RI [ prog
+.IR args \~.\|.\|.]
+.YS
+.SY keyctl
+.B session
+.I name
+.RI [ prog
+.RI [ args \~.\|.\|.]]
+.YS
+.SY keyctl
+.B instantiate
+.RB [ \-x ]
+.I key
+.I data
+.I keyring
+.YS
+.SY keyctl
+.B pinstantiate
+.RB [ \-x ]
+.I key
+.I keyring
+.YS
+.SY keyctl
+.B negate
+.I key
+.I timeout
+.I keyring
+.YS
+.SY keyctl
+.B reject
+.I key
+.I timeout
+.I error
+.I keyring
+.YS
+.SY keyctl
+.B timeout
+.I key
+.I timeout
+.YS
+.SY keyctl
+.B security
+.I key
+.YS
+.SY keyctl
+.B reap
+.RB [ \-v ]
+.YS
+.SY keyctl
+.B purge
+.I type
+.YS
+.SY keyctl
+.B purge
+.RB [ \-i ]
+.RB [ \-p ]
+.I type
+.I desc
+.YS
+.SY keyctl
+.B purge
+.B \-s
+.I type
+.I desc
+.YS
+.SY keyctl
+.B get_persistent
+.I keyring
+.RI [ uid ]
+.YS
+.SY keyctl
+.B dh_compute
+.I private
+.I prime
+.I base
+.YS
+.SY keyctl
+.B dh_compute_kdf
+.I private
+.I prime
+.I base
+.I output_length
+.I hash_type
+.YS
+.SY keyctl
+.B dh_compute_kdf_oi
+.RB [ \-x ]
+.I private
+.I prime
+.I base
+.I output_length
+.I hash_type
+.YS
+.SY keyctl
+.B pkey_query
+.I key
+.I pass
+.RI [ k \fB=3D\fP v \~.\|.\|.]
+.YS
+.SY keyctl
+.B pkey_encrypt
+.I key
+.I pass
+.I datafile
+.RI [ k \fB=3D\fP v \~.\|.\|.\&]
+.I encfile
+.YS
+.SY keyctl
+.B pkey_decrypt
+.I key
+.I pass
+.I encfile
+.RI [ k \fB=3D\fP v \~.\|.\|.\&]
+.I datafile
+.YS
+.SY keyctl
+.B pkey_sign
+.I key
+.I pass
+.I datafile
+.RI [ k \fB=3D\fP v \~.\|.\|.\&]
+.I sigfile
+.YS
+.SY keyctl
+.B pkey_decrypt
+.I key
+.I pass
+.I datafile
+.I sigfile
+.RI [ k \fB=3D\fP v \~.\|.\|.]
+.YS
+.SY keyctl
+.B watch
+.RB [ \-f \~\fIfilters\fP]
+.I key
+.YS
+.SY keyctl
+.B watch_add
+.I fd
+.I key
+.YS
+.SY keyctl
+.B watch_rm
+.I fd
+.I key
+.YS
+.SY keyctl
+.B watch_session
+.RB [ \-f \~\fIfilters\fP]
+.RB [ \-n \~\fIname\fP]
+.I notifylog
+.I gclog
+.I fd
+.I prog
+.RI [ args \~.\|.\|.]
+.YS
 .SH DESCRIPTION
 This program is used to control the key management facility in various ways
 using a variety of subcommands.
diff --git a/man/request-key.8 b/man/request-key.8
index d49ca78..08f2ace 100644
--- a/man/request-key.8
+++ b/man/request-key.8
@@ -11,8 +11,16 @@
 .SH NAME
 request\-key \- handle key instantiation callback requests from the kernel
 .SH SYNOPSIS
-\fB/sbin/request\-key \fR<op> <key> <uid> <gid> <threadring> <processring>
-	<sessionring> [<info>]
+.SY /sbin/request\-key
+.I op
+.I key
+.I uid
+.I gid
+.I threadring
+.I processring
+.I sessionring
+.RI [ info ]
+.YS
 .SH DESCRIPTION
 This program is invoked by the kernel when the kernel is asked for a key t=
hat
 it doesn't have immediately available. The kernel creates a partially set =
up
--=20
2.45.2


--p3s4cepzebtc4ity
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmZzaNwACgkQnowa+77/
2zJ4rw/9G0/LwdBUkQ1BG5yrINGcZFnwbLQL9qtVfJD3XU4HKiyc3G6LyHtW6Lhu
yoEe1AYmgwL1nVenRLyZWWDXXICFwRz9FivKDLM91syy0XVwe4VrY3i8llIzQiK6
A1TbI42qwrtC4kBxXkH2MZVGlTT+dkuTLLVN7REJE/89ADldHFZTvBbXoFFTU9h/
Ae6xCgDNG9agTGoI9d3HV3xHGh9H7YrBbdrKvj53k24J6iE7fG2MkCfHXVZck7RC
JOpBk2npYXfdzFwLaIv0OK5Vv05LBBLogaoPZqkoAyat4Rw5oOyltL5P4Uq7geq2
0uDiE9ZB9J9OReSwc+9Pgjptnd2uS8vgplQTqSKN+8vvX9/V1MMo3pV9d3UkhQLz
zk49vyzBM1nuMhk+PuuUck0ZQlKrDa5xi1CFsJ6V7WIZwGYN0PmMARVg8U5eKMKz
c7fXApcyVIjEXL60qhi/Lwl63c23OvGYfHIii+ys+aVtz9PM+gqVDO1/62WsLNuX
DDSWvp5PvMfskwDkFN6cVhIndwscqNRFHGWlPMiJcmJZudp3fO1FY/qRH51YLsOh
nzhaGSpl/48P+EtE+oCE+KeQVlq1BoLOdqO6PLMhcicKALomM6v1gaorqDxfBds7
2s9/jik+ZuLBfkY9rjmbGveN71NbUaG2/RQPMFJpVaRt7K3i6bw=
=NUhW
-----END PGP SIGNATURE-----

--p3s4cepzebtc4ity--

