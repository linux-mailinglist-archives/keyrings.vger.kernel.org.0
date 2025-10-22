Return-Path: <keyrings+bounces-3262-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23133BFBD53
	for <lists+keyrings@lfdr.de>; Wed, 22 Oct 2025 14:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE0855626C0
	for <lists+keyrings@lfdr.de>; Wed, 22 Oct 2025 12:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B533064A5;
	Wed, 22 Oct 2025 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DL8vOTwA"
X-Original-To: keyrings@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E4314A8B
	for <keyrings@vger.kernel.org>; Wed, 22 Oct 2025 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135793; cv=none; b=rGYIiodTPCntOwIeFwi4EQ1YJIlfwlPmsjyJS+uOx4HiGwna8H20/20A+DjcCA76JP97fcvAEHEPnRq1YkA5MQQZDQa2EqE9EdwJq0QoY/qerX9LkYKB0IVOPjdfz7f9AhZCNBl3EQkKUvett9jU0oSvdtjdKdbiuLxa9oDEWaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135793; c=relaxed/simple;
	bh=JktCQkI6ynd7sl6DFIF72HeqeQ7e4o9Q2QQ2jWvW24k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Aj45qIJEkCMwD/X28hQfLYSNAWHCLF7bke88BjLnx3TxLIQmdiXR5u8+tnCnAqDKubfMyBAvdMLtfQSHJIvo59J0ls1ruNJnHuf8nORsWICeyMVqljB25k58Z6u0tmMm7vyEgtV+CpAxrYThQny4SL7aTUyiTxL27FyMtUA2Hi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DL8vOTwA; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761135786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXBQTo0YxNH0AV9Ylz3QmVWC6p5HiT23uJ/brCIeGUs=;
	b=DL8vOTwA6JGAsocBBgFYuTlHJ1nULMgtmBemuRIogJmHoIGvl1xHJefWWth3GrnzYuDkdg
	imI+9m0fOBjUNVHKbHntErgui7/2DOr1DvLHoLDVtEwZ2whCjxv23Jh+NoQCqLlvUFYhM2
	Apy/yIhb5R9ecdIRRbu10t86/0qW9GA=
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] crypto: asymmetric_keys - prevent overflow in
 asymmetric_key_generate_id
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aO0dJeqb9E99xVvD@wunner.de>
Date: Wed, 22 Oct 2025 14:23:02 +0200
Cc: David Howells <dhowells@redhat.com>,
 Ignat Korchagin <ignat@cloudflare.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Vivek Goyal <vgoyal@redhat.com>,
 keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <73423731-F3C2-483A-BDAB-3FEF5471B8EA@linux.dev>
References: <20251013114010.28983-2-thorsten.blum@linux.dev>
 <aO0dJeqb9E99xVvD@wunner.de>
To: Lukas Wunner <lukas@wunner.de>
X-Migadu-Flow: FLOW_OUT

Hi Lukas,

On 13. Oct 2025, at 17:39, Lukas Wunner wrote:
> On Mon, Oct 13, 2025 at 01:40:10PM +0200, Thorsten Blum wrote:
>> Use check_add_overflow() to guard against potential integer overflows
>> when adding the binary blob lengths and the size of an asymmetric_key_id
>> structure and return ERR_PTR(-EOVERFLOW) accordingly. This prevents a
>> possible buffer overflow when copying data from potentially malicious
>> X.509 certificate fields that can be arbitrarily large, such as ASN.1
>> INTEGER serial numbers, issuer names, etc.
>> 
>> Fixes: 7901c1a8effb ("KEYS: Implement binary asymmetric key ID handling")
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Lukas Wunner <lukas@wunner.de>

Thank you for your review.

I removed stable@ after your feedback to v2, but shouldn't v3 be applied
to stable as well?

Best,
Thorsten


