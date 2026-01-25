Return-Path: <keyrings+bounces-3919-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLxMOOwpdmndMgEAu9opvQ
	(envelope-from <keyrings+bounces-3919-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:34:20 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 882478100C
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 15:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC6373005AC8
	for <lists+keyrings@lfdr.de>; Sun, 25 Jan 2026 14:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89051F4181;
	Sun, 25 Jan 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLeF30T2"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552245BE3;
	Sun, 25 Jan 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351650; cv=none; b=KpVURI/DgjQONjnxwdsGkDzn94M9HWJHT+3ZB7lqFoCbegI6VEMC7JFP9WTq5oXg+1owGqkHuYjXWoEJcJh/vtmlTC6HerHj1oseIgoUHaZcD8co3WPK4gHaSa3JVj1Id7O16nDbwHUc0B6kodmb/dTfY9EV93SGZ1TRvaQEXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351650; c=relaxed/simple;
	bh=xcIrvaTTzSVCgO9wrZZ9IP5JR3PwHp3nrCaXuLjG+/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKMiUyABqMbOFivQo3EpnRh0LB9B5GdIY3+63jI3Ee0nqqRc9hgSfwnmwDfkzkiZwmO2TpH7gVhf1d2z0L2COFWRZ1IzDqpMMNgcgArxBnZAIQh/6c7NRk6/RZDcEh2cgwaMhX8CacDgwJXqchzxYt8P/ioEjr6eFlMD5qgeVYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLeF30T2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8641FC4CEF1;
	Sun, 25 Jan 2026 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769351650;
	bh=xcIrvaTTzSVCgO9wrZZ9IP5JR3PwHp3nrCaXuLjG+/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLeF30T2pwGDVRMU28OkwYxWcHr015tz0tbjcRKAu/7E02rHNBzQU863hE+g1LkYx
	 HFmRcVGKHBsHj270BHG6QbYnYkEhPUHgZlGUIzuPqZcSuOw0tnsnAQycsB4KvT9F0T
	 KsdcJlBIRtOgD95P0cNBPWXXJyna+RihVzy+2ADfhuCdcuec+YvHK9+Zl5VvJvEpDh
	 +YH5qV/B4yz0dRZj9zElfiJ+4RojeKtxzJHGVexnoMs0k8xImYHJOUhhUTOHF5jkek
	 MYUwc8361bTim1ACv+QoJpBRkxqGz8bFJkCJmNuHil/Ybjhz345O/pIi7Is3+2D4lZ
	 xm0C6Xai5mLeg==
Date: Sun, 25 Jan 2026 16:34:05 +0200
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
Subject: Re: [PATCH v14 2/5] x509: Separately calculate sha256 for blacklist
Message-ID: <aXYp3Zb3rLudQBpE@kernel.org>
References: <20260121223609.1650735-1-dhowells@redhat.com>
 <20260121223609.1650735-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223609.1650735-3-dhowells@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3919-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chronox.de:email,cloudflare.com:email]
X-Rspamd-Queue-Id: 882478100C
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:36:04PM +0000, David Howells wrote:
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
>  crypto/asymmetric_keys/x509_public_key.c | 23 +++++++++++++----------
>  2 files changed, 15 insertions(+), 10 deletions(-)
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
> index 12e3341e806b..6d002e3b20c5 100644
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
> @@ -65,19 +78,9 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
>  				  sig->digest);
> -

nit: spurious diff unrelated to change

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

I hold on for commentary (nit was is not reason to not give
reviewed-by) tho it looks to me acceptable.

BR, Jarkko

