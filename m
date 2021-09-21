Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FDB413BFE
	for <lists+keyrings@lfdr.de>; Tue, 21 Sep 2021 23:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhIUVJA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Sep 2021 17:09:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233997AbhIUVI7 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 21 Sep 2021 17:08:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E8CE611ED;
        Tue, 21 Sep 2021 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632258447;
        bh=KhqgCOU1H+B4j48XZ2KbxoGsnjCzuiyjcIpFTqCMxxQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=mmiDqp8W7ToUmvXUok5eX0WvW7OdVY5wBuyVdo7QuRceEf9R4ND6az8ZVbcx6A26H
         DZ6BF5ifNm5jmPssa+ZSP8hEkRyUfY9l1FZQxZonSQ8dEtm4ugyAClUDFFM0ZfNrWC
         r6T7IzSRzasfQ7ZH7y825kviG7Un6PZ1ekGkZHeQukHC/pYMpvk5baTboQ8LJXPMxf
         FTyv7eQ5w3O02jWNf4EGT5S3awNii4rm5uDKApzaG44U8KivSWMNd6VgIvloWMtChp
         9vFHOCu0Snks/tbzZbEutpI+Dim10D3DUvfrsXAJ4Acv7TkEkHlPzQ+vnWu3pmS4O+
         laAo3A1MU4D1Q==
Message-ID: <6318b58cf9ede0ffcda396cd14572d0143f6a04e.camel@kernel.org>
Subject: Re: [PATCH] pkcs7: support EC-RDSA/streebog in SignerInfo
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Elvira Khabirova <e.khabirova@omp.ru>, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, herbert@gondor.apana.org.au,
        dhowells@redhat.com, vt@altlinux.org
Date:   Wed, 22 Sep 2021 00:07:25 +0300
In-Reply-To: <59bf7fdf-b06e-1533-865a-06c612f4a19c@linux.alibaba.com>
References: <20210511174744.4f3c6c59@msk1wst204>
         <59bf7fdf-b06e-1533-865a-06c612f4a19c@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, 2021-09-18 at 10:39 +0800, Tianjia Zhang wrote:
> ping.
>=20
> On 5/11/21 10:47 PM, Elvira Khabirova wrote:
> > Allow using EC-RDSA/streebog in pkcs7 certificates in a similar way
> > to how it's done in the x509 parser.
> >=20
> > This is needed e.g. for loading kernel modules signed with EC-RDSA.
> >=20
> > Signed-off-by: Elvira Khabirova <e.khabirova@omp.ru>
> > ---
> >   crypto/asymmetric_keys/pkcs7_parser.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >=20
> > diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_=
keys/pkcs7_parser.c
> > index 967329e0a07b..39c260a04167 100644
> > --- a/crypto/asymmetric_keys/pkcs7_parser.c
> > +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> > @@ -248,6 +248,12 @@ int pkcs7_sig_note_digest_algo(void *context, size=
_t hdrlen,
> >   	case OID_sha224:
> >   		ctx->sinfo->sig->hash_algo =3D "sha224";
> >   		break;
> > +	case OID_gost2012Digest256:
> > +		ctx->sinfo->sig->hash_algo =3D "streebog256";
> > +		break;
> > +	case OID_gost2012Digest512:
> > +		ctx->sinfo->sig->hash_algo =3D "streebog512";
> > +		break;
> >   	default:
> >   		printk("Unsupported digest algo: %u\n", ctx->last_oid);
> >   		return -ENOPKG;
> > @@ -269,6 +275,11 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t=
 hdrlen,
> >   		ctx->sinfo->sig->pkey_algo =3D "rsa";
> >   		ctx->sinfo->sig->encoding =3D "pkcs1";
> >   		break;
> > +	case OID_gost2012PKey256:
> > +	case OID_gost2012PKey512:
> > +		ctx->sinfo->sig->pkey_algo =3D "ecrdsa";
> > +		ctx->sinfo->sig->encoding =3D "raw";
> > +		break;
> >   	default:
> >   		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
> >   		return -ENOPKG;
> >=20

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

