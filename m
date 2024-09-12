Return-Path: <keyrings+bounces-2036-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58265976DBD
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 17:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04CBE1F29C2A
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 15:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3C2548E0;
	Thu, 12 Sep 2024 15:27:48 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368D1ABEDB;
	Thu, 12 Sep 2024 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726154868; cv=none; b=TSwqPE7NAct9TayzS+Z1uVwKR7RyZ+QDUSD6Cua36vjiU4A24A/9GOzKdGWHP80wJ7vBXHijQ+pPCv0QzsJcN9jmSYbmIIPkyPBjtZplDo/8KNPlTo34+Zw3yXDKUQoHs+QQP17bDq7FOCtnGAGWmUTXwSE2w/AGf23FFZ8URQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726154868; c=relaxed/simple;
	bh=xZ/qZP4UwQDZdtV12tuh4vcZxYv7nbDvAUUvgQGNHuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0plTTeGBnrXzyDlCi8sPjyxtCAWvT8b2W++KBkS23Cmdck+zL6AZ4TDHx4UYA2Oo3f09T7A5lNtaYl5c3r91vZQ+i9ATXtW/DmirJH6Wsrund0LKq3JxYloWgAgxYzvbNvSFsuR/XPqhYteneYnfIWYDd/N7Mer/JMmdL3LYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id A2629100DA1C3;
	Thu, 12 Sep 2024 17:27:36 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 551E0268E93; Thu, 12 Sep 2024 17:27:36 +0200 (CEST)
Date: Thu, 12 Sep 2024 17:27:36 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
Message-ID: <ZuMIaEktrP4j1s9l@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
 <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org>
 <ZuKeHmeMRyXZHyTK@wunner.de>
 <D44DDHSNZNKO.2LVIDKUHA3LGX@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D44DDHSNZNKO.2LVIDKUHA3LGX@kernel.org>

On Thu, Sep 12, 2024 at 05:19:15PM +0300, Jarkko Sakkinen wrote:
> I try to understand these in detail because I rebase later on my TPM2
> ECDSA patches (series last updated in April) on top of this. I'll hold
> with that for the sake of less possible conflicts with this larger
> series.
> 
> Many of the questions rised during the Spring about akcipher so now is
> my chance to fill the dots by asking them here.

I assume you're referring to:
https://lore.kernel.org/all/20240528210823.28798-1-jarkko@kernel.org/

Help me understand this:
Once you import a private key to a TPM, can you get it out again?
Can you generate private keys on the TPM which cannot be retrieved?

It would be good if the cover letter or one of the commits in your
series explained this.  Some of the commit messages are overly terse
and consist of just two or three bullet points.

The reason I'm asking is, there are security chips such as ATECC508A
which allow generating private ECDSA keys on the chip that cannot
be retrieved.  One can send a message digest to the chip and get
a signature back.  One can also use the chip for signature verification,
but that's less interesting because it's attached via i2c, which is
usually slower than verifying on the CPU:

https://cdn.sparkfun.com/assets/learn_tutorials/1/0/0/3/Microchip_ATECC508A_Datasheet.pdf

If TPMs support unretrievable, maybe even on-device created
private keys, they would offer comparable functionality to the
ATECC508A and that would suggest adding an asymmetric_key_subtype
which uses some kind of abstraction that works for both kinds of
devices.

I note there are ASN.1 modules in your series.  Please provide a
spec reference in the .asn1 file so that one knows where it's
originating from.  If it's originating from an RFC, please add
an SPDX identifier as in commit 201c0da4d029.

Thanks,

Lukas

