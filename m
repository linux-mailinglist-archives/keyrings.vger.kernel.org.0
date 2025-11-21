Return-Path: <keyrings+bounces-3418-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99016C7BD87
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 23:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5AD5E4E16BD
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 22:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE727301716;
	Fri, 21 Nov 2025 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+4GTFpB"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F9283FF5;
	Fri, 21 Nov 2025 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763792; cv=none; b=evrhrc+M+K9L0b48sDptZeYyT3al3rrK2NNLukS3TVyJr9Ps+0WIdQHx7ZEl1ocO7maTzBiNxH4GQc9gWn1r+6CnA2yKyqZWuAbfWGuOBIHC2qcBL+G0IeZrkf+LiS9Ee89XBPqVVmq6bvHEdiedgJ5cKMwuwhaHLoKz6yhY3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763792; c=relaxed/simple;
	bh=e9ZqBXP95c4OSOZyJl1u2zIaA+FI5tFCCZnvQ3XZ8b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4+xz0W4IbHHjyITmjzf0Hp8r1hsKncJP7y9+0eaRUj/EpJuVKhO3zubc4PqGHrUBSgbewm4FPpSUnAZC/e2u6EW6nkGEwdHSKA9RCAqXW05qn4cHWFqbZbihU4W9l/bye+d5vk2CtQ2h0zEgU5dlOZudoGuL20Fapg2DW1qug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+4GTFpB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F206C4CEF1;
	Fri, 21 Nov 2025 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763792;
	bh=e9ZqBXP95c4OSOZyJl1u2zIaA+FI5tFCCZnvQ3XZ8b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+4GTFpBed2rY5ZRjETnCWRIMeoIsX9hQcF67lauBRnOPY+4c9BW+Xt1vnUCV0c4P
	 eo3SEnK7aGfu7gicFcYiPNtcHT2XGf8BEuj1XXgVaTtnFLtU6z1chw+pL+vNXOth/B
	 KFOH2EvD9fldKZEFwvEpXJf6jKdln3noFcc2Ci1zGb4PbTvozRaw2pnFdfmEXvJLuU
	 woez9+2wJA6nG99k63+PN0yMFzgtR2N8ek16gBM78Aso9VeTo0M1OBLspa+HzVQ969
	 EJFspqNPa2OhWNTDkEGSy/+wCxb7i8KDj6WKWa3yRseKE7JedL0lxKpocSsDXCeNys
	 6Z3qHw7w+ogmQ==
Date: Fri, 21 Nov 2025 22:23:09 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251121222309.GA3300186@google.com>
References: <20251121005017.GD3532564@google.com>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
 <3067069.1763761171@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3067069.1763761171@warthog.procyon.org.uk>

On Fri, Nov 21, 2025 at 09:39:31PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > > > +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) != 0)
> > > > +		return -EBADMSG;
> > > 
> > > Actually, this should return -EKEYREJECTED, not -EBADMSG.
> > 
> > Who/what decided that?
> 
> I did.  When I added RSA support in 2012 for module signing.  Note that it
> was originally added as part of crypto/asymmetric_keys/ and was not covered by
> a crypto API.  The RSA code has since been moved to crypto/ and is now
> accessed through the crypto API, but it has retained this error code and this
> is also used by other public key algos.
> 
> > A lot of the crypto code uses -EBADMSG already.
> > crypto_aead uses it, for example.
> 
> ecdsa.c:60:	return -EKEYREJECTED;
> ecrdsa.c:111:		return -EKEYREJECTED;
> ecrdsa.c:139:		return -EKEYREJECTED;
> ecrdsa.c:239:		return -EKEYREJECTED;
> rsassa-pkcs1.c:293:		return -EKEYREJECTED;
> rsassa-pkcs1.c:295:		return -EKEYREJECTED;

crypto/aegis128-core.c:442:             return -EBADMSG;
crypto/aegis128-core.c:499:             return -EBADMSG;
crypto/algif_aead.c:313:                        if (err == -EIOCBQUEUED || err == -EBADMSG || !ret)
crypto/authenc.c:223:           return -EBADMSG;
crypto/authencesn.c:220:                return -EBADMSG;
crypto/ccm.c:336:                       err = -EBADMSG;
crypto/ccm.c:384:               return -EBADMSG;
crypto/chacha20poly1305.c:90:           return -EBADMSG;
crypto/dh.c:207:                                ret = -EBADMSG;
crypto/dh.c:221:                                ret = -EBADMSG;
crypto/dh.c:242:                ret = -EBADMSG;
crypto/ecdsa.c:37:              return -EBADMSG;
crypto/ecrdsa.c:101:            return -EBADMSG;
crypto/gcm.c:471:       return crypto_memneq(iauth_tag, auth_tag, authsize) ? -EBADMSG : 0;
crypto/krb5enc.c:259:           return -EBADMSG;
crypto/rsa.c:150:               ret = -EBADMSG;
crypto/rsa.c:189:               ret = -EBADMSG;
crypto/rsassa-pkcs1.c:275:              return -EBADMSG;
crypto/rsassa-pkcs1.c:282:              return -EBADMSG;
crypto/rsassa-pkcs1.c:286:              return -EBADMSG;
crypto/rsassa-pkcs1.c:288:              return -EBADMSG;
crypto/testmgr.c:90:     * algorithm might result in EINVAL rather than EBADMSG, due to other
crypto/testmgr.c:2179:      (err != vec->crypt_error && !(err == -EBADMSG && vec->novrfy))) {
crypto/testmgr.c:2183:              vec->crypt_error != 0 && vec->crypt_error != -EBADMSG)
crypto/testmgr.c:2184:                  sprintf(expected_error, "-EBADMSG or %d",
crypto/testmgr.c:2187:                  sprintf(expected_error, "-EBADMSG");
include/crypto/aead.h:37: * operation is that the caller should explicitly check for -EBADMSG of the
include/crypto/aead.h:39: * a breach in the integrity of the message. In essence, that -EBADMSG error
include/crypto/aead.h:375: * Return: 0 if the cipher operation was successful; -EBADMSG: The AEAD

That list actually includes the same three files that use -EKEYREJECTED.
It looks like if the signature verification fails "early" it's -EBADMSG,
whereas if it fails "late" it's -EKEYREJECTED?  I'm skeptical that
that's a meaningful difference.  And it's not like this is documented
either; crypto_sig_verify() just says "error code in case of error".

- Eric

