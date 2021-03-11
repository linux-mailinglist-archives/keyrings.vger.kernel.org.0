Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954DB3371A2
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 12:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhCKLpL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 06:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbhCKLov (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 06:44:51 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88C5C061760
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 03:44:50 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id i15so2392167qvr.0
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 03:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version
         :content-transfer-encoding:date:message-id;
        bh=qS0UAwyAgp/Rw0AsTfWp+VWoYKT0tVjS9govhWMbhBk=;
        b=HA6T3Yyn6gsrS4KzBLG9d+kPJYgGsAtHotRlNO+YXAoS4qIAWlTYliF8/x+YNwayXS
         9VfQqgHOByKrUAi2ed/KeCyrNuQkNKEKgjZQPvzz3lhwFyWVJv9TkkNvnABpNGu6J8J/
         HC/2+Siy49fVRh5XFIKvsvxYlCa7g9Lf34QndJmeMP3+equWYpqOWrCqdq0plI3uUOP6
         E4LpZQ53cbfxim6jcaq3l9i/Y9ZklHGAmdqcUs/UbrHxwVFOVJvXRQFHD/KAlIbtjlfK
         3OPDGCU7bRLDoBH88vDydSAbY7tXd6LocRTdglTFxHKKs0UmZppOf354qthsDWsLz8R5
         sUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:content-transfer-encoding:date:message-id;
        bh=qS0UAwyAgp/Rw0AsTfWp+VWoYKT0tVjS9govhWMbhBk=;
        b=V7mYDAM3BazcvqOulYAJNvw0sD+z3yWy+B15uUSFK+M391CHrfVQwR7zMeTG8d5kzH
         gs7EkJnyIqY3JVV97oWTHie9qLvgoeVM9p8heqg9EPkl6mDTStt6Er8b0Zp9N3wYU9sN
         0n4IgLYnprYqWipx6Mou3E+HtQBETSXSC8yLw6CGoYQrmKf6B12UjyfDEQQjlBOzZqUM
         9mutAcy9RLAb3h+Gr6/jD2dPYyLMGltenFsSHaKP/OPEry71+Ye4zc4KjthZA06u9ZmD
         l4nXF2KgT4BFG9ll1O7EohDimzeStIlM/vE3OB/xOd30ZXIzGSqY8FFuCchTRez1vnES
         FHeA==
X-Gm-Message-State: AOAM530NCWTqPF4JuJPdEN9LDI+vui3tS5PPUyt4O/gcd8q9qIbZwO4K
        cG+Ixp5is/gXoLqrzjPDfpYFMw==
X-Google-Smtp-Source: ABdhPJy2LeGl4R13CAeWqf8TsTwLFHc36ksGhPXZU736zR8FONC6CcZ2RADDDen5PzxNbEaV4CbBxQ==
X-Received: by 2002:a05:6214:1110:: with SMTP id e16mr7248217qvs.62.1615463089521;
        Thu, 11 Mar 2021 03:44:49 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61:2b0f:e860:4e22:d54f])
        by smtp.gmail.com with ESMTPSA id z78sm1747646qka.38.2021.03.11.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 03:44:49 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     David Howells <dhowells@redhat.com>
Cc:     David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: 'make O=' indigestion with module signing
In-Reply-To: <972381.1615459754@warthog.procyon.org.uk>
References: <91190.1615444370@turing-police>
 <972381.1615459754@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1615463088_76436P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 06:44:48 -0500
Message-ID: <109018.1615463088@turing-police>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--==_Exmh_1615463088_76436P
Content-Type: text/plain; charset=us-ascii

On Thu, 11 Mar 2021 10:49:14 +0000, David Howells said:
> I wonder...  Can you grab branch keys-cve-2020-26541-branch from:
>
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
>
> and try that?  If that breaks, can you try dropping the top four commits?

[/usr/src/linux-next] git checkout keys-cve-2020-26541-branch
Checking out files: 100% (13062/13062), done.
Previous HEAD position was b01d57bfdc41 Add linux-next specific files for 20210310
Branch 'keys-cve-2020-26541-branch' set up to track remote branch 'keys-cve-2020-26541-branch' from 'linux-fs'.
Switched to a new branch 'keys-cve-2020-26541-branch'

