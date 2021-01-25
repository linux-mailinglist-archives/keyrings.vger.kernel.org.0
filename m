Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4663047B1
	for <lists+keyrings@lfdr.de>; Tue, 26 Jan 2021 20:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbhAZGA1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 01:00:27 -0500
Received: from mx1.emlix.com ([136.243.223.33]:42050 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728073AbhAYM31 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 25 Jan 2021 07:29:27 -0500
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id B55D65FCA5;
        Mon, 25 Jan 2021 12:56:18 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Date:   Mon, 25 Jan 2021 12:56:14 +0100
Message-ID: <2525730.a3zTd9XyL1@devpool47>
Organization: emlix GmbH
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35> <3394639.6NgGvCfkNl@devpool47>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1700098.1KN2oRN6cf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--nextPart1700098.1KN2oRN6cf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux Kernel Developers List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Date: Mon, 25 Jan 2021 12:56:14 +0100
Message-ID: <2525730.a3zTd9XyL1@devpool47>
Organization: emlix GmbH
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35> <3394639.6NgGvCfkNl@devpool47>

Am Mittwoch, 13. Januar 2021, 13:49:12 CET schrieb Rolf Eike Beer:
> Otherwise build fails if the headers are not in the default location. Whi=
le
> at it also ask pkg-config for the libs, with fallback to the existing
> value.

Can someone please take this through the kbuild-tree? Noone seems to be=20
interested in picking this up so far.

Thanks,

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart1700098.1KN2oRN6cf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCYA6x3gAKCRCr5FH7Xu2t
/FNHA/9GA1b168qTGS1IMyWlzzkXL9f4BBohKPlnQ4nYQ8JrCjFnqEhWKMakZkaJ
wMJ5rmxuq8FyVQr9Cp07M3/Wmpj9ByjgSLcWMmUyrUbcuzA/eI7sVW3TBn/d6e32
gW2sSpftxpt3w3mS1lE/faNSflEkFer02DQ5B1SPkxK6KREiXg==
=WcBP
-----END PGP SIGNATURE-----

--nextPart1700098.1KN2oRN6cf--



