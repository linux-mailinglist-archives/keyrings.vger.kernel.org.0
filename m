Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1150233275
	for <lists+keyrings@lfdr.de>; Thu, 30 Jul 2020 14:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG3M4e (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 Jul 2020 08:56:34 -0400
Received: from mx1.emlix.com ([188.40.240.192]:55920 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726535AbgG3M4e (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 Jul 2020 08:56:34 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jul 2020 08:56:33 EDT
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id EF6E75FF99;
        Thu, 30 Jul 2020 14:49:46 +0200 (CEST)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v4] scripts: use pkg-config to locate libcrypto
Date:   Thu, 30 Jul 2020 14:49:41 +0200
Message-ID: <1825784.enSSdDGVcg@devpool35>
Organization: emlix GmbH
In-Reply-To: <2278760.8Yd83Mgoko@devpool35>
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9679229.JMKxYvS3ME"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--nextPart9679229.JMKxYvS3ME
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Montag, 27. April 2020, 10:11:28 CEST schrieb Rolf Eike Beer:
> From 082ba542ca4c710dcf592a6f9233603b9275d05d Mon Sep 17 00:00:00 2001
> From: Rolf Eike Beer <eb@emlix.com>
> Date: Thu, 22 Nov 2018 16:40:49 +0100
> Subject: [PATCH 1/2] scripts: use pkg-config to locate libcrypto
>=20
> Otherwise build fails if the headers are not in the default location. Whi=
le
> at it also ask pkg-config for the libs, with fallback to the existing
> value.

Close to 2 years since the original patch=E2=80=A6 can this please be appli=
ed? It=20
get's annoying to patch every new kernel version the same way again.

Thx

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart9679229.JMKxYvS3ME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCXyLB5gAKCRCr5FH7Xu2t
/OfFBADHZ2FrSoVi6DAf2H7CaJx74tezgvQax1e0nMjCGpnAgonXf4+y3bjHjNBI
mHCzvvybwqFG7hC3nVzw4mpptyc/nSv5kJGZZkxFvvJ3+YDWfhbtrovpAxKqBR9y
D/1YIQ8cR/WoONrRs0BGUf6lDN9BspoABK6gPoXztzT8mz+ODA==
=tpgR
-----END PGP SIGNATURE-----

--nextPart9679229.JMKxYvS3ME--



