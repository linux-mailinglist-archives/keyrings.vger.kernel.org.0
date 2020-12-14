Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D972DA2A2
	for <lists+keyrings@lfdr.de>; Mon, 14 Dec 2020 22:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgLNVlg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Dec 2020 16:41:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406807AbgLNVlg (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 14 Dec 2020 16:41:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvvvV00l7z9s0b;
        Tue, 15 Dec 2020 08:40:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607982046;
        bh=3JjwU9FMTSysTsKbEoxAhXtb46+VKMMyJV4VwIySsK8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=REfdSlWuUXlbrEy9wNC7xeUA389v3fyMhH+YczsFqIsexBekVy60lA0NLu+dQA5br
         WUn5xQ6fDTiGyPVUK8tY5RQrF28LCjPE3RK8akrHH8aib+sWbgui62plDcsZVGHAYe
         kAOMwVjBIn0THee9OXpGWzOcGNxF7jCCGLm6mUrYq17aVNHF+5lx7tlGger6vyfQpR
         NJP/OIgufaOy2EH0nt5Nw+WCGsx/B9BxWWziu5BAEWpUNz+jPK1IG8XNzo++X+UB0G
         9dJta20ibHjRehKUEuUCybDkxcK4+bsKk2Yn32GDmQImlWdqAezetKsSz++R6tR+xv
         daB9VNl+1cxDg==
Date:   Tue, 15 Dec 2020 08:40:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Subject: Re: [GIT PULL] keys: Collected minor fixes and cleanups
Message-ID: <20201215084037.76dd4c98@canb.auug.org.au>
In-Reply-To: <CAADWXX83JC0oSVoDxOwsLE1DPm8r6JLWcAsP0UyCLO_X544pkQ@mail.gmail.com>
References: <2659836.1607940186@warthog.procyon.org.uk>
        <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
        <CAADWXX83JC0oSVoDxOwsLE1DPm8r6JLWcAsP0UyCLO_X544pkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u0N.9FFRBQ5prXVibfV=Cb0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--Sig_/u0N.9FFRBQ5prXVibfV=Cb0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, 14 Dec 2020 13:05:51 -0800 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Mon, Dec 14, 2020 at 12:49 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I suspect the fix is trivial (change the "," to "|"), but I will not
> > be pulling this - or anything else that hasn't been in linux-next -
> > from you this merge window. =20
>=20
> It looks like Stephen Rothwell saw it in next yesterday, and fixed it
> up there in his merge.
>=20
> So somebody was aware of the problem. But unlike Stephen, I don't take
> broken code and just silently fix it up in the merge.
>=20
> I suspect Stephen might have thought it was a merge conflict fix,
> rather than just a broken branch.
>=20
> Stephen: that makes linux-next test coverage kind of pointless, if you
> just fix bugs in the branches you merge. You should reject things more
> aggressively, rather than make them "pass" in Linux-next.

I also reported it last Friday
(https://lore.kernel.org/lkml/20201211155031.0e35abf2@canb.auug.org.au/)
and so assumed it would be fixed before being sent to you ... I
sometimes fix simple things up but mostly reject them - clearly that
would not have made a difference here.

--=20
Cheers,
Stephen Rothwell

--Sig_/u0N.9FFRBQ5prXVibfV=Cb0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/X29UACgkQAVBC80lX
0GzRywf/TUfUtDuvxp4LbMQJ8kjHjmCm97z+Owe85JLyLp/OUf8AE0mh+Cx6kbEB
KvpBwSaQ5c3x4FyOeUbOXVCdn7r1hGy6+tttnurK5cbtAza6U7U19MGcu7oI1ii1
2VFDwMun1dGrJt78apl/F47icTL6TwkW0IX2SYErXh09Roi4x8C4Hy0hJ2PBnb49
BWpTaUwa1zwv5bVbb+iHmh6nc652ahMqJ7bLaEpt+TEbDHm9q9TNBtZv/8EIDh3e
gNN2DVDjBx7HeQD3Y16WSezLth1D7I6clxxAS550E+qdKgeOaxs/XxVhgQMuBEUH
5nGAA4KtqRTKyiH8dgW3gAkwR6652A==
=rGZ4
-----END PGP SIGNATURE-----

--Sig_/u0N.9FFRBQ5prXVibfV=Cb0--
