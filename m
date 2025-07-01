Return-Path: <keyrings+bounces-2880-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC883AEED17
	for <lists+keyrings@lfdr.de>; Tue,  1 Jul 2025 05:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA9547A4D70
	for <lists+keyrings@lfdr.de>; Tue,  1 Jul 2025 03:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8F153598;
	Tue,  1 Jul 2025 03:49:32 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7091E502;
	Tue,  1 Jul 2025 03:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751341772; cv=none; b=S6rWHolipSzWYUzMErI5nL2V8Wv8o0feWk2VN/VaCKBab7AO6IqEV2U4ORaQxfr3A48i0QGz9mauGL/IzOmgGyn+2y7zcNkk887hK/489zyjAIlqEdxKNCJC5sNt46ZMzRWBEHVIk5Z6T94E3Co2h37om0sU0NILi/V/KYIP+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751341772; c=relaxed/simple;
	bh=WfErUWWO0FHy2yvR45YOitzVe3ayn4SCITWeqCcEojk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ct3Bcbq9+MofL/dlv25XgMfksyv6lHiIebU4+PaTWZKqJoHVlXYOFl2gWQgUtI8muyYfl/XUCkD+9qH4F6Rt0DgGtU1KOwFNs+YiKTbK1PrspOmhQaZx1uVlLZdNtLb4YXmtr3Rbv5ulag2ww6A4z5TG9/FJbPcgPj1gZ/bDmsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bWTVQ6gzpz1R8g2;
	Tue,  1 Jul 2025 11:46:54 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 61C87140295;
	Tue,  1 Jul 2025 11:49:25 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 11:49:24 +0800
Message-ID: <d612599a-b773-42ca-acfa-67b6867f96e6@huawei.com>
Date: Tue, 1 Jul 2025 11:49:23 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, <keyrings@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100007.china.huawei.com (7.202.181.92)

Hi,

On 7/1/2025 3:41 AM, Dan Carpenter wrote:
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
>> To reintroduce the sm2 algorithm, the patch set did the following:
>>   - Reintroduce the mpi library based on libgcrypt.
>>   - Reintroduce ec implementation to MPI library.
>>   - Rework sm2 algorithm.
>>   - Support verification of X.509 certificates.
> 
> Remind me, why did we remove these?
> 

At first, the process of calculating the digest with the SM2 certificate
was coupled with the signature verification process, and this 
unreasonable situation was corrected with commit e5221fa6a355 ("KEYS: 
asymmetric: Move sm2 code into x509_public_key "). However, this commit 
also caused SM2 to be unable to verify secondary certificates due to its 
special implementation. This issue was not resolved, which led to the 
removal of the sm2 algorithm.

