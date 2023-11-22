Return-Path: <keyrings+bounces-142-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B77F3ECE
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 08:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F1C9B20DCA
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 07:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22421C2AD;
	Wed, 22 Nov 2023 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WPDRTlKF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEDC18E;
	Tue, 21 Nov 2023 23:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1700637669; x=1700896869;
	bh=KQKcYlfUBhynJr4wyR2tBUaN/WN3sfGnek/kUSlXy6w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WPDRTlKF+bhvFZ0g1kafvVXKkij1wkDpxk7Sh18WP/+Fhv39hf4OxHZt2O3o8xrGf
	 zmfkTIGMu+hAjV4SUqBouBWBq5JBjtHJH8BS8s2f9MB88l7pWEFy1cviU7GlMWJgy3
	 ahOog1HXwMJbetb2/I4eNY+IOIXo1FLhYaEb1ihKG1nV9P52Hh3SYxJFOOsSV7kXRT
	 Xmr+tQvjTq2Yma/c8cLOpdyHqksSCwa9RnL8OiW+sap9dqwYkwDwXnC8591g/IvjJM
	 A3rImSrVl5IIhQuuCu/etRXrWr8Ggdmh5oBXHqHlMfivOTOMLUm4zQB4WJ6azCZWND
	 itGuMK4q1lTtA==
Date: Wed, 22 Nov 2023 07:20:59 +0000
To: Yusong Gao <a869920004@gmail.com>
From: Juerg Haefliger <juergh@proton.me>
Cc: jarkko@kernel.org, davem@davemloft.net, dhowells@redhat.com, dwmw2@infradead.org, zohar@linux.ibm.com, herbert@gondor.apana.org.au, lists@sapience.com, dimitri.ledkov@canonical.com, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3] sign-file: Fix incorrect return values check
Message-ID: <20231122082050.7eeea7bd@smeagol>
In-Reply-To: <20231121034044.847642-1-a869920004@gmail.com>
References: <20231121034044.847642-1-a869920004@gmail.com>
Feedback-ID: 45149698:user:proton
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_5S9CcLAoQ3T185ob3CrIvjzHrp6WwlJzSCP7jwKvM"

This is a multi-part message in MIME format.

--b1_5S9CcLAoQ3T185ob3CrIvjzHrp6WwlJzSCP7jwKvM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Nov 2023 03:40:44 +0000
"Yusong Gao" <a869920004@gmail.com> wrote:

> There are some wrong return values check in sign-file when call OpenSSL
> API. The ERR() check cond is wrong because of the program only check the
> return value is < 0 instead of <=3D 0. For example:
> 1. CMS_final() return 1 for success or 0 for failure.
> 2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.
> 3. i2d_TYPEbio() return 1 for success and 0 for failure.
> 4. BIO_free() return 1 for success and 0 for failure.

Good catch! In this case I'd probably be more strict and check for '!=3D 1'=
.
See below.

...Juerg


> Link: https://www.openssl.org/docs/manmaster/man3/
> Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing with a=
 raw signature")
>=20
> Signed-off-by: Yusong Gao <a869920004@gmail.com>
> ---
> V1, V2: Clarify the description of git message.
> ---
>  scripts/sign-file.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 598ef5465f82..dcebbcd6bebd 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -322,7 +322,7 @@ int main(int argc, char **argv)
>  =09=09=09=09     CMS_NOSMIMECAP | use_keyid |
>  =09=09=09=09     use_signed_attrs),
>  =09=09    "CMS_add1_signer");
> -=09=09ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
> +=09=09ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) <=3D 0,

ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=3D 1,


>  =09=09    "CMS_final");
>=20
>  #else
> @@ -341,10 +341,10 @@ int main(int argc, char **argv)
>  =09=09=09b =3D BIO_new_file(sig_file_name, "wb");
>  =09=09=09ERR(!b, "%s", sig_file_name);
>  #ifndef USE_PKCS7
> -=09=09=09ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
> +=09=09=09ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) <=3D 0,

ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) !=3D 1,


