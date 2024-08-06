Return-Path: <keyrings+bounces-1866-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5361948B5C
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 10:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0681F2234B
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CF8163AA7;
	Tue,  6 Aug 2024 08:33:06 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764213C81C;
	Tue,  6 Aug 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722933186; cv=none; b=f2rUdIgktcQuyD9GvD1tyYyEKVpDi4luBJSm1xni4oD3Z62tV8d+Kq+lNt3nsOxrir7Apqa8HrTKrQJn4l6dyfgrTCDpDyGuXFkprcwpM3EBA5DksjikVKNq+Qb/lhMR5m98W5O2OqyGRgMy/Y+OMSLwZlNhp0tvuyPfGYGoOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722933186; c=relaxed/simple;
	bh=Et4UrDWBSq2Ig4dCwK/PUkVMKoqWc0/cBul9G49mKe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btV+iTm+2pqgwerLh97tPefbc0uriYO/ndXv8EGG1syf+M5KcvWKPNvELFKgnhwIA6AhMuXbL/pAhfOzGNWsDwZiaJBZit/TgJbxQBCMhRx4UUQYSN+cRGXodD1i3IOKDp7obm9kALqnOGcH1SslvITuKu63+KQtxAarbvjaTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 14EA62800B489;
	Tue,  6 Aug 2024 10:32:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0E03F3F4DC; Tue,  6 Aug 2024 10:32:55 +0200 (CEST)
Date: Tue, 6 Aug 2024 10:32:55 +0200
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
Message-ID: <ZrHft0G-1BTmhF0V@wunner.de>
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
> On Mon, Jul 29, 2024 at 03:48:00PM +0200, Lukas Wunner wrote:
> > Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
> > introduced an API which accepts kernel buffers instead of sglists for
> > signature generation and verification.
> > 
> > Commit 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without
> > scatterlists") converted the sole user in the tree to the new API.
> > 
> > Although the API externally accepts kernel buffers, internally it still
> > converts them to sglists, which results in overhead for asymmetric
> > algorithms because they need to copy the sglists back into kernel
> > buffers.
> > 
> > Take the next step and switch signature verification over to using
> > kernel buffers internally, thereby avoiding the sglists overhead.
> > 
> > Because all ->verify implementations are synchronous, forego invocation
> > of crypto_akcipher_sync_{prep,post}() and call crypto_akcipher_verify()
> > directly from crypto_sig_verify().
> 
> The link between sig and akcipher is meant to be temporary.  The
> plan is to create a new low-level API for sig and then migrate
> the signature code over to that from akcipher.
> 
> Yes we do want to get rid of the unnecessary SG list ops but is
> it possible to side-step this for your work? If not perhaps you
> could help by creating the low-level API for sig? :)

I'm looking through the code right now to understand what would be
necessary to get there.

One issue I see is an algorithm name collision in rsa-pkcs1pad.c:
I think I'd have to register two instances in pkcs1pad_create(),
an akcipher_instance and a sig_instance.

And inst->alg.base.cra_name would be the same in both cases,
i.e. "pkcs1pad(%s)".  Now what?  :(

The last couple of days I've been contemplating amending
struct akcipher_alg with additional callbacks to get the
max_sig_size and max_data_size.  For RSA it's the same as
the keysize (which is available through the existing ->max_size
callback), but for ECDSA it's different depending on the
template.  Adding those new callbacks to a new struct sig_alg
would be cleaner of course than shoehorning them into struct
akcipher_alg.

Thanks,

Lukas

