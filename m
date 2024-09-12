Return-Path: <keyrings+bounces-2015-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A162E9763BE
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 09:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB35F1C20316
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 07:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C724518DF9B;
	Thu, 12 Sep 2024 07:59:53 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277911712;
	Thu, 12 Sep 2024 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127993; cv=none; b=Me9PRodCnkwwkrGHHMwRunbxXcKxKpBa3xMJnQBx2W1abXQicAyJS7I5bSYXlFt6PhT78huYTpWXaGmmMT9ST91Fj3FR20ztfsYCi6rWVJMjDeO9uvKdbNqaxjyxF27DDy6ukKHFL/x6+QDEctGw6DoRf91cRWhVUq88WtBL+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127993; c=relaxed/simple;
	bh=c0fWAsM3sltv3+hp98DScU6zIwiDzyN9cXhZFUkdhwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilAZyjhVS6YI2xqP1XMPAr/AYWsU4U4rcdZbpvc6P+8hU+C19Yz/a63lSoiXC8m+OD+lnwjz/8EL9QQgP/FkLcI2rrsG/+xC3ZHmU5veX/icXTWEPWrF6WzEj0nRNIoKCLZyaPk3hYigepgygnFiTfF4izusr0mBOXxUdZhhu0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5382830003C94;
	Thu, 12 Sep 2024 09:59:48 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3F7A5B312E; Thu, 12 Sep 2024 09:59:48 +0200 (CEST)
Date: Thu, 12 Sep 2024 09:59:48 +0200
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
Subject: Re: [PATCH v2 01/19] crypto: ecdsa - Drop unused test vector elements
Message-ID: <ZuKfdHnBXxvdU5Tk@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <f160f2418c98204817f93339e944529987308b32.1725972334.git.lukas@wunner.de>
 <D43FMJZBP0GO.4TZSB0B03L9E@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D43FMJZBP0GO.4TZSB0B03L9E@kernel.org>

On Wed, Sep 11, 2024 at 02:52:27PM +0300, Jarkko Sakkinen wrote:
> On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> > The ECDSA test vectors contain "params", "param_len" and "algo" elements
> > even though ecdsa.c doesn't make any use of them.  The only algorithm
> > implementation using those elements is ecrdsa.c.
> 
> I'm missing these pieces of information here at least:
> 
> - akcipher.h tells that tail contains OID, parameter blob length and the
>   blob itself.
> - akcipher.h leaves the size of those fields completely *undefined*.
> - According to call sites OID and blob length are 32-bit fields.
> - According to call sites that I bumped into they are always set to
>   zero.
> - There's no information in the kernel source code that I could fine
>   for any other rules how the should be set.
>   
> Putting random words (of which params_len is not even a word) to quotes
> does not really make this whole story obvious. You could just as well
> delete the paragraph, because that only makes you look for a struct
> that does not even exist.

As explained above, "The only algorithm implementation using those elements
is ecrdsa.c."

So if you're interested in understanding how the elements are used,
you need to look at crypto/ecrdsa.c.

Thanks,

Lukas

