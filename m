Return-Path: <keyrings+bounces-2017-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D846976415
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 10:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7626F1C208BC
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7A436C;
	Thu, 12 Sep 2024 08:12:12 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E7518F2FB;
	Thu, 12 Sep 2024 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128732; cv=none; b=b6x6QphxlO/UA1YBK83J7jjXPDTCxwUCZ1awgcioybRbbC5BzYNkaV8Jy7Zcdk17FHnYV5HIlKOq0kchcCeKuR16YTqDV0L2h4uSf5r89DP6hso5SQ6E6Mz7nP8DiFx+tsPO8JRE72QY04UN5Tr2S/LlwlrHEK6iNOFYRNMGTBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128732; c=relaxed/simple;
	bh=UbMGX2oDZPSE9seClpEPKbIaE1nMuAaIAcbOL82/7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLkxEzPpBwuAwn9Okug+NGRBKl8/q/XH+6KEZ3366iy/zJD2VP0YRF8//SM5D6oeT/iP5HUP/BqVHLM7/9yDKZqbyTcDaLDWAZD2byBTZC4JJV6gXxu7sDgsrSogCP+/a7YVyQO5xodNKyOKDmXJVHF2o/HpqnHEZZhS8OLbLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 9A0F93000A0D1;
	Thu, 12 Sep 2024 10:12:07 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8570712D3BE; Thu, 12 Sep 2024 10:12:07 +0200 (CEST)
Date: Thu, 12 Sep 2024 10:12:07 +0200
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
Subject: Re: [PATCH v2 16/19] crypto: sig - Rename crypto_sig_maxsize() to
 crypto_sig_keysize()
Message-ID: <ZuKiV1uNkH1PwlJP@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <85b9d0003d8d55c21e7411802950826d01011668.1725972335.git.lukas@wunner.de>
 <D43H3UEUAXDN.2CF8RROAANPM9@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D43H3UEUAXDN.2CF8RROAANPM9@kernel.org>

On Wed, Sep 11, 2024 at 04:02:03PM +0300, Jarkko Sakkinen wrote:
> On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> > crypto_sig_maxsize() is a bit of a misnomer as it doesn't return the
> > maximum signature size, but rather the key size.
> >
> > Rename it as well as all implementations of the ->max_size callback.
> > A subsequent commit introduces a crypto_sig_maxsize() function which
> > returns the actual maximum signature size.
> >
> > While at it, change the return type of crypto_sig_keysize() from int to
> > unsigned int for consistency with crypto_akcipher_maxsize().  None of
> > the callers checks for a negative return value and an error condition
> > can always be indicated by returning zero.
> 
> Why this is so late in the series?

Because it's a prerequisite for the subsequent patch.

Thanks,

Lukas

