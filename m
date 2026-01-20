Return-Path: <keyrings+bounces-3861-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOc+B3EEcGmUUgAAu9opvQ
	(envelope-from <keyrings+bounces-3861-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:40:49 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E74D1DB
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9538CA863B7
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 21:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F6A3BB9F5;
	Tue, 20 Jan 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ew7h69r3"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47536A027;
	Tue, 20 Jan 2026 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945105; cv=none; b=P+Y0JFZmYbE0TKvivqAGCUQB2kmTBzceY5a1OzKXqNSkJ2DKxMa5xf0ZYHAAQahT1apV7hqB00FdxmXB/MPDxcGh3mqI2ULRmxow/AfTdCwyeHMoy4bgucJue3YrYOGkp906dpbKUBlaoj2yeaHulbQxVaD4Ao/LcLmYNywYnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945105; c=relaxed/simple;
	bh=RAG3vFa/udd/yExlhn033Rdo7wtK9n4f+PKeqcvcKbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3ylzDM42mwwMr5j2ldr51kL8kJybzsCzOxf4BzZA7Sub9nUsoCZ9V2HRiVcPptwynL1JSPf2gZjbVcq8AY5w2CMzncQ6McEJo64iKqm1rENZI1FfH4sVgSRcEWZIHuce/U47UuVJtGW1AWiLDrBGb2szQ0d0N7PJSUOf9qkrPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ew7h69r3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB7CC16AAE;
	Tue, 20 Jan 2026 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768945103;
	bh=RAG3vFa/udd/yExlhn033Rdo7wtK9n4f+PKeqcvcKbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ew7h69r3SG/b/D4yjK6sjQ1H+iFuqGcZN7MHJ49iqY9SYANvch8B3GbD/3cHRnfl3
	 BqKy/aICtlE8FS1kwGDstkwmhnfQV9cGQGPofREMKsIxU96CdonWD2y1iCNftM7eDB
	 p8aXN9s6xd4ZDwZp+uAWD8IGzT5ImzNLpDuBA/7rLkGW7BafIJB/nVyYpY97WFDgAT
	 OOocuYq9uqBo7x4/rXPl5UKKH6L5RIUa9urtgmXDtYSc2XB51ZL7YQBA35nh2iSPy5
	 tbBGTFS1ZOoRezmy8eXcezwmS7Q3jDYYqTyN8+sh9bygJtUmQzZWf46g1BMlNK5Q1D
	 3712Vkv+i/rSg==
Date: Tue, 20 Jan 2026 13:38:20 -0800
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
Subject: Re: [PATCH v13 05/12] modsign: Enable ML-DSA module signing
Message-ID: <20260120213820.GD2657@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-6-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-6-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3861-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A66E74D1DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:51PM +0000, David Howells wrote:
> The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
> without regard to what's specified in the CMS message.  This is, in theory,
> configurable, but there's currently no hook in the crypto_sig API to do
> that, though possibly it could be done by parameterising the name of the
> algorithm, e.g. ("mldsa87(sha512)").

As I mentioned on v11, this paragraph doesn't really make sense, since
the XOF is part of the ML-DSA specification.  Sure, you saw some
component of ML-DSA which could, in principle, swapped out with some
other component to create a new algorithm which would not be "ML-DSA".
But the XOF isn't really unique there.

> +config MODULE_SIG_KEY_TYPE_MLDSA_44
> +	bool "ML-DSA-44"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-44 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.

Let me reiterate my comment from v11:

    Also unclear why the above help text mentions anything about SHAKE256 or
    the authenticatedAttributes.  That's an implementation detail.  (And
    the CMS specification calls them signed attributes anyway.)

I'll also note that your signing program doesn't actually produce signed
attributes if the OpenSSL version is sufficiently new.

> +config MODULE_SIG_KEY_TYPE_MLDSA_65
> +	bool "ML-DSA-65"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-65 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_87
> +	bool "ML-DSA-87"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA-87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.

Do all three ML-DSA parameter sets really need to be supported for
module signing?  How will distros decide which one to use?

Any chance that ML-DSA-65 would be good enough for everyone?  That's the
one that I'm seeing recommended the most.

> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 7070245edfc1..547b97097230 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -315,18 +315,36 @@ int main(int argc, char **argv)
>  		ERR(!digest_algo, "EVP_get_digestbyname");
>  
>  #ifndef USE_PKCS7
> +
> +		unsigned int flags =
> +			CMS_NOCERTS |
> +			CMS_PARTIAL |
> +			CMS_BINARY |
> +			CMS_DETACHED |
> +			CMS_STREAM  |
> +			CMS_NOSMIMECAP |
> +			CMS_NO_SIGNING_TIME |
> +			use_keyid;
> +
> +		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
> +		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
> +		    OPENSSL_VERSION_MAJOR < 4) {
> +			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
> +			  * and before.
> +			  */
> +			use_signed_attrs = 0;
> +		}
> +
> +		flags |= use_signed_attrs;

If OpenSSL 3.5 is the last version that doesn't support the noattr case,
that would mean that OpenSSL 3.6 does support it, right?  OpenSSL 3.6
was released several months ago.  Yet the above code requires version 4.

Either way, this version-dependent logic is a bit fragile: users will
suddenly get different behavior on OpenSSL version updates.  And once
everyone has updated, the old code will no longer be tested.

How about we just support the new way only?  That would be simpler, and
it sounds like it's already supported by the latest OpenSSL.

- Eric

