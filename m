Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD00C2F7430
	for <lists+keyrings@lfdr.de>; Fri, 15 Jan 2021 09:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbhAOIUE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 15 Jan 2021 03:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:55616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbhAOIUD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 15 Jan 2021 03:20:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 734B32220B;
        Fri, 15 Jan 2021 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610698761;
        bh=A9oZqwHyVb1s0FAAbyEQ2q5pl1kkazae5TJfWwODb7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BKyXxs9Zjvk879z6SwbTzzgeGRbS9SO7v26aHrrAVAeQdMClzxs5DiXvdFKD+nZFk
         AnBX97FbaS89/N/XxBp7OMhE371Mrfgt0u+rQQgqOdBgT66YYrFSX77RR8PfaOk+35
         mx+InCHcCytmKi0fwdz/mTVIXSBb2Npc48/yX/mOo5GSVJcrac5nuzenXk/9aOchvf
         DiSogEBwMkEHJfS5JhGib2vLsFbIvgnaFbhKUpAV5PWq2WdANXYeaSEvc++pWa0XTg
         l4UvAfC9W4BIdTN0kRoDCk5WCDbIFzRT5HaEYi0GKcykE2lxDGg+vw/hXDbcst9qUR
         PHPmNRqbifYrg==
Date:   Fri, 15 Jan 2021 10:19:17 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2] keys: X.509 public key issuer lookup without AKID
Message-ID: <YAFQBT/pKw4PDenV@kernel.org>
References: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114204035.2046219-1-andrew.zaborowski@intel.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Jan 14, 2021 at 09:40:35PM +0100, Andrew Zaborowski wrote:
> There are non-root X.509 v3 certificates in use there that contain no
> Authority Key Identifier extension (RFC5280 section 4.2.1.1).  The
> asymmetric key's issuer key IDs 1 and 2 for those certificates are
> generated from the AKID data so current code has no way to look up the
> issuer certificate for verification.  Add a third ID blob to the arrays
> in both asymmetric_key_ids (for certficate subject) and in the
> public_keys_signature's auth_ids (for issuer lookup), using just raw
> subject and issuer DNs from the certificate.  There's no other place
> this data is currently saved that could be used in find_asymmetric_key.
> Adapt asymmetric_key_ids() and the callers to use the third ID for
> lookups when none of the other two are available.  Attempt to keep the
> logic intact when they are, to minimise behaviour changes.  Adapt the
> restrict functions' NULL-checks to include that ID too.  The lookup
> logic in pkcs7_verify.c is not modified, the AKID extensions are still
> required there.
> 
> I believe this implements what (2) in the struct asymmetric_key_id
> comment (include/keys/asymmetric-type.h) talks about already, so that
> comment isn't modified.  It's also how "openssl verify" looks up issuer
> certificates without the AKID available.

Preferably no language in persons.

