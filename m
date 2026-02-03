Return-Path: <keyrings+bounces-4014-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JfVF51DgWnNFAMAu9opvQ
	(envelope-from <keyrings+bounces-4014-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:38:53 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F3D30F3
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 01:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C7643003E8C
	for <lists+keyrings@lfdr.de>; Tue,  3 Feb 2026 00:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBED1D6DA9;
	Tue,  3 Feb 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXVywSx5"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD918E025;
	Tue,  3 Feb 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078931; cv=none; b=WiUT5DN2PBsMpW2URwGg5u75v/AuGEXfTJRPQO/kigyRevPsS1r6xl/6YAFYqdUjwHu5L4c7E9SOkzDwEpyB6Uw4DjXkrZci9x3jPoE+lPaRWtz/NzZEwncta3ZU3qMfmpvTgpBKCNYnr6h/A+272eAuVIXeHqUqCnhg2yDubkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078931; c=relaxed/simple;
	bh=ovtezGkmnjYK1dJq7gxbfnsXpTZi+R1BHE8vyy9L2bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4LZ9ER4AIyH7afW9qch8sK7OyNKzn5SAV/6AnwTiJPV1qYCA9YUWlU15izNVR+q+U6AhbMcK9eRxhHKzGZYPZVW/GA5wUqPUrNpWn3xq4ST5YmHgi/4l2QYqqejZvUv2GP9Qrg6S2DKAlHb+0s/IP4ZtIMFOVT6oDHOgdKjJpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXVywSx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD4C116C6;
	Tue,  3 Feb 2026 00:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078931;
	bh=ovtezGkmnjYK1dJq7gxbfnsXpTZi+R1BHE8vyy9L2bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXVywSx5/T+VdYINhKgFGG2rIPRbmAmvlrrctUivGuVVM9RlH+tSIuAEjB8rhpqxE
	 cPKQ6aJmvxR+8iUH+cnWpmDRzw/jREp1ZiwNMt3Rg53PihT3/vHtb8c8z0cf2cUnYW
	 V1hT8TCFoEy67+cthScL3fhaIFD2cPxPfh5PVt9DckzgIm7YSi0KgaW5nE1vsj9IKm
	 hAhp2bqkIxTn3xnUqiDF/F4FXXHuySApeau6+ANsvsgjrL3cH73RHE+VnbE2JoZSIo
	 u6crnRwVuGsEa9cAVeIpLlhiwpXn3XK67rhuVnoZhcrQ7txY/b2hmptNjSBWzGWfEN
	 S/65u6pNESVFQ==
Date: Tue, 3 Feb 2026 02:35:26 +0200
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
Subject: Re: [PATCH v16 7/7] pkcs7: Allow authenticatedAttributes for ML-DSA
Message-ID: <aYFCzv9MKNnROg2Y@kernel.org>
References: <20260202170216.2467036-1-dhowells@redhat.com>
 <20260202170216.2467036-8-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202170216.2467036-8-dhowells@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-4014-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,chronox.de:email,wunner.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apana.org.au:email]
X-Rspamd-Queue-Id: AE3F3D30F3
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:02:12PM +0000, David Howells wrote:
> Allow the rejection of authenticatedAttributes in PKCS#7 (signedAttrs in
> CMS) to be waived in the kernel config for ML-DSA when used for module
> signing.  This reflects the issue that openssl < 4.0 cannot do this and
> openssl-4 has not yet been released.
> 
> This does not permit RSA, ECDSA or ECRDSA to be so waived (behaviour
> unchanged).
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
>  crypto/asymmetric_keys/Kconfig        | 11 +++++++++++
>  crypto/asymmetric_keys/pkcs7_parser.c |  8 ++++++++
>  crypto/asymmetric_keys/pkcs7_parser.h |  3 +++
>  crypto/asymmetric_keys/pkcs7_verify.c |  6 ++++++
>  4 files changed, 28 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
> index e1345b8f39f1..1dae2232fe9a 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -53,6 +53,17 @@ config PKCS7_MESSAGE_PARSER
>  	  This option provides support for parsing PKCS#7 format messages for
>  	  signature data and provides the ability to verify the signature.
>  
> +config PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
> +	bool "Waive rejection of authenticatedAttributes for ML-DSA"
> +	depends on PKCS7_MESSAGE_PARSER
> +	depends on CRYPTO_MLDSA
> +	help
> +	  Due to use of CMS_NOATTR with ML-DSA not being supported in
> +	  OpenSSL < 4.0 (and thus any released version), enabling this
> +	  allows authenticatedAttributes to be used with ML-DSA for
> +	  module signing.  Use of authenticatedAttributes in this
> +	  context is normally rejected.
> +
>  config PKCS7_TEST_KEY
>  	tristate "PKCS#7 testing key type"
>  	depends on SYSTEM_DATA_VERIFICATION
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 594a8f1d9dfb..db1c90ca6fc1 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -92,9 +92,17 @@ static int pkcs7_check_authattrs(struct pkcs7_message *msg)
>  	if (!sinfo)
>  		goto inconsistent;
>  
> +#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
> +	msg->authattrs_rej_waivable = true;
> +#endif
> +
>  	if (sinfo->authattrs) {
>  		want = true;
>  		msg->have_authattrs = true;
> +#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
> +		if (strncmp(sinfo->sig->pkey_algo, "mldsa", 5) != 0)
> +			msg->authattrs_rej_waivable = false;
> +#endif
>  	} else if (sinfo->sig->algo_takes_data) {
>  		sinfo->sig->hash_algo = "none";
>  	}
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.h b/crypto/asymmetric_keys/pkcs7_parser.h
> index e17f7ce4fb43..6ef9f335bb17 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.h
> +++ b/crypto/asymmetric_keys/pkcs7_parser.h
> @@ -55,6 +55,9 @@ struct pkcs7_message {
>  	struct pkcs7_signed_info *signed_infos;
>  	u8		version;	/* Version of cert (1 -> PKCS#7 or CMS; 3 -> CMS) */
>  	bool		have_authattrs;	/* T if have authattrs */
> +#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
> +	bool		authattrs_rej_waivable; /* T if authatts rejection can be waived */
> +#endif
>  
>  	/* Content Data (or NULL) */
>  	enum OID	data_type;	/* Type of Data */
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index 06abb9838f95..519eecfe6778 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -425,6 +425,12 @@ int pkcs7_verify(struct pkcs7_message *pkcs7,
>  			return -EKEYREJECTED;
>  		}
>  		if (pkcs7->have_authattrs) {
> +#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
> +			if (pkcs7->authattrs_rej_waivable) {
> +				pr_warn("Waived invalid module sig (has authattrs)\n");
> +				break;
> +			}
> +#endif
>  			pr_warn("Invalid module sig (has authattrs)\n");
>  			return -EKEYREJECTED;
>  		}
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

