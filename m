Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1776F304671
	for <lists+keyrings@lfdr.de>; Tue, 26 Jan 2021 19:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732034AbhAZRXP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 12:23:15 -0500
Received: from mx1.emlix.com ([136.243.223.33]:44754 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387772AbhAZIC6 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 26 Jan 2021 03:02:58 -0500
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id C2A625FA1A;
        Tue, 26 Jan 2021 09:01:24 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Date:   Tue, 26 Jan 2021 09:01:20 +0100
Message-ID: <2384276.IbH9z7ADXJ@devpool47>
Organization: emlix GmbH
In-Reply-To: <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>
References: <20538915.Wj2CyUsUYa@devpool35> <2525730.a3zTd9XyL1@devpool47> <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2498514.zdjasX8D7D"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--nextPart2498514.zdjasX8D7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Linux Kernel Developers List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Date: Tue, 26 Jan 2021 09:01:20 +0100
Message-ID: <2384276.IbH9z7ADXJ@devpool47>
Organization: emlix GmbH
In-Reply-To: <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>
References: <20538915.Wj2CyUsUYa@devpool35> <2525730.a3zTd9XyL1@devpool47> <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>

Am Dienstag, 26. Januar 2021, 07:30:03 CET schrieb Masahiro Yamada:
> On Tue, Jan 26, 2021 at 2:42 PM Rolf Eike Beer <eb@emlix.com> wrote:
> > Am Mittwoch, 13. Januar 2021, 13:49:12 CET schrieb Rolf Eike Beer:
> > > Otherwise build fails if the headers are not in the default location.
> > > While
> > > at it also ask pkg-config for the libs, with fallback to the existing
> > > value.
> >=20
> > Can someone please take this through the kbuild-tree? Noone seems to be
> > interested in picking this up so far.

> Is 'PKG_CONFIG' necessary?
>=20
> I see many Makefiles hard-coding 'pkg-config'.

Well, it depends ;)

When people use pkgconf then this usually installs a pkg-config alias, too,=
 so=20
that would be no problem. The problem comes when other places in the kernel=
=20
start copying that code over, and then hardcode pkg-config for stuff that=20
needs a prefixed pkg-config because it is about target code.

Given that I would prefer it this way, but YMMV. If it is that variable tha=
t=20
blocks integrating I'll change it.

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart2498514.zdjasX8D7D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCYA/MUAAKCRCr5FH7Xu2t
/FmIA/9K2X8zIwXcNreRp/m+3PJshIU94mgSOR0DnMIWRIrvBn7YovCLiS4UOZT8
+ZSggOhHkeNd6SJE6CBOUzKcUXp3sOLwMHoEWWZbAnt0EOEdYidvQ6IVIpcAGSLU
QxMB9eFsfvnQMHvbpJDScFQCb5yH/OIx5ocjCDA1LJPnGn0J/g==
=La0P
-----END PGP SIGNATURE-----

--nextPart2498514.zdjasX8D7D--



