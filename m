Return-Path: <keyrings+bounces-2901-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8780EAF7532
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 15:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4B23BDE00
	for <lists+keyrings@lfdr.de>; Thu,  3 Jul 2025 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E952E6D3A;
	Thu,  3 Jul 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A5NsHkt/"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A81F76A5;
	Thu,  3 Jul 2025 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548501; cv=none; b=qjoHPmU7FCGG7yvlVkwE4pp/cu761Itt0tlKB/TbAmtrYrE2iHXgSSjFnnVAGxi18gnr6PLK23qpt7EDhFxsNhZSR3mMyEeseMe9WT4lDcWecvSCUtFgFG9wAdQiqSgpDvGMcM84Rlu+nLuKH1sJ53yr/fXMB+H+pRFFRc1Z/vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548501; c=relaxed/simple;
	bh=x6rhCvsaJ/VXQv2sLssQ3HLVw0d6XihLUY4zvLhajbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTS79cxD595cyIJCV4aiEif2dYrcQ7RpfYriLa38KDvKUuqkT9NynJ+UbdW629WWnEZ64eB7w4J3ILqSPYHmEFQeZEJLSbL226NKBOQT8GDGEIPjN/zf+aAPrRGzR4Yf1lmwI53IaNtkQvpqKu3IQ+vA6RkusYKAOOeDvRlMuW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=A5NsHkt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FFEC4CEED;
	Thu,  3 Jul 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A5NsHkt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1751548496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xkiEb1x5aeo2U5t7p61ZjNQh1p++o+M4e3PN96IzcNk=;
	b=A5NsHkt/twS0bSDj/dJyaVEYb0DcjCIKrsfieIG5usjSVyLy5UjwXc9Fmro5QFrNm4+oN4
	zntJYgFFrWmxhGHjKr9bh3rpoCZZEUGfgjRACZntqAV8ad3nPAPoEq+xVC9ViWH+oGBfAo
	fi7x52XGQtuUYW396Ey2rPe2bCT2vII=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 91f8f88e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 3 Jul 2025 13:14:56 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:14:52 +0200
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
Message-ID: <aGaCTOJ30KNPOBIC@zx2c4.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>

Hi,

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.
> 
> Gu Bowen (4):
>   Revert "Revert "lib/mpi: Extend the MPI library""
>   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
>   crypto/sm2: Rework sm2 alg with sig_alg backend
>   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates

I am less than enthusiastic about this. Firstly, I'm kind of biased
against the whole "national flag algorithms" thing. But I don't know how
much weight that argument will have here. More importantly, however,
implementing this atop MPI sounds very bad. The more MPI we can get rid
of, the better.

Is MPI constant time? Usually the good way to implement EC algorithms
like this is to very carefully work out constant time (and fast!) field
arithmetic routines, verify their correctness, and then implement your
ECC atop that. At this point, there's *lots* of work out there on doing
fast verified ECC and a bunch of different frameworks for producing good
implementations. There are also other implementations out there you
could look at that people have presumably studied a lot. This is old
news. (In 3 minutes of scrolling around, I noticed that
count_leading_zeros() on a value is used as a loop index, for example.
Maybe fine, maybe not, I dunno; this stuff requires analysis.)

On the other hand, maybe you don't care because you only implement
verification, not signing, so all info is public? If so, the fact that
you don't care about CT should probably be made pretty visible. But
either way, you should still be concerned with having an actually good &
correct implementation of which you feel strongly about the correctness.

Secondly, the MPI stuff you're proposing here adds a 25519 and 448
implementation, and support for weierstrauss, montgomery, and edwards,
and... surely you don't need all of this for SM-2. Why add all this
unused code? Presumably because you don't really understand or "own" all
of the code that you're proposing to add. And that gives me a lot of
hesitation, because somebody is going to have to maintain this, and if
the person sending patches with it isn't fully on top of it, we're not
off to a good start.

Lastly, just to nip in the bud the argument, "but weierstrauss is all
the same, so why not just have one library to do all possible
weierstrauss curves?" -- the fact that this series reintroduces the
removed "generic EC library" indicates there's actually not another user
of it, even before we get into questions of whether it's a good idea.

Jason

