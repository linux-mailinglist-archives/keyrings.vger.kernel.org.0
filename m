Return-Path: <keyrings+bounces-2548-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF0A75916
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 11:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE773A5802
	for <lists+keyrings@lfdr.de>; Sun, 30 Mar 2025 09:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C3B15D5B6;
	Sun, 30 Mar 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="K6qKzCY4"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9FA38F80;
	Sun, 30 Mar 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743325680; cv=none; b=RRtYYXwleSf3OJwo4VdBp9cjtZI00ugGKiTVsgR1W+2bm7DNY+M+JHz/XPyYq07HFBxXYTmTPRJmK4H8ilMzzuExbJXgytKY8N2CbFEXGBRvQqTXgR/3I56Inh1hFrrFAm6Yzdph70WOaEoM2XaSfBDVunAq8xFtjq9OqTJuUUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743325680; c=relaxed/simple;
	bh=YEh9mjjNKFWS/tS9b/mJHTuWX4G6dvJ7J7sBxd+aJIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjBQe1wdR1+lv3zPe/BCaI2FgoAspTtZYucnQg3ijzW5q6gqa/Z8ImjeoDWmQhF9zUkgqMO8+rZ5IhOM7xg2S6tO+EQ9RUPpXQ89PM0SVIeY0I3e5xdvUR89ZxcV8rdPXw1dP0QD9+UgmWnKV/DqxRCwikA49t/pUhLmuA/46+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=K6qKzCY4; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cI2tNxonByOej+EcriXZjpqoIKnB0phbC0J6w9FUT8A=; b=K6qKzCY4g8+ht+eSwW/r4kMSxd
	pr/fGBeZppw+qOlxrRe9P/W56iyTTmKxhfzCbfDt740d8n+UToDOUTCZjZBn/AsnsaZ9sHVJWys8E
	0bVpk1JoFZYcttwP17TuZXxkcI6UFVY6ElroHOB9/dmemq/3ZzU+2sIeMRxee9MNwxF7kcVI9RLne
	5bd3fzbj8oyApTBogAqrFYWJ4N/mMUwdmyKuPXt9F04+ytEdR7eqqOMtEtSUoXdmKkEbG1cwsvChw
	RcQgmAxEkocPm2Qy9CaFbHZiG5u3xOcgRn/6j/KPQShyvE0BzhI7UIH4acp3VT7ScrTEfTs3YRv58
	WIkS70SQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tyodK-00BJyz-2q;
	Sun, 30 Mar 2025 17:07:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 30 Mar 2025 17:07:10 +0800
Date: Sun, 30 Mar 2025 17:07:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Rosen Penev <rosenp@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Message-ID: <Z-kJvk5t-ea0yizK@gondor.apana.org.au>
References: <20250314160543.605055-1-arnd@kernel.org>
 <CAMuHMdViGZRQL7toi7Arvm5L=OTK1mGmODbckE+427bx4KyWdw@mail.gmail.com>
 <4a1e3e4d-a568-4f5f-a6cc-502b9642d0eb@app.fastmail.com>
 <CAMuHMdU2k8Bmnpw88s=zA_a2m8ez=exo7OA53MkzkG=evyC+PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2k8Bmnpw88s=zA_a2m8ez=exo7OA53MkzkG=evyC+PQ@mail.gmail.com>

On Sun, Mar 30, 2025 at 10:54:12AM +0200, Geert Uytterhoeven wrote:
>
> Sure, I mean from a functional point of view.  Let me rephrase:
> When do you want to store Kerberos ticket caches within the kernel?
> Is that pure user-space, or is that done by the kernel?

I think it's purely user-space.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

