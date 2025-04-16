Return-Path: <keyrings+bounces-2639-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09EA8B2BB
	for <lists+keyrings@lfdr.de>; Wed, 16 Apr 2025 09:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3448B17F2FC
	for <lists+keyrings@lfdr.de>; Wed, 16 Apr 2025 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B435C227E8A;
	Wed, 16 Apr 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="exZZi4Xm"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAB189B9D;
	Wed, 16 Apr 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790100; cv=none; b=jO5LE8OYfZgiCermpCmC8FjA2zd6WY9StCv+9u4AvS1cgnjd4HnVh0eTutTl25ot47xpmlYOiUyHhPwwjcPeI9W4kzluNnQAZpRcs77aQzLsOyMv108sLBrSYGJalz7WCKAODS6Qlnm5Vm1/aPrGFSuBfBG44mqmgBtdW9mqvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790100; c=relaxed/simple;
	bh=GF3YRY/VdGJ8HRDSj5KRVoEnnHc2m+rQrtYehCdR4d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPJBUVNwn0xRj97lfq6fzKKQg7r8XpzNzkicLTk1jyYJUuvO0MRCz85oTygzXPcbeicxy3Ni1EBAqaohePXBN4auPvlk68qm90mtvsSvthG5kSopiGefzIjR6btzqlsfsTNzJGoBo0jmfeAo4IWFULddliU4sjZ94RtChfDlyBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=exZZi4Xm; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=owjHDvkx63hFcxsCgNXz3onLFKLz0QUom1BU5ynaaso=; b=exZZi4Xmr2kUhJbu9eb5qxcBGn
	a91bIOMLVsEktGQEPkTTjzWruPiQoK0Fc0iK38GoiEFWU/g7Oj9Wj7R8bvRMTLXfrUpC1J/v7I+gH
	5IQ8+bEnD1P+5mmx6czyRKebaXlqmB7ccRzZzR9BIp7c/+JFQxzDst23CV/hIRCOsPW4j5YjbJlPH
	qAb0wPHNEELgY0oy1IWjJiFdRvnl63xxfy+xjSKMg1WyFz6R/CvEDzE09eonPuvFoyeQ25YDFFoXq
	AmHY6cfv7CgoXGjPq1OrvHMlqB9XnwSiiAAxJxWjiFPEL7Tnd7oztOiv8OzFR9KrRCUZ4rkA6RBPo
	gZLwY/TQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xbS-00G7q8-0P;
	Wed, 16 Apr 2025 15:54:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 15:54:38 +0800
Date: Wed, 16 Apr 2025 15:54:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] crypto: x509 - Replace kmalloc() +
 NUL-termination with kzalloc()
Message-ID: <Z_9iPqyEzb70enT5@gondor.apana.org.au>
References: <20250407082247.741684-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407082247.741684-1-thorsten.blum@linux.dev>

On Mon, Apr 07, 2025 at 10:22:47AM +0200, Thorsten Blum wrote:
> Use kzalloc() to zero out the one-element array instead of using
> kmalloc() followed by a manual NUL-termination.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  crypto/asymmetric_keys/x509_cert_parser.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

