Return-Path: <keyrings+bounces-3264-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574ABFF310
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 06:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB36719C1398
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 04:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ABC268C42;
	Thu, 23 Oct 2025 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="WZq08v92"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0680F254AF5;
	Thu, 23 Oct 2025 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195478; cv=none; b=uTEqhzfbdXTjtfJlfa30MUwaDz4Fi9FYh30fIzxm/ePIhuSnwwxOhI3O2TG5CGD0oVNOnerjH3ZRXEd+4U0wEC8iya47CXVzmN6g0UdLFku0wVKKAu/842WgA3KYmckuBA2YH7OC+ZTY7zA1sL/VhMGV0t3VkwQAa/iSn59yeuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195478; c=relaxed/simple;
	bh=zTzLCyKRNxIUCFFlQy7DNcAVnnfonP6oOKMRwNh0yto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfJos+4dDkSa55vNnmYsCeZItIPlKuUJyTrMZsPbeYEvzaxvQUiBLbyjzQCysf8rwb8yxNGoyFzWdtt/uKr2leKl5n1/VGRPdMhT5Qu1+NI1d+NHhtiyv2tAjrCm0Y9KBRBbwe6nV6cUMgpv+X2q5p1ySVE8W6zsh1YgQaKjB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=WZq08v92; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=QjutTxieGvPrKP+vWG3L/WYu9AGUmrvvNSazLyVa8bo=; 
	b=WZq08v928JfeWTJzBFWIi5dHa3epOie3K5QuXSzc5WIbkp9cXa6YeF8tGz7Q88GIWWv/25d/Dvo
	DMuWojgB73usr2AkDb2BCI/ZzifBPG9Yl7DdsMyiwI+TS1zstdBZZtFEBJophsXYgyUaATMzHirPk
	vZup7vfnZRHPQ8aeWXogbaDDBZVJXwNE6rNPwnqdmu2Amde+EnPitubdK0i7ARyvKgmJsXKZG8hVO
	GCg633rDa9EOyOrsnL9yqoIxdD8CgXTKJySCxZjo4Ajb35E+d/VXS26ygi5iB9/GXxjgvIkCi6VZL
	jjF7ctDkaNBqV/d2UelHHoWqL/N7s/HZGFwQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vBnO1-00EsFS-1W;
	Thu, 23 Oct 2025 12:57:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Oct 2025 12:57:17 +0800
Date: Thu, 23 Oct 2025 12:57:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vivek Goyal <vgoyal@redhat.com>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
Message-ID: <aPm1rbMRxUZjeyEu@gondor.apana.org.au>
References: <20251013114010.28983-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013114010.28983-2-thorsten.blum@linux.dev>

On Mon, Oct 13, 2025 at 01:40:10PM +0200, Thorsten Blum wrote:
> Use check_add_overflow() to guard against potential integer overflows
> when adding the binary blob lengths and the size of an asymmetric_key_id
> structure and return ERR_PTR(-EOVERFLOW) accordingly. This prevents a
> possible buffer overflow when copying data from potentially malicious
> X.509 certificate fields that can be arbitrarily large, such as ASN.1
> INTEGER serial numbers, issuer names, etc.
> 
> Fixes: 7901c1a8effb ("KEYS: Implement binary asymmetric key ID handling")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v3:
> - Also use check_add_overflow() for adding the struct size itself as
>   suggested by Lukas
> - Drop struct_size()
> - Update patch description
> - Drop patch 2/2
> - Link to v2: https://lore.kernel.org/lkml/20251012203841.60230-1-thorsten.blum@linux.dev/
> 
> Changes in v2:
> - Use check_add_overflow() and error out as suggested by Lukas
> - Update patch description
> - Add Fixes: tag and @stable for backporting
> - Link to v1: https://lore.kernel.org/lkml/20251007185220.234611-2-thorsten.blum@linux.dev/
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

