Return-Path: <keyrings+bounces-1921-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24095B4EE
	for <lists+keyrings@lfdr.de>; Thu, 22 Aug 2024 14:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5AA287FBC
	for <lists+keyrings@lfdr.de>; Thu, 22 Aug 2024 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC5B17E007;
	Thu, 22 Aug 2024 12:25:31 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055F26AF6;
	Thu, 22 Aug 2024 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724329531; cv=none; b=uecJb/HEGHfi2tJo34lpatcuGGQH5wheE6/KOXpCttg81LRwNefA5ZLSL1lZzxF/2NnxKHdaRILMFNiekt/3bh8xuYj5AJyRC4JWRPw+Q8kz/eJY+JslKeQIgZ7a6iGcSKSFfJF+zK4Qp5gYsmXUmidVaLtzT9GquMM6e35S99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724329531; c=relaxed/simple;
	bh=dJ5mpFMi78HZmb+SvzJ5RYBqU7yDrCKeTBnQvLGst3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUwYkF+038VtWV3cVjKHtVrVV5AtP8HRuAm60TIAVJjEUcg1deLss45m3tENajbZyVDSAHdH+H8er4h30E40m7SYpkJ0RfhpQ+u1vGfCdYGMisfol0oqBef3b3ii5xnA3Zec5P+q6PSG1LXoJInxnRyMa2f3tBSZuT98KYVprRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id CCE562801089B;
	Thu, 22 Aug 2024 14:25:18 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A1A4F5B1EB; Thu, 22 Aug 2024 14:25:18 +0200 (CEST)
Date: Thu, 22 Aug 2024 14:25:18 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify
 op
Message-ID: <ZscuLueUKl9rcCGr@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
 <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
 <ZrG6w9wsb-iiLZIF@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrG6w9wsb-iiLZIF@gondor.apana.org.au>

On Tue, Aug 06, 2024 at 01:55:15PM +0800, Herbert Xu wrote:
> The link between sig and akcipher is meant to be temporary.  The
> plan is to create a new low-level API for sig and then migrate
> the signature code over to that from akcipher.
> 
> Yes we do want to get rid of the unnecessary SG list ops but is
> it possible to side-step this for your work? If not perhaps you
> could help by creating the low-level API for sig? :)

Status update -- I've done that and pushed an initial version to:

  https://github.com/l1k/linux/commits/spdm-future

in commits:

  629611b crypto: sig - Introduce sig_alg backend
  39b2f45 crypto: ecdsa - Migrate to sig_alg backend
  e603b20 crypto: ecrdsa - Migrate to sig_alg backend
  299f197 crypto: rsa-pkcs1pad - Deduplicate set_{pub,priv}_key callbacks
  6c5ec06 crypto: rsassa-pkcs1 - Migrate to sig_alg backend
  6d95a64 crypto: rsassa-pkcs1 - Harden digest length verification
  17ac60d crypto: rsassa-pkcs1 - Avoid copying hash prefix
  c6c7360 crypto: drivers - Drop bogus sign/verify operations
  fb4fa6c crypto: akcipher - Drop sign/verify operations
  fb5f4d2 crypto: sig - Move crypto_sig_*() API calls to include file

I'll have to polish and test this a little more before submission.

However, I came across a snag:

There's a virtio interface for akcipher implemented by:

  drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
  include/uapi/linux/virtio_crypto.h

That's user space ABI, so we're stuck with it.  The user space ABI
combines sign/verify and encrypt/decrypt in common structs.

But it should be possible to change virtio_crypto_akcipher_algs.c
so that it uses crypto_sig or crypto_akcipher depending on the
virtio request.

That will take some more time and because I also need to prepare
for Plumbers, this work may get delayed until the next cycle.

If you want to review and maybe apply a first batch of patches to
migrate the algorithms, I can submit that.  But the removal of
sign/verify from akcipher with the above-mentioned commit fb4fa6c
("crypto: akcipher - Drop sign/verify operations") cannot happen
until virtio is migrated.

Thanks,

Lukas

