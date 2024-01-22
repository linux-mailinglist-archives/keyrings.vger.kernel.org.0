Return-Path: <keyrings+bounces-495-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C508837290
	for <lists+keyrings@lfdr.de>; Mon, 22 Jan 2024 20:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 509CC1C297E3
	for <lists+keyrings@lfdr.de>; Mon, 22 Jan 2024 19:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A0A3E489;
	Mon, 22 Jan 2024 19:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6UoiyPq"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D83D553;
	Mon, 22 Jan 2024 19:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705951778; cv=none; b=GzpG5/JRRSyeNSxToL73h5iTUY3KGC7HjOFkch4tZ+TScKGPwqvK9rbb5SOlzVAR+IXkb3nGo9JqNGcVbB2q+wvYyUH9YLVTF6P19OaaGp8PQ/FL/GKBayyvRphLUqvegS3c8ghehTF2zds3e6gJb2z2auXduN4NoRoX687vE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705951778; c=relaxed/simple;
	bh=4viDg/UZCMocmrdRRRxo7hpmqbP++BJQAw3lhLgTbvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FpSOHVx1s5Fu8g9cQhTux6LtkqehNIXXmzJ7JLt/NmrB2qU2Lontg30aeAMR+SnOiby/AGrqS04yPLtG3QP9nzi4luXVdrOPNrXzpqd2RYUocHqoScNpcRXWv4Ac1j57VY91PT//whdlFHIahYQ3vXnf7wZISvYiFCzd/CSTgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6UoiyPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3CCC433F1;
	Mon, 22 Jan 2024 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705951777;
	bh=4viDg/UZCMocmrdRRRxo7hpmqbP++BJQAw3lhLgTbvI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r6UoiyPqI8hv/uF4765xmPkLzSCB57IFzKqNLNgbuo4ktFv1/w8TVM+mjlONCvnf/
	 7c04D9Qix5cy0t5T4ZugJw0Y6mR0APYEXNj3L19We4fnKDo0Dy/aqGNWtFZImT1ykG
	 o1s6aKETm+sUsKJGQga9ojH1Nt9dcQKsH1lyG+FAeXItKACgesWbd2s79uoTRQ8J86
	 gooB4FkyMCbnwfZpwO0tkx+dTk2DY5pcP0WFmEdtsfSh1OH7Ruo59ljbjRwtk3LCaV
	 qiNgCx4PL7w8MDESfaDD5bl6YA5vWGQHDkR/3qbLXvSCP8pA/N+sfI1eeCQgBSTAD+
	 sL2lNUKh+MP4Q==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jan 2024 21:29:33 +0200
Message-Id: <CYLHFLJROQG2.SCLJMME8WBN8@suppilovahvero>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Dan Williams" <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate
 allocation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "David Howells" <dhowells@redhat.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
X-Mailer: aerc 0.15.2
References: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
In-Reply-To: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>

On Sun Jan 21, 2024 at 7:50 PM EET, Lukas Wunner wrote:
> Jonathan suggests adding cleanup.h support for x509_certificate structs:
> https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/

You have suggested-by. Use link/closes/whatever tag if you want to link
that message (and rip off this paragraph). Since the whole feature is
new maybe it would make sense to remind about __cleanup__ attribute and
its use or at least link: https://lwn.net/Articles/934679/.

You are writing it like "every knows this already".

> Introduce a DEFINE_FREE() macro and use it in x509_cert_parse() and
> x509_key_preparse().  These are the only functions where scope-based

DEFINE_FREE() macro already exists. This patch just invokes
the already existing macro.

> x509_certificate allocation currently makes sense.  Another user will
> be introduced with the upcoming SPDM library (Security Protocol and
> Data Model) for PCI device authentication.

What is it and why we care about it here?

>
> Unlike most other DEFINE_FREE() macros, this one not only has to check

So they are not DEFINE_FREE() macros but locations that invoke
DEFINE_FREE() (i.e. DEFINE_FREE9() invocations).


> for NULL, but also for ERR_PTR() before calling x509_free_certificate()
> at end of scope.  That's because the "constructor" of x509_certificate
> structs, x509_cert_parse(), may return an ERR_PTR().

"Unlike usual DEFINE_FREE() invocations, return value may also contain
error, matching the possible return values of x509_cert_parse()."


> I've compared the Assembler output before/after and while I couldn't
> spot a functional difference, I did notice an annoying superfluous check
> being added to each function:

The tail of the commit message looks more like diary, notes, plans than
anything senseful for a commit message.

