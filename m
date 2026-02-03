Return-Path: <keyrings+bounces-4012-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBc6G+JBgWl6FAMAu9opvQ
	(envelope-from <keyrings+bounces-4012-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:31:30 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8035D2FF2
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C7C2303F7CA
	for <lists+keyrings@lfdr.de>; Tue,  3 Feb 2026 00:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1512F1AA1D2;
	Tue,  3 Feb 2026 00:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htyzosSb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B2946C;
	Tue,  3 Feb 2026 00:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078578; cv=none; b=YVHEvRVT6htx/EkrxQu6dMGucnk06r7OzdXVwRDig8p1UNzxrai0uEoICXOEsJ2woBMrHYbuA4sbKK153VHXAlqC3GvfIrEPEkPHoUU1Ar/8B8AQS+pjBBkpzw81uCeGQS/RKSG6PTqxWysf2c5OqKK+j1UH3h79AEyMeudiTWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078578; c=relaxed/simple;
	bh=2Gg2lcoEzqYgKvmR2XIYGE4t6ifR5oJlytJ3TxR8NaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOYbpyphOy+R+J4m7ToGa6hA0XMDz57zQalHZvtdrqyLaVt4ezw+ucaVhvV1VEZ/twtkgj6naOj4MYzE/88WAnUZVdg94TRIqfbOGw9d9bmy7fOxC9TLbCB4619NbqbWQaLEWdN1ll/+uidnk+n/F16mlna1I5KoegrSh0L5F4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htyzosSb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB002C19421;
	Tue,  3 Feb 2026 00:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078577;
	bh=2Gg2lcoEzqYgKvmR2XIYGE4t6ifR5oJlytJ3TxR8NaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htyzosSbxZNjGbxuX++vfNLmYmZ9t3YDNLPK2La3M6ebGhiiCqFJ2gzLo83q541JN
	 s7o4Ypr69OSXNlslRaT7P5LK8H96SIUiOOl+LNjoVIlsWSQivLRhKhcvk9MlI6NiT3
	 QjkT8h/lpq11P23SzDoCCcw7iq1NJwU9xSuvCAUrlckjtFs+hSqfvnS12NWxIGhDUZ
	 3KOoZfQErxHvWwlYOobYPGfUGzkSYQGb4iHOJjO/gUpkd9Eql+ru3b+7QKCD9pa4m2
	 BLTW9wWOlgHDTH0o738O9UkdZprlILGogXStH5ewaa6Y8A1wzgPObSdYh8w23aoxE/
	 bNPfHRkzlUt7Q==
Date: Tue, 3 Feb 2026 02:29:32 +0200
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
Subject: Re: [PATCH v16 4/7] pkcs7: Allow the signing algo to do whatever
 digestion it wants itself
Message-ID: <aYFBbGmMTszT3ZRb@kernel.org>
References: <20260202170216.2467036-1-dhowells@redhat.com>
 <20260202170216.2467036-5-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202170216.2467036-5-dhowells@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-4012-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,wunner.de:email,chronox.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cloudflare.com:email]
