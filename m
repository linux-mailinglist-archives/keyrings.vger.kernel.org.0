Return-Path: <keyrings+bounces-2902-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F9AF759E
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 15:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 347297A4FAC
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 13:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B6814D70E;
	Thu,  3 Jul 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jKOzT2lb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585121DDD1;
	Thu,  3 Jul 2025 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549369; cv=none; b=IBtSa/Ei4AaTkeSLfljk8FKUw1qsH7I1ax1xsiJnL0hLUMWqy2H/J/ZUpRidd0P/BU19eNsEQSa0UUOcYMRrvJk8Xr7yhCiV8NaCL9fz4ySTTWHduRrNd86cbX8Csmr8Zi4S4s4b8REOFOdPQB51wV9P+XuDjeQFq+/uHqV7RvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549369; c=relaxed/simple;
	bh=XD+0M/+zCuo2tdMuEHDUd3fH2NYMzesi4Z2cIPur/bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coqHmU/mnKAXMGLtAFcwojkJ3mO+7whGm6RAEXyNJm0GICHyDoU80HMq53702QadA+7zkC3a81vmIhGRLXnLZic2q/vSaMYyS3Oxl04Gf9wl5Ubj7/iD1Gm489QxlJX8Zn1Da8G2P9CZAThLuYUsgPXSwUUHEu5xRSWSYrRvRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=jKOzT2lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F2C4CEF0;
	Thu,  3 Jul 2025 13:29:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jKOzT2lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1751549364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttQ9IlSas/7byHbl3N830DTSnlGxfWvdLVjZQAWvIdk=;
	b=jKOzT2lb2+tzjr/h7XdTM6pY64vKrZT+NyVEfAjhWGFUqRwxcaTHGJG7y2sxpY2y6iQ8bo
	XokFr/A5k9b/+tlJZt+UyTwpaq/Ff/5lpia1H9WzWV8b7+avnJ4CLcb8mg57R0/vlS44se
	0Ah1gTu1dh32SLD8z1M8TXiwfjwdL2E=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d211acee (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 3 Jul 2025 13:29:24 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:29:21 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Message-ID: <aGaFsaUOuNd1xs8m@zx2c4.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <aGaCTOJ30KNPOBIC@zx2c4.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGaCTOJ30KNPOBIC@zx2c4.com>

On Thu, Jul 03, 2025 at 03:14:52PM +0200, Jason A. Donenfeld wrote:
> Hi,
> 
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> > To reintroduce the sm2 algorithm, the patch set did the following:
> >  - Reintroduce the mpi library based on libgcrypt.
> >  - Reintroduce ec implementation to MPI library.
> >  - Rework sm2 algorithm.
> >  - Support verification of X.509 certificates.
> > 
> > Gu Bowen (4):
> >   Revert "Revert "lib/mpi: Extend the MPI library""
> >   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
> >   crypto/sm2: Rework sm2 alg with sig_alg backend
> >   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> 
> I am less than enthusiastic about this. Firstly, I'm kind of biased
> against the whole "national flag algorithms" thing. But I don't know how
> much weight that argument will have here. More importantly, however,
> implementing this atop MPI sounds very bad. The more MPI we can get rid
> of, the better.
> 
> Is MPI constant time? Usually the good way to implement EC algorithms
> like this is to very carefully work out constant time (and fast!) field
> arithmetic routines, verify their correctness, and then implement your
> ECC atop that. At this point, there's *lots* of work out there on doing
> fast verified ECC and a bunch of different frameworks for producing good
> implementations. There are also other implementations out there you
> could look at that people have presumably studied a lot. This is old
> news. (In 3 minutes of scrolling around, I noticed that
> count_leading_zeros() on a value is used as a loop index, for example.
> Maybe fine, maybe not, I dunno; this stuff requires analysis.)
> 
> On the other hand, maybe you don't care because you only implement
> verification, not signing, so all info is public? If so, the fact that
> you don't care about CT should probably be made pretty visible. But
> either way, you should still be concerned with having an actually good &
> correct implementation of which you feel strongly about the correctness.
> 
> Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> implementation, and support for weierstrauss, montgomery, and edwards,
> and... surely you don't need all of this for SM-2. Why add all this
> unused code? Presumably because you don't really understand or "own" all
> of the code that you're proposing to add. And that gives me a lot of
> hesitation, because somebody is going to have to maintain this, and if
> the person sending patches with it isn't fully on top of it, we're not
> off to a good start.
> 
> Lastly, just to nip in the bud the argument, "but weierstrauss is all
> the same, so why not just have one library to do all possible
> weierstrauss curves?" -- the fact that this series reintroduces the
> removed "generic EC library" indicates there's actually not another user
> of it, even before we get into questions of whether it's a good idea.

I went looking for reference implementations and came across this
"GmSSL" project and located:

https://github.com/guanzhi/GmSSL/blob/master/src/sm2_sign.c#L271
which uses some routines from
https://github.com/guanzhi/GmSSL/blob/master/src/sm2_z256.c

I have no idea what the deal actually is here -- is this any good? has
anybody looked at it? is it a random github? -- but it certainly
_resembles_ something more comfortable than the MPI code. Who knows, it
could be terrible, but you get the idea.

Jason

