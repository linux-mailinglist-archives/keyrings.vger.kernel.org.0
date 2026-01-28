Return-Path: <keyrings+bounces-3972-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UUacNHuYemm58QEAu9opvQ
	(envelope-from <keyrings+bounces-3972-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 29 Jan 2026 00:15:07 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18AA9DDD
	for <lists+keyrings@lfdr.de>; Thu, 29 Jan 2026 00:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0661730125E7
	for <lists+keyrings@lfdr.de>; Wed, 28 Jan 2026 23:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6A63446C5;
	Wed, 28 Jan 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrH9Ila4"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722233ADBE;
	Wed, 28 Jan 2026 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642105; cv=none; b=aveKukrJeoPHX54+m7bOI08eVCof7ctUsdQcbSry8B4jXyyKXoAeQWAfd78Fqihw6mBM/J2OpBWGG+l8+MooZwefdPGCwuZdbOjyW8xUYmSSTdjUcwQBJrPDAFhHMu/chmHCYy0st55mz5eEHvVQiIxN1/Y8bk49V0DM6bql4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642105; c=relaxed/simple;
	bh=BwOEG0K4gspcwYgfqCYRp2ZcR11PloWhIkq/xhMlA+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAsTtsAoeTPWQkMseBR3WnMio5CLRHs9pZH3cXmtYRVxSRfjL6X94VMleoW9ol/s7ee6GIogM7RKNZdoG5WItjT4pO4DtMbPQyMrvWEYgqYW/ItjUZOqdueH6XDDIhHs9NW550ezoSvzC+1kHKI5HpV3HWWhF2Jqqt4s+ms3F0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrH9Ila4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E42C4CEF1;
	Wed, 28 Jan 2026 23:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769642104;
	bh=BwOEG0K4gspcwYgfqCYRp2ZcR11PloWhIkq/xhMlA+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrH9Ila4z5UTISZc3XhXloqQEaPVqE0JILJReIrMSThiFuboqxaDKDhTUj77vT/Y6
	 rNvotD3xXzQ7iWMtM2Xt3qVg87f9kX2XDQ/WxQdQqnm93VBPFgeJR0SOV2ZFfBxb1l
	 kDVIYlftArsum1ek/PT6AGq1peyCymulx13UoFE6JhuWibvwg9hP3+sHK3s1vhGozW
	 cC+N8Vc7gsN7+DVovuf0RPBLygrP+e/7cm+o9fNjZw+tovMWQJOD3RO0Iw1WvDxghF
	 cDWKvH79SuP//BHFz/na3XP47kfRTBSfUK3ypMTSDi+qHZsK6wvwNgxkhJWm3O+z1t
	 avoaYoAuH9w6Q==
Date: Thu, 29 Jan 2026 01:14:59 +0200
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
Subject: Re: [PATCH v15 2/7] x509: Separately calculate sha256 for blacklist
Message-ID: <aXqYc7V9F22xrVub@kernel.org>
References: <20260126142931.1940586-1-dhowells@redhat.com>
 <20260126142931.1940586-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126142931.1940586-3-dhowells@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-3972-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,apana.org.au:email]
X-Rspamd-Queue-Id: 5A18AA9DDD
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 02:29:23PM +0000, David Howells wrote:
> Calculate the SHA256 hash for blacklisting purposes independently of the
> signature hash (which may be something other than SHA256).
> 
> This is necessary because when ML-DSA is used, no digest is calculated.
> 
> Note that this represents a change of behaviour in that the hash used for
> the blacklist check would previously have been whatever digest was used
> for, say, RSA-based signatures.  It may be that this is inadvisable.
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
>  crypto/asymmetric_keys/x509_parser.h     |  2 ++
>  crypto/asymmetric_keys/x509_public_key.c | 22 +++++++++++++---------
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
> index 0688c222806b..b7aeebdddb36 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -9,12 +9,14 @@
>  #include <linux/time.h>
>  #include <crypto/public_key.h>
>  #include <keys/asymmetric-type.h>
> +#include <crypto/sha2.h>
>  
>  struct x509_certificate {
>  	struct x509_certificate *next;
>  	struct x509_certificate *signer;	/* Certificate that signed this one */
>  	struct public_key *pub;			/* Public key details */
>  	struct public_key_signature *sig;	/* Signature parameters */
> +	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
>  	char		*issuer;		/* Name of certificate issuer */
>  	char		*subject;		/* Name of certificate subject */
>  	struct asymmetric_key_id *id;		/* Issuer + Serial number */
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index 12e3341e806b..79cc7b7a0630 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -31,6 +31,19 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	pr_devel("==>%s()\n", __func__);
>  
> +	/* Calculate a SHA256 hash of the TBS and check it against the
> +	 * blacklist.
> +	 */
> +	sha256(cert->tbs, cert->tbs_size, cert->sha256);
> +	ret = is_hash_blacklisted(cert->sha256, sizeof(cert->sha256),
> +				  BLACKLIST_HASH_X509_TBS);
> +	if (ret == -EKEYREJECTED) {
> +		pr_err("Cert %*phN is blacklisted\n",
> +		       (int)sizeof(cert->sha256), cert->sha256);
> +		cert->blacklisted = true;
> +		ret = 0;
> +	}
> +
>  	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
>  	if (!sig->s)
>  		return -ENOMEM;
> @@ -69,15 +82,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  	if (ret < 0)
>  		goto error_2;
>  
> -	ret = is_hash_blacklisted(sig->digest, sig->digest_size,
> -				  BLACKLIST_HASH_X509_TBS);
> -	if (ret == -EKEYREJECTED) {
> -		pr_err("Cert %*phN is blacklisted\n",
> -		       sig->digest_size, sig->digest);
> -		cert->blacklisted = true;
> -		ret = 0;
> -	}
> -
>  error_2:
>  	kfree(desc);
>  error:
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

