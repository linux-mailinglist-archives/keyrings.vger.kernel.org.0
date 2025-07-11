Return-Path: <keyrings+bounces-2920-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D8B01122
	for <lists+keyrings@lfdr.de>; Fri, 11 Jul 2025 04:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A3DA760144
	for <lists+keyrings@lfdr.de>; Fri, 11 Jul 2025 02:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2E4146A66;
	Fri, 11 Jul 2025 02:14:45 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF9B665;
	Fri, 11 Jul 2025 02:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200085; cv=none; b=s0qlKJKXkZuRh8AR64O5qHakToqU3a++r2L0amocdY0t7UreM9NBYIKrv1Cdl12m6SOJ1e1/zpPEZrLeZ5wBSTS2zkB1wI4YolgbUQR69Lt4/XIJgEfZ6fJ7pU3/kamCvNI3N86QbYPFWXSCtqXmYucpNY/nQfOYvhCSlx87Avs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200085; c=relaxed/simple;
	bh=HsCivigBSU9t2P+tGWBlpWxJJpKVlbwpxZlqF8U0KVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SJJi8uogayuGID0Gu8UFuUUFlOfymGIWJF4TEcPbjJJaM2LwXXkT9bxxdf5spaKvhS8d6RSiLYphVzmOTSgQtDAGu8gHG8UL5zfm8cMLMGw7QVEk8tgeZpGaFasTAfXma56APJ5sFleL5/CNj53hsDswD+qnYi9CMR/5CAGIGYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bdZtX72Whz2Cdk8;
	Fri, 11 Jul 2025 10:10:28 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 90F0A140278;
	Fri, 11 Jul 2025 10:14:33 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Jul
 2025 10:14:32 +0800
Message-ID: <3654a091-053a-4330-a019-a681d06166be@huawei.com>
Date: Fri, 11 Jul 2025 10:14:31 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Tianjia
 Zhang <tianjia.zhang@linux.alibaba.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, <keyrings@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <aGaCTOJ30KNPOBIC@zx2c4.com>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <aGaCTOJ30KNPOBIC@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100007.china.huawei.com (7.202.181.92)

Hi,

On 7/3/2025 9:14 PM, Jason A. Donenfeld wrote:
> Hi,
> 
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
>> To reintroduce the sm2 algorithm, the patch set did the following:
>>   - Reintroduce the mpi library based on libgcrypt.
>>   - Reintroduce ec implementation to MPI library.
>>   - Rework sm2 algorithm.
>>   - Support verification of X.509 certificates.
>>
>> Gu Bowen (4):
>>    Revert "Revert "lib/mpi: Extend the MPI library""
>>    Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
>>    crypto/sm2: Rework sm2 alg with sig_alg backend
>>    crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
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

Actually, I wasn't very familiar with MPI in the past. Previously, the 
implementation of sm2 was done through MPI, so I used it as well. 
Perhaps I could try using the ecc algorithm in the kernel.

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

Thank you for your advice, it has been very beneficial for me as I just 
started participating in the community. I will try to implement the 
functionality with more robust code and only submit parts that I fully 
understand.

Best Regards，
Guber



