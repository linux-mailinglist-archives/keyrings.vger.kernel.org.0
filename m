Return-Path: <keyrings+bounces-1088-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A60E8A3EAE
	for <lists+keyrings@lfdr.de>; Sat, 13 Apr 2024 23:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC9E1C209A0
	for <lists+keyrings@lfdr.de>; Sat, 13 Apr 2024 21:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71AE1EB31;
	Sat, 13 Apr 2024 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go5rgI5n"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9631865;
	Sat, 13 Apr 2024 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713043409; cv=none; b=Xv4y6+evNWm+2slRAT5lUCKk280oOrxGPZjlVw9psaYZy8yI4VYt/f0RKv5Jcv6YKY7k2iot4md5K5t4NyhYOapdy+SxSeJxb0nlbPfixiKVSuTnPkD4eCw2eonTkQ1upjk9yviTgBJZwExIcnSkDgt9vNXbQJqT3Thqccn/H8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713043409; c=relaxed/simple;
	bh=w9DjssfpgemJ7DwVPGoFygy9yDX5o/YGpSSOudyuOMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fmZS+WkczSH6JVExGnJTLAbIp8CASupIFHb5wSbv6PZ1jCNibvua+S4EYKJpojjdFugIFCVsWUBh80NVGX8ZZPM+l8gyY4sBuJvF4U0NrDtULD50lshRUrsPvcPjSNTClh8BJUYHGbTkzTXt5rrEIuGSJcfFHAE4rAElNmCdAW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Go5rgI5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7227FC113CD;
	Sat, 13 Apr 2024 21:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713043409;
	bh=w9DjssfpgemJ7DwVPGoFygy9yDX5o/YGpSSOudyuOMk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Go5rgI5nxYZDGrvDqzGQlnAygUfWLPQwmJqQagV89HtcXrawRRkjZn1JTUu3Y1hk+
	 ECXtoLkT9lBAyBRhG6kBO8+UvvnbmeTAgq4ygqiFC6wlm9O6jCBd4CZbE1sxOARJEp
	 9R/U9Otg0+RAGT4fjF/NrxBBXls37do5V9COfh0uqrk7SznK0AZii8aig1/phSzH9C
	 cdMcHxHVpL8ZCYEl5q/4Z8CUwo5xmf8SrOk3wQl5QPxoxR9NYSTCMvPFpHaZAyMPiK
	 CDJAxzbxkdXkVOiz0pCpohxVCXnL2HobFbdTiEEf6pzj1b5Nu5J0Lz6Lq7OfUf/2Kh
	 zuFa6Sttfww9w==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Apr 2024 00:23:24 +0300
Message-Id: <D0JB7FZC0NB6.3AWDQJ70E6SBP@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Dan Williams" <dan.j.williams@intel.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH v4] X.509: Introduce scope-based x509_certificate
 allocation
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "David Howells" <dhowells@redhat.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
X-Mailer: aerc 0.17.0
References: <ace28d74f7c143fa28919214858a9ca90b6cf970.1712511262.git.lukas@wunner.de>
In-Reply-To: <ace28d74f7c143fa28919214858a9ca90b6cf970.1712511262.git.lukas@wunner.de>

Apologies for late response, I've been sick as stated in some other
LKML responses.

On Sun Apr 7, 2024 at 8:57 PM EEST, Lukas Wunner wrote:
> Add a DEFINE_FREE() clause for x509_certificate structs and use it in
> x509_cert_parse() and x509_key_preparse().  These are the only functions
> where scope-based x509_certificate allocation currently makes sense.
> A third user will be introduced with the forthcoming SPDM library
> (Security Protocol and Data Model) for PCI device authentication.
>
> Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
> instead of NULL before calling x509_free_certificate() at end of scope.
> That's because the "constructor" of x509_certificate structs,
> x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
> NULL.

+1

> Comparing the Assembler output before/after has shown they are identical,
> save for the fact that gcc-12 always generates two return paths when
> __cleanup() is used, one for the success case and one for the error case.
>
> In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> check on return.  Introduce an assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.
>
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Link: https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/
> Link: https://lwn.net/Articles/934679/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Changes v3 -> v4:
> Use passive mood in and drop the word "handy" from commit message (Jarkko=
).
>
> Link to v3:
> https://lore.kernel.org/all/63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708=
439875.git.lukas@wunner.de/
>
>  crypto/asymmetric_keys/x509_cert_parser.c | 43 ++++++++++++-------------=
------
>  crypto/asymmetric_keys/x509_parser.h      |  3 +++
>  crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++---------------
>  include/linux/compiler.h                  |  2 ++
>  4 files changed, 30 insertions(+), 49 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 487204d..aeffbf6 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -60,24 +60,24 @@ void x509_free_certificate(struct x509_certificate *c=
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
> +	assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */
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
> @@ -85,7 +85,7 @@ struct x509_certificate *x509_cert_parse(const void *da=
ta, size_t datalen)
>  	/* Attempt to decode the certificate */
>  	ret =3D asn1_ber_decoder(&x509_decoder, ctx, data, datalen);
>  	if (ret < 0)
> -		goto error_decode;
> +		return ERR_PTR(ret);
> =20
>  	/* Decode the AuthorityKeyIdentifier */
>  	if (ctx->raw_akid) {
> @@ -95,20 +95,19 @@ struct x509_certificate *x509_cert_parse(const void *=
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
> @@ -116,33 +115,23 @@ struct x509_certificate *x509_cert_parse(const void=
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
> index 97a886c..0688c22 100644
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
> +	    if (!IS_ERR(_T)) x509_free_certificate(_T))

+1

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
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index c00cc6c..53666eb 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -148,6 +148,8 @@ void ftrace_likely_update(struct ftrace_likely_data *=
f, int val,
>  } while (0)
>  #endif
> =20
> +#define assume(cond) do { if (!(cond)) __builtin_unreachable(); } while =
(0)
> +

Should compiler.h additions be isolated to separate patches?

>  /*
>   * KENTRY - kernel entry point
>   * This can be used to annotate symbols (functions or data) that are use=
d

Other than that this looks good to me.

BR, Jarkko

