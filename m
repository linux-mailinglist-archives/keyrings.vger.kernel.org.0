Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3FA3F1758
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 12:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbhHSKgb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 06:36:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236149AbhHSKgb (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Aug 2021 06:36:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9B516113C;
        Thu, 19 Aug 2021 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629369355;
        bh=0gYRryj8WcD05dNv3C5iWMMOAQxCqY5AJZQHDbt70CM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=sU+wf523Fhx9pa4dA9UUzGeQLvn1NmWrexhEeM+W79+r6bFT4h08kDualdcJX/cR/
         KKdvTP0AE3jyDYU0voFEsFLa1xtF+vulKLMh/r+ider7dC707giPUjGbtQC66Oqo7Q
         PlKT205Fb99WfNYfiMO15yG7Euc+Vz9Xo5Gq6XPw88UXbx5HPcJ4kvxfNbrn8GY9lx
         j93Z5yAwclYd4D3mtXXrhdknB3+2wRPJroWDt3U8jQ4S2lmJXcDIpQZ5oRRrtI4nSO
         up0w/GlPyjErtJW6to2SKVObs6aRzEaPfCPLCg9jwNtK4FVz6Y751YPYCs0/WVyPEA
         Au4J9yVOa13Zg==
Message-ID: <6db55147350d81ed205d37031d81b03b80f639cc.camel@kernel.org>
Subject: Re: Re: PING: [PATCH] crypto: public_key: fix overflow during
 implicit conversion
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     zhenwei pi <pizhenwei@bytedance.com>, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 19 Aug 2021 13:35:52 +0300
In-Reply-To: <8bf3a04d-f1a7-cd8c-5c5a-ace3de500b2f@bytedance.com>
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
         <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
         <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
         <8bf3a04d-f1a7-cd8c-5c5a-ace3de500b2f@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-08-19 at 10:03 +0800, zhenwei pi wrote:
> On 8/18/21 8:33 PM, Jarkko Sakkinen wrote:
> > On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
> > > PING
> >=20
> > Please, do not top-post.
> >=20
> > You are lacking Herbert Xu:
> >=20
> > $ scripts/get_maintainer.pl crypto/asymmetric_keys/public_key.c
> > David Howells <dhowells@redhat.com> (maintainer:ASYMMETRIC KEYS)
> > Herbert Xu <herbert@gondor.apana.org.au> (maintainer:CRYPTO API)
> > "David S. Miller" <davem@davemloft.net> (maintainer:CRYPTO API)
> > keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS)
> > linux-crypto@vger.kernel.org (open list:CRYPTO API)
> > linux-kernel@vger.kernel.org (open list)
> >=20
> > > On 8/10/21 2:39 PM, zhenwei pi wrote:
> > > > Hit kernel warning like this, it can be reproduced by verifying
> > > > 256
> > > > bytes datafile by keyctl command.
> > > >=20
> > > >    WARNING: CPU: 5 PID: 344556 at crypto/rsa-pkcs1pad.c:540
> > > > pkcs1pad_verify+0x160/0x190
> > > >    ...
> > > >    Call Trace:
> > > >     public_key_verify_signature+0x282/0x380
> > > >     ? software_key_query+0x12d/0x180
> > > >     ? keyctl_pkey_params_get+0xd6/0x130
> > > >     asymmetric_key_verify_signature+0x66/0x80
> > > >     keyctl_pkey_verify+0xa5/0x100
> > > >     do_syscall_64+0x35/0xb0
> > > >     entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >=20
> > > > '.digest_size(u8) =3D params->in_len(u32)' leads overflow of an
> > > > u8
> >=20
> > Where is this statement?
> >=20
>=20
> In function "static int asymmetric_key_verify_signature(struct=20
> kernel_pkey_params *params, const void *in, const void *in2)"
>=20
> > > > value,
> > > > so use u32 instead of u8 of digest. And reorder struct
> > > > public_key_signature, it could save 8 bytes on a 64 bit
> > > > machine.
> >                                                       ~~~~~
> >                                                       64-bit
> >                                                      =20
> > What do you mean by "could"? Does it, or does it
> > not?
> >                                         			=09
> > =09
> >=20
> After reordering struct public_key_signature, sizeof(struct=20
> public_key_signature) gets smaller than the original version.

OK, then just state is as "it saves" instead of "it could save".

Not a requirement but have you been able to trigger this for a
kernel that does not have this fix?

/Jarkko
