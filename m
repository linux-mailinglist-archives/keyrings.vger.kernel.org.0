Return-Path: <keyrings+bounces-3422-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A1C7C42D
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 04:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858733A645E
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 03:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FE0239085;
	Sat, 22 Nov 2025 03:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="RKo8AG6p"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200821A9F87;
	Sat, 22 Nov 2025 03:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763781505; cv=none; b=beeR2GQYrbFJhhuu4an/ZYQBpuO5XBQ4hJX9rzE81F19FR7tbWKPN+yrMTj6N+w2fEDz5ZqIJ9lzuC019Ic5cabAMzJwbYlsvVesf5pkrENxg/1W1FbV3QIgJGlpV9JhGvKO9oLQYFGA7X2z9DEGZX2YuH6oHTzC6qEJPycokZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763781505; c=relaxed/simple;
	bh=AKQ+e/Y/MvkwR6u/0bjUqMSKtYiilnHYFgc6cNgLQas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADBvdnsVaKQbcwXUb3w2FhJE4u75/5wmRCgXFprRUfHHAvjc7xsIDbBzws9Yrr7MFQYxSSWeejr2UrRuzW+WN8939Ki23S+v4/VR+9tQCAoToWawrHJkwGOK7ASjYjqlQn4I+LXixU4GRlW2tPZeQbtDBgm6htT2fUJaF3lExi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=RKo8AG6p; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=KpVONpLQsronA4PofyCxFAv6zgv7u3RHDjSnm5KlJlI=; 
	b=RKo8AG6pmJRnlyjHcVs3bobW2Y0Aq3Gd2rkZ/Cf88xEXFRpsiMP+Uku4wlku709qvElyCFRAvNA
	gm6LZ0ZJarlGmn4/HNSAxFCy0ffowK4/dZ8bzSq+7bctk8IinF14FxqQMGIX29KQ+XzQzCereSXVh
	93s990l8Eu4eI3q+noZMXjrW5QmU6apYr7cZflovBaCjWnSJItoaeMGKyM0t7WjVq1La3tPAMLxN+
	yRN/lKv5L4YsX0x7V9T1oAZoWS5rzf/eX+0VyuNNnpEOxUVDOzVRg8c6Ih4nNHLwHZpAgh20zCmTK
	208Ukz4wB2+KohgIavoZ5wbOAh8xlBzxR9Bg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vMe8U-0056WJ-2K;
	Sat, 22 Nov 2025 11:18:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 22 Nov 2025 11:18:06 +0800
Date: Sat, 22 Nov 2025 11:18:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ally Heev <allyheev@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] crypto: asymmetric_keys: fix uninitialized pointers
 with free attribute
Message-ID: <aSErbjx5TrFH7K76@gondor.apana.org.au>
References: <20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>

On Tue, Nov 11, 2025 at 07:06:29PM +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behavior as the memory assigned randomly to the pointer is freed
> automatically when the pointer goes out of scope.
> 
> crypto/asymmetric_keys doesn't have any bugs related to this as of now,
> but, it is better to initialize and assign pointers with `__free`
> attribute in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
> Changes in v2:
> - moved declarations to the top and initialized them with NULL
> - Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-crypto-v1-1-83da1e10e8c4@gmail.com
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 2 +-
>  crypto/asymmetric_keys/x509_public_key.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