> Internally the search specifier string generated for the key lookup in
> find_asymmetric_key() uses a new prefix that tells
> asymmetric_key_match_preparse to only match the data against the raw
> Distinguished Name in the third ID and shouldn't conflict with search
> specifiers already in use.
> 
> Lookups are unambiguous only provided that the CAs respect the condition
> in RFC5280 4.2.1.1 that the AKID may only be omitted if the CA uses a
> single signing key.
> 
> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> ---
> v2:
>  - focus the commit message on the implementation
>  - shorten the prefix used in find_asymmetric_key
>  - clarify find_asymmetric_key comment
> 
>  crypto/asymmetric_keys/asymmetric_type.c  | 52 +++++++++++++++++------
>  crypto/asymmetric_keys/pkcs7_trust.c      |  6 +--
>  crypto/asymmetric_keys/restrict.c         | 48 ++++++++++++---------
>  crypto/asymmetric_keys/x509_cert_parser.c | 10 +++++
>  crypto/asymmetric_keys/x509_public_key.c  | 10 +++++
>  include/crypto/public_key.h               |  2 +-
>  include/keys/asymmetric-type.h            |  3 +-
>  7 files changed, 95 insertions(+), 36 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index 33e77d846ca..e411f2a7a84 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -36,8 +36,11 @@ static DECLARE_RWSEM(asymmetric_key_parsers_sem);
>   * find_asymmetric_key - Find a key by ID.
>   * @keyring: The keys to search.
>   * @id_0: The first ID to look for or NULL.
> - * @id_1: The second ID to look for or NULL.
> - * @partial: Use partial match if true, exact if false.
> + * @id_1: The second ID to look for or NULL, matched together with @id_0
> + * against @keyring keys' id[0] and id[1].
> + * @id_2: The fallback ID to match against @keyring keys' id[2] if both of the
> + * other IDs are NULL.
> + * @partial: Use partial match for @id_0 and @id_1 if true, exact if false.
>   *
>   * Find a key in the given keyring by identifier.  The preferred identifier is
>   * the id_0 and the fallback identifier is the id_1.  If both are given, the
> @@ -46,6 +49,7 @@ static DECLARE_RWSEM(asymmetric_key_parsers_sem);
>  struct key *find_asymmetric_key(struct key *keyring,
>  				const struct asymmetric_key_id *id_0,
>  				const struct asymmetric_key_id *id_1,
> +				const struct asymmetric_key_id *id_2,
>  				bool partial)
>  {
>  	struct key *key;
> @@ -54,14 +58,17 @@ struct key *find_asymmetric_key(struct key *keyring,
>  	char *req, *p;
>  	int len;
>  
> -	BUG_ON(!id_0 && !id_1);
> +	BUG_ON(!id_0 && !id_1 && !id_2);
>  
>  	if (id_0) {
>  		lookup = id_0->data;
>  		len = id_0->len;
> -	} else {
> +	} else if (id_1) {
>  		lookup = id_1->data;
>  		len = id_1->len;
> +	} else {
> +		lookup = id_2->data;
> +		len = id_2->len;
>  	}
>  
>  	/* Construct an identifier "id:<keyid>". */
> @@ -69,7 +76,10 @@ struct key *find_asymmetric_key(struct key *keyring,
>  	if (!req)
>  		return ERR_PTR(-ENOMEM);
>  
> -	if (partial) {
> +	if (!id_0 && !id_1) {
> +		*p++ = 'd';
> +		*p++ = 'n';
> +	} else if (partial) {
>  		*p++ = 'i';
>  		*p++ = 'd';
>  	} else {
> @@ -183,8 +193,8 @@ bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
>  EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
>  
>  /**
> - * asymmetric_match_key_ids - Search asymmetric key IDs
> - * @kids: The list of key IDs to check
> + * asymmetric_match_key_ids - Search asymmetric key IDs 1 & 2
> + * @kids: The pair of key IDs to check
>   * @match_id: The key ID we're looking for
>   * @match: The match function to use
>   */
> @@ -198,7 +208,7 @@ static bool asymmetric_match_key_ids(
>  
>  	if (!kids || !match_id)
>  		return false;
> -	for (i = 0; i < ARRAY_SIZE(kids->id); i++)
> +	for (i = 0; i < 2; i++)
>  		if (match(kids->id[i], match_id))
>  			return true;
>  	return false;

Why are key ID 2 and key ID 3 handled differently? They are both
optional.

> @@ -242,7 +252,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
>  }
>  
>  /*
> - * Match asymmetric keys by an exact match on an ID.
> + * Match asymmetric keys by an exact match on one of the first two IDs.
>   */
>  static bool asymmetric_key_cmp(const struct key *key,
>  			       const struct key_match_data *match_data)
> @@ -255,7 +265,7 @@ static bool asymmetric_key_cmp(const struct key *key,
>  }
>  
>  /*
> - * Match asymmetric keys by a partial match on an IDs.
> + * Match asymmetric keys by a partial match on one of the first two IDs.
>   */
>  static bool asymmetric_key_cmp_partial(const struct key *key,
>  				       const struct key_match_data *match_data)
> @@ -267,6 +277,18 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
>  					asymmetric_key_id_partial);
>  }
>  
> +/*
> + * Match asymmetric keys by an exact match on the third IDs.
> + */
> +static bool asymmetric_key_cmp_name(const struct key *key,
> +				    const struct key_match_data *match_data)
> +{
> +	const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
> +	const struct asymmetric_key_id *match_id = match_data->preparsed;
> +
> +	return kids && asymmetric_key_id_same(kids->id[2], match_id);
> +}
> +
>  /*
>   * Preparse the match criterion.  If we don't set lookup_type and cmp,
>   * the default will be an exact match on the key description.
> @@ -274,8 +296,9 @@ static bool asymmetric_key_cmp_partial(const struct key *key,
>   * There are some specifiers for matching key IDs rather than by the key
>   * description:
>   *
> - *	"id:<id>" - find a key by partial match on any available ID
> - *	"ex:<id>" - find a key by exact match on any available ID
> + *	"id:<id>" - find a key by partial match on one of the first two IDs
> + *	"ex:<id>" - find a key by exact match on one of the first two IDs
> + *	"dn:<id>" - find a key by exact match on the third ID
>   *
>   * These have to be searched by iteration rather than by direct lookup because
>   * the key is hashed according to its description.
> @@ -299,6 +322,11 @@ static int asymmetric_key_match_preparse(struct key_match_data *match_data)
>  		   spec[1] == 'x' &&
>  		   spec[2] == ':') {
>  		id = spec + 3;
> +	} else if (spec[0] == 'd' &&
> +		   spec[1] == 'n' &&
> +		   spec[2] == ':') {
> +		id = spec + 3;
> +		cmp = asymmetric_key_cmp_name;
>  	} else {
>  		goto default_match;
>  	}
> diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
> index 61af3c4d82c..998ba0e2ffb 100644
> --- a/crypto/asymmetric_keys/pkcs7_trust.c
> +++ b/crypto/asymmetric_keys/pkcs7_trust.c
> @@ -48,7 +48,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
>  		 * keys.
>  		 */
>  		key = find_asymmetric_key(trust_keyring,
> -					  x509->id, x509->skid, false);
> +					  x509->id, x509->skid, NULL, false);
>  		if (!IS_ERR(key)) {
>  			/* One of the X.509 certificates in the PKCS#7 message
>  			 * is apparently the same as one we already trust.
> @@ -82,7 +82,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
>  		key = find_asymmetric_key(trust_keyring,
>  					  last->sig->auth_ids[0],
>  					  last->sig->auth_ids[1],
> -					  false);
> +					  NULL, false);
>  		if (!IS_ERR(key)) {
>  			x509 = last;
>  			pr_devel("sinfo %u: Root cert %u signer is key %x\n",
> @@ -97,7 +97,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
>  	 * the signed info directly.
>  	 */
>  	key = find_asymmetric_key(trust_keyring,
> -				  sinfo->sig->auth_ids[0], NULL, false);
> +				  sinfo->sig->auth_ids[0], NULL, NULL, false);
>  	if (!IS_ERR(key)) {
>  		pr_devel("sinfo %u: Direct signer is key %x\n",
>  			 sinfo->index, key_serial(key));
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
> index 77ebebada29..f77875ec942 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -87,7 +87,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
>  	sig = payload->data[asym_auth];
>  	if (!sig)
>  		return -ENOPKG;
> -	if (!sig->auth_ids[0] && !sig->auth_ids[1])
> +	if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
>  		return -ENOKEY;
>  
>  	if (ca_keyid && !asymmetric_key_id_partial(sig->auth_ids[1], ca_keyid))
> @@ -96,7 +96,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
>  	/* See if we have a key that signed this one. */
>  	key = find_asymmetric_key(trust_keyring,
>  				  sig->auth_ids[0], sig->auth_ids[1],
> -				  false);
> +				  sig->auth_ids[2], false);
>  	if (IS_ERR(key))
>  		return -ENOKEY;
>  
> @@ -108,11 +108,11 @@ int restrict_link_by_signature(struct key *dest_keyring,
>  	return ret;
>  }
>  
> -static bool match_either_id(const struct asymmetric_key_ids *pair,
> +static bool match_either_id(const struct asymmetric_key_id **pair,
>  			    const struct asymmetric_key_id *single)
>  {
> -	return (asymmetric_key_id_same(pair->id[0], single) ||
> -		asymmetric_key_id_same(pair->id[1], single));
> +	return (asymmetric_key_id_same(pair[0], single) ||
> +		asymmetric_key_id_same(pair[1], single));
>  }
>  
>  static int key_or_keyring_common(struct key *dest_keyring,
> @@ -140,20 +140,22 @@ static int key_or_keyring_common(struct key *dest_keyring,
>  	sig = payload->data[asym_auth];
>  	if (!sig)
>  		return -ENOPKG;
> -	if (!sig->auth_ids[0] && !sig->auth_ids[1])
> +	if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
>  		return -ENOKEY;
>  
>  	if (trusted) {
>  		if (trusted->type == &key_type_keyring) {
>  			/* See if we have a key that signed this one. */
>  			key = find_asymmetric_key(trusted, sig->auth_ids[0],
> -						  sig->auth_ids[1], false);
> +						  sig->auth_ids[1],
> +						  sig->auth_ids[2], false);
>  			if (IS_ERR(key))
>  				key = NULL;
>  		} else if (trusted->type == &key_type_asymmetric) {
> -			const struct asymmetric_key_ids *signer_ids;
> +			const struct asymmetric_key_id **signer_ids;
>  
> -			signer_ids = asymmetric_key_ids(trusted);
> +			signer_ids = (const struct asymmetric_key_id **)
> +				asymmetric_key_ids(trusted)->id;
>  
>  			/*
>  			 * The auth_ids come from the candidate key (the
> @@ -164,22 +166,29 @@ static int key_or_keyring_common(struct key *dest_keyring,
>  			 * The signer_ids are identifiers for the
>  			 * signing key specified for dest_keyring.
>  			 *
> -			 * The first auth_id is the preferred id, and
> -			 * the second is the fallback. If only one
> -			 * auth_id is present, it may match against
> -			 * either signer_id. If two auth_ids are
> -			 * present, the first auth_id must match one
> -			 * signer_id and the second auth_id must match
> -			 * the second signer_id.
> +			 * The first auth_id is the preferred id, 2nd and
> +			 * 3rd are the fallbacks. If excatly one of
> +			 * auth_ids[0] and auth_ids[1] is present, it may
> +			 * match either signer_ids[0] or signed_ids[1].
> +			 * If both are present the first one may match
> +			 * either signed_id but the second one must match
> +			 * the second signer_id. If neither of them is
> +			 * available, auth_ids[2] is matched against
> +			 * signer_ids[2] as a fallback.
>  			 */
> -			if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
> +			if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
> +				if (asymmetric_key_id_same(signer_ids[2],
> +							   sig->auth_ids[2]))
> +					key = __key_get(trusted);
> +
> +			} else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
>  				const struct asymmetric_key_id *auth_id;
>  
>  				auth_id = sig->auth_ids[0] ?: sig->auth_ids[1];
>  				if (match_either_id(signer_ids, auth_id))
>  					key = __key_get(trusted);
>  
> -			} else if (asymmetric_key_id_same(signer_ids->id[1],
> +			} else if (asymmetric_key_id_same(signer_ids[1],
>  							  sig->auth_ids[1]) &&
>  				   match_either_id(signer_ids,
>  						   sig->auth_ids[0])) {
> @@ -193,7 +202,8 @@ static int key_or_keyring_common(struct key *dest_keyring,
>  	if (check_dest && !key) {
>  		/* See if the destination has a key that signed this one. */
>  		key = find_asymmetric_key(dest_keyring, sig->auth_ids[0],
> -					  sig->auth_ids[1], false);
> +					  sig->auth_ids[1], sig->auth_ids[2],
> +					  false);
>  		if (IS_ERR(key))
>  			key = NULL;
>  	}
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
> index 52c9b455fc7..59dfffa77cf 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -415,8 +415,18 @@ int x509_note_issuer(void *context, size_t hdrlen,
>  		     const void *value, size_t vlen)
>  {
>  	struct x509_parse_context *ctx = context;
> +	struct asymmetric_key_id *kid;
> +
>  	ctx->cert->raw_issuer = value;
>  	ctx->cert->raw_issuer_size = vlen;
> +
> +	if (!ctx->cert->sig->auth_ids[2]) {
> +		kid = asymmetric_key_generate_id(value, vlen, "", 0);
> +		if (IS_ERR(kid))
> +			return PTR_ERR(kid);
> +		ctx->cert->sig->auth_ids[2] = kid;
> +	}
> +
>  	return x509_fabricate_name(ctx, hdrlen, tag, &ctx->cert->issuer, vlen);
>  }
>  
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index ae450eb8be1..a95cc351518 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -221,6 +221,13 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
>  		goto error_free_desc;
>  	kids->id[0] = cert->id;
>  	kids->id[1] = cert->skid;
> +	kids->id[2] = asymmetric_key_generate_id(cert->raw_subject,
> +						 cert->raw_subject_size,
> +						 "", 0);
> +	if (IS_ERR(kids->id[2])) {
> +		ret = PTR_ERR(kids->id[2]);
> +		goto error_free_kids;
> +	}
>  
>  	/* We're pinning the module by being linked against it */
>  	__module_get(public_key_subtype.owner);
> @@ -237,8 +244,11 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
>  	cert->skid = NULL;
>  	cert->sig = NULL;
>  	desc = NULL;
> +	kids = NULL;
>  	ret = 0;
>  
> +error_free_kids:
> +	kfree(kids);
>  error_free_desc:
>  	kfree(desc);
>  error_free_cert:
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 948c5203ca9..4819e63a772 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -37,7 +37,7 @@ extern void public_key_free(struct public_key *key);
>   * Public key cryptography signature data
>   */
>  struct public_key_signature {
> -	struct asymmetric_key_id *auth_ids[2];
> +	struct asymmetric_key_id *auth_ids[3];
>  	u8 *s;			/* Signature */
>  	u32 s_size;		/* Number of bytes in signature */
>  	u8 *digest;
> diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
> index a29d3ff2e7e..344ab9f178d 100644
> --- a/include/keys/asymmetric-type.h
> +++ b/include/keys/asymmetric-type.h
> @@ -53,7 +53,7 @@ struct asymmetric_key_id {
>  };
>  
>  struct asymmetric_key_ids {
> -	void		*id[2];
> +	void		*id[3];
>  };
>  
>  extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
> @@ -75,6 +75,7 @@ const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
>  extern struct key *find_asymmetric_key(struct key *keyring,
>  				       const struct asymmetric_key_id *id_0,
>  				       const struct asymmetric_key_id *id_1,
> +				       const struct asymmetric_key_id *id_2,
>  				       bool partial);
>  
>  /*
> -- 
> 2.27.0
> 
> 

This gives checkpatch error but is not due to this patch. I sent a
bug fix (and also cc'd you to that). I'll apply that to my tree as
soon as I get it ack'd first.

Overally, I don't understand differianting the semantics. Emphasis
on that I haven't been involved with asymmetric keys implementation,
so it is entirely possible that there are good reasons to do this
but the commit message did not shed any light on this.

/Jarkko
