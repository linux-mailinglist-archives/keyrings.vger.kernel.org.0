Return-Path: <keyrings+bounces-3921-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJLmBuErdmkVMwEAu9opvQ
	(envelope-from <keyrings+bounces-3921-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:42:41 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9F8109B
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 865D53004F5B
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 14:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB6E3233F4;
	Sun, 25 Jan 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIB6OaDd"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE361A4F3C;
	Sun, 25 Jan 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352129; cv=none; b=TeM10xYNwHfssdzJX8GHNCTMroqp3VQ5mr+hJw8P1YFWhGHLgKNFE+xziY6MpBwvZwd0rgS/UMBJmAAD6Nh8RxofAMs8rRHpRmCWdD84+ueZLfXFBX2gYLhT/3s7grE/kHrG3yyIHZDwMQKenQT7pCH0vVe6hojriU4OeYY5b6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352129; c=relaxed/simple;
	bh=EgLp+TJrK/wL/mk3vJpIQqiATVBQVFj3Tafcpgb8tTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k93yH1ac8rSWYK8npNRGywP93mIjdFHI+cUoUjOYcI1IZq4lWtXQuR7DDoSjOOBDyk18GWJTIQPlH+doGABDnGf6z1B9cMQhy4zIHkIaC7FWgy2nOj9vG0M48ZKcvHW7A/igOo8fFda0uvOxrL4EUxEUq3VA6qGIy68tc2EVXxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIB6OaDd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB42AC4CEF1;
	Sun, 25 Jan 2026 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769352128;
	bh=EgLp+TJrK/wL/mk3vJpIQqiATVBQVFj3Tafcpgb8tTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIB6OaDdC1h3eSU3eVep5sGKDo370vl3VmCScObnEv+dXdp58mP+EWb9GDVoBp7Ql
	 pFjKctZFs95VCRabG347pq8COmdbybhKFJDo1W5dfB3wywjuavVG8E12GbYVly5I3p
	 dIIpwK3HUp+n9BDoun/AojEQceeJvOYl20FmdrzOGXmdjzLEEsnHA9dIdR4OZxksVA
	 /8w/BEQRjJU79LIwosQFgLiCka6IUSlVTwGF/VePuDs7INm6LCEmoSAIQxE02ZerUo
	 afkAXp/yGsnZV6KhUm+HXgD87bAxeoDVBfwDF2DuUxVzUitmasdldNpcKIJgIXIwN8
	 t7R5HWdgGP1BQ==
Date: Sun, 25 Jan 2026 16:42:04 +0200
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
Subject: Re: [PATCH v14 4/5] pkcs7, x509: Add ML-DSA support
Message-ID: <aXYrvMpaQ2rHmFrw@kernel.org>
References: <20260121223609.1650735-1-dhowells@redhat.com>
 <20260121223609.1650735-5-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223609.1650735-5-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3921-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wunner.de:email,chronox.de:email,apana.org.au:email,cloudflare.com:email]
X-Rspamd-Queue-Id: 70B9F8109B
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:36:06PM +0000, David Howells wrote:
> Add support for ML-DSA keys and signatures to the CMS/PKCS#7 and X.509
> implementations.  ML-DSA-44, -65 and -87 are all supported.  For X.509
> certificates, the TBSCertificate is required to be signed directly; for CMS,
> direct signing of the data is preferred, though use of SHA512 (and only that)
> as an intermediate hash of the content is permitted with signedAttrs.
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

Why don't we have a constant for "none"?

$ git grep "\"none\"" security/
security/apparmor/audit.c:      "none",
security/apparmor/lib.c:        { "none", DEBUG_NONE },
security/security.c:    [LOCKDOWN_NONE] = "none",

$ git grep "\"none\"" crypto
crypto/asymmetric_keys/public_key.c:                                    hash_algo = "none";
crypto/asymmetric_keys/public_key.c:                            hash_algo = "none";
crypto/testmgr.h: * PKCS#1 RSA test vectors for hash algorithm "none"

IMHO, this a bad practice.


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

BR, Jarkko

