Return-Path: <keyrings+bounces-2507-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB5AA6B987
	for <lists+keyrings@lfdr.de>; Fri, 21 Mar 2025 12:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBEE3BD34E
	for <lists+keyrings@lfdr.de>; Fri, 21 Mar 2025 11:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2A81F4199;
	Fri, 21 Mar 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Q+l5nEw6"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F071F09A8;
	Fri, 21 Mar 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555228; cv=none; b=QhQV7OaslktZxOw7fyYnrldCnY6kwsbqWoUIE4QfanGpsIERBNV9eF2qo93NchQ95o5iNZwSc26he16IYqLd4dXxNyToS2Yh+2/mNuM3KeA7ibRzOw7/UXys8RY0v2YndNYCXssmUyqLMLlsFmbJ7xrSRUlIKcBQKOaMAd9d4TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555228; c=relaxed/simple;
	bh=Mhh/jGWYISEYVoqjjfMvQsP+f47HccIZcoa+4NXdSv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgdaH1tr/SMUZDde9CpuoZIeRkF01O6MWYcrwjmIM2Tzo5CLZ2ZouxK3THWS6EtvwBXfIeNnOVsLjGTJiPuMkbk6f9ZB6IzZvSWA77v2Hn6sVgjjWqoztdLHJMLPq3XN5L4o9If1dv64vakFmQndpOTULzSOkLgb259m5iNcDWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Q+l5nEw6; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QaVaGTW9001ipjEXlA8GyMzu/EmEw5sG37WJJlONmRY=; b=Q+l5nEw6J1yFdrA0OhHKhMVOvR
	Gmm3ANZ6LAIFPJnjXRfP+URq4Pq6n7BA1UEYRClGMl+fTiDFu2JHjQyAl4FJPjUwvbDBJ6u9Ac/ZZ
	4/DKfIkPM+ydObrWzuprHtlQxQnBjG0qDRKGUh9EsE/T0cgG3whsD4Dk2bEIH5vi2lseYiBbOYeUG
	/ymaEm75aJ3JLTYXj3L2gHxZqNu2b12pinjSUrAQ0wrPmAKFLK/tOQ/OJFKDJpUhd8AuWhcwT+xgB
	Vwp4dwFJSjfHAkjzeMpEUOuW44aw5XeB9Gg2cqESbze3bLE1/+Ps7AdutuIuiLQNm6Kehh4FWDrIa
	fc1axgUg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tvaCp-0090Ez-16;
	Fri, 21 Mar 2025 19:06:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 21 Mar 2025 19:06:27 +0800
Date: Fri, 21 Mar 2025 19:06:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Message-ID: <Z91IMz8bXE8_T-3r@gondor.apana.org.au>
References: <20250314160543.605055-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314160543.605055-1-arnd@kernel.org>

On Fri, Mar 14, 2025 at 05:05:32PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Any driver that needs these library functions should already be selecting
> the corresponding Kconfig symbols, so there is no real point in making
> these visible.
> 
> The original patch that made these user selectable described problems
> with drivers failing to select the code they use, but for consistency
> it's better to always use 'select' on a symbol than to mix it with
> 'depends on'.
> 
> Fixes: e56e18985596 ("lib/crypto: add prompts back to crypto libraries")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: add the missing 'select' statements
> ---
>  drivers/crypto/marvell/Kconfig | 4 ++--
>  lib/crypto/Kconfig             | 8 ++++----
>  security/keys/Kconfig          | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

