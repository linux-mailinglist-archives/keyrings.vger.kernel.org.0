Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8ED3F176C
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 12:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237851AbhHSKnB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 06:43:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:51560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236149AbhHSKnB (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Aug 2021 06:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A80AF6113D;
        Thu, 19 Aug 2021 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629369745;
        bh=xJ7UEL9HZ8z2uF/hWejre2Z71R2i5cuER1AULbTrHpg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=uEK7tapHLENc7dbFtE12KQet8t4ygrP0X7IPeavlsD2wPyOYpQiswQgvj4lHUVQ0I
         458Tu2LaCOiujPgXQl4acdUFDdR+Ma8Ip/CHvUl1l6+JerfXFDHRXjPJnHOysFikU+
         ixeQw1AMxKtUU0RfALFjBl/4kEjW6akS04OEg6GjW8tdtFMnjj6jCpDQip+XQ+NDL6
         2Jg2vhEeWhPno9CcBpwHi6i7EJzGixQEvBk8lMvanfYV5r8ks5Xm8u2UJPAu+rwSgQ
         F9+0H+qtUH2IW62qrpRbTDN2bKv2Yqbv6XYdzeaA6GwKTgvyYOgHDGdm3iSHDFCK8M
         7nMPQbmqv/w7g==
Message-ID: <1cbfe2bbb46ab48bf6dddee9a15a7c04c99db8f7.camel@kernel.org>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>, Denis Kenzior <denkenz@gmail.com>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Date:   Thu, 19 Aug 2021 13:42:22 +0300
In-Reply-To: <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
References: <20210818144617.110061-1-ardb@kernel.org>
         <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
         <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 2021-08-18 at 18:10 +0200, Ard Biesheuvel wrote:
> On Wed, 18 Aug 2021 at 16:51, Denis Kenzior <denkenz@gmail.com>
> wrote:
> > Hi Ard,
> >=20
> > On 8/18/21 9:46 AM, Ard Biesheuvel wrote:
> > > As discussed on the list [0], MD4 is still being relied upon by
> > > the CIFS
> > > driver, even though successful attacks on MD4 are as old as Linux
> > > itself.
> > >=20
> > > So let's move the code into the CIFS driver, and remove it from
> > > the
> > > crypto API so that it is no longer exposed to other subsystems or
> > > to
> > > user space via AF_ALG.
> > >=20
> >=20
> > Can we please stop removing algorithms from AF_ALG?
>=20
> I don't think we can, to be honest. We need to have a deprecation
> path
> for obsolete and insecure algorithms: the alternative is to keep
> supporting a long tail of broken crypto indefinitely.

I think you are ignoring the fact that by doing that you might be
removing a migration path to more secure algorithms, for some legacy
systems.

I.e. in some cases this might mean sticking to insecure algorithm *and*
old kernel for unnecessary long amount of time because migration is
more costly.

Perhaps there could be a comman-line parameter or similar to enable
legacy crypto?

/Jarkko
