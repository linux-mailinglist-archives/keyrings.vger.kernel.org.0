Return-Path: <keyrings+bounces-3920-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJXsNA0rdmkVMwEAu9opvQ
	(envelope-from <keyrings+bounces-3920-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:39:09 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115681047
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85BE830011A9
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951F03233ED;
	Sun, 25 Jan 2026 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1M1baXz"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED68318BB6;
	Sun, 25 Jan 2026 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351940; cv=none; b=hChZBtMrLJd+KJ/jDVZ+XFyZJTwkSQK1n0j7HB4kyHccD4Rt6bUCCizo7kUUdGIoqjpccebvAw+7IK5On8lu0Bq+MxQ7+2QCZUUDgSaCZAhg3XZq5+tYsm/IO5u0YYJTumdsYWQuBOJQe3OYeRj0dNHzP1suOaaBL/2UOOGRqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351940; c=relaxed/simple;
	bh=5pD8pKRykaQOR3gyddRCZrDAr6WH3sOErBGusc9nr3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr/EZozKeBo2Maei9OqhsIKmkWjwnFs4gVFoxbBBFInioAYXYI7iLOhVTEmDAAqtNhJY8jRLGGvYzKMb/6BhzK+SbMtjuravcG1K4DyAU4Wp0vhNJRGj+7UQ3iDLI5KmnNZvbpWbPU2zvufZEklyVWOyJX8Ir0UyI7++GF02Ukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1M1baXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B783EC19421;
	Sun, 25 Jan 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769351940;
	bh=5pD8pKRykaQOR3gyddRCZrDAr6WH3sOErBGusc9nr3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1M1baXzmGDlEjRLX2wxa8V4m2KR4E41SuFhR172ITppNmoIE/5mPM6eEJm2m836B
	 +7YYDmR+NXUkVN34/nDdszFQcFPR/AZSeQRJw4hHLKilm3XeSan6mClzcCkBHoNIuG
	 ETFbdC2qDgbvuHVe3tUMf7eDDJF0T8x//5gG5n05U2k5qknHMu9uQOG1WGomAfFjld
	 IDNKN8nepgOvlzGC6CY+1DwV+muZBkRzEdd3iBww46kXCXpn349MliA6ZHnrSdlhnY
	 0piB4nv3ah1DxkEjWTJbk2JaKU2cwAOJxKWwQAWECyv2lNUp09yvfSd2o79jjP/fMH
	 nTUQU2Zxj2T5A==
Date: Sun, 25 Jan 2026 16:38:55 +0200
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
Subject: Re: [PATCH v14 3/5] pkcs7: Allow the signing algo to do whatever
 digestion it wants itself
Message-ID: <aXYq_9XoOx5WaoU9@kernel.org>
References: <20260121223609.1650735-1-dhowells@redhat.com>
 <20260121223609.1650735-4-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223609.1650735-4-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3920-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,apana.org.au:email,cloudflare.com:email,wunner.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0115681047
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:36:05PM +0000, David Howells wrote:
> Allow the data to be verified in a PKCS#7 or CMS message to be passed
> directly to an asymmetric cipher algorithm (e.g. ML-DSA) if it wants to do
> whatever passes for hashing/digestion itself.  The normal digestion of the
> data is then skipped as that would be ignored unless another signed info in
> the message has some other algorithm that needs it.
> 
> The 'data to be verified' may be the content of the PKCS#7 message or it
> will be the authenticatedAttributes (signedAttrs if CMS), modified, if
> those are present.
> 
> This is done by:
> 
>  (1) Rename ->digest and ->digest_len to ->m and ->m_size to represent the
>      input to the signature verification algorithm, reflecting that
>      ->digest may no longer actually *be* a digest.
> 
>  (2) Make ->m and ->m_size point to the data to be verified rather than
>      making public_key_verify_signature() access the data directly.  This
>      is so that keyctl(KEYCTL_PKEY_VERIFY) will still work.

These renames emit enough noise to be split into a separate patch.

> 
>  (3) Add a flag, ->algo_takes_data, to indicate that the verification
>      algorithm wants to access the data to be verified directly rather than
>      having it digested first.
> 
>  (4) If the PKCS#7 message has authenticatedAttributes (or CMS signedAtts),
>      then the digest contained therein will be validated as now, and the
>      modified attrs blob will either be digested or assigned to ->m as
>      appropriate.
> 
>  (5) For ML-DSA, point ->m to the TBSCertificate instead of digesting it
>      and using the digest.
> 
> Note that whilst ML-DSA does allow for an "external mu", CMS doesn't yet
> have that standardised.
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
>  crypto/asymmetric_keys/asymmetric_type.c |  4 +-
>  crypto/asymmetric_keys/pkcs7_parser.c    |  4 +-
>  crypto/asymmetric_keys/pkcs7_verify.c    | 79 ++++++++++++++++--------
>  crypto/asymmetric_keys/public_key.c      |  3 +-
>  crypto/asymmetric_keys/signature.c       |  3 +-
>  crypto/asymmetric_keys/x509_public_key.c | 19 ++++--
>  include/crypto/public_key.h              |  6 +-
>  security/integrity/digsig_asymmetric.c   |  4 +-
>  8 files changed, 79 insertions(+), 43 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index 348966ea2175..2326743310b1 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -593,10 +593,10 @@ static int asymmetric_key_verify_signature(struct kernel_pkey_params *params,
>  {
>  	struct public_key_signature sig = {
>  		.s_size		= params->in2_len,
> -		.digest_size	= params->in_len,
> +		.m_size		= params->in_len,
>  		.encoding	= params->encoding,
>  		.hash_algo	= params->hash_algo,
> -		.digest		= (void *)in,
> +		.m		= (void *)in,
>  		.s		= (void *)in2,
>  	};
>  
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 423d13c47545..3cdbab3b9f50 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -599,8 +599,8 @@ int pkcs7_sig_note_set_of_authattrs(void *context, size_t hdrlen,
>  	}
>  
>  	/* We need to switch the 'CONT 0' to a 'SET OF' when we digest */
> -	sinfo->authattrs = value - (hdrlen - 1);
> -	sinfo->authattrs_len = vlen + (hdrlen - 1);
> +	sinfo->authattrs = value - hdrlen;
> +	sinfo->authattrs_len = vlen + hdrlen;
>  	return 0;
>  }
>  
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index 6d6475e3a9bf..a5b2ed4d53fd 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -30,8 +30,18 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  
>  	kenter(",%u,%s", sinfo->index, sinfo->sig->hash_algo);
>  
> +	if (!sinfo->authattrs && sig->algo_takes_data) {
> +		/* There's no intermediate digest and the signature algo
> +		 * doesn't want the data prehashing.
> +		 */
> +		sig->m = (void *)pkcs7->data;
> +		sig->m_size = pkcs7->data_len;
> +		sig->m_free = false;
> +		return 0;
> +	}
> +
>  	/* The digest was calculated already. */
> -	if (sig->digest)
> +	if (sig->m)
>  		return 0;
>  
>  	if (!sinfo->sig->hash_algo)
> @@ -45,12 +55,13 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
>  
>  	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
> -	sig->digest_size = crypto_shash_digestsize(tfm);
> +	sig->m_size = crypto_shash_digestsize(tfm);
>  
>  	ret = -ENOMEM;
> -	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
> -	if (!sig->digest)
> +	sig->m = kmalloc(umax(sinfo->authattrs_len, sig->m_size), GFP_KERNEL);
> +	if (!sig->m)
>  		goto error_no_desc;
> +	sig->m_free = true;
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
>  	if (!desc)
> @@ -59,33 +70,30 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  	desc->tfm   = tfm;
>  
>  	/* Digest the message [RFC2315 9.3] */
> -	ret = crypto_shash_digest(desc, pkcs7->data, pkcs7->data_len,
> -				  sig->digest);
> +	ret = crypto_shash_digest(desc, pkcs7->data, pkcs7->data_len, sig->m);
>  	if (ret < 0)
>  		goto error;
> -	pr_devel("MsgDigest = [%*ph]\n", 8, sig->digest);
> +	pr_devel("MsgDigest = [%*ph]\n", 8, sig->m);
>  
>  	/* However, if there are authenticated attributes, there must be a
>  	 * message digest attribute amongst them which corresponds to the
>  	 * digest we just calculated.
>  	 */
>  	if (sinfo->authattrs) {
> -		u8 tag;
> -
>  		if (!sinfo->msgdigest) {
>  			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
>  			ret = -EKEYREJECTED;
>  			goto error;
>  		}
>  
> -		if (sinfo->msgdigest_len != sig->digest_size) {
> +		if (sinfo->msgdigest_len != sig->m_size) {
>  			pr_warn("Sig %u: Invalid digest size (%u)\n",
>  				sinfo->index, sinfo->msgdigest_len);
>  			ret = -EBADMSG;
>  			goto error;
>  		}
>  
> -		if (memcmp(sig->digest, sinfo->msgdigest,
> +		if (memcmp(sig->m, sinfo->msgdigest,
>  			   sinfo->msgdigest_len) != 0) {
>  			pr_warn("Sig %u: Message digest doesn't match\n",
>  				sinfo->index);
> @@ -97,21 +105,33 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		 * as the contents of the digest instead.  Note that we need to
>  		 * convert the attributes from a CONT.0 into a SET before we
>  		 * hash it.
> +		 *
> +		 * However, for certain algorithms, such as ML-DSA, the digest
> +		 * is integrated into the signing algorithm.  In such a case,
> +		 * we copy the authattrs, modifying the tag type, and set that
> +		 * as the digest.
>  		 */
> -		memset(sig->digest, 0, sig->digest_size);
> -
> -		ret = crypto_shash_init(desc);
> -		if (ret < 0)
> -			goto error;
> -		tag = ASN1_CONS_BIT | ASN1_SET;
> -		ret = crypto_shash_update(desc, &tag, 1);
> -		if (ret < 0)
> -			goto error;
> -		ret = crypto_shash_finup(desc, sinfo->authattrs,
> -					 sinfo->authattrs_len, sig->digest);
> -		if (ret < 0)
> -			goto error;
> -		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
> +		if (sig->algo_takes_data) {
> +			sig->m_size = sinfo->authattrs_len;
> +			memcpy(sig->m, sinfo->authattrs, sinfo->authattrs_len);
> +			sig->m[0] = ASN1_CONS_BIT | ASN1_SET;
> +			ret = 0;
> +		} else {
> +			u8 tag = ASN1_CONS_BIT | ASN1_SET;
> +
> +			ret = crypto_shash_init(desc);
> +			if (ret < 0)
> +				goto error;
> +			ret = crypto_shash_update(desc, &tag, 1);
> +			if (ret < 0)
> +				goto error;
> +			ret = crypto_shash_finup(desc, sinfo->authattrs + 1,
> +						 sinfo->authattrs_len - 1,
> +						 sig->m);
> +			if (ret < 0)
> +				goto error;
> +		}
> +		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
>  	}
>  
>  error:
> @@ -137,9 +157,14 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
>  	ret = pkcs7_digest(pkcs7, sinfo);
>  	if (ret)
>  		return ret;
> +	if (!sinfo->sig->m_free) {
> +		pr_notice_once("%s: No digest available\n", __func__);
> +		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
> +				 * intermediate digest. */
> +	}
>  
> -	*buf = sinfo->sig->digest;
> -	*len = sinfo->sig->digest_size;
> +	*buf = sinfo->sig->m;
> +	*len = sinfo->sig->m_size;
>  
>  	i = match_string(hash_algo_name, HASH_ALGO__LAST,
>  			 sinfo->sig->hash_algo);
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index e5b177c8e842..a46356e0c08b 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -425,8 +425,7 @@ int public_key_verify_signature(const struct public_key *pkey,
>  	if (ret)
>  		goto error_free_key;
>  
> -	ret = crypto_sig_verify(tfm, sig->s, sig->s_size,
> -				sig->digest, sig->digest_size);
> +	ret = crypto_sig_verify(tfm, sig->s, sig->s_size, sig->m, sig->m_size);
>  
>  error_free_key:
>  	kfree_sensitive(key);
> diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
> index 041d04b5c953..a5ac7a53b670 100644
> --- a/crypto/asymmetric_keys/signature.c
> +++ b/crypto/asymmetric_keys/signature.c
> @@ -28,7 +28,8 @@ void public_key_signature_free(struct public_key_signature *sig)
>  		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
>  			kfree(sig->auth_ids[i]);
>  		kfree(sig->s);
> -		kfree(sig->digest);
> +		if (sig->m_free)
> +			kfree(sig->m);
>  		kfree(sig);
>  	}
>  }
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index 6d002e3b20c5..27b4fea37845 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -50,6 +50,14 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	sig->s_size = cert->raw_sig_size;
>  
> +	if (sig->algo_takes_data) {
> +		/* The signature algorithm does whatever passes for hashing. */
> +		sig->m = (u8 *)cert->tbs;
> +		sig->m_size = cert->tbs_size;
> +		sig->m_free = false;
> +		goto out;
> +	}
> +
>  	/* Allocate the hashing algorithm we're going to need and find out how
>  	 * big the hash operational data will be.
>  	 */
> @@ -63,12 +71,13 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	}
>  
>  	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
> -	sig->digest_size = crypto_shash_digestsize(tfm);
> +	sig->m_size = crypto_shash_digestsize(tfm);
>  
>  	ret = -ENOMEM;
> -	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
> -	if (!sig->digest)
> +	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
> +	if (!sig->m)
>  		goto error;
> +	sig->m_free = true;
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
>  	if (!desc)
> @@ -76,8 +85,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	desc->tfm = tfm;
>  
> -	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
> -				  sig->digest);
> +	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size, sig->m);
>  	if (ret < 0)
>  		goto error_2;
>  
> @@ -85,6 +93,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	kfree(desc);
>  error:
>  	crypto_free_shash(tfm);
> +out:
>  	pr_devel("<==%s() = %d\n", __func__, ret);
>  	return ret;
>  }
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 81098e00c08f..4c5199b20338 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -43,9 +43,11 @@ extern void public_key_free(struct public_key *key);
>  struct public_key_signature {
>  	struct asymmetric_key_id *auth_ids[3];
>  	u8 *s;			/* Signature */
> -	u8 *digest;
> +	u8 *m;			/* Message data to pass to verifier */
>  	u32 s_size;		/* Number of bytes in signature */
> -	u32 digest_size;	/* Number of bytes in digest */
> +	u32 m_size;		/* Number of bytes in ->m */
> +	bool m_free;		/* T if ->m needs freeing */
> +	bool algo_takes_data;	/* T if public key algo operates on data, not a hash */
>  	const char *pkey_algo;
>  	const char *hash_algo;
>  	const char *encoding;
> diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
> index 457c0a396caf..87be85f477d1 100644
> --- a/security/integrity/digsig_asymmetric.c
> +++ b/security/integrity/digsig_asymmetric.c
> @@ -121,8 +121,8 @@ int asymmetric_verify(struct key *keyring, const char *sig,
>  		goto out;
>  	}
>  
> -	pks.digest = (u8 *)data;
> -	pks.digest_size = datalen;
> +	pks.m = (u8 *)data;
> +	pks.m_size = datalen;
>  	pks.s = hdr->sig;
>  	pks.s_size = siglen;
>  	ret = verify_signature(key, &pks);
> 

BR, Jarkko

