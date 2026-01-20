Return-Path: <keyrings+bounces-3852-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N9kOGXBb2l3MQAAu9opvQ
	(envelope-from <keyrings+bounces-3852-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 18:54:45 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8448E9E
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 18:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 79B8E86BF7B
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0E44279E5;
	Tue, 20 Jan 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaXdjvEy"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8601426D20;
	Tue, 20 Jan 2026 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930676; cv=none; b=pkG86KlkCO0uOa+h+7kA0QeJImLHZgUUd3SY5Qy8LSw+kedzLO29WbTf3L8W0U6xC7iLew2UDuo2jq1xFn2yRdTXspgt8JrkHVN6jVYS2yPWJVIs7KWCTRlXGWhrc+CIkCXzkJkcYeo20pyQTU+rzElwvRWtVc8qfdpWlMD2swc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930676; c=relaxed/simple;
	bh=wJQBZ1TJNTNB7ksYKiOlBOzjglAchDHQY+OOq1S/3xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfChteo65v5VmBQ6TmbjKJ7nyFmi4Rup1q9FFAWIGkamGuF8oa+RcK8xc+01gfVyTxhspdkTdc1Ij7jS1TTeCCrVtnZmxoB6h2AKnlYBUdOFdyzo+qzDt1mc5220+NuhUJMH8q7/UNb/+kkEnjjcuX7obMhqXx6RIl7XjKmhNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaXdjvEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5BEC16AAE;
	Tue, 20 Jan 2026 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930676;
	bh=wJQBZ1TJNTNB7ksYKiOlBOzjglAchDHQY+OOq1S/3xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaXdjvEy0AOieDtNHoNEaxXslQf051oXfLqScvWfqhutXQ4Zzl0dZoA+CQgeFAE4a
	 UhaRsIzqPuifft/IzniVxWjmnttRsUa1nLdpQXo/ed8qo6VJ2JUcfzcGCpo3eqCWvh
	 sgbkfApN/BPuhJONAxO7bqZVMruqEdY0SV5OQeeNFUmiqgbFaEdJeTlCmuSWmihLFh
	 UzPiD+C5cNqcIWisLpIA88SLVsY4GaQQlAxxh3lPYiB03T4ww4uBgObPubdxSRyDWR
	 yWB8M+EsqLAXKjRk4BQmBA+0rTrCZ0gE3l/VIOycaZ+0Xx5VX8h4ToyjxuwyibtijI
	 A50wVHm+DPIsQ==
Date: Tue, 20 Jan 2026 19:37:51 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 01/12] crypto: Add ML-DSA crypto_sig support
Message-ID: <aW-9b0JO_FX3P__b@kernel.org>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-2-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-2-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-3852-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,wunner.de:email,chronox.de:email,cloudflare.com:email]
X-Rspamd-Queue-Id: 7CC8448E9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:47PM +0000, David Howells wrote:
> Add verify-only public key crypto support for ML-DSA so that the
> X.509/PKCS#7 signature verification code, as used by module signing,
> amongst other things, can make use of it through the common crypto_sig API.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/Kconfig  |  10 +++
>  crypto/Makefile |   2 +
>  crypto/mldsa.c  | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 213 insertions(+)
>  create mode 100644 crypto/mldsa.c
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 12a87f7cf150..8dd5c6660c5a 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -344,6 +344,16 @@ config CRYPTO_ECRDSA
>  	  One of the Russian cryptographic standard algorithms (called GOST
>  	  algorithms). Only signature verification is implemented.
>  
> +config CRYPTO_MLDSA
> +	tristate "ML-DSA (Module-Lattice-Based Digital Signature Algorithm)"
> +	select CRYPTO_SIG
> +	select CRYPTO_LIB_MLDSA
> +	select CRYPTO_LIB_SHA3
> +	help
> +	  ML-DSA (Module-Lattice-Based Digital Signature Algorithm) (FIPS-204).
> +
> +	  Only signature verification is implemented.
> +
>  endmenu
>  
>  menu "Block ciphers"
> diff --git a/crypto/Makefile b/crypto/Makefile
> index 23d3db7be425..267d5403045b 100644
> --- a/crypto/Makefile
> +++ b/crypto/Makefile
> @@ -60,6 +60,8 @@ ecdsa_generic-y += ecdsa-p1363.o
>  ecdsa_generic-y += ecdsasignature.asn1.o
>  obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
>  
> +obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
> +
>  crypto_acompress-y := acompress.o
>  crypto_acompress-y += scompress.o
>  obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
> diff --git a/crypto/mldsa.c b/crypto/mldsa.c
> new file mode 100644
> index 000000000000..2146c774b5ca
> --- /dev/null
> +++ b/crypto/mldsa.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * crypto_sig wrapper around ML-DSA library.
> + */
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <crypto/internal/sig.h>
> +#include <crypto/mldsa.h>
> +
> +struct crypto_mldsa_ctx {
> +	u8 pk[MAX(MAX(MLDSA44_PUBLIC_KEY_SIZE,
> +		      MLDSA65_PUBLIC_KEY_SIZE),
> +		  MLDSA87_PUBLIC_KEY_SIZE)];
> +	unsigned int pk_len;
> +	enum mldsa_alg strength;
> +	u8 key_set;
> +};
> +
> +static int crypto_mldsa_sign(struct crypto_sig *tfm,
> +			     const void *msg, unsigned int msg_len,
> +			     void *sig, unsigned int sig_len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int crypto_mldsa_verify(struct crypto_sig *tfm,
> +			       const void *sig, unsigned int sig_len,
> +			       const void *msg, unsigned int msg_len)
> +{
> +	const struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	if (unlikely(!ctx->key_set))
> +		return -EINVAL;
> +
> +	return mldsa_verify(ctx->strength, sig, sig_len, msg, msg_len,
> +			    ctx->pk, ctx->pk_len);
> +}
> +
> +static unsigned int crypto_mldsa_key_size(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	switch (ctx->strength) {
> +	case MLDSA44:
> +		return MLDSA44_PUBLIC_KEY_SIZE;
> +	case MLDSA65:
> +		return MLDSA65_PUBLIC_KEY_SIZE;
> +	case MLDSA87:
> +		return MLDSA87_PUBLIC_KEY_SIZE;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
> +
> +static int crypto_mldsa_set_pub_key(struct crypto_sig *tfm,
> +				    const void *key, unsigned int keylen)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +	unsigned int expected_len = crypto_mldsa_key_size(tfm);
> +
> +	if (keylen != expected_len)
> +		return -EINVAL;
> +
> +	ctx->pk_len = keylen;
> +	memcpy(ctx->pk, key, keylen);
> +	ctx->key_set = true;
> +	return 0;
> +}
> +
> +static int crypto_mldsa_set_priv_key(struct crypto_sig *tfm,
> +				     const void *key, unsigned int keylen)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static unsigned int crypto_mldsa_max_size(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	switch (ctx->strength) {
> +	case MLDSA44:
> +		return MLDSA44_SIGNATURE_SIZE;
> +	case MLDSA65:
> +		return MLDSA65_SIGNATURE_SIZE;
> +	case MLDSA87:
> +		return MLDSA87_SIGNATURE_SIZE;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
> +
> +static int crypto_mldsa44_alg_init(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	ctx->strength = MLDSA44;
> +	ctx->key_set = false;
> +	return 0;
> +}
> +
> +static int crypto_mldsa65_alg_init(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	ctx->strength = MLDSA65;
> +	ctx->key_set = false;
> +	return 0;
> +}
> +
> +static int crypto_mldsa87_alg_init(struct crypto_sig *tfm)
> +{
> +	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	ctx->strength = MLDSA87;
> +	ctx->key_set = false;
> +	return 0;
> +}
> +
> +static void crypto_mldsa_alg_exit(struct crypto_sig *tfm)
> +{
> +}
> +
> +static struct sig_alg crypto_mldsa_algs[] = {
> +	{
> +		.sign			= crypto_mldsa_sign,
> +		.verify			= crypto_mldsa_verify,
> +		.set_pub_key		= crypto_mldsa_set_pub_key,
> +		.set_priv_key		= crypto_mldsa_set_priv_key,
> +		.key_size		= crypto_mldsa_key_size,
> +		.max_size		= crypto_mldsa_max_size,
> +		.init			= crypto_mldsa44_alg_init,
> +		.exit			= crypto_mldsa_alg_exit,
> +		.base.cra_name		= "mldsa44",
> +		.base.cra_driver_name	= "mldsa44-lib",
> +		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
> +		.base.cra_module	= THIS_MODULE,
> +		.base.cra_priority	= 5000,
> +	}, {
> +		.sign			= crypto_mldsa_sign,
> +		.verify			= crypto_mldsa_verify,
> +		.set_pub_key		= crypto_mldsa_set_pub_key,
> +		.set_priv_key		= crypto_mldsa_set_priv_key,
> +		.key_size		= crypto_mldsa_key_size,
> +		.max_size		= crypto_mldsa_max_size,
> +		.init			= crypto_mldsa65_alg_init,
> +		.exit			= crypto_mldsa_alg_exit,
> +		.base.cra_name		= "mldsa65",
> +		.base.cra_driver_name	= "mldsa65-lib",
> +		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
> +		.base.cra_module	= THIS_MODULE,
> +		.base.cra_priority	= 5000,
> +	}, {
> +		.sign			= crypto_mldsa_sign,
> +		.verify			= crypto_mldsa_verify,
> +		.set_pub_key		= crypto_mldsa_set_pub_key,
> +		.set_priv_key		= crypto_mldsa_set_priv_key,
> +		.key_size		= crypto_mldsa_key_size,
> +		.max_size		= crypto_mldsa_max_size,
> +		.init			= crypto_mldsa87_alg_init,
> +		.exit			= crypto_mldsa_alg_exit,
> +		.base.cra_name		= "mldsa87",
> +		.base.cra_driver_name	= "mldsa87-lib",
> +		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
> +		.base.cra_module	= THIS_MODULE,
> +		.base.cra_priority	= 5000,
> +	},
> +};
> +
> +static int __init mldsa_init(void)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++) {
> +		ret = crypto_register_sig(&crypto_mldsa_algs[i]);
> +		if (ret < 0)
> +			goto error;
> +	}
> +	return 0;
> +
> +error:
> +	pr_err("Failed to register (%d)\n", ret);
> +	for (i--; i >= 0; i--)
> +		crypto_unregister_sig(&crypto_mldsa_algs[i]);
> +	return ret;
> +}
> +module_init(mldsa_init);
> +
> +static void mldsa_exit(void)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++)
> +		crypto_unregister_sig(&crypto_mldsa_algs[i]);
> +}
> +module_exit(mldsa_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Crypto API support for ML-DSA signature verification");
> +MODULE_ALIAS_CRYPTO("mldsa44");
> +MODULE_ALIAS_CRYPTO("mldsa65");
> +MODULE_ALIAS_CRYPTO("mldsa87");
> 

Went through it, not much else to say, as it just binds the callbacks:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