That still didn't work, and dropping off the 4 commits from Eric Snowberg
didn't change things.

I checked out next-20210310, did a 'make mrproper', and tested as the
owner of the source tree rather than as a different user...

LANG=C make O=/tmp/test-as-owner  V=1 ARCH=arm64 ASFLAGS='-mcpu=all' CROSS_COMPILE=/opt/aarch64/bin/aarch64-linux-gnu- certs/

make -f /usr/src/linux-next/scripts/Makefile.build obj=certs \
single-build= \
need-builtin=1 need-modorder=1
  scripts/extract-cert /usr/src/linux-next/"certs/signing_key.pem" certs/signing_key.x509
Extracted cert: /CN=Build time autogenerated kernel key
  /opt/aarch64/bin/aarch64-linux-gnu-gcc (...)  -o certs/system_keyring.o /usr/src/linux-next/certs/system_keyring.c

And the files ended up where they belonged:

 ls -l /tmp/test-as-owner/certs/
total 72
-rw-r--r-- 1 source source  1288 Mar 11 06:33 blacklist_nohashes.o
-rw-r--r-- 1 source source 18496 Mar 11 06:33 blacklist.o
-rw-r--r-- 1 source source   542 Mar 11 06:33 built-in.a
-rw-r--r-- 1 source source  5856 Mar 11 06:33 common.o
-rw-r--r-- 1 source source     0 Mar 11 06:33 modules.order
-rw-r--r-- 1 source source  1184 Mar 11 06:33 revocation_certificates.o
-rw-r--r-- 1 source source  1357 Mar 11 06:33 signing_key.x509
-rw-r--r-- 1 source source  6888 Mar 11 06:33 system_certificates.o
-rw-r--r-- 1 source source 17504 Mar 11 06:33 system_keyring.o
-rw-r--r-- 1 source source     0 Mar 11 06:33 x509_certificate_list
-rw-r--r-- 1 source source     0 Mar 11 06:33 x509_revocation_list

So there's something weird going on with scripts/extract-cert when running
as a userid other than the owner of the source tree..  I wonder if it's actually
an OpenSSL issue...

I'll look at it some more later today...

--==_Exmh_1615463088_76436P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYEoCrwdmEQWDXROgAQJD+Q//QTWrx2FPQC17UjJId1jCe1l7mIon5n1G
GUykD0QR0nILRZlydJyHHTl4GPmy3lR1065EeQ5ayI0C4oil2cgVI0tjD+jV6RW1
y76gl+CLEhircXJaC0v4IDSyK0VwChdBKOiVg2dnAQkNdXA5lV1lCiZgVMWc/olI
LTVMiouO7rJfqsfMpQVn25BpMyOfW5rFw1LHmSFZ8wjqDumZJFzBdUDpFpeoqHfQ
jdRasfechvheG85PVzlQyPlLOdUHs6NWHBw+xa8bA6OgmeGVlS3vhOh23/P21ph7
bzlG0TApI5JIm4QAFOi+x+GGR5GnrbOuisksuqUUzuP7Qrh7/LtzJ710qHC1HSEc
ZFbpbXQKnbDP+qhrYwVLsfJTZq/dNc/CnVnMlcZnTWlNu1kGovRLPPZfsTZcjlpF
extwwuAhp/uxt91fruuctBAlYDKqBqbFW30zXiGpj4VTxaVVx7wBtQ23V4Q2BZ5l
1draWBN+S2PRcQHwBA0YOznN8ZDV5P6sK3q37GgCerVMPoJcD1kf+EFn/itpdS1o
H8mEaB8s5i/Ejdgnne5KUyO5a0QDdhdWIPIJv6DirQoLEYFEkuc5DOnZQvBmRgQD
oStc5lIiS5pOWFLKSsYTcQUPaYO/f/D4GfFa2/1OcA6tHPkYA92BEHpkwWwfZeUi
qMMJG5abPcA=
=geiJ
-----END PGP SIGNATURE-----

--==_Exmh_1615463088_76436P--
