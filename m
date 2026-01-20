Return-Path: <keyrings+bounces-3853-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JFPOZ7Xb2n8RwAAu9opvQ
	(envelope-from <keyrings+bounces-3853-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 20:29:34 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E94A661
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 20:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 207778827DC
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C4243E9DC;
	Tue, 20 Jan 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R52wzwus"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770D743E4B5;
	Tue, 20 Jan 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931591; cv=none; b=r0CM5Duybl3hcyE4nwPZTRpjlWiieSjgtlmtJ2UFi7IsSWFLxTpks6F/C4VgAyOngW20qye2zk85AGj5JCgt5mu8TSlvfpSavjfkxP9QReqAZvcDe4G+rlA53yf2UNDCTrN46ZQ8TQJHaDVJRj6Ir6PmIv3nwvf3vIIPqMCQ9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931591; c=relaxed/simple;
	bh=BM9xqbGtIsX/gKKfenu8o5AXySIZUT57aB3PCy4BLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L08z+rMXuf7/6LfDlqc3g2s/V2pA6dutLQF7BAFgwF3F9eOv/VOZvvBayq+AIWXyAytvFsLuZ3JJDkickWERBhUTzu49f2ih9f2F/7XEwfHRI0dbBhlf/qk3iqiJb6eqQc7EmJeTeaJaa7MFJlpeZ73WotbyrR+pBjtbP45x6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R52wzwus; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24841C16AAE;
	Tue, 20 Jan 2026 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931590;
	bh=BM9xqbGtIsX/gKKfenu8o5AXySIZUT57aB3PCy4BLYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R52wzwusPh/a2iuVHCJHCsXWPfOsJzW4enkSaApnl92mwhHZN5M4ny/1ejyRNcZW+
	 8gU9ehG5FMgeuEGA4FTA5UW+p+FJKFQvWzZvJBqN5XDMggetj3VpQUlLdX8Q9DcOL+
	 wlVThlSjiGy5t0NOrlRFDoJlO49DOr03M5uACDbgLBSaChxmNg0FiE08ok/Yqd4Q0l
	 TKo7IiYJrbAZFkUvmfcMQ3Dnw0keM7/JSZJp2ruMYwgMDYh69zRxbj3YHmG/Cgxyd5
	 gPJtCl9cfDoJKnPeZXLDZu8t6AlDJLHeMEvZGNsntxwHkEpNZhfY9SEq6Tqv496YQo
	 mfPhEkcvXtyYA==
Date: Tue, 20 Jan 2026 19:53:05 +0200
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
Subject: Re: [PATCH v13 02/12] pkcs7: Allow the signing algo to calculate the
 digest itself
Message-ID: <aW_BAchcx2_TXASz@kernel.org>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-3-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-3853-lists,keyrings=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,cloudflare.com:email,wunner.de:email]
X-Rspamd-Queue-Id: 112E94A661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:48PM +0000, David Howells wrote:
> The ML-DSA public key algorithm really wants to calculate the message
> digest itself, rather than having the digest precalculated and fed to it
> separately as RSA does[*].  The kernel's PKCS#7 parser, however, is
> designed around the latter approach.
> 
>   [*] ML-DSA does allow for an "external mu", but CMS doesn't yet have that
>   standardised.
> 
> Fix this by noting in the public_key_signature struct when the signing
> algorithm is going to want this and then, rather than doing the digest of
> the authenticatedAttributes ourselves and overwriting the sig->digest with
> that, replace sig->digest with a copy of the contents of the
> authenticatedAttributes section and adjust the digest length to match.
> 
> This will then be fed to the public key algorithm as normal which can do
> what it wants with the data.
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
>  crypto/asymmetric_keys/pkcs7_parser.c |  4 +--
>  crypto/asymmetric_keys/pkcs7_verify.c | 48 ++++++++++++++++++---------
>  include/crypto/public_key.h           |  1 +
>  3 files changed, 36 insertions(+), 17 deletions(-)
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
> index 6d6475e3a9bf..0f9f515b784d 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -70,8 +70,6 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
>  	 * digest we just calculated.
>  	 */
>  	if (sinfo->authattrs) {
> -		u8 tag;
> -
>  		if (!sinfo->msgdigest) {
>  			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
>  			ret = -EKEYREJECTED;
> @@ -97,20 +95,40 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
> +		if (sig->algo_does_hash) {
> +			kfree(sig->digest);
> +
> +			ret = -ENOMEM;
> +			sig->digest = kmalloc(umax(sinfo->authattrs_len, sig->digest_size),
> +					      GFP_KERNEL);
> +			if (!sig->digest)
> +				goto error_no_desc;
> +
> +			sig->digest_size = sinfo->authattrs_len;
> +			memcpy(sig->digest, sinfo->authattrs, sinfo->authattrs_len);
> +			((u8 *)sig->digest)[0] = ASN1_CONS_BIT | ASN1_SET;
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
> +						 sig->digest);
> +			if (ret < 0)
> +				goto error;
> +		}
>  		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
>  	}
>  
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index 81098e00c08f..e4ec8003a3a4 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -46,6 +46,7 @@ struct public_key_signature {
>  	u8 *digest;
>  	u32 s_size;		/* Number of bytes in signature */
>  	u32 digest_size;	/* Number of bytes in digest */
> +	bool algo_does_hash;	/* Public key algo does its own hashing */

I'd use the wording you used already in commit message, which
factors more descriptive than what you have here. E.g., name
it "external_digest".

It would be easier to digest this when revisiting the code later...

>  	const char *pkey_algo;
>  	const char *hash_algo;
>  	const char *encoding;
> 

Allocation scheme is not the prettiest but I neither have
anything other to offer, so other than the rename request,
I think this is acceptable.

BR, Jarkko