X-Rspamd-Queue-Id: B8035D2FF2
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:02:09PM +0000, David Howells wrote:
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
>  (1) Make ->m and ->m_size point to the data to be verified rather than
>      making public_key_verify_signature() access the data directly.  This
>      is so that keyctl(KEYCTL_PKEY_VERIFY) will still work.
> 
>  (2) Add a flag, ->algo_takes_data, to indicate that the verification
>      algorithm wants to access the data to be verified directly rather than
>      having it digested first.
> 
>  (3) If the PKCS#7 message has authenticatedAttributes (or CMS
>      signedAttrs), then the digest contained therein will be validated as
>      now, and the modified attrs blob will either be digested or assigned
>      to ->m as appropriate.
> 
>  (4) If present, always copy and modify the authenticatedAttributes (or
>      signedAttrs) then digest that in one go rather than calling the shash
>      update twice (once for the tag and once for the rest).
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
>  crypto/asymmetric_keys/pkcs7_parser.c    |  4 +-
>  crypto/asymmetric_keys/pkcs7_verify.c    | 52 ++++++++++++++++--------
>  crypto/asymmetric_keys/signature.c       |  3 +-
>  crypto/asymmetric_keys/x509_public_key.c | 10 +++++
>  include/crypto/public_key.h              |  2 +
>  5 files changed, 51 insertions(+), 20 deletions(-)
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
> index aa085ec6fb1c..06abb9838f95 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -30,6 +30,16 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
>  	if (sig->m)
>  		return 0;
> @@ -48,9 +58,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  	sig->m_size = crypto_shash_digestsize(tfm);
>  
>  	ret = -ENOMEM;
> -	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
> +	sig->m = kmalloc(umax(sinfo->authattrs_len, sig->m_size), GFP_KERNEL);
>  	if (!sig->m)
>  		goto error_no_desc;
> +	sig->m_free = true;
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
>  	if (!desc)
> @@ -69,8 +80,6 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  	 * digest we just calculated.
>  	 */
>  	if (sinfo->authattrs) {
> -		u8 tag;
> -
>  		if (!sinfo->msgdigest) {
>  			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
>  			ret = -EKEYREJECTED;
> @@ -96,21 +105,25 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  		 * as the contents of the digest instead.  Note that we need to
>  		 * convert the attributes from a CONT.0 into a SET before we
>  		 * hash it.
> +		 *
> +		 * However, for certain algorithms, such as ML-DSA, the digest
> +		 * is integrated into the signing algorithm.  In such a case,
> +		 * we copy the authattrs, modifying the tag type, and set that
> +		 * as the digest.
>  		 */
> -		memset(sig->m, 0, sig->m_size);
> -
> -
> -		ret = crypto_shash_init(desc);
> -		if (ret < 0)
> -			goto error;
> -		tag = ASN1_CONS_BIT | ASN1_SET;
> -		ret = crypto_shash_update(desc, &tag, 1);
> -		if (ret < 0)
> -			goto error;
> -		ret = crypto_shash_finup(desc, sinfo->authattrs,
> -					 sinfo->authattrs_len, sig->m);
> -		if (ret < 0)
> -			goto error;
> +		memcpy(sig->m, sinfo->authattrs, sinfo->authattrs_len);
> +		sig->m[0] = ASN1_CONS_BIT | ASN1_SET;
> +
> +		if (sig->algo_takes_data) {
> +			sig->m_size = sinfo->authattrs_len;
> +			ret = 0;
> +		} else {
> +			ret = crypto_shash_digest(desc, sig->m,
> +						  sinfo->authattrs_len,
> +						  sig->m);
> +			if (ret < 0)
> +				goto error;
> +		}
>  		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
>  	}
>  
> @@ -137,6 +150,11 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
>  	ret = pkcs7_digest(pkcs7, sinfo);
>  	if (ret)
>  		return ret;
> +	if (!sinfo->sig->m_free) {
> +		pr_notice_once("%s: No digest available\n", __func__);
> +		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
> +				 * intermediate digest. */

Is this logic going to change in the foreseeable future?

> +	}
>  
>  	*buf = sinfo->sig->m;
>  	*len = sinfo->sig->m_size;
> diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
> index f4ec126121b3..a5ac7a53b670 100644
> --- a/crypto/asymmetric_keys/signature.c
> +++ b/crypto/asymmetric_keys/signature.c
> @@ -28,7 +28,8 @@ void public_key_signature_free(struct public_key_signature *sig)
>  		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
>  			kfree(sig->auth_ids[i]);
>  		kfree(sig->s);
> -		kfree(sig->m);
> +		if (sig->m_free)
> +			kfree(sig->m);
>  		kfree(sig);
>  	}
>  }
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index 3854f7ae4ed0..27b4fea37845 100644
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
> @@ -69,6 +77,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
>  	if (!sig->m)
>  		goto error;
> +	sig->m_free = true;
>  
>  	desc = kzalloc(desc_size, GFP_KERNEL);
>  	if (!desc)
> @@ -84,6 +93,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	kfree(desc);
>  error:
>  	crypto_free_shash(tfm);
> +out:
>  	pr_devel("<==%s() = %d\n", __func__, ret);
>  	return ret;
>  }
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index bd38ba4d217d..4c5199b20338 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -46,6 +46,8 @@ struct public_key_signature {
>  	u8 *m;			/* Message data to pass to verifier */
>  	u32 s_size;		/* Number of bytes in signature */
>  	u32 m_size;		/* Number of bytes in ->m */
> +	bool m_free;		/* T if ->m needs freeing */
> +	bool algo_takes_data;	/* T if public key algo operates on data, not a hash */
>  	const char *pkey_algo;
>  	const char *hash_algo;
>  	const char *encoding;
> 

BR, Jarkko

