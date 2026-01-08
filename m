Return-Path: <keyrings+bounces-3748-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C65EFD03039
	for <lists+keyrings@lfdr.de>; Thu, 08 Jan 2026 14:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40D03051EB5
	for <lists+keyrings@lfdr.de>; Thu,  8 Jan 2026 13:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9504E20DF;
	Thu,  8 Jan 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv/LLeDg"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FE4DE919;
	Thu,  8 Jan 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878115; cv=none; b=a9ZwYa2HvosO/hiiiGW2rKzspXPmgrgKbV398M1+6JGGYkIN9Ux+G/e9ISDeY/nPD4Lszv9JZFn1WeC9Dh0vL+C10wv8oaMu5dIDEirkV5ZuA1zuS8pOV4qN2ZDoLKWeEQ9fVQT1fAkIbjgBHxXmqaVjMwfL5q6jSwc8cHKLWew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878115; c=relaxed/simple;
	bh=kqe0GgqLwOCmhisKTrQQsmB4eDke67DDmv1VSGX3Gag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoU91TYOauEEGTWQ7vxEPT/Hr0ivfq7eSdbnHzD6EgsSRDpuavgGTPhusdnnqhWhAdIMCtAWOsH4nYJh01u9Gj9nZyo5RlDCjkOI6r+y2sw3cWve9BoaebNX2Z9oEDN2CCxaXR22hTBQn7Mz2EWagIfWDOSvMh7Lq7lhsfXYKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv/LLeDg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A58C19425;
	Thu,  8 Jan 2026 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767878115;
	bh=kqe0GgqLwOCmhisKTrQQsmB4eDke67DDmv1VSGX3Gag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv/LLeDgb5E4U6gLMp5BzGjYSPiX4m8clw9f1iVNNxP9824UVzE0/rpUkKVQwENgy
	 hqgn/TOurvoeB6FY8RWR1cdsOqMmfEEmonW4pAjEfioD46s2ib4dPfLFsk1L2Thzbq
	 dJhnTX5koYXFMpyKBNCGuo5ku5s0Cak47KSfQkoB9EV1/4IJwJzyrbbIOl3Q6Z8XkH
	 pzQi8ofuTknyObmEMHKPIwLxjExtLipc0VpF0QNI9axsSFA38WmmYXoLBPh/JXAU+g
	 3+bJEfi/006xkCsr6LLTmhOumbcnYPpXRK8j6A3luLlNMeRNh+NWxIlVi7zKaahuvQ
	 xnWlWPadAkT1A==
Date: Thu, 8 Jan 2026 15:15:10 +0200
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
	linux-kernel@vger.kernel.org,
	Tadeusz Struk <tadeusz.struk@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v11 6/8] crypto: Add RSASSA-PSS support
Message-ID: <aV-t3m-ZxAcEqZmq@kernel.org>
References: <20260105152145.1801972-1-dhowells@redhat.com>
 <20260105152145.1801972-7-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105152145.1801972-7-dhowells@redhat.com>

