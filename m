Return-Path: <keyrings+bounces-3721-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42CCF7370
	for <lists+keyrings@lfdr.de>; Tue, 06 Jan 2026 09:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA60D307725E
	for <lists+keyrings@lfdr.de>; Tue,  6 Jan 2026 08:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FBB30AAA9;
	Tue,  6 Jan 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7ZoPwzf"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10F20C00C;
	Tue,  6 Jan 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686591; cv=none; b=Wzm0FzSi2LQ6PIBunxHCcw5wUdSkoqdCBmmKllhbhwmiNBxwMFsG6kQ4sttvmqi7o/EcMlSQJiWvzeCtNFakIBsVnSYutGtSfpKcXe8bNO5HgwKl6dHphd6XVJ/8tOmiuHGz4JH61qgimgUap5cePxA61RqfxcX6L9l7v2gCulU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686591; c=relaxed/simple;
	bh=39mtTD1mKtUBs1ueaRg937mqdeu4uq3k6CxZDHkqtPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fukyH2uS0FSqgcfM879zUceaa+5tyuQUcchh5bmBf3wyKWprZQDIZQXPaAqpEcDVqumBrInc0GEUB6hW7yA/mNx6ZOmHc1q35rNpP/C3540XTieYA2x4koyOpEk53eqo45TwPOUADXICAc6JKuzsRNkVd9CRQFjegOjN1/3C4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7ZoPwzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6635C116C6;
	Tue,  6 Jan 2026 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767686590;
	bh=39mtTD1mKtUBs1ueaRg937mqdeu4uq3k6CxZDHkqtPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7ZoPwzfnmcabNZsXhhFPkC0diNTcbxD8MOxWwMcIR/D0rfnIcat+g9pKl3D4vNR8
	 p8eE3YSZadhKUqx9GtmY6slFcA+wwf2J0zl8waciGXk0txzdYSJXkag4jGw7NzIEBN
	 R5qVh8gAYMRiPLwh62oWiz1lUlVGvsRaCcbxXB76h6blFAxh0Ywu5PR44n3fmcoC21
	 XWCx3T+Gd/5jijysHW6D+l4yPhy2J6ypLMLYrDMOuOYyVS7HS/e9i29GPQjPoG5w/y
	 n5+3xJI2ity3YIpNwBZMmfYaC8SfT/W2UI5RiEAPnjyEgfNKmNRdBwMuKFFHHGdIp1
	 gdgZ6mgUBy+3Q==
Date: Tue, 6 Jan 2026 00:02:51 -0800
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
Subject: Re: [PATCH v11 3/8] pkcs7, x509: Add ML-DSA support
Message-ID: <20260106080251.GD2630@sol>
References: <20260105152145.1801972-1-dhowells@redhat.com>
 <20260105152145.1801972-4-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105152145.1801972-4-dhowells@redhat.com>

On Mon, Jan 05, 2026 at 03:21:28PM +0000, David Howells wrote:
> Add support for ML-DSA keys and signatures to the PKCS#7 and X.509
> implementations.
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
>  crypto/asymmetric_keys/pkcs7_parser.c     | 15 ++++++++++++++
>  crypto/asymmetric_keys/public_key.c       |  7 +++++++
>  crypto/asymmetric_keys/x509_cert_parser.c | 24 +++++++++++++++++++++++
>  include/linux/oid_registry.h              |  5 +++++
>  4 files changed, 51 insertions(+)

This "PKCS#7" (really CMS -- the kernel misleadingly uses the old name)
stuff is really hard to understand.  I'm trying to understand what
message you're actually passing to mldsa_verify().  That's kind of the
whole point, after all.

The message comes from the byte array public_key_signature::digest
(which is misleadingly named, as it's not always a digest).  In turn,
that comes from the following:

1.) If the CMS object doesn't include signed attributes, then it's a
    digest of the real message the caller provided.

2.) If the CMS object includes signed attributes, then the message is
    the signed attributes as a byte array.  The signed attributes are
    required to include a message digest attribute whose value matches a
    digest of the real message the caller provided.

In either (1) or (2), the digest algorithm used comes from the CMS
object itself, from SignerInfo::digestAlgorithm.  The kernel allows
SHA-1, SHA-224, SHA-256, SHA-384, SHA-512, SM3, Streebog-256,
Streebog-512, SHA3-256, SHA3-384, and SHA3-512.

So, a couple issues.  First, case (1) isn't actually compatible with
RFC 9882 (https://datatracker.ietf.org/doc/rfc9882/) which is the
specification for ML-DSA support in CMS.  RFC 9882 is clear that if
there are no signed attributes, then the ML-DSA signature is computed
directly over the signed-data, not over a digest of it.

That needs to either be implemented correctly, or not at all.  (If only
(2) is actually needed, then "not at all" probably would be preferable.)

Second, because the digest algorithm comes from the untrusted signature
object and the kernel is allowing different many digest algorithms,
attackers are free to search for preimages across algorithms.  For
example, if an attacker can find a Streebog-512 digest that matches a
particular SHA-512 digest that was used in a valid signature, they could
forge signatures.  This would only require a weakness in Streebog-512.

While the root cause of this seems to be a flaw in CMS itself, it can be
mitigated by more strictly limiting the allowed digest algorithms.  The
kernel already does this for the existing signature algorithms.

For simplicity and to avoid this issue entirely, I suggest just allowing
SHA-512 only.  That's the only one that RFC 9882 says MUST be supported
with ML-DSA.

- Eric

