Return-Path: <keyrings+bounces-3421-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753EC7C405
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 04:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CCBCB35EEBF
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 03:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F88221FD0;
	Sat, 22 Nov 2025 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="PMwAAoAq"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C620E702;
	Sat, 22 Nov 2025 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763781283; cv=none; b=HFSZfnI7iQp4mVqts2iNxYOinEU3Moxt6BMU0aWPvNUchdLFU6rsYkgDKiOIKEz8fFmJnZwhJhv8b/4nkbXv09AOEa2GKYBlM1rU0S8s3ceiN2oJxka9SGiLRZK2MDGLqx66CorcYLMkZCFasBSp+zOgnSgAQ+gUIms0C3X/ixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763781283; c=relaxed/simple;
	bh=tfz3gySeLaWRZkcwxx8TZ3NnEklLfUwXYqjsj+2Net0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ir8GSGVaxoMKwdWxYAIY5gBY64je+DGEFkq533s90BHGhpuTDTsKchZ6eLPxRTy03C2uZwBV/vGG7tmAwk0X5hcMS5y+eUYl2/SGNdnOdTGj3eCsFoVVM3ZdHC1wChLbwzYJ3QsseExvUyJpUKCHKrdpGmngxhMoAfnYQx98jyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=PMwAAoAq; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=si1hCYMZ4kTFY4505cLvl+gu/iTtBNfRWRlwIkNXT3o=; 
	b=PMwAAoAqTut/te0w1DTv8azc9P9YuKdOhzUL/ngiQMghGxHCzXyBe9SMGAqkj9EEUOA41X4IT0n
	hx1BA8hAyrHTvHiT/oNBrvTQUCc3sfN4ZDhKxfto55Iy9qnSyjkjlfPXp8Zx9A0AlVat4MqbRN2ss
	BmKON0xhSSX8HS8KDjtNX1srZz3Ftzi18KMNUjq/psSmrUrQ9z+q5xB6pArXjq+1XiiS2Geiwl69a
	CuM+2UISGgEzvNXqkTVjO4dP6NJxLkLXXGi2di2az6D2KRT6wdJ0IoYw16Anc7ARl05SsVm/zv+8R
	E9F7jiQHFcp22Inw07aWTQASU3DmaFoqYZgw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vMe4t-0056SK-2z;
	Sat, 22 Nov 2025 11:14:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 22 Nov 2025 11:14:23 +0800
Date: Sat, 22 Nov 2025 11:14:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] KEYS: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <aSEqj3u6l-SDIa_D@gondor.apana.org.au>
References: <aRHClatB48XT_hap@kspp>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRHClatB48XT_hap@kspp>

On Mon, Nov 10, 2025 at 07:46:45PM +0900, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
> 
> crypto/asymmetric_keys/restrict.c:20:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> This helper creates a union between a flexible-array member (FAM) and a
> set of MEMBERS that would otherwise follow it.
> 
> This overlays the trailing MEMBER unsigned char data[10]; onto the FAM
> struct asymmetric_key_id::data[], while keeping the FAM and the start
> of MEMBER aligned.
> 
> The static_assert() ensures this alignment remains, and it's
> intentionally placed inmediately after the corresponding structures --no
> blank line in between.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  crypto/asymmetric_keys/restrict.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

