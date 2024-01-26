Return-Path: <keyrings+bounces-504-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEE83D6D4
	for <lists+keyrings@lfdr.de>; Fri, 26 Jan 2024 10:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBEB71C2886F
	for <lists+keyrings@lfdr.de>; Fri, 26 Jan 2024 09:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD650A94;
	Fri, 26 Jan 2024 08:59:49 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9898850A9C;
	Fri, 26 Jan 2024 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259589; cv=none; b=bd/FWSQosuH8w1+B5AIkbqLuMNZnQlk6hG60Dm56jP3209CnvNU+DBBWLKBNnnDJXvcG5u+E8kF4EZe2g+51MJm2eFIBwsHSLcgDvKpItOsE+lctwohf+6Lrozfyz/bp2TCtsb3hKgdr85AJXIcFYtma3yPz6sfII9Y8K2vVWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259589; c=relaxed/simple;
	bh=BFZKQfwPlkgBrQm0U3pdSu3J+I3igl1BqYMLLM1Hs6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6jqaU6VduAek7FKTneuxBMqwKW+xwYoZuqXGVGHSVtvbi93jrdintQ2pXqeb4uutoSYuWMK1iAJkGhUPyDS51LQIEDk+9niFIpKNLlwdolpbLoWaROR24CPuDWoikYkjNRoGRU4jg9LSKaF941EdLyg560dIiSlZgiOu/qUKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rTI3q-006EcS-2V; Fri, 26 Jan 2024 16:59:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 26 Jan 2024 16:59:54 +0800
Date: Fri, 26 Jan 2024 16:59:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: clayc@hpe.com
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, dhowells@redhat.com,
	davem@davemloft.net
Subject: Re: [PATCH] KEYS: include header for EINVAL definition
Message-ID: <ZbN0ikVlrgRqyByZ@gondor.apana.org.au>
References: <20240107132842.4024084-1-clayc@hpe.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240107132842.4024084-1-clayc@hpe.com>

On Sun, Jan 07, 2024 at 09:28:42PM +0800, clayc@hpe.com wrote:
> From: Clay Chang <clayc@hpe.com>
> 
> This patch includes linux/errno.h to address the issue of 'EINVAL' being
> undeclared.
> 
> Signed-off-by: Clay Chang <clayc@hpe.com>
> ---
>  include/crypto/public_key.h | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

