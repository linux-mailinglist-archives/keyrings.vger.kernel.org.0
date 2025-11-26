Return-Path: <keyrings+bounces-3445-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B6C8C0E4
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 22:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28A354E442C
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 21:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAFB304BB2;
	Wed, 26 Nov 2025 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp8Krux9"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9129D265;
	Wed, 26 Nov 2025 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193336; cv=none; b=atbSKbcjtKLDlMlbxUpC/qMhyOHbVZ0gwX57FzqFHuZxgTlHLbAl3FX5tEN4AhSyXl8funnIoTHvrK5McOBGNEsrJghWNsTEkx5t+aAnu1hp+wwGv+BcLdlVRp41xzD+w1eqlamqKNJXawT8CJIL46TH47SOfZ9W5bTxcRZ27VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193336; c=relaxed/simple;
	bh=Zi/o6mieUOCUTETAmimj2DLyaQxOhpdsZQfmWHe2yFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdhuBLrg05OrnEQhJ87UwC2BZ4nRoTg0NyS37A9qMCFuXQoi+Rf3GbI8DmbjkDba1BXHb3eD5aN3EM23VljLV2+hThhs3JmU9hYOxeh8j242ZyG1DljFmROx87wGcOu4LZ9DfGgscdh9cR6zGAqV0KoP2Nu1/Vy9hKlWV6iRlWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp8Krux9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5354C4CEF7;
	Wed, 26 Nov 2025 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764193336;
	bh=Zi/o6mieUOCUTETAmimj2DLyaQxOhpdsZQfmWHe2yFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kp8Krux9BVRY8kb0nbRPXUAxOEwXUfMppS4V+KyXbvk1nobapd2zVnbdj5XYImNSj
	 oPmlUByfiPI+/F5bQ888LbhSFGb7XP+jQMw23IRaWXvw3IU2BIrmWBSs8+4X2oQnA9
	 UcMMYsxllkG7oYdgm+grD/b1GPU3qRAFCGNoNwVpLB3q7JTSylvPxu6mNpuTTEwCJL
	 clWrhGk2qlI/gC02qBuNvW3YulIed1RSCLGXBV+IP72QmakzsRKFmeCyoUAA5k9/rV
	 ptHYQRNADHdkTLF5zDN9Y5w7UxoD7E8gfczyOjMkA50HJpN2l0zS7xamOwXBLTaqg2
	 12rEBTuMYy1Jg==
Date: Wed, 26 Nov 2025 13:42:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] lib/crypto: Add ML-DSA verification support
Message-ID: <20251126214209.GA1697@quark>
References: <20251126203517.167040-1-ebiggers@kernel.org>
 <20251126203517.167040-2-ebiggers@kernel.org>
 <IA4PR84MB4011F4D5B7EF52901829AD94ABDEA@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA4PR84MB4011F4D5B7EF52901829AD94ABDEA@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>

On Wed, Nov 26, 2025 at 09:29:10PM +0000, Elliott, Robert (Servers) wrote:
> 
> 
> > -----Original Message-----
> > From: Eric Biggers <ebiggers@kernel.org>
> > Subject: [PATCH v2 1/2] lib/crypto: Add ML-DSA verification support
> ...
> 
> > +++ b/lib/crypto/mldsa.c
> 
> > +} mldsa_parameter_sets[] = {
> > +	[MLDSA44] = {
> > +		.ctilde_len = 32,
> > +		.pk_len = MLDSA44_PUBLIC_KEY_SIZE,
> > +		.sig_len = MLDSA44_SIGNATURE_SIZE,
> > +	},
> > +	[MLDSA65] = {
> > +		.ctilde_len = 48,
> > +		.pk_len = MLDSA65_PUBLIC_KEY_SIZE,
> > +		.sig_len = MLDSA65_SIGNATURE_SIZE,
> > +	},
> > +	[MLDSA87] = {
> > +		.ctilde_len = 64,
> > +		.pk_len = MLDSA87_PUBLIC_KEY_SIZE,
> > +		.sig_len = MLDSA87_SIGNATURE_SIZE,
> > +	},
> ...
> > +	union {
> ...
> > +		/* The commitment hash.  Real length is params->ctilde_len */
> > +		u8 ctildeprime[64];
> > +	};
> ...
> > +	/* Recreate the challenge c from the signer's commitment hash. */
> > +	sample_in_ball(&ws->c, ctilde, params->ctilde_len, params->tau,
> > +		       &ws->shake);
> ...
> > +	/* Finish computing ctildeprime. */
> > +	shake_squeeze(&ws->shake, ws->ctildeprime, params->ctilde_len);
> ...
> > +	/* Verify that ctilde == ctildeprime. */
> > +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) != 0)
> > +		return -EKEYREJECTED;
> 
> Is there any way to ensure that each ctilde_len value is <= 64
> and <= the corresponding .sig_size value at compile time so there's
> no risk of overflowing any buffers?

Not at compile time, unless we do some fancy validation of each of the
three ctilde_len values against the max3() of the signature lengths
using macros.  It could be checked at runtime in a module_init function.
Seems pointless though, given that these parameters are fixed in the
ML-DSA specification.  The specification uses parameters that make sense
and are consistent with each other.

- Eric

