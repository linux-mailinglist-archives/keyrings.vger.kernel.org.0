Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1675F3F186F
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbhHSLpF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 07:45:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238984AbhHSLpF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 19 Aug 2021 07:45:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61C366108B;
        Thu, 19 Aug 2021 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629373468;
        bh=hwMD+gT6JhKBqN/kWxG50wBEzaeHGHaZnKIPiIyF4PI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=F1a37lXqH0SDloz9Kg4edPKT54/iZchqCtq3UK8XkV6xHTTX9tDg2iWG8WTMCfJj7
         2+exGtbZDgYQMYg3Yboz3mBepPhg/ZCwN1hUO/AX1vuMVQLoRWRPQGwz4XhS6WTtBf
         02LfWR1bsrHL9i5jhG3nWX9Q7PgGu+0cD4RAzmoont9K4XAYsWADK8ZeW6g7RruZf0
         Ivv2xAkTghi8p/2HqSDn4PoDAqLeylQLpQHb5DwWn3wtcVpSahZ4yZOBvL/dM9wY3s
         CXEkCh0nottwGmITf/oP1SL6sPG30y3DDkAevGjYNNDdBJ7EgMD0coVYEyu3uG8hz8
         aqQPvRFQ3ygXw==
Message-ID: <94672b79411362d524455cca4680d3d28f1ec376.camel@kernel.org>
Subject: Re: Re: Re: PING: [PATCH] crypto: public_key: fix overflow during
 implicit conversion
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     zhenwei pi <pizhenwei@bytedance.com>, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 19 Aug 2021 14:44:26 +0300
In-Reply-To: <7ae0836f-884b-e262-6ade-d0ca6ea0eb93@bytedance.com>
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
         <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
         <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
         <8bf3a04d-f1a7-cd8c-5c5a-ace3de500b2f@bytedance.com>
         <6db55147350d81ed205d37031d81b03b80f639cc.camel@kernel.org>
         <7ae0836f-884b-e262-6ade-d0ca6ea0eb93@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-08-19 at 18:52 +0800, zhenwei pi wrote:
> On 8/19/21 6:35 PM, Jarkko Sakkinen wrote:
> > On Thu, 2021-08-19 at 10:03 +0800, zhenwei pi wrote:
> > > On 8/18/21 8:33 PM, Jarkko Sakkinen wrote:
> > > > On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
> > > > > PING
> > > >=20
> > > > Please, do not top-post.
> > > >=20
> > > > You are lacking Herbert Xu:
> > > >=20
> > > > $ scripts/get_maintainer.pl crypto/asymmetric_keys/public_key.c
> > > > David Howells <dhowells@redhat.com> (maintainer:ASYMMETRIC KEYS)
> > > > Herbert Xu <herbert@gondor.apana.org.au> (maintainer:CRYPTO API)
> > > > "David S. Miller" <davem@davemloft.net> (maintainer:CRYPTO API)
> > > > keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS)
> > > > linux-crypto@vger.kernel.org (open list:CRYPTO API)
> > > > linux-kernel@vger.kernel.org (open list)
> > > >=20
> > > > > On 8/10/21 2:39 PM, zhenwei pi wrote:
> > > > > > Hit kernel warning like this, it can be reproduced by verifying
> > > > > > 256
> > > > > > bytes datafile by keyctl command.
> > > > > >=20
> > > > > >     WARNING: CPU: 5 PID: 344556 at crypto/rsa-pkcs1pad.c:540
> > > > > > pkcs1pad_verify+0x160/0x190
> > > > > >     ...
> > > > > >     Call Trace:
> > > > > >      public_key_verify_signature+0x282/0x380
> > > > > >      ? software_key_query+0x12d/0x180
> > > > > >      ? keyctl_pkey_params_get+0xd6/0x130
> > > > > >      asymmetric_key_verify_signature+0x66/0x80
> > > > > >      keyctl_pkey_verify+0xa5/0x100
> > > > > >      do_syscall_64+0x35/0xb0
> > > > > >      entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > > > >=20
> > > > > > '.digest_size(u8) =3D params->in_len(u32)' leads overflow of an
> > > > > > u8
> > > >=20
> > > > Where is this statement?
> > > >=20
> > >=20
> > > In function "static int asymmetric_key_verify_signature(struct
> > > kernel_pkey_params *params, const void *in, const void *in2)"
> > >=20
> > > > > > value,
> > > > > > so use u32 instead of u8 of digest. And reorder struct
> > > > > > public_key_signature, it could save 8 bytes on a 64 bit
> > > > > > machine.
> > > >                                                        ~~~~~
> > > >                                                        64-bit
> > > >                                                       =20
> > > > What do you mean by "could"? Does it, or does it
> > > > not?
> > > >                                          			=09
> > > > =09
> > > >=20
> > > After reordering struct public_key_signature, sizeof(struct
> > > public_key_signature) gets smaller than the original version.
> >=20
> > OK, then just state is as "it saves" instead of "it could save".
> >=20
> > Not a requirement but have you been able to trigger this for a
> > kernel that does not have this fix?
> >=20
> This kernel warning can be reproduced on debian11(Linux-5.10.0-8-amd64)=
=20
> by the following script:
>=20
> RAWDATA=3Drawdata
> SIGDATA=3Dsigdata
>=20
> modprobe pkcs8_key_parser
>=20
> rm -rf *.der *.pem *.pfx
> rm -rf $RAWDATA
> dd if=3D/dev/random of=3D$RAWDATA bs=3D256 count=3D1
>=20
> openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem=
=20
> -subj "/C=3DCN/ST=3DGD/L=3DSZ/O=3Dvihoo/OU=3Ddev/CN=3Dxx.com/emailAddress=
=3Dyy@xx.com"
>=20
> KEY_ID=3D`openssl pkcs8 -in key.pem -topk8 -nocrypt -outform DER | keyctl=
=20
> padd asymmetric 123 @s`
>=20
> keyctl pkey_sign $KEY_ID 0 $RAWDATA enc=3Dpkcs1 hash=3Dsha1 > $SIGDATA
> keyctl pkey_verify $KEY_ID 0 $RAWDATA $SIGDATA enc=3Dpkcs1 hash=3Dsha1


Thank you. I'll see if I can reproduce this when you send a new version
(if not, it is not constraint for accepting to patch, but I'll still
try).

PS. Ignore the firstname lastname comment. I was not aware that in some
cultures it is written like that (James Bottomley pointed this out).

/Jarkko
