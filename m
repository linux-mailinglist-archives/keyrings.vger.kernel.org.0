Return-Path: <keyrings+bounces-3865-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PfqOGwGcGmUUgAAu9opvQ
	(envelope-from <keyrings+bounces-3865-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:49:16 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 687934D3DA
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB8D0B271B2
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD983DA7D7;
	Tue, 20 Jan 2026 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP0ibWYw"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DAF3BF30A;
	Tue, 20 Jan 2026 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947292; cv=none; b=Hldiif/pAJQ614ZDjdHLrzs1xp2ulj6hYWZFVFT615ogWtl6SdK7a9+xe+Ut+ye74u3bBcQliY841dI8U7kkbGNm8BJL/181tEYvpuYYZbMWDag3kblX64GPACm8zxG+PxF4g/608uLjel/oExZ3T2NVesMvVqPCrFqDCimAS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947292; c=relaxed/simple;
	bh=IJq2QZQ/5+HzuoMyBaOMkJ+nw8LR9hsm71dOifv66r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQRkcAbeLJtNQbvHV9VxtvLtSGXkzhiC4eSS0ZzB5zMGhfVCq/t9ktjpPJRg9GPRxls1oImiUEKhLHtMF5Ng0hed1kVKmPse9qAc9Km28ggFVn5of+cD2m+EwlA8sY/ylwefp/1LN2qSy7ZEnFs1zsTYr8ebB08vmoG2rZYmbzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP0ibWYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AC9C16AAE;
	Tue, 20 Jan 2026 22:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768947291;
	bh=IJq2QZQ/5+HzuoMyBaOMkJ+nw8LR9hsm71dOifv66r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP0ibWYwgNFasQy+aGVdbjYPTXsbR+TDeoXiXhc60HzWLbC7QOtE9gEbAegLnWw2U
	 WVk3h/92p+EJ9WRzQ4ySDNXa0hrYJiKRBfA/z1H8WK9Zq8LZVvk3z/NLRheKmbKDt+
	 OYATIQtGf9IR3y6dQDcsnWdjUSBp+xpuzqHCjYZDDB1dnjCKLXgqYSZyamnNn/bO1v
	 lyUAl5ryO0LP+t0/P8GGzrQWzN0d8tUiQ+ytrnk0a9Y43b5+qkyONUH03cRexxjJc/
	 Nqvgg+lqnqnWJpG4bTrDHzOfVeVmTmlGyQA2Eg8aj328RZ4u2nod0BE+Gf8oW8h9xB
	 tDIvUD38LUlvg==
Date: Tue, 20 Jan 2026 14:14:48 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 11/12] x509, pkcs7: Limit crypto combinations that
 may be used for module signing
Message-ID: <20260120221448.GB6191@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-12-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-12-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3865-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,apana.org.au:email,cloudflare.com:email,chronox.de:email,wunner.de:email]
X-Rspamd-Queue-Id: 687934D3DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:57PM +0000, David Howells wrote:
> Limit the set of crypto combinations that may be used for module signing as
> no indication of hash algorithm used for signing is added to the hash of
> the data, so in theory a data blob hashed with a different algorithm can be
> substituted provided it has the same hash output.
> 
> This also rejects the use of less secure algorithms.
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
>  crypto/asymmetric_keys/public_key.c | 55 +++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index 13a5616becaa..90b98e1a952d 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -24,6 +24,52 @@ MODULE_DESCRIPTION("In-software asymmetric public-key subtype");
>  MODULE_AUTHOR("Red Hat, Inc.");
>  MODULE_LICENSE("GPL");
>  
> +struct public_key_restriction {
> +	const char	*pkey_algo;	/* Signing algorithm (e.g. "rsa") */
> +	const char	*pkey_enc;	/* Signature encoding (e.g. "pkcs1") */
> +	const char	*hash_algo;	/* Content hash algorithm (e.g. "sha256") */
> +};
> +
> +static const struct public_key_restriction public_key_restrictions[] = {
> +	/* algo			encoding	hash */
> +	{ "rsa",		"pkcs1",	"sha256" },
> +	{ "rsa",		"pkcs1",	"sha384" },
> +	{ "rsa",		"pkcs1",	"sha512" },
> +	{ "rsa",		"emsa-pss",	"sha512" },
> +	{ "ecdsa",		"x962",		"sha256" },
> +	{ "ecdsa",		"x962",		"sha384" },
> +	{ "ecdsa",		"x962",		"sha512" },
> +	{ "ecrdsa",		"raw",		"sha256" },
> +	{ "ecrdsa",		"raw",		"sha384" },
> +	{ "ecrdsa",		"raw",		"sha512" },
> +	{ "mldsa44",		"raw",		"sha512" },
> +	{ "mldsa65",		"raw",		"sha512" },
> +	{ "mldsa87",		"raw",		"sha512" },
> +	/* ML-DSA may also do its own hashing over the entire message. */
> +	{ "mldsa44",		"raw",		"-" },
> +	{ "mldsa65",		"raw",		"-" },
> +	{ "mldsa87",		"raw",		"-" },
> +};

Have you read software_key_determine_akcipher()?  It's the place where
the encoding and hash_algo are validated currently.  This commit adds a
second set of slightly different checks alongside the existing ones.
It's unclear whether the existing checks were considered.

Also, the ML-DSA and RSASSA-PSS support is new in this patchset, and
this commit is a fix for it.  Instead of committing buggy code that is
fixed by a later commit, it's preferable to commit correct code in the
first place.

- Eric

