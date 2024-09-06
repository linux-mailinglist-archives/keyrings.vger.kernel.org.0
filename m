Return-Path: <keyrings+bounces-1935-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773A96EB43
	for <lists+keyrings@lfdr.de>; Fri,  6 Sep 2024 08:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46231C23D7A
	for <lists+keyrings@lfdr.de>; Fri,  6 Sep 2024 06:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2800145FFF;
	Fri,  6 Sep 2024 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="HVT8YDDS"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4674140E2E;
	Fri,  6 Sep 2024 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605988; cv=none; b=bAQazq/J7zIttZjR31Iy7Uf6DN3qO4stKWZqkteGmdcy/XnYrSQDQR1tue7L/aIoVpW0SG1vGCSDOJjZ6sI7JSuXjpNeQeLgCILrzNbgUfXvOL8PJ7RJIgS9lldL4I/9z0HeFdz+T2B2yu0i0ZED0SMp+rF3Mk5PYrMqU0ztAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605988; c=relaxed/simple;
	bh=9qEsuurv2N2uY32XnpeyGgBFlMO2uLp/Hj0P+rW9Uxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/gxx4AZ2xnIe7MZwGf73nGZVDuKNdSch2JT49khzyBJHL8L9k0qpdGdw4BdySkVt1OA8fKGcFwx7TvN5o8VZm/vip9aK5HsRcwvoPzUeYE+VfZU/GpsGmvO1ugMytv917VEVQjxXvGYMoM4jAygnChoeluCO24xXWJFA6aNDzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=HVT8YDDS; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W+UwvjYKC0vg2lzUhqUnw0heFE0B17R9zWw6oXzEWps=; b=HVT8YDDSDhLRu+pwboJjlPht7q
	v/9lTapXz8PpzuwWmY2xz8+swBK5V4vvp2ACg/4DRLCINyGf6LrF1M2JrQK36LKf/Xw8QoW27l3ff
	fSjCusepDY85fq9/gx9viBzcj4ICFR0822vewTKBSYrXwFLd4DjAtTIexW9uckmeL/SoU1tI36Cye
	fJdAn8dV+1mb90W7Y3rFoaqnSglrUbwqU7HJb4yj19gqPAb6JzZI3Z3TPdJoI7OAFknt72XS21ORO
	qHfmWQiZsECOVCwZ3IC7bXLClqda+2IkFNs1RJLYOSM4UqV0whQqznqvllNzbI5DwUE0+ztD5GvPe
	ZnLnA0gQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1smSly-000WNH-1X;
	Fri, 06 Sep 2024 14:59:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Sep 2024 14:59:00 +0800
Date: Fri, 6 Sep 2024 14:59:00 +0800
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
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify
 op
Message-ID: <ZtqoNAgcnXnrYhZZ@gondor.apana.org.au>
References: <cover.1722260176.git.lukas@wunner.de>
 <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
 <ZrG6w9wsb-iiLZIF@gondor.apana.org.au>
 <ZscuLueUKl9rcCGr@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZscuLueUKl9rcCGr@wunner.de>

On Thu, Aug 22, 2024 at 02:25:18PM +0200, Lukas Wunner wrote:
>
> That's user space ABI, so we're stuck with it.  The user space ABI
> combines sign/verify and encrypt/decrypt in common structs.

I would say that this is something that we can break.  Breaking
it is no different to running virtio on a host that does not support
these algorithms.  After all, a software implementation must always
be present.

I deliberately left akcipher out of crypto_user because the API
is still in flux.  We should not let virtio constrain ourselves.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