>   x509_free_certificate() at end of scope.  It knows whether "cert" is
>   an ERR_PTR() because of the explicit "if (IS_ERR(cert))" check at the
>   top of the function, but it doesn't know whether it's NULL.  In fact
>   it can *never* be NULL because x509_cert_parse() only returns either
>   a valid pointer or an ERR_PTR().
>
>   I've tried adding __attribute__((returns_nonnull)) to x509_cert_parse()
>   but the compiler ignores it due to commit a3ca86aea507
>   ("Add '-fno-delete-null-pointer-checks' to gcc CFLAGS").
>
> * x509_cert_parse() now checks that "cert" is not an ERR_PTR() before
>   calling x509_free_certificate() at end of scope.  The compiler doesn't
>   know that kzalloc() never returns an ERR_PTR().
>
>   I've tried telling the compiler that by amending kmalloc() with
>   "if (IS_ERR(ptr)) __builtin_unreachable();", but the result was
>   disappointing:  While it succeeded in eliminating the superfluous
>   ERR_PTR() check, total vmlinux size increased by 448 bytes.
>
>   I could add such a clause locally to x509_cert_parse() instead of
>   kmalloc(), but it would require additions to compiler-*.h.
>   (clang uses a different syntax for these annotations.)
>
> Despite the annoying extra checks, I think the gain in readability
> justifies the conversion.
>
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---

Maybe you want to put tail here.

>  crypto/asymmetric_keys/x509_cert_parser.c | 42 +++++++++++--------------=
------
>  crypto/asymmetric_keys/x509_parser.h      |  3 +++
>  crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++----------------
>  3 files changed, 27 insertions(+), 49 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 487204d..e597ac6 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -60,24 +60,23 @@ void x509_free_certificate(struct x509_certificate *c=
ert)
>   */
>  struct x509_certificate *x509_cert_parse(const void *data, size_t datale=
n)
>  {
> -	struct x509_certificate *cert;
> -	struct x509_parse_context *ctx;
> +	struct x509_certificate *cert __free(x509_free_certificate);
> +	struct x509_parse_context *ctx __free(kfree) =3D NULL;
>  	struct asymmetric_key_id *kid;
>  	long ret;
> =20
> -	ret =3D -ENOMEM;
>  	cert =3D kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
>  	if (!cert)
> -		goto error_no_cert;
> +		return ERR_PTR(-ENOMEM);
>  	cert->pub =3D kzalloc(sizeof(struct public_key), GFP_KERNEL);
>  	if (!cert->pub)
> -		goto error_no_ctx;
> +		return ERR_PTR(-ENOMEM);
>  	cert->sig =3D kzalloc(sizeof(struct public_key_signature), GFP_KERNEL);
>  	if (!cert->sig)
> -		goto error_no_ctx;
> +		return ERR_PTR(-ENOMEM);
>  	ctx =3D kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
>  	if (!ctx)
> -		goto error_no_ctx;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	ctx->cert =3D cert;
>  	ctx->data =3D (unsigned long)data;
> @@ -85,7 +84,7 @@ struct x509_certificate *x509_cert_parse(const void *da=
ta, size_t datalen)
>  	/* Attempt to decode the certificate */
>  	ret =3D asn1_ber_decoder(&x509_decoder, ctx, data, datalen);
>  	if (ret < 0)
> -		goto error_decode;
> +		return ERR_PTR(ret);
> =20
>  	/* Decode the AuthorityKeyIdentifier */
>  	if (ctx->raw_akid) {
> @@ -95,20 +94,19 @@ struct x509_certificate *x509_cert_parse(const void *=
data, size_t datalen)
>  				       ctx->raw_akid, ctx->raw_akid_size);
>  		if (ret < 0) {
>  			pr_warn("Couldn't decode AuthKeyIdentifier\n");
> -			goto error_decode;
> +			return ERR_PTR(ret);
>  		}
>  	}
> =20
> -	ret =3D -ENOMEM;
>  	cert->pub->key =3D kmemdup(ctx->key, ctx->key_size, GFP_KERNEL);
>  	if (!cert->pub->key)
> -		goto error_decode;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	cert->pub->keylen =3D ctx->key_size;
> =20
>  	cert->pub->params =3D kmemdup(ctx->params, ctx->params_size, GFP_KERNEL=
);
>  	if (!cert->pub->params)
> -		goto error_decode;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	cert->pub->paramlen =3D ctx->params_size;
>  	cert->pub->algo =3D ctx->key_algo;
> @@ -116,33 +114,23 @@ struct x509_certificate *x509_cert_parse(const void=
 *data, size_t datalen)
