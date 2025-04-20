Return-Path: <keyrings+bounces-2645-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5CA946D2
	for <lists+keyrings@lfdr.de>; Sun, 20 Apr 2025 08:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3F61894272
	for <lists+keyrings@lfdr.de>; Sun, 20 Apr 2025 06:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF6F19258E;
	Sun, 20 Apr 2025 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="SfuMBaqC"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC41373;
	Sun, 20 Apr 2025 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745131211; cv=none; b=hcI2UGYbqn4rbi+sWlTxUX6bRWI28/Djc77rdOVYM6HmPo79/DbhuLGX2c2+n79eBBWQkhLVTPPvqdTK324wrfU3qKWrfKTr0Vvol3iSsUxAa1+mRv68AssqNiU/F3mZDjXEzHlLRBlzeZUE3Ul6jt6seyYddjQpPzn2JzPBqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745131211; c=relaxed/simple;
	bh=TMKqFLJUPKsSq4QBQnnNnTSgXYg1nBK+QD4qSFt1mt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwkGaGoFAsm3SLFinwpEroH/1Zh3LLAcN3DLo+wiin6qDlyF+hmnDfyyj7Z4E1Y/I83+YIZuPWyyMPrc4qcw5Z5I9ZWhZf0AY8fWS/z/KjAktq21F4BcypezakTT3QVpORNSlGkIh5WoN/eg7FD7stJ6jH9SB46UADILuAm4rOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=SfuMBaqC; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8yBRXEpl/zJ2DC6+BgwWilj/xw5IQ+a0xstsD+P+cM0=; b=SfuMBaqCsK502ZPFFK7FlC6u7N
	9lKYLN7KvkrCS54daxBdS6M20Lk0jdHWpT2aYdDZFoAJ22FipPZCbbJq22aca4QORUBCpn5L5BD8b
	7U70QCi3ZnWit1QzA+SKI9Zgof0Wza9Jl+8CjCwvBk794kVM7FBiJJmYWBWr/1+fjCoQXW0rpwkIy
	NCAlpJYacjC+W/wOBefRSNw84iUsETtUKT5ZLQUukNLpI8BfqAZvl6uyBkofvWTIFZxJ25JhMEwcO
	P3aI5xtOGGzQPuOc0xAMDJnmI/H0ForWRdtO5y7RcdYLbPARZr1WDlieT0Z+0Vwig2yulJSvW8TdD
	hTSfO6Mg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u6OKa-00H6Gs-0J;
	Sun, 20 Apr 2025 14:39:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 20 Apr 2025 14:39:08 +0800
Date: Sun, 20 Apr 2025 14:39:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	ogabbay@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, derek.kiernan@amd.com, dragan.cvetic@amd.com,
	arnd@arndb.de, praveen.jain@amd.com, harpreet.anand@amd.com,
	nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
	ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <aASWjGNpn1QZYgZb@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
 <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
 <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
 <5f49d271-fdf3-3b52-664a-3f576bc3c61e@amd.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f49d271-fdf3-3b52-664a-3f576bc3c61e@amd.com>

On Thu, Apr 17, 2025 at 09:02:15PM +0530, Gupta, Nipun wrote:
>
> Thanks for pointing out to the C file, but as these these system calls can
> support only synchronous operations, precludes their use for asynchronous
> operations. In the TLS handshakes, where multiple connections occur
> simultaneously, asynchronous operations are beneficial. OpenSSL ASYNC
> support can very well utilizes the asynchronous operations while
> establishing multiple TLS connections.

In that case we should extend af_alg to support akcipher algorithms.

Having every crypto driver make up its own user-space PKI interface
is not scalable.

I held back on adding akcipher to af_alg because it would lead to
the freezing of our akcipher API.  But it's time to do this.

Being the first user of such an interface, could you please post
your OpenSSL patches as well so that we can look at what's actually
needed?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

