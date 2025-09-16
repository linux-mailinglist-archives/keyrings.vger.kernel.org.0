Return-Path: <keyrings+bounces-3003-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7EB59097
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 10:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF613522C38
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581DB2EA46F;
	Tue, 16 Sep 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="UEOv1bMQ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48EF28CF42
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011158; cv=none; b=QBCL8vEJrfjaCSH4zdixPfqs2ZNBFcfbX91jC3aBxSRXIc406sk5TpVQt5p16289kMINz9+b4AI3H4G2yWimVMdfPMZZOpxbXkvVCILOmTFXGPi6TQ+G7bTo/FWFCgL91Cbczb1KKp9Q9mAA/Aim5zeV4bNXZpMeMbPTd9r1j08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011158; c=relaxed/simple;
	bh=0xHfYEY3U6CDYFIi4LYTmBP7CI66AU2qyZG8HO0xiPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1fx/qBC0+kDK6ptBYM8yV5TX4HQSHahmx0opHQi6IejODJpmtF61R8IfUtR7+6jCxk9/Y0+UsjsTQIFzPXhslCIncPjcK8E8JJAaKhjkLGJrBuF9pE1BqcuSf4lvILr+oKGtuUeiTovjAvI+p/A1X/rIPtLAqQCRW6UkYy3Oho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=UEOv1bMQ; arc=none smtp.client-ip=62.149.158.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id yQxZuEUb3loieyQxZuaXbq; Tue, 16 Sep 2025 10:22:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1758010967; bh=0xHfYEY3U6CDYFIi4LYTmBP7CI66AU2qyZG8HO0xiPw=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=UEOv1bMQQ+RImCi2Rb/+bJk9ZjB0GuoVPJw0+CiVNN6D+18hZdgcx+d2rYk1K4DUG
	 4gqJ8ty3OmEJSeGNwxhtWr0GjiRL+dBEtBJEuvx6j9JBsPuX5wdpLn7bSH3fWHmXt0
	 LnDlKemDCn80PatL+3SI1mjQmj6MttXj2P17UeA3ZV4Wghe8ocmF51GzSMQ0m2ZPVh
	 q8Hvre8H/4zI/ZZGF70pk+bV9sn2s+wG9aMsVZd0H58f7xhos2rZ1er5o/cDsTYtV4
	 IuScrdASIJ38DE+Wb8AK6dNc/ub+RoFMmjdQyeCbsHWTnmNPOs+/7kdVH3+QpJkEaa
	 LmgC47MyuIVcw==
Message-ID: <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
Date: Tue, 16 Sep 2025 10:22:45 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 0/4] User API for KPP
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark>
 <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
 <aMjjPV21x2M_Joi1@gondor.apana.org.au>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <aMjjPV21x2M_Joi1@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKtUpiwpljX/5MMPsGZCvOo4KkAe2n3nmZxPezNVocF86QlDDyZiRDpQmr7cW+70dQcSCjrijyyatTlzyCGgWdcEFju9x+W1csd/+8RnPQrPmVsybDqr
 BVqlQdO8G1qzcZ06zu89XbgqEIq2zOPGMSRYtOxMV5WMKwsd9ddC3Hc5upgPis1Fgr101IrUswaPgJI2PV+CtXT2t6gjZ3GJzBYCpbLOEqKdjJQhgaH48/NZ
 obfqV1oOj15qiPgWktOakQlv+w0JQ8lSp6KlmVT+SUaoD5ez40syrKDEhkVvWnwQGzsBnEzfsw+91zN03a4/JDRgdUwv7S5pnkPwS3wkWeNzcRXIeT8xDDE3
 hrEKRkYO2WTBFNdaL1DQF+3Jd15XfQdOLlG4/FJnUgroAzId4b4c1acdeNL7yzx+qzu5gIxx

On 16/09/25 06:10, Herbert Xu wrote:
> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
>>
>> The main purpose of using this implementation is to be able to use the
>> kernel's trusted keys as private keys. Trusted keys are protected by a TPM
>> or other hardware device, and being able to generate private keys that can
>> only be (de)encapsulated within them is (IMHO) a very useful and secure
>> mechanism for storing a private key.
> 
> If the issue is key management then you should be working with
> David Howell on creating an interface that sits on top of the
> keyring subsystem.
> 
> The Crypto API doesn't care about keys.

No, the problem concerns the use of the Linux keyring (specifically, trusted 
keys and other hardware-managed keys) with cryptographic algorithms.

 From a security standpoint, AF_ALG and keyctl's trusted keys are a perfect 
match to manage secure encryption and decryption, so why not do the same with 
KPP operations (or other cryptographic operations)?

I know there might be issues with allowing user space to use this interface, but:

1) I think this mechanism can get its best when implemented in hardware, and

2) (hey!) we're developers who know what they're doing! :)

This patch series is just a sample of the improvements I'd like to make on this 
front. Please tell me if you don't intend to add these mechanisms to the kernel 
at all, or if I have any chances, so I can decide whether to proceed or stop here.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

