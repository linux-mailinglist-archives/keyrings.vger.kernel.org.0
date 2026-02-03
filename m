Return-Path: <keyrings+bounces-4013-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ/0LG1CgWl6FAMAu9opvQ
	(envelope-from <keyrings+bounces-4013-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:33:49 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A4D3055
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F9EA3012EB3
	for <lists+keyrings@lfdr.de>; Tue,  3 Feb 2026 00:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24601DD889;
	Tue,  3 Feb 2026 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyimsMcl"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2428834;
	Tue,  3 Feb 2026 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078624; cv=none; b=ova+WZkqltSrIxeMxRz2OWTf6VS8JchHjO8gAHD5qzd9qK6tKkfHQZutOUXt6/Nbiivg5k4WI92Jvp9ixpSpiMVo5ptFJvyr6x6sa+ZpINHiw1Acb2+iydlY5nl3SWQY1ic5SEMDGGQv0msMdt6UemwLNrAjn64EUGm4aAukTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078624; c=relaxed/simple;
	bh=lZEOo8Ix7bSl5UQ1oFNEPtRE4WE9yKwH/dhFlf9CBE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foWQVi9kLng8IxrRX9hPKzugutB5uui+2Lwcd7zoDIO12I8DwVXwp8JJHlwMlD0CmQF67GGqRlvnaJ5fMsh+zCcItqWTumTrjB8t3e7BAMeryjNRCNcUAoPJdlwAfVidHu+/3k3DINe/elrwSlTJLhepDqg7VJwEt54MuxCVzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyimsMcl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93470C116C6;
	Tue,  3 Feb 2026 00:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078624;
	bh=lZEOo8Ix7bSl5UQ1oFNEPtRE4WE9yKwH/dhFlf9CBE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyimsMcl7ZLLOMn5r2bwpfcQ58OrvErDCbKjsHG/BE2ZZRUtfs2FmwuWUwgt6wB9S
	 YFzLL6fyGq728pDEtwY7GPWcO2H+6nJQhXCWojDLCbRLO73JaEOLuU79WnnmOXyFwN
	 ndFa6PxGqeb/67HAE9uYMFJuDUVOZu1DCl/n6i5WeHTQFPa5SgqiGNicqqLfR0BpyJ
	 0wZqh8TrRxpA3DRmevtwpIUYJ+aernfuIcP/3ZlN0tk/rg1FtNQmzDR+oI/Sb1wChL
	 /g4ooFAIeLXBjnI4E/Q2hiJ5FdYg2Q73DEPbFYIHy8VaRBcszZTX3iiS/NnKPclkXe
	 25Hap/FsZVudA==
Date: Tue, 3 Feb 2026 02:30:19 +0200
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
Subject: Re: [PATCH v16 5/7] pkcs7, x509: Add ML-DSA support
Message-ID: <aYFBm-BUhrY2IyZ5@kernel.org>
References: <20260202170216.2467036-1-dhowells@redhat.com>
 <20260202170216.2467036-6-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202170216.2467036-6-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4013-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,wunner.de:email,cloudflare.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chronox.de:email]
