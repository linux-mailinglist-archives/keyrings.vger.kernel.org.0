Return-Path: <keyrings+bounces-2848-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63531AE1004
	for <lists+keyrings@lfdr.de>; Fri, 20 Jun 2025 01:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF0F165096
	for <lists+keyrings@lfdr.de>; Thu, 19 Jun 2025 23:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082EB25D527;
	Thu, 19 Jun 2025 23:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="nDz8fjGx"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF81624DE;
	Thu, 19 Jun 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750375369; cv=none; b=ZOYJD4HRRd4MILHMUk8d6A+fEDoCwtVY1MQZG6KQPYDcyS5xHsKVEcxKA5Qic66J0ef6idpwewZxO+xNKw+IEeK8anPVwLSGGPseCtBQrxHOvEmSCcWshJKv3v7jv3H1SkMzaeHON6dkVTcN6YJUpQhxRtf6BCYvDmCS7inJlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750375369; c=relaxed/simple;
	bh=Vfhc+F1NBou2Cp7Orz20Okwcw/W+PxblCM7CBaW11eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUAh52GwhKO/A91CE8/NI1IHik/lGqbnYzJx3oFr2glR9l4h6HoaJezaOzF+zH5Ad8qYEDyeTyJJF5+JUqsxnD9Mu4TO1pdtAFdEF9asrHRXDkTZPxEJhRY5MmL2VN/x8NfGtWi3KP5yXa5fLb6fCwTbEt3vuKJJB+lkVxjIWHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=nDz8fjGx; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W+Y2lsXPJdi1RUH/PSEB/FJQRlCoG8VD2Nqg0GB52nc=; b=nDz8fjGxN2pP7BV25fGFwk6IrT
	ABdXg3zraCQs5jIG/UqGltCl9nP70gM7q8Cf8T+Kv+zQnujizKWmGKrFVJ3OQiruAARi6R2qXoXKx
	qEH28ypgsmFsOp4+KMS8+1D6QCwxgIfsINmhcLu5XZupxv+hy+Ao/ipE7wY60o4I1IQma8VzYwcvJ
	Y+e26aicEpu4ObHlSt0D5XMJq+AGJSmhMbhJP6ifuo1I1PZA4fyuLuykPjJZeKS2eSBERAmaqRRVc
	thTSH5+0QfvPJqXepnFMISklrlohJ19s5PSob7hZtYmhbPn3YB0HVuYsCnzkAB/mVMPoH0KqhoRay
	OPtOi5SQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uSOL8-000R2r-10;
	Fri, 20 Jun 2025 07:22:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Jun 2025 07:22:26 +0800
Date: Fri, 20 Jun 2025 07:22:26 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Howells <dhowells@redhat.com>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Clemens Lang <cllang@redhat.com>,
	David Bohannon <dbohanno@redhat.com>,
	Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: Module signing and post-quantum crypto public key algorithms
Message-ID: <aFSbsteSI9xTRA1Q@gondor.apana.org.au>
References: <501216.1749826470@warthog.procyon.org.uk>
 <aFQDLCvTs8IaAQI_@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQDLCvTs8IaAQI_@wunner.de>

On Thu, Jun 19, 2025 at 02:31:40PM +0200, Lukas Wunner wrote:
>
> I assume Herbert will insist that any new algorithm is hardened
> against side channel attacks.  Thankfully, Stephan seems to have
> put some effort into that:

No I think we should instead only support public keys.  There is
no valid use-case for private keys in the kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

