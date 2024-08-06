Return-Path: <keyrings+bounces-1865-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F399948916
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 07:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 998E21C20BFA
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 05:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E701BB6BA;
	Tue,  6 Aug 2024 05:56:00 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC01BB6AB;
	Tue,  6 Aug 2024 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722923760; cv=none; b=NzWlE4yJWrzS5Wnk3U06O/1tW71kx+6K7Q8sUGo6EpLHF2IOllPudSkvTpVoV2Nbk4PZM7hMQdCtxHpSrxJwIO5DhT4DkvuNU4AuO+zL4EEb0X/fqnNEun/9S8brAyHRZhxUCUQkRAR+0kdux8TTMSUM4TmHYzvHBZmxLZXQw2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722923760; c=relaxed/simple;
	bh=bF/kPymzVwsm4G5FVZrNwYBVzG3zHnDbcM7SULwMHPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOM1pP/ez9Nb4fWsMvNJe6nOdYjUrsH+m413l66czGhiIa4oWiwlWu+H8p/VADyPBWSbtADz6AxW0JfDbfNPI6ZenhnXhDFRrbLUdAeEgizpXlmWawR9O2ItqgU6eXuLRYyGrnOLuXIEL6ZCErc+13wc3ZCKkqSRYfuw61+VMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sbD1i-002iCv-2y;
	Tue, 06 Aug 2024 13:55:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 06 Aug 2024 13:55:15 +0800
Date: Tue, 6 Aug 2024 13:55:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
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
Message-ID: <ZrG6w9wsb-iiLZIF@gondor.apana.org.au>
References: <cover.1722260176.git.lukas@wunner.de>
 <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>

On Mon, Jul 29, 2024 at 03:48:00PM +0200, Lukas Wunner wrote:
> Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
> introduced an API which accepts kernel buffers instead of sglists for
> signature generation and verification.
> 
> Commit 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without
> scatterlists") converted the sole user in the tree to the new API.
> 
> Although the API externally accepts kernel buffers, internally it still
> converts them to sglists, which results in overhead for asymmetric
> algorithms because they need to copy the sglists back into kernel
> buffers.
> 
> Take the next step and switch signature verification over to using
> kernel buffers internally, thereby avoiding the sglists overhead.
> 
> Because all ->verify implementations are synchronous, forego invocation
> of crypto_akcipher_sync_{prep,post}() and call crypto_akcipher_verify()
> directly from crypto_sig_verify().
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/akcipher.c         | 11 +++-----
>  crypto/ecdsa.c            | 27 +++++---------------
>  crypto/ecrdsa.c           | 28 +++++++--------------
>  crypto/rsa-pkcs1pad.c     | 27 ++++++++------------
>  crypto/sig.c              | 24 +++++++++---------
>  crypto/testmgr.c          | 12 ++++-----
>  include/crypto/akcipher.h | 53 +++++++++++++++++++++------------------
>  7 files changed, 76 insertions(+), 106 deletions(-)

The link between sig and akcipher is meant to be temporary.  The
plan is to create a new low-level API for sig and then migrate
the signature code over to that from akcipher.

Yes we do want to get rid of the unnecessary SG list ops but is
it possible to side-step this for your work? If not perhaps you
could help by creating the low-level API for sig? :)

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