On Mon, Jan 05, 2026 at 03:21:31PM +0000, David Howells wrote:
> Add support for RSASSA-PSS [RFC8017 sec 8.1] signature verification support
> to the RSA driver in crypto/.  Note that signing support is not provided.
> 
> The verification function requires an info string formatted as a
> space-separated list of key=value pairs.  The following parameters need to
> be provided:
> 
>  (1) sighash=<algo>
> 
>      The hash algorithm to be used to digest the data.
> 
>  (2) pss_mask=<type>,...
> 
>      The mask generation function (MGF) and its parameters.
> 
>  (3) pss_salt=<len>
> 
>      The length of the salt used.
> 
> The only MGF currently supported is "mgf1".  This takes an additional
> parameter indicating the mask-generating hash (which need not be the same
> as the data hash).  E.g.:
> 
>      "sighash=sha256 pss_mask=mgf1,sha256 pss_salt=32"
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Tadeusz Struk <tadeusz.struk@intel.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: David S. Miller <davem@davemloft.net>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/Makefile               |   1 +
>  crypto/rsa.c                  |   8 +
>  crypto/rsassa-pss.c           | 397 ++++++++++++++++++++++++++++++++++
>  include/crypto/internal/rsa.h |   2 +
>  4 files changed, 408 insertions(+)
>  create mode 100644 crypto/rsassa-pss.c
> 
> diff --git a/crypto/Makefile b/crypto/Makefile
> index 267d5403045b..5c91440d1751 100644
> --- a/crypto/Makefile
> +++ b/crypto/Makefile
> @@ -50,6 +50,7 @@ rsa_generic-y += rsa.o
>  rsa_generic-y += rsa_helper.o
>  rsa_generic-y += rsa-pkcs1pad.o
>  rsa_generic-y += rsassa-pkcs1.o
> +rsa_generic-y += rsassa-pss.o
>  obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
>  
>  $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
> diff --git a/crypto/rsa.c b/crypto/rsa.c
> index 6c7734083c98..189a09d54c16 100644
> --- a/crypto/rsa.c
> +++ b/crypto/rsa.c
> @@ -10,6 +10,7 @@
>  #include <linux/mpi.h>
>  #include <crypto/internal/rsa.h>
>  #include <crypto/internal/akcipher.h>
> +#include <crypto/internal/sig.h>
>  #include <crypto/akcipher.h>
>  #include <crypto/algapi.h>
>  
> @@ -414,8 +415,14 @@ static int __init rsa_init(void)
>  	if (err)
>  		goto err_unregister_rsa_pkcs1pad;
>  
> +	err = crypto_register_sig(&rsassa_pss_alg);
> +	if (err)
> +		goto err_rsassa_pss;
> +
>  	return 0;
>  
> +err_rsassa_pss:
> +	crypto_unregister_template(&rsassa_pkcs1_tmpl);
>  err_unregister_rsa_pkcs1pad:
>  	crypto_unregister_template(&rsa_pkcs1pad_tmpl);
>  err_unregister_rsa:
> @@ -425,6 +432,7 @@ static int __init rsa_init(void)
>  
>  static void __exit rsa_exit(void)
>  {
> +	crypto_unregister_sig(&rsassa_pss_alg);
>  	crypto_unregister_template(&rsassa_pkcs1_tmpl);
>  	crypto_unregister_template(&rsa_pkcs1pad_tmpl);
>  	crypto_unregister_akcipher(&rsa);
> diff --git a/crypto/rsassa-pss.c b/crypto/rsassa-pss.c
> new file mode 100644
> index 000000000000..7f27e8fa6fa7
> --- /dev/null
> +++ b/crypto/rsassa-pss.c
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * RSA Signature Scheme combined with EMSA-PSS encoding (RFC 8017 sec 8.2)
> + *
> + * https://www.rfc-editor.org/rfc/rfc8017#section-8.1
> + *
> + * Copyright (c) 2025 Red Hat
> + */
> +
> +#define pr_fmt(fmt) "RSAPSS: "fmt
> +#include <linux/ctype.h>
> +#include <linux/module.h>
> +#include <linux/oid_registry.h>
> +#include <linux/parser.h>
> +#include <linux/scatterlist.h>
> +#include <crypto/akcipher.h>
> +#include <crypto/algapi.h>
> +#include <crypto/hash.h>
> +#include <crypto/sig.h>
> +#include <crypto/internal/akcipher.h>
> +#include <crypto/internal/rsa.h>
> +#include <crypto/internal/sig.h>
> +
> +struct rsassa_pss_ctx {
> +	struct crypto_akcipher *rsa;
> +	unsigned int	key_size;
> +	unsigned int	salt_len;
> +	char		*pss_hash;
> +	char		*mgf1_hash;
> +};

Just a nit but I would not align these fields as it does not serve any
purpose here.


> +
> +enum {
> +	rsassa_pss_verify_hash_algo,
> +	rsassa_pss_verify_pss_mask,
> +	rsassa_pss_verify_pss_salt,
> +};
> +
> +static const match_table_t rsassa_pss_verify_params = {
> +	{ rsassa_pss_verify_hash_algo,	"sighash=%s" },
> +	{ rsassa_pss_verify_pss_mask,	"pss_mask=%s" },
> +	{ rsassa_pss_verify_pss_salt,	"pss_salt=%u" },
> +	{}
> +};
> +
> +/*
> + * Parse the signature parameters out of the info string.
> + */
> +static int rsassa_pss_vinfo_parse(struct rsassa_pss_ctx *ctx,
> +				  char *info)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +	char *p, *q;
> +
> +	ctx->pss_hash = NULL;
> +	ctx->mgf1_hash = NULL;
> +	ctx->salt_len = 0;
> +
> +	for (p = info; p && *p;) {
> +		if (isspace(*p)) {
> +			p++;
> +			continue;
> +		}
> +		q = p++;
> +		while (*p && !isspace(*p))
> +			p++;
> +
> +		if (!*p)
> +			p = NULL;
> +		else
> +			*p++ = 0;
> +
> +		switch (match_token(q, rsassa_pss_verify_params, args)) {
> +		case rsassa_pss_verify_hash_algo:
> +			*args[0].to = 0;
> +			ctx->pss_hash = args[0].from;
> +			break;
> +		case rsassa_pss_verify_pss_mask:
> +			if (memcmp(args[0].from, "mgf1", 4) != 0)
> +				return -ENOPKG;
> +			if (args[0].from[4] != ',')
> +				return -EINVAL;
> +			args[0].from += 5;
> +			if (args[0].from >= args[0].to)
> +				return -EINVAL;
> +			*args[0].to = 0;
> +			ctx->mgf1_hash = args[0].from;
> +			break;
> +		case rsassa_pss_verify_pss_salt:
> +			if (match_uint(&args[0], &ctx->salt_len) < 0)
> +				return -EINVAL;
> +			break;
> +		default:
> +			pr_debug("Unknown info param\n");
> +			return -EINVAL; /* Ignoring it might be better. */
> +		}
> +	}
> +
> +	if (!ctx->pss_hash ||
> +	    !ctx->mgf1_hash ||
> +	    !ctx->salt_len)
> +		return -EINVAL;
> +	return 0;
> +}
> +
> +DEFINE_FREE(crypto_free_shash, struct crypto_shash*,
> +	    if (!IS_ERR_OR_NULL(_T)) { crypto_free_shash(_T); });
> +
> +/*
> + * Perform mask = MGF1(mgfSeed, masklen) - RFC8017 appendix B.2.1.
> + */
> +static int MGF1(struct rsassa_pss_ctx *ctx,
> +		const u8 *mgfSeed, unsigned int mgfSeed_len,
> +		u8 *mask, unsigned int maskLen)
> +{
> +	struct crypto_shash *hash_tfm __free(crypto_free_shash) = NULL;
> +	struct shash_desc *Hash __free(kfree) = NULL;
> +	unsigned int counter, count_to, hLen, T_len;
> +	__be32 *C;
> +	int err;
> +	u8 *T, *t, *to_hash;
> +
> +	hash_tfm = crypto_alloc_shash(ctx->mgf1_hash, 0, 0);
> +	if (IS_ERR(hash_tfm))
> +		return PTR_ERR(hash_tfm);
> +
> +	hLen = crypto_shash_digestsize(hash_tfm);
> +	count_to = DIV_ROUND_UP(maskLen, hLen);
> +	T_len = hLen * count_to;
> +
> +	Hash = kmalloc(roundup(sizeof(struct shash_desc) +
> +			       crypto_shash_descsize(hash_tfm), 64) +
> +		       roundup(T_len, 64) + /* T */
> +		       roundup(mgfSeed_len + 4, 64), /* mgfSeed||C */
> +		       GFP_KERNEL);
> +	if (!Hash)
> +		return -ENOMEM;
> +
> +	Hash->tfm = hash_tfm;
> +
> +	/* 2: Let T be the empty octet string. */
> +	T = (void *)Hash +
> +		roundup(sizeof(struct shash_desc) +
> +			crypto_shash_descsize(hash_tfm), 64);
> +
> +	/* 3: Generate the mask. */
> +	to_hash = T + roundup(T_len, 64);
> +	memcpy(to_hash, mgfSeed, mgfSeed_len);
> +	C = (__be32 *)(to_hash + mgfSeed_len);
> +
> +	t = T;
> +	for (counter = 0; counter < count_to; counter++) {
> +		/* 3A: C = I2OSP(counter, 4). */
> +		put_unaligned_be32(counter, C);
> +
> +		/* 3B: T = T || Hash(mgfSeed || C). */
> +		err = crypto_shash_digest(Hash, to_hash, mgfSeed_len + 4, t);
> +		if (err < 0)
> +			return err;
> +
> +		t += hLen;
> +	}
> +
> +	/* 4: Output T to mask */
> +	memcpy(mask, T, maskLen);
> +	return 0;
> +}
> +
> +/*
> + * Perform EMSA-PSS-VERIFY(M, EM, emBits) - RFC8017 sec 9.1.2.
> + */
> +static int emsa_pss_verify(struct rsassa_pss_ctx *ctx,
> +			   const u8 *M, unsigned int M_len,
> +			   const u8 *EM, unsigned int emLen)
> +{
> +	struct crypto_shash *hash_tfm __free(crypto_free_shash);
> +	struct shash_desc *Hash __free(kfree) = NULL;
> +	unsigned int emBits, hLen, sLen, DB_len;
> +	const u8 *maskedDB, *H;
> +	u8 *mHash, *dbMask, *DB, *salt, *Mprime, *Hprime;
> +	int err, i;
> +
> +	emBits = 8 - fls(EM[0]);
> +	emBits = emLen * 8 - emBits;
> +
> +	hash_tfm = crypto_alloc_shash(ctx->pss_hash, 0, 0);
> +	if (IS_ERR(hash_tfm))
> +		return PTR_ERR(hash_tfm);
> +
> +	hLen = crypto_shash_digestsize(hash_tfm);
> +	sLen = ctx->salt_len;
> +
> +	if (sLen > 65536 ||
> +	    emBits < 8 * (hLen + sLen) + 9)
> +		return -EBADMSG;
> +
> +	DB_len = emLen - hLen - 1;
> +
> +	Hash = kmalloc(roundup(sizeof(struct shash_desc) +
> +			       crypto_shash_descsize(hash_tfm), 64) +
> +		       roundup(hLen, 64) + /* mHash */
> +		       roundup(DB_len, 64) + /* DB and dbMask */
> +		       roundup(8 + hLen + sLen, 64) + /* M' */
> +		       roundup(hLen, 64), /* H' */
> +		       GFP_KERNEL);
> +	if (!Hash)
> +		return -ENOMEM;
> +
> +	Hash->tfm = hash_tfm;
> +
> +	mHash = (void *)Hash +
> +		roundup(sizeof(struct shash_desc) +
> +			crypto_shash_descsize(hash_tfm), 64);
> +	DB = dbMask = mHash + roundup(hLen, 64);
> +	Mprime = dbMask + roundup(DB_len, 64);
> +	Hprime = Mprime + roundup(8 + hLen + sLen, 64);
> +
> +	/* 1. Check len M against hash input limitation. */
> +	/* The standard says ~2EiB for SHA1, so I think we can ignore this. */
> +
> +	/* 2. mHash = Hash(M).
> +	 * In theory, we would do:
> +	 *	err = crypto_shash_digest(Hash, M, M_len, mHash);
> +	 * but the caller is assumed to already have done that for us.
> +	 */
> +	if (M_len != hLen)
> +		return -EINVAL;
> +	memcpy(mHash, M, hLen);
> +
> +	/* 3. Check emLen against hLen + sLen + 2. */
> +	if (emLen < hLen + sLen + 2)
> +		return -EBADMSG;
> +
> +	/* 4. Validate EM. */
> +	if (EM[emLen - 1] != 0xbc)
> +		return -EKEYREJECTED;
> +
> +	/* 5. Pick maskedDB and H. */
> +	maskedDB = EM;
> +	H = EM + DB_len;
> +
> +	/* 6. Check leftmost 8emLen-emBits bits of maskedDB are 0. */
> +	/* Can only find emBits by counting the zeros on the Left. */
> +
> +	/* 7. Let dbMask = MGF(H, emLen - hLen - 1). */
> +	err = MGF1(ctx, H, hLen, dbMask, DB_len);
> +	if (err < 0)
> +		return err;
> +
> +	/* 8. Let DB = maskedDB XOR dbMask. */
> +	for (i = 0; i < DB_len; i++)
> +		DB[i] = maskedDB[i] ^ dbMask[i];
> +
> +	/* 9. Set leftmost bits in DB to zero. */
> +	int z = 8 * emLen - emBits;
> +	if (z > 0) {
> +		if (z >= 8) {
> +			DB[0] = 0;
> +		} else {
> +			z = 8 - z;
> +			DB[0] &= (1 << z) - 1;
> +		}
> +	}
> +
> +	/* 10. Check the left part of DB is {0,0,...,1}. */
> +	for (i = 0; i < emLen - hLen - sLen - 2; i++)
> +		if (DB[i] != 0)
> +			return -EKEYREJECTED;
> +	if (DB[i] != 0x01)
> +		return -EKEYREJECTED;
> +
> +	/* 11. Let salt be the last sLen octets of DB. */
> +	salt = DB + DB_len - sLen;
> +
> +	/* 12. Let M' be 00 00 00 00 00 00 00 00 || mHash || salt. */
> +	memset(Mprime, 0, 8);
> +	memcpy(Mprime + 8, mHash, hLen);
> +	memcpy(Mprime + 8 + hLen, salt, sLen);
> +
> +	/* 13. Let H' = Hash(M'). */
> +	err = crypto_shash_digest(Hash, Mprime, 8 + hLen + sLen, Hprime);
> +	if (err < 0)
> +		return err;
> +
> +	/* 14. Check H = H'. */
> +	if (memcmp(H, Hprime, hLen) != 0)
> +		return -EKEYREJECTED;
> +	return 0;
> +}
> +
> +/*
> + * Perform RSASSA-PSS-VERIFY((n,e),M,S) - RFC8017 sec 8.1.2.
> + */
> +static int rsassa_pss_verify(struct crypto_sig *tfm,
> +			     const void *src, unsigned int slen,
> +			     const void *digest, unsigned int dlen,
> +			     const char *info)
> +{
> +	struct akcipher_request *rsa_req __free(kfree) = NULL;
> +	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
> +	struct crypto_wait cwait;
> +	struct scatterlist sg;
> +	unsigned int rsa_reqsize = crypto_akcipher_reqsize(ctx->rsa);
> +	char *str __free(kfree) = NULL;
> +	u8 *EM;
> +	int err;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	str = kstrdup(info, GFP_KERNEL);
> +	if (!str)
> +		return -ENOMEM;
> +
> +	err = rsassa_pss_vinfo_parse(ctx, str);
> +	if (err < 0)
> +		return err;
> +
> +	/* RFC8017 sec 8.1.2 step 1 - length checking */
> +	if (!ctx->key_size || slen != ctx->key_size)
> +		return -EINVAL;
> +
> +	/* RFC8017 sec 8.1.2 step 2 - RSA verification */
> +	rsa_req = kmalloc(sizeof(*rsa_req) + rsa_reqsize + ctx->key_size,
> +			  GFP_KERNEL);
> +	if (!rsa_req)
> +		return -ENOMEM;
> +
> +	EM = (u8 *)(rsa_req + 1) + rsa_reqsize;
> +	memcpy(EM, src, slen);
> +
> +	crypto_init_wait(&cwait);
> +	sg_init_one(&sg, EM, slen);
> +	akcipher_request_set_tfm(rsa_req, ctx->rsa);
> +	akcipher_request_set_crypt(rsa_req, &sg, &sg, slen, slen);
> +	akcipher_request_set_callback(rsa_req, CRYPTO_TFM_REQ_MAY_SLEEP,
> +				      crypto_req_done, &cwait);
> +
> +	err = crypto_akcipher_encrypt(rsa_req);
> +	err = crypto_wait_req(err, &cwait);
> +	if (err)
> +		return err;
> +
> +	/* RFC 8017 sec 8.1.2 step 3 - EMSA-PSS(M, EM, modbits-1) */
> +	return emsa_pss_verify(ctx, digest, dlen, EM, slen);
> +}
> +
> +static unsigned int rsassa_pss_key_size(struct crypto_sig *tfm)
> +{
> +	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	return ctx->key_size * BITS_PER_BYTE;
> +}
> +
> +static int rsassa_pss_set_pub_key(struct crypto_sig *tfm,
> +				    const void *key, unsigned int keylen)
> +{
> +	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	return rsa_set_key(ctx->rsa, &ctx->key_size, RSA_PUB, key, keylen);
> +}
> +
> +static int rsassa_pss_init_tfm(struct crypto_sig *tfm)
> +{
> +	struct crypto_akcipher *rsa;
> +	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	rsa = crypto_alloc_akcipher("rsa", 0, 0);
> +	if (IS_ERR(rsa))
> +		return PTR_ERR(rsa);
> +
> +	ctx->rsa = rsa;
> +	return 0;
> +}
> +
> +static void rsassa_pss_exit_tfm(struct crypto_sig *tfm)
> +{
> +	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
> +
> +	crypto_free_akcipher(ctx->rsa);
> +}
> +
> +struct sig_alg rsassa_pss_alg = {
> +	.verify		= rsassa_pss_verify,
> +	.set_pub_key	= rsassa_pss_set_pub_key,
> +	.key_size	= rsassa_pss_key_size,
> +	.init		= rsassa_pss_init_tfm,
> +	.exit		= rsassa_pss_exit_tfm,
> +	.base = {
> +		.cra_name	 = "rsassa-pss",
> +		.cra_driver_name = "rsassa-pss-generic",
> +		.cra_priority	 = 100,
> +		.cra_module	 = THIS_MODULE,
> +		.cra_ctxsize	 = sizeof(struct rsassa_pss_ctx),
> +	},
> +};
> +
> +MODULE_ALIAS_CRYPTO("rsassa-pss");
> diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
> index 071a1951b992..d7f38a273949 100644
> --- a/include/crypto/internal/rsa.h
> +++ b/include/crypto/internal/rsa.h
> @@ -83,4 +83,6 @@ static inline int rsa_set_key(struct crypto_akcipher *child,
>  
>  extern struct crypto_template rsa_pkcs1pad_tmpl;
>  extern struct crypto_template rsassa_pkcs1_tmpl;
> +extern struct sig_alg rsassa_pss_alg;
> +
>  #endif
> 

BR, Jarkko

