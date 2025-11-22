Return-Path: <keyrings+bounces-3423-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F833C7D2B8
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 15:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F1844E50EF
	for <lists+keyrings@lfdr.de>; Sat, 22 Nov 2025 14:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E8E22156C;
	Sat, 22 Nov 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Owj1L+wU"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479E221265;
	Sat, 22 Nov 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821432; cv=none; b=DLjQqvJr03Ul04l9D7I6smU52GKKUyMPf+UFnq2cqCryIMjk9nnF1X8sseMMxfMvwZQmlQ+6dSjHN0uW3rSRnaN0LlXgmheYkl7OaXi+TlTy77Ow10McAzhs291EukSJvG6eImRlROH3D1Sba5ibFEvhLoXMUI2BXmA9wy+0vOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821432; c=relaxed/simple;
	bh=1Q5wr4hBGau0NJPeRkF+HrhSnysI8a1AWimWdnTLJso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8hpSs2oW1BFPACdZRIZGGW1JACSQt9b55bpai/y/YGbL9c4UHC+0Ji4AJh/6ySoUv4ADUm8GC3PyfiXXrtlAqdRSgTL53mkgxxORCMAIhZK1xXnRyGDWueYVZl8sXIWwf96d4QcTSKDbuOQ7gYBv4R7cTRWjrWoIOjLSTYxA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Owj1L+wU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81535C4CEF5;
	Sat, 22 Nov 2025 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763821431;
	bh=1Q5wr4hBGau0NJPeRkF+HrhSnysI8a1AWimWdnTLJso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Owj1L+wUSfr9VSJhlIVGds6Taa5hzZth8P+bavORgS1FciflzCJboEyzbAxrOkwtb
	 ffLWrYaWnX+xbgPrpN1qGePDuX8+M3nRkAi6A/qCiHESjCZt/lGx07bCi/RfqW4sGB
	 +qRmF1u18oSm/VHgIgMNXg5QLOiiVCFVfOkZzSfWyXa6exsV2ggkD3gfFpEgi32bNc
	 fXztghGz3VAcy1VYUrDNe0k+8cr6oP/5Uj32pyxRsXi87xDzB8MUUCQjJECdEFONN2
	 osYskzgVWilFQj+7tuMpFardvtlZbJCPBdwa1PdCEkCWYoFtKvWlTx78tu2gmsQCwq
	 UtjdVtqJeGkQg==
Message-ID: <33e351fb-4ecc-4894-b3c8-c0511d8fcc88@kernel.org>
Date: Sat, 22 Nov 2025 15:23:47 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: asymmetric_keys: fix uninitialized pointers with
 free attr
To: Ignat Korchagin <ignat@cloudflare.com>, Ally Heev <allyheev@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20251105-aheev-uninitialized-free-attr-crypto-v1-1-83da1e10e8c4@gmail.com>
 <CALrw=nH8z0p=nyM_S0BN0JfdUB8fQHvkH6AULD3qj6sPQ1qJig@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CALrw=nH8z0p=nyM_S0BN0JfdUB8fQHvkH6AULD3qj6sPQ1qJig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2025 14:12, Ignat Korchagin wrote:
> Hi,
> 
> On Wed, Nov 5, 2025 at 9:53 AM Ally Heev <allyheev@gmail.com> wrote:
>>
>> Uninitialized pointers with `__free` attribute can cause undefined
>> behaviour as the memory assigned(randomly) to the pointer is freed
>> automatically when the pointer goes out of scope
>>
>> crypto/asymmetric_keys doesn't have any bugs related to this as of now,
>> but, it is better to initialize and assign pointers with `__free` attr
>> in one statement to ensure proper scope-based cleanup
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
>> Signed-off-by: Ally Heev <allyheev@gmail.com>
>> ---
>>  crypto/asymmetric_keys/x509_cert_parser.c | 11 +++++++----
>>  crypto/asymmetric_keys/x509_public_key.c  | 14 ++++++++------
>>  2 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
>> index 8df3fa60a44f80fbd71af17faeca2e92b6cc03ce..bfd2cb2a9d81e3c615dfd4fe6f41653869a8cbd6 100644
>> --- a/crypto/asymmetric_keys/x509_cert_parser.c
>> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
>> @@ -60,12 +60,12 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
>>   */
>>  struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
>>  {
>> -       struct x509_certificate *cert __free(x509_free_certificate);
> 
> Should this be just initialized to NULL instead of moving the declaration?

No, it should not. That's not the syntax of cleanup.h... and if you do
not like that syntax (I fully understand), then please do not allow to
use cleanup.h in this/yours subsystem.

> 
>> -       struct x509_parse_context *ctx __free(kfree) = NULL;
> 


Best regards,
Krzysztof

