Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5529413BFB
	for <lists+keyrings@lfdr.de>; Tue, 21 Sep 2021 23:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbhIUVIE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Sep 2021 17:08:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhIUVID (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 21 Sep 2021 17:08:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27BCD60F13;
        Tue, 21 Sep 2021 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632258394;
        bh=lQc2mbOTgbORFbIdMqiuMSia9+RYI/oA9brIoAUn2kI=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=BYSUUdU4z9EUSNxLFkSZ/d21qadrgfCU3JQ7rsk9Lv+4bIBw+mS9D2+klRXcFk5ib
         j/eANlTRcLkESHmWrEW2RqQnKs1w66XXSbr7YJLR/lMMUxrsdmvcN2sASP/WbGwN/7
         f6eDur9NyCayD16CkK6W+g9l9T7MTb/mw/x6loYk8KFU7ZxczsDLVQk4zcE4GiurPo
         TGwpPt1bZhfGEFeDRk7bZzY4PxVnuuLr0fka4JxH3F2YSXAlJwKJxoaQv9EybNQU1K
         DChzcsSw+qPTpluuskGMsGWaRiE69AlNpjljaz6LfDJOP4z2N1OIM47k/nJAP6+bLS
         GOWf7vmVd55bg==
Message-ID: <e1a6e006f6104aa49b01c4c3ddb0c5f1968dc708.camel@kernel.org>
Subject: Re: [PATCH v3] pkcs7: make parser enable SM2 and SM3 algorithms
 combination
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Date:   Wed, 22 Sep 2021 00:06:32 +0300
In-Reply-To: <ba6bdc45-d0f1-2a33-4ccd-67c2739567a3@linux.alibaba.com>
References: <20210624094705.48673-1-tianjia.zhang@linux.alibaba.com>
         <ba6bdc45-d0f1-2a33-4ccd-67c2739567a3@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, 2021-09-18 at 10:25 +0800, Tianjia Zhang wrote:
> ping.
>=20
> On 6/24/21 5:47 PM, Tianjia Zhang wrote:
> > Support parsing the message signature of the SM2 and SM3 algorithm
> > combination. This group of algorithms has been well supported. One
> > of the main users is module signature verification.
> >=20
> > Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> > ---
> >   crypto/asymmetric_keys/pkcs7_parser.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >=20
> > diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_=
keys/pkcs7_parser.c
> > index 967329e0a07b..6cf6c4552c11 100644
> > --- a/crypto/asymmetric_keys/pkcs7_parser.c
> > +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> > @@ -248,6 +248,9 @@ int pkcs7_sig_note_digest_algo(void *context, size_=
t hdrlen,
> >   	case OID_sha224:
> >   		ctx->sinfo->sig->hash_algo =3D "sha224";
> >   		break;
> > +	case OID_sm3:
> > +		ctx->sinfo->sig->hash_algo =3D "sm3";
> > +		break;
> >   	default:
> >   		printk("Unsupported digest algo: %u\n", ctx->last_oid);
> >   		return -ENOPKG;
> > @@ -269,6 +272,10 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t=
 hdrlen,
> >   		ctx->sinfo->sig->pkey_algo =3D "rsa";
> >   		ctx->sinfo->sig->encoding =3D "pkcs1";
> >   		break;
> > +	case OID_SM2_with_SM3:
> > +		ctx->sinfo->sig->pkey_algo =3D "sm2";
> > +		ctx->sinfo->sig->encoding =3D "raw";
> > +		break;
> >   	default:
> >   		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
> >   		return -ENOPKG;
> >=20

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

