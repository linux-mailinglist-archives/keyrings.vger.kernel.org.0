Return-Path: <keyrings+bounces-3866-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIoRNaoMcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3866-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:15:54 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA24DA03
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB614B45559
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105CA3B8D46;
	Tue, 20 Jan 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drAFt7nh"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B6346782;
	Tue, 20 Jan 2026 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948871; cv=none; b=jrRbFzFmJ7P8OAXaZGXng+RDJdtNP2ymr0tnIVSxmj8YlfcQwTG2qQA3ratHv4SXTlr9nig90gIJm8VL996SYp9pg2/UGxt15Yrcxsh0995bLmEMRiZoBC7676GgGWNqzopfi2H+dkmxKtyzuPr3H+TJ4r4NpeUHclpnACACeq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948871; c=relaxed/simple;
	bh=lYDtHpMC2PRSP0n3ZWhyho0wNOnkm4bjkT4lWx/9tWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TphdABeZ4X8LBOtdYlpUjXHDXCRisWilTUUqJ/c1VfImo8iDFmn/owjCIeUeKGyJs29z0dvaqLKvwPNrMgrLAKrNmI8sf020G6WXUhHDv1+lphUe97yMGm8uv6297wDVwD5vBqSHOxpvukRLlJ81gcEHfq/FULG5UPRRM5GuM1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drAFt7nh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788FEC16AAE;
	Tue, 20 Jan 2026 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768948871;
	bh=lYDtHpMC2PRSP0n3ZWhyho0wNOnkm4bjkT4lWx/9tWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drAFt7nh9TEGlVtgDNL5IoFO+BVPtTRY/8D58XglJEkey5tIi7jeozQahuj2QepJv
	 GuSxqJbJ6Tm5+dBLCIJYB7JGs+WIgu6x7I/2x4ANQ2jkoewQtuy5hgczrCHCybrLC8
	 xQuwiHaHmR3ige2BqszpmfKcVOA4EQQksj4e1vCIqXBHmwaEsxKZ4Sz9fCkldQ/Aqm
	 MuIwg3d4KAysLVLXS1XrtHyNd2eAvY4H7JoHvHQ22nKTPgGxp/eABhpnBAC6gwKdP7
	 UqLkLQUiMTn+iJv3B6jaaTZiSpiSM2op+3+cV0x4IHrU7c9wwFBVknnAHDx9HKERop
	 Up9p9S0tTTLKw==
Date: Tue, 20 Jan 2026 14:41:08 -0800
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
	linux-kernel@vger.kernel.org,
	Tadeusz Struk <tadeusz.struk@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v13 07/12] crypto: Add RSASSA-PSS support
Message-ID: <20260120224108.GC6191@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-8-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-8-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3866-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 41BA24DA03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:53PM +0000, David Howells wrote:
> Add support for RSASSA-PSS [RFC8017 sec 8.1] signature verification support
> to the RSA driver in crypto/.

This additional feature significantly increases the scope of your
patchset, especially considering that the kernel previously didn't
implement RSASSA-PSS at all.  This patchset also doesn't include any
explanation for why this additional feature is needed.  It might make
sense to add this feature, but it needs to be properly explained, and it
would be preferable for it to be its own patchset.

> The verification function requires an info string formatted as a
> space-separated list of key=value pairs.  The following parameters need to
> be provided:
> 
>  (1) sighash=<algo>
> 
>      The hash algorithm to be used to digest the data.
> 
>  (2) pss_mask=<type>,...
> 
>      The mask generation function (MGF) and its parameters.
> 
>  (3) pss_salt=<len>
> 
>      The length of the salt used.
> 
> The only MGF currently supported is "mgf1".  This takes an additional
> parameter indicating the mask-generating hash (which need not be the same
> as the data hash).  E.g.:
> 
>      "sighash=sha256 pss_mask=mgf1,sha256 pss_salt=32"

One of the issues with RSASSA-PSS is the excessive flexibility in the
parameters, which often end up being attacker controlled.  Therefore
many implementations of RSASSA-PSS restrict the allowed parameters to
something reasonable, e.g. restricting the allowed hash algorithms,
requiring the two hash algorithms to be the same, and requiring the salt
size to match the digest size.  We should do likewise if possible.

> +		case rsassa_pss_verify_pss_mask:
> +			if (memcmp(args[0].from, "mgf1", 4) != 0)
> +				return -ENOPKG;

Out-of-bounds read.

As I mentioned in another reply, error-prone string parsing isn't a
great choice.  C has native support for function parameters.

> +static int emsa_pss_verify(struct rsassa_pss_ctx *ctx,
> +			   const u8 *M, unsigned int M_len,
> +			   const u8 *EM, unsigned int emLen)
> +{
> +	unsigned int emBits, hLen, sLen, DB_len;
> +	const u8 *maskedDB, *H;
> +	u8 *mHash, *dbMask, *DB, *salt, *Mprime, *Hprime;
> +	int err, i;
> +
> +	emBits = 8 - fls(EM[0]);
> +	emBits = emLen * 8 - emBits;

This does not implement EMSA-PSS-VERIFY correctly.  Please check the
specification.  emBits is supposed to be determined solely from the
public key.

Please also add KUnit tests for this code, including edge cases.

FYI: it will take a couple more passes to properly review this:
unfortunately this encoding scheme is a bit complicated, and some of
your implementation choices like using strings instead of
straightforward function parameters don't particularly help.  These are
just a couple things I noticed in a first pass.

- Eric