X-Rspamd-Queue-Id: 144A4D3055
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:02:10PM +0000, David Howells wrote:
> Add support for ML-DSA keys and signatures to the CMS/PKCS#7 and X.509
> implementations.  ML-DSA-44, -65 and -87 are all supported.  For X.509
> certificates, the TBSCertificate is required to be signed directly; for
> CMS, direct signing of the data is preferred, though use of SHA512 (and
> only that) as an intermediate hash of the content is permitted with
> signedAttrs.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/asymmetric_keys/pkcs7_parser.c     | 24 +++++++++++++++++++-
>  crypto/asymmetric_keys/public_key.c       | 10 +++++++++
>  crypto/asymmetric_keys/x509_cert_parser.c | 27 ++++++++++++++++++++++-
>  include/linux/oid_registry.h              |  5 +++++
>  4 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 3cdbab3b9f50..594a8f1d9dfb 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -95,11 +95,18 @@ static int pkcs7_check_authattrs(struct pkcs7_message *msg)
>  	if (sinfo->authattrs) {
>  		want = true;
>  		msg->have_authattrs = true;
> +	} else if (sinfo->sig->algo_takes_data) {
> +		sinfo->sig->hash_algo = "none";
>  	}
>  
> -	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next)
> +	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next) {
>  		if (!!sinfo->authattrs != want)
>  			goto inconsistent;
> +
> +		if (!sinfo->authattrs &&
> +		    sinfo->sig->algo_takes_data)
> +			sinfo->sig->hash_algo = "none";
> +	}
>  	return 0;
>  
>  inconsistent:
> @@ -297,6 +304,21 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>  		ctx->sinfo->sig->pkey_algo = "ecrdsa";
>  		ctx->sinfo->sig->encoding = "raw";
>  		break;
> +	case OID_id_ml_dsa_44:
> +		ctx->sinfo->sig->pkey_algo = "mldsa44";
> +		ctx->sinfo->sig->encoding = "raw";
> +		ctx->sinfo->sig->algo_takes_data = true;
> +		break;
> +	case OID_id_ml_dsa_65:
> +		ctx->sinfo->sig->pkey_algo = "mldsa65";
> +		ctx->sinfo->sig->encoding = "raw";
> +		ctx->sinfo->sig->algo_takes_data = true;
> +		break;
> +	case OID_id_ml_dsa_87:
> +		ctx->sinfo->sig->pkey_algo = "mldsa87";
> +		ctx->sinfo->sig->encoding = "raw";
> +		ctx->sinfo->sig->algo_takes_data = true;
> +		break;
>  	default:
>  		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>  		return -ENOPKG;
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index a46356e0c08b..09a0b83d5d77 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -142,6 +142,16 @@ software_key_determine_akcipher(const struct public_key *pkey,
>  		if (strcmp(hash_algo, "streebog256") != 0 &&
>  		    strcmp(hash_algo, "streebog512") != 0)
>  			return -EINVAL;
> +	} else if (strcmp(pkey->pkey_algo, "mldsa44") == 0 ||
> +		   strcmp(pkey->pkey_algo, "mldsa65") == 0 ||
> +		   strcmp(pkey->pkey_algo, "mldsa87") == 0) {
> +		if (strcmp(encoding, "raw") != 0)
> +			return -EINVAL;
> +		if (!hash_algo)
> +			return -EINVAL;
> +		if (strcmp(hash_algo, "none") != 0 &&
> +		    strcmp(hash_algo, "sha512") != 0)
> +			return -EINVAL;
>  	} else {
>  		/* Unknown public key algorithm */
>  		return -ENOPKG;
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index b37cae914987..2fe094f5caf3 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -257,6 +257,15 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
>  	case OID_gost2012Signature512:
>  		ctx->cert->sig->hash_algo = "streebog512";
>  		goto ecrdsa;
> +	case OID_id_ml_dsa_44:
> +		ctx->cert->sig->pkey_algo = "mldsa44";
> +		goto ml_dsa;
> +	case OID_id_ml_dsa_65:
> +		ctx->cert->sig->pkey_algo = "mldsa65";
> +		goto ml_dsa;
> +	case OID_id_ml_dsa_87:
> +		ctx->cert->sig->pkey_algo = "mldsa87";
> +		goto ml_dsa;
>  	}
>  
>  rsa_pkcs1:
> @@ -274,6 +283,12 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
>  	ctx->cert->sig->encoding = "x962";
>  	ctx->sig_algo = ctx->last_oid;
>  	return 0;
> +ml_dsa:
> +	ctx->cert->sig->algo_takes_data = true;
> +	ctx->cert->sig->hash_algo = "none";
> +	ctx->cert->sig->encoding = "raw";
> +	ctx->sig_algo = ctx->last_oid;
> +	return 0;
>  }
>  
>  /*
> @@ -300,7 +315,8 @@ int x509_note_signature(void *context, size_t hdrlen,
>  
>  	if (strcmp(ctx->cert->sig->pkey_algo, "rsa") == 0 ||
>  	    strcmp(ctx->cert->sig->pkey_algo, "ecrdsa") == 0 ||
> -	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0) {
> +	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0 ||
> +	    strncmp(ctx->cert->sig->pkey_algo, "mldsa", 5) == 0) {
>  		/* Discard the BIT STRING metadata */
>  		if (vlen < 1 || *(const u8 *)value != 0)
>  			return -EBADMSG;
> @@ -524,6 +540,15 @@ int x509_extract_key_data(void *context, size_t hdrlen,
>  			return -ENOPKG;
>  		}
>  		break;
> +	case OID_id_ml_dsa_44:
> +		ctx->cert->pub->pkey_algo = "mldsa44";
> +		break;
> +	case OID_id_ml_dsa_65:
> +		ctx->cert->pub->pkey_algo = "mldsa65";
> +		break;
> +	case OID_id_ml_dsa_87:
> +		ctx->cert->pub->pkey_algo = "mldsa87";
> +		break;
>  	default:
>  		return -ENOPKG;
>  	}
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 6de479ebbe5d..ebce402854de 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -145,6 +145,11 @@ enum OID {
>  	OID_id_rsassa_pkcs1_v1_5_with_sha3_384, /* 2.16.840.1.101.3.4.3.15 */
>  	OID_id_rsassa_pkcs1_v1_5_with_sha3_512, /* 2.16.840.1.101.3.4.3.16 */
>  
> +	/* NIST FIPS-204 ML-DSA */
> +	OID_id_ml_dsa_44,			/* 2.16.840.1.101.3.4.3.17 */
> +	OID_id_ml_dsa_65,			/* 2.16.840.1.101.3.4.3.18 */
> +	OID_id_ml_dsa_87,			/* 2.16.840.1.101.3.4.3.19 */
> +
>  	OID__NR
>  };
>  
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