>  =09=09=09    "%s", sig_file_name);
>  #else
> -=09=09=09ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
> +=09=09=09ERR(i2d_PKCS7_bio(b, pkcs7) <=3D 0,

ERR(i2d_PKCS7_bio(b, pkcs7) !=3D 1,


>  =09=09=09    "%s", sig_file_name);
>  #endif
>  =09=09=09BIO_free(b);
> @@ -374,9 +374,9 @@ int main(int argc, char **argv)
>=20
>  =09if (!raw_sig) {
>  #ifndef USE_PKCS7
> -=09=09ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s", dest_name);
> +=09=09ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) <=3D 0, "%s", dest_name);


ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) !=3D 1, "%s", dest_name);


>  #else
> -=09=09ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
> +=09=09ERR(i2d_PKCS7_bio(bd, pkcs7) <=3D 0, "%s", dest_name);

ERR(i2d_PKCS7_bio(bd, pkcs7) !=3D 1, "%s", dest_name);


>  #endif
>  =09} else {
>  =09=09BIO *b;
> @@ -396,7 +396,7 @@ int main(int argc, char **argv)
>  =09ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
>  =09ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", =
dest_name);
>=20
> -=09ERR(BIO_free(bd) < 0, "%s", dest_name);
> +=09ERR(BIO_free(bd) <=3D 0, "%s", dest_name);

ERR(BIO_free(bd) !=3D 1, "%s", dest_name);


>=20
>  =09/* Finally, if we're signing in place, replace the original. */
>  =09if (replace_orig)
> --
> 2.34.1
>=20


--b1_5S9CcLAoQ3T185ob3CrIvjzHrp6WwlJzSCP7jwKvM
Content-Type: application/pgp-signature; name=attachment.sig
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=attachment.sig

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFJekJBRUJDZ0FkRmlFRWhaZlU5Nkl1
cHJ2aUxkZUxEOU9MQ1F1bVFyY0ZBbVZkcTlJQUNna1FEOU9MQ1F1bQ0KUXJlZEx3LytPWFVoVzVK
dTJsdlU5VDJ2TjRrT3d0bUpkb3BBdmdBWld4RnpTYVN1RHRmTTlJVHU4ZHVXNUlNNg0KRCtzeEtM
WUdKbWI5RkFKZ3NRWDFsdFZvSGV1TjJxODFRcTNkRGNDSVBqc2J2dXh4R2NOcHVvQ0V2YU9WWGM2
cw0KeklDazJSelFHd2tNRjNGRy9MNGE3Mmh3RlMxYzhKbm1KZ2ZQbndGYVZhekV6OW5Kb0lqTDF0
bmlNOVF3RjJqWA0KUno1WjhBaFdzdlZHeVlqUEFxYnNKaU9JMlViOFJ0TzFRbnVaT09DYU5YSHM4
RlVwQWMxa1NOQy80UGYyUytuUQ0KQ3JGb0poUEFZVFozTHVFWjhDaHo0dUpFZzFUaGorTGI0ZEdK
eDNtSVBRSEREMzRkMjNhRTJTbTE1c0xCMmRWMA0KZTUyUGxWVlJTTFFmeitjcnJhRE9ZR1lOZllz
UmdGck8vRkdkYlN0aGFTb0hJWkFSNGl6aURSeUxRS3VpNjRLaA0KME9YVFBNcUU3bHRnVzFoM2pQ
WXZEQUhwZ3NjdTRxMHg4R2dlTERhTHhEeVBGcDNqNmxNY2xyQkRSK3pGa1lDTg0KeDVKYWVyS1p6
dUF2ZWpvZ1prNjdNMktmZGIxSGtVWWVGYUpxY2xkWkZVd3p1bFBxWTgzNFZWM1JEUTNtdUduUw0K
SmcxNnl5R3ZBbytkNnhkZXpLRzArU05hU3Y3LzJxSnl0VzFRNUg4OWM1ZlBSYUNUc1lQdGQyY2Fr
OHdsNjhCMQ0KRHFFakN6ZjFKdXdNWTRWVDFUTm8wM201TTVZMDQ2bzhxK002TGxpUUlqb1FqWDZm
d0RnUmJIT25sZW9OVW5IVA0KQU94alRCRElMRU83YVNhbnF4aGJIb00xQ3JST0VpOERlRGJHa3F2
c29NQWVuZE40SzY0PQ0KPWhySVMNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0K

--b1_5S9CcLAoQ3T185ob3CrIvjzHrp6WwlJzSCP7jwKvM--


