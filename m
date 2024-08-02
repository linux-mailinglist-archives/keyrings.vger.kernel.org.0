Return-Path: <keyrings+bounces-1859-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA594652E
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 23:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CD8E1F225E1
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 21:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3A5136982;
	Fri,  2 Aug 2024 21:40:22 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3925136658;
	Fri,  2 Aug 2024 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722634822; cv=none; b=uoxSRizA4ea6gU01+V04sJa+6q3F7DTQUTs5w9FpuVWweVzvraCdo04zHIbDY90FP1tBVwcttyH9TwYORFEMyfTatpfpDYz+Pnuj+pe0F6Yn7y/MUzLF2+Ip0A09zFcKQjTn4BsxqTblz8oNXW5D5dVATQb7izlFNbkwnNeo1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722634822; c=relaxed/simple;
	bh=CmvANR78IVe5deFd1xqrnqTya9fXJRXlYXKZ4KdaEh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfoRGprl2Th3df4jC5kTgM3mX+6XX2u7QrLVl8zioCSmhV/ZW6OtGKfad2pe+ANjgG1IGz64c+kuNjBE093TaAxSoNK5Mnv6rndy9U6obmVgkkfvXTrDGTZuGj/3fv/vDp2T8bBVeUMJijmAOuXEYmNNONI0ZiSdhr2dwNmKclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1D1D42800B6EB;
	Fri,  2 Aug 2024 23:40:10 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0A9259927D4; Fri,  2 Aug 2024 23:40:10 +0200 (CEST)
Date: Fri, 2 Aug 2024 23:40:10 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify
 op
Message-ID: <Zq1SOhVkhe-6Qy2A@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
 <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
 <20240801170226.000070ea@Huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801170226.000070ea@Huawei.com>

On Thu, Aug 01, 2024 at 05:02:26PM +0100, Jonathan Cameron wrote:
> On Mon, 29 Jul 2024 15:48:00 +0200 Lukas Wunner <lukas@wunner.de> wrote:
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
> Rather than passing scatter lists and buffers
> via the same function void akcipher_request_set_crypt()
> why not add a variant that takes buffers for signing cases so
> that you can maintain the scatterlist pointers for the encrypt/decrypt
> cases?
[...]
> Maybe it's worth a 'special' variant.
> static inline void akcipher_request_set_crypt_for_verify()
> so that you can keep the other list typed and not rely
> on overlapping pointer fields via the union.

I need some guidance from Herbert as to which operations he envisages
shall be migrated to kernel buffers.

Perhaps he wants to migrate the encrypt/decrypt operations as well?
The present patch migrates verify and the other ones (sign/encrypt/decrypt)
could be migrated one by one afterwards.

In that case I don't think it makes sense to introduce a new function.
We'd retain the name of the existing function and only change parameters
passed to it.

There is no caller for encrypt/decrypt operations in the tree which
uses sglists:

* The only caller of crypto_akcipher_sync_{en,de}crypt() in the tree is
  software_key_eds_op() and uses kernel buffers.
* The only callers of crypto_akcipher_{en,de}crypt() are rsa-pkcs1pad.c
  and three crypto hardware drivers which fall back to software RSA for
  certain key sizes (aspeed-acry.c, hpre_crypto.c, jh7110-rsa.c).
  They could use kernel buffers as well.

Thanks,

Lukas

