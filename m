Return-Path: <keyrings+bounces-3973-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAOtIq2Yemm58QEAu9opvQ
	(envelope-from <keyrings+bounces-3973-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 29 Jan 2026 00:15:57 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63EA9E02
	for <lists+keyrings@lfdr.de>; Thu, 29 Jan 2026 00:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4756130046A7
	for <lists+keyrings@lfdr.de>; Wed, 28 Jan 2026 23:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E21833F8B1;
	Wed, 28 Jan 2026 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6goQrMS"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A722335554;
	Wed, 28 Jan 2026 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642148; cv=none; b=mOi0WG+glvpEmcBvI/cQpbNh/ZHNth/1kcajZ2u2zG2ho7qQQIg72EiHbNe7YgWz/KMNJIIp7jLJVUnE4fH92t3QTSe9pEkiF9ZCs4GugMZMeoJnDpNVyVb6uGJdH/M1aOta3p/TT5IByEbqJ99rYR/n5XD8QerVV+wlsvBXr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642148; c=relaxed/simple;
	bh=/g5GQCRx9VQ1qpx5c23mUIMjE6qDTKlKhm2i5tJzEEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+fpcsTswn21XnBeuGsZUFpp8w+hUFyMJhOfneoFrHa/GP6EkOLgcXPCGOtNJ+gszasKJvpjP2Qxh02h/I/EkbnO0X845O3ZFalozsVb5uGcJDwqGC6IwHZYSEUiggaX0OBQfxOZ9aYJuLoXyLG95nq2V+yXq2Y542/sKLOmbkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6goQrMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FC4C4CEF1;
	Wed, 28 Jan 2026 23:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769642147;
	bh=/g5GQCRx9VQ1qpx5c23mUIMjE6qDTKlKhm2i5tJzEEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6goQrMSmWlTGBjF1g8gIXvwlczh4NG7n3FI0tec8IkWwjfTkqzDXSIsV20Q3lfhO
	 7fypmBfJbkor5lM7uCar6mNAQMxuOpx/fNM1HLtjyffrReJN/amEDJQ8pn7SOuRJLe
	 vE3SXwlZaBJaulwAlJ+2Mx2C+ooO5fheJ6XaJsW7UO6+frWJnQ3ICfO/hP3UTCXa+m
	 18gwCBmRvd4Bz8wP+rv8kFrgb+PzleKUqjHAzIgZ4CkG3GlCMjebdV5gfml8IwCKhl
	 xKKMT3QX0DjE/X457KCcw/+1aI+cdYYfzjoOV9rFZHo6Yk0OERKCUmPWntC/eeJYPj
	 ySuqBNfrcCcAQ==
Date: Thu, 29 Jan 2026 01:15:42 +0200
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
Subject: Re: [PATCH v15 3/7] pkcs7, x509: Rename ->digest to ->m
Message-ID: <aXqYnh92VWroe8AJ@kernel.org>
References: <20260126142931.1940586-1-dhowells@redhat.com>
 <20260126142931.1940586-4-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126142931.1940586-4-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3973-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,apana.org.au:email]
X-Rspamd-Queue-Id: AB63EA9E02
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 02:29:24PM +0000, David Howells wrote:
> Rename ->digest and ->digest_len to ->m and ->m_size to represent the input
> to the signature verification algorithm, reflecting that ->digest may no
> longer actually *be* a digest.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/asymmetric_keys/asymmetric_type.c |  4 ++--
>  crypto/asymmetric_keys/pkcs7_verify.c    | 28 ++++++++++++------------
>  crypto/asymmetric_keys/public_key.c      |  3 +--
>  crypto/asymmetric_keys/signature.c       |  2 +-
>  crypto/asymmetric_keys/x509_public_key.c | 10 ++++-----
>  include/crypto/public_key.h              |  4 ++--
>  security/integrity/digsig_asymmetric.c   |  4 ++--
>  7 files changed, 26 insertions(+), 29 deletions(-)
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
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index 6d6475e3a9bf..aa085ec6fb1c 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -31,7 +31,7 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  	kenter(",%u,%s", sinfo->index, sinfo->sig->hash_algo);
>  
>  	/* The digest was calculated already. */
> -	if (sig->digest)
> +	if (sig->m)
>  		return 0;
>  
>  	if (!sinfo->sig->hash_algo)
> @@ -45,11 +45,11 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
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
>  		goto error_no_desc;
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
> @@ -59,11 +59,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
> @@ -78,14 +77,14 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
> @@ -98,7 +97,8 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		 * convert the attributes from a CONT.0 into a SET before we
>  		 * hash it.
>  		 */
> -		memset(sig->digest, 0, sig->digest_size);
> +		memset(sig->m, 0, sig->m_size);
> +
>  
>  		ret = crypto_shash_init(desc);
>  		if (ret < 0)
> @@ -108,10 +108,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		if (ret < 0)
>  			goto error;
>  		ret = crypto_shash_finup(desc, sinfo->authattrs,
> -					 sinfo->authattrs_len, sig->digest);
> +					 sinfo->authattrs_len, sig->m);
>  		if (ret < 0)
>  			goto error;
> -		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
> +		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
>  	}
>  
>  error:
> @@ -138,8 +138,8 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
>  	if (ret)
>  		return ret;
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
> index 041d04b5c953..f4ec126121b3 100644
> --- a/crypto/asymmetric_keys/signature.c
> +++ b/crypto/asymmetric_keys/signature.c
> @@ -28,7 +28,7 @@ void public_key_signature_free(struct public_key_signature *sig)
>  		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
>  			kfree(sig->auth_ids[i]);
>  		kfree(sig->s);
> -		kfree(sig->digest);
> +		kfree(sig->m);
>  		kfree(sig);
>  	}
>  }
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index 79cc7b7a0630..3854f7ae4ed0 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -63,11 +63,11 @@ int x509_get_sig_params(struct x509_certificate *cert)
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
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
> @@ -76,9 +76,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	desc->tfm = tfm;
>  
> -	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
> -				  sig->digest);
> -
> +	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size, sig->m);
>  	if (ret < 0)
>  		goto error_2;
>  
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 81098e00c08f..bd38ba4d217d 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -43,9 +43,9 @@ extern void public_key_free(struct public_key *key);
>  struct public_key_signature {
>  	struct asymmetric_key_id *auth_ids[3];
>  	u8 *s;			/* Signature */
> -	u8 *digest;
> +	u8 *m;			/* Message data to pass to verifier */
>  	u32 s_size;		/* Number of bytes in signature */
> -	u32 digest_size;	/* Number of bytes in digest */
> +	u32 m_size;		/* Number of bytes in ->m */
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

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

