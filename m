Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFFF7D42D2
	for <lists+keyrings@lfdr.de>; Tue, 24 Oct 2023 00:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjJWWnT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 23 Oct 2023 18:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjJWWnT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 23 Oct 2023 18:43:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAA610C;
        Mon, 23 Oct 2023 15:43:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12764C433C7;
        Mon, 23 Oct 2023 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698100997;
        bh=9NTGeqoJxxeloHGamBz9q7jjB37nZEJlywbpZkVIFQs=;
        h=Date:Subject:From:To:References:In-Reply-To:From;
        b=gYPmBXlhb7opCuY0lgSfV19bKADDlxhj9ej8W1MyKgBawXQw2WyhN6+YeucWDIHd8
         bmfNOnVSmQ3iKPQhWnzFuqaV91e1is2kufH//dbsJvC+lgsePlPw2itRXbQvZZXweI
         wwkRtSjAMn6kb5bFyBZv3JUTGaddiFrMUr2ImPrqI52UOdUutvbxa9l9OdMiBqfovE
         aN887n7mjp/hUq1gXoAGbd/VXJwON5+nIECQ/kq5s99UPwpUlAFiTnYF1TNvjt1iYe
         5Han9w0xSjcnOzfLBjPmYaUOYLq2wI7soMtn5FOlkWmEFdoEuq1l8eB5Cv885JXmQU
         0rIw6FI3Yid3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 24 Oct 2023 01:43:13 +0300
Subject: Re: [PATCH] certs: Break circular dependency when selftest is
 modular
From:   "Jarkko Sakkinen" <jarkko@kernel.org>
To:     "Herbert Xu" <herbert@gondor.apana.org.au>,
        "Linux Crypto Mailing List" <linux-crypto@vger.kernel.org>,
        "David Howells" <dhowells@redhat.com>, <keyrings@vger.kernel.org>
Message-Id: <CWG6IPHQFEE6.2V1C6UYS0AVKD@suppilovahvero>
X-Mailer: aerc 0.15.2
References: <ZSzIaBZ8YQHss2Dv@gondor.apana.org.au>
In-Reply-To: <ZSzIaBZ8YQHss2Dv@gondor.apana.org.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon Oct 16, 2023 at 8:21 AM EEST, Herbert Xu wrote:
> The modular build fails because the self-test code depends on pkcs7
> which in turn depends on x509 which contains the self-test.
>
> Split the self-test out into its own module to break the cycle.
>
> Fixes: 3cde3174eb91 ("certs: Add FIPS selftests")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kcon=
fig
> index 1ef3b46d6f6e..59ec726b7c77 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -76,7 +76,7 @@ config SIGNED_PE_FILE_VERIFICATION
>  	  signed PE binary.
> =20
>  config FIPS_SIGNATURE_SELFTEST
> -	bool "Run FIPS selftests on the X.509+PKCS7 signature verification"
> +	tristate "Run FIPS selftests on the X.509+PKCS7 signature verification"
>  	help
>  	  This option causes some selftests to be run on the signature
>  	  verification code, using some built in data.  This is required
> @@ -84,5 +84,6 @@ config FIPS_SIGNATURE_SELFTEST
>  	depends on KEYS
>  	depends on ASYMMETRIC_KEY_TYPE
>  	depends on PKCS7_MESSAGE_PARSER=3DX509_CERTIFICATE_PARSER
> +	depends on X509_CERTIFICATE_PARSER
> =20
>  endif # ASYMMETRIC_KEY_TYPE
> diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Mak=
efile
> index 0d1fa1b692c6..1a273d6df3eb 100644
> --- a/crypto/asymmetric_keys/Makefile
> +++ b/crypto/asymmetric_keys/Makefile
> @@ -22,7 +22,8 @@ x509_key_parser-y :=3D \
>  	x509_cert_parser.o \
>  	x509_loader.o \
>  	x509_public_key.o
> -x509_key_parser-$(CONFIG_FIPS_SIGNATURE_SELFTEST) +=3D selftest.o
> +obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) +=3D x509_selftest.o
> +x509_selftest-y +=3D selftest.o
> =20
>  $(obj)/x509_cert_parser.o: \
>  	$(obj)/x509.asn1.h \
> diff --git a/crypto/asymmetric_keys/selftest.c b/crypto/asymmetric_keys/s=
elftest.c
> index fa0bf7f24284..c50da7ef90ae 100644
> --- a/crypto/asymmetric_keys/selftest.c
> +++ b/crypto/asymmetric_keys/selftest.c
> @@ -4,10 +4,11 @@
>   * Written by David Howells (dhowells@redhat.com)
>   */
> =20
> -#include <linux/kernel.h>
> -#include <linux/cred.h>
> -#include <linux/key.h>
>  #include <crypto/pkcs7.h>
> +#include <linux/cred.h>
> +#include <linux/kernel.h>
> +#include <linux/key.h>
> +#include <linux/module.h>
>  #include "x509_parser.h"
> =20
>  struct certs_test {
> @@ -175,7 +176,7 @@ static const struct certs_test certs_tests[] __initco=
nst =3D {
>  	TEST(certs_selftest_1_data, certs_selftest_1_pkcs7),
>  };
> =20
> -int __init fips_signature_selftest(void)
> +static int __init fips_signature_selftest(void)
>  {
>  	struct key *keyring;
>  	int ret, i;
> @@ -222,3 +223,9 @@ int __init fips_signature_selftest(void)
>  	key_put(keyring);
>  	return 0;
>  }
> +
> +late_initcall(fips_signature_selftest);
> +
> +MODULE_DESCRIPTION("X.509 self tests");
> +MODULE_AUTHOR("Red Hat, Inc.");

Not anything related to this patch per se but I'm wondering how useful
MODULE_AUTHOR() field is in the modern times... It can sometimes point
out to a person who has long gone from working with kernel and generally
is misleading. Git sort of provides the field in better granularity.

> +MODULE_LICENSE("GPL");
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_key=
s/x509_parser.h
> index a299c9c56f40..97a886cbe01c 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -40,15 +40,6 @@ struct x509_certificate {
>  	bool		blacklisted;
>  };
> =20
> -/*
> - * selftest.c
> - */
> -#ifdef CONFIG_FIPS_SIGNATURE_SELFTEST
> -extern int __init fips_signature_selftest(void);
> -#else
> -static inline int fips_signature_selftest(void) { return 0; }
> -#endif
> -
>  /*
>   * x509_cert_parser.c
>   */
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 7c71db3ac23d..6a4f00be22fc 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -262,15 +262,9 @@ static struct asymmetric_key_parser x509_key_parser =
=3D {
>  /*
>   * Module stuff
>   */
> -extern int __init certs_selftest(void);
>  static int __init x509_key_init(void)
>  {
> -	int ret;
> -
> -	ret =3D register_asymmetric_key_parser(&x509_key_parser);
> -	if (ret < 0)
> -		return ret;
> -	return fips_signature_selftest();
> +	return register_asymmetric_key_parser(&x509_key_parser);
>  }
> =20
>  static void __exit x509_key_exit(void)

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

David, are you going to pick this?

BR, Jarkko