>  	/* Grab the signature bits */
>  	ret =3D x509_get_sig_params(cert);
>  	if (ret < 0)
> -		goto error_decode;
> +		return ERR_PTR(ret);
> =20
>  	/* Generate cert issuer + serial number key ID */
>  	kid =3D asymmetric_key_generate_id(cert->raw_serial,
>  					 cert->raw_serial_size,
>  					 cert->raw_issuer,
>  					 cert->raw_issuer_size);
> -	if (IS_ERR(kid)) {
> -		ret =3D PTR_ERR(kid);
> -		goto error_decode;
> -	}
> +	if (IS_ERR(kid))
> +		return ERR_CAST(kid);
>  	cert->id =3D kid;
> =20
>  	/* Detect self-signed certificates */
>  	ret =3D x509_check_for_self_signed(cert);
>  	if (ret < 0)
> -		goto error_decode;
> -
> -	kfree(ctx);
> -	return cert;
> +		return ERR_PTR(ret);
> =20
> -error_decode:
> -	kfree(ctx);
> -error_no_ctx:
> -	x509_free_certificate(cert);
> -error_no_cert:
> -	return ERR_PTR(ret);
> +	return_ptr(cert);
>  }
>  EXPORT_SYMBOL_GPL(x509_cert_parse);
> =20
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_key=
s/x509_parser.h
> index 97a886c..d2dfe50 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -5,6 +5,7 @@
>   * Written by David Howells (dhowells@redhat.com)
>   */
> =20
> +#include <linux/cleanup.h>
>  #include <linux/time.h>
>  #include <crypto/public_key.h>
>  #include <keys/asymmetric-type.h>
> @@ -44,6 +45,8 @@ struct x509_certificate {
>   * x509_cert_parser.c
>   */
>  extern void x509_free_certificate(struct x509_certificate *cert);
> +DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
> +	    if (!IS_ERR_OR_NULL(_T)) x509_free_certificate(_T))
>  extern struct x509_certificate *x509_cert_parse(const void *data, size_t=
 datalen);
>  extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
>  			    unsigned char tag,
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 6a4f00b..00ac715 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -161,12 +161,11 @@ int x509_check_for_self_signed(struct x509_certific=
ate *cert)
>   */
>  static int x509_key_preparse(struct key_preparsed_payload *prep)
>  {
> -	struct asymmetric_key_ids *kids;
> -	struct x509_certificate *cert;
> +	struct x509_certificate *cert __free(x509_free_certificate);
> +	struct asymmetric_key_ids *kids __free(kfree) =3D NULL;
> +	char *p, *desc __free(kfree) =3D NULL;
>  	const char *q;
>  	size_t srlen, sulen;
> -	char *desc =3D NULL, *p;
> -	int ret;
> =20
>  	cert =3D x509_cert_parse(prep->data, prep->datalen);
>  	if (IS_ERR(cert))
> @@ -188,9 +187,8 @@ static int x509_key_preparse(struct key_preparsed_pay=
load *prep)
>  	}
> =20
>  	/* Don't permit addition of blacklisted keys */
> -	ret =3D -EKEYREJECTED;
>  	if (cert->blacklisted)
> -		goto error_free_cert;
> +		return -EKEYREJECTED;
> =20
>  	/* Propose a description */
>  	sulen =3D strlen(cert->subject);
> @@ -202,10 +200,9 @@ static int x509_key_preparse(struct key_preparsed_pa=
yload *prep)
>  		q =3D cert->raw_serial;
>  	}
> =20
> -	ret =3D -ENOMEM;
>  	desc =3D kmalloc(sulen + 2 + srlen * 2 + 1, GFP_KERNEL);
>  	if (!desc)
> -		goto error_free_cert;
> +		return -ENOMEM;
>  	p =3D memcpy(desc, cert->subject, sulen);
>  	p +=3D sulen;
>  	*p++ =3D ':';
> @@ -215,16 +212,14 @@ static int x509_key_preparse(struct key_preparsed_p=
ayload *prep)
> =20
>  	kids =3D kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
>  	if (!kids)
> -		goto error_free_desc;
> +		return -ENOMEM;
>  	kids->id[0] =3D cert->id;
>  	kids->id[1] =3D cert->skid;
>  	kids->id[2] =3D asymmetric_key_generate_id(cert->raw_subject,
>  						 cert->raw_subject_size,
>  						 "", 0);
> -	if (IS_ERR(kids->id[2])) {
> -		ret =3D PTR_ERR(kids->id[2]);
> -		goto error_free_kids;
> -	}
> +	if (IS_ERR(kids->id[2]))
> +		return PTR_ERR(kids->id[2]);
> =20
>  	/* We're pinning the module by being linked against it */
>  	__module_get(public_key_subtype.owner);
> @@ -242,15 +237,7 @@ static int x509_key_preparse(struct key_preparsed_pa=
yload *prep)
>  	cert->sig =3D NULL;
>  	desc =3D NULL;
>  	kids =3D NULL;
> -	ret =3D 0;
> -
> -error_free_kids:
> -	kfree(kids);
> -error_free_desc:
> -	kfree(desc);
> -error_free_cert:
> -	x509_free_certificate(cert);
> -	return ret;
> +	return 0;
>  }
> =20
>  static struct asymmetric_key_parser x509_key_parser =3D {


BR, Jarkko

