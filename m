Return-Path: <keyrings+bounces-3007-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB946B59652
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 14:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16D9B2A3E32
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 12:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF7930C62E;
	Tue, 16 Sep 2025 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="JRNpG/lN"
X-Original-To: keyrings@vger.kernel.org
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5F27B353
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026215; cv=none; b=PlCsdXTay+H2HbGKcq7NQpqVddUkwIn+wikUoL7ep5yJGbI8yBHvsp1K76gs0AIKXZP4CplvhnXGRG/JkkreBN+EIIylXjnQKu8kz8pDrwDgpLz1yCK3vs92dE8y5xuElhN4FCJ7fNfnvu+CbQXrBTZdJ/0NZcDOKEhMyEm0HkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026215; c=relaxed/simple;
	bh=PjDGLNsXltZbr9iGTE6kDlLg5BFFQTHOTcQPEvFofAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W40VNxjm7hDqHf1DISK5egXvWeYv8+pdR+cnl8Z0yNYsZ1Wy5dTb5jP8Yf2o+XHbxIksFNMTmopYUtzZIDtUddnWPUslBUubdUQEDBE6/IDFeIfxporJf0cUTDeoy2WAK4/PkqC/W4cNrUDAaHu2ccZKilSxd/928UOh85UwgFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=JRNpG/lN; arc=none smtp.client-ip=62.149.158.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id yUsRuI61gloieyUsRud1q3; Tue, 16 Sep 2025 14:33:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1758026024; bh=PjDGLNsXltZbr9iGTE6kDlLg5BFFQTHOTcQPEvFofAg=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=JRNpG/lN9ncx4VGNGVlnf06N6iDT0PJF3VOFs2VSOjLoF24CpQu8POrxEqVDLZJuS
	 vlDkvd+7FPjuGgHFMamYeCGgTNdFfsnoGqONfegoblrfotICCp9WIdsbiC7oQ1L0m8
	 C1JubppIVPDCBzSWZq4/kmW73pDwBJxyXZvDp0F3awPPpi51P8rxgLy0Pc38tmlAQr
	 enGSEzJzhukCOP1tUxVlg139h6uSfK9nMXQmsEwjX1A25KKTgbz68YvjC/z61LCyRX
	 Ymilhv+3hL/eBsI5MRxuJL5XYfP8faPInRvviTuruq6Ogq7dcyUpA9XwRw1caexoBX
	 7U2mQ6Yrc/1iQ==
Message-ID: <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
Date: Tue, 16 Sep 2025 14:33:43 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 0/4] User API for KPP
Content-Language: en-US
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>
References: <20250915084039.2848952-1-giometti@enneenne.com>
 <20250915145059.GC1993@quark>
 <87f17424-b50e-45a0-aefa-b1c7a996c36c@enneenne.com>
 <aMjjPV21x2M_Joi1@gondor.apana.org.au>
 <fc1459db-2ce7-4e99-9f5b-e8ebd599f5bc@enneenne.com>
 <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com>
 <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com>
 <CALrw=nGHDW=FZcVG94GuuX9AOBC-N5OC2aXiybfAro6E8VNzPQ@mail.gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <CALrw=nGHDW=FZcVG94GuuX9AOBC-N5OC2aXiybfAro6E8VNzPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD/K45sE1mfiDMk36svJgffhGUObNeGASD1JAAo2Kk9lz2kFW9JNxzfpoQd2oiYtHEpgujcVYVr+zx7waAZZrTwJ2hedm2PiK8IytycNpFUx9RuI4pQd
 2ebPJHdJjdttOu8GBr5ME6d5vI5PkL0/Xumec4yrm1LVKxZArCKyxaEkMa7Z4WzmjTd2oZ8Haq9/hrjT3oUUPztiuD7cT6JbEZri/qcbE4JGhwuWDlIoKs47
 B2YM6LGzKyVs/WL7ilwCaZ6vjDnzVpaIXxNcxP4+eGKrIF6ylrhdy5Xz2/RSXFeGK3q8RByYi6bE/s1NEo9+tbjDtDobv/FJQvFU+591f81JYF0m/GTdjv8P
 SUhhazz5gl0o3EBUpFwL/JjHq76ZKPYZa3KNkQmwE4xwzsNA284cLBLIy/yAzzzDo87wI/lY

On 16/09/25 13:56, Ignat Korchagin wrote:
> On Tue, Sep 16, 2025 at 12:21 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>
>> On 16/09/25 12:21, Ignat Korchagin wrote:
>>> On Tue, Sep 16, 2025 at 9:22 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>>>
>>>> On 16/09/25 06:10, Herbert Xu wrote:
>>>>> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
>>>>>>
>>>>>> The main purpose of using this implementation is to be able to use the
>>>>>> kernel's trusted keys as private keys. Trusted keys are protected by a TPM
>>>>>> or other hardware device, and being able to generate private keys that can
>>>>>> only be (de)encapsulated within them is (IMHO) a very useful and secure
>>>>>> mechanism for storing a private key.
>>>>>
>>>>> If the issue is key management then you should be working with
>>>>> David Howell on creating an interface that sits on top of the
>>>>> keyring subsystem.
>>>>>
>>>>> The Crypto API doesn't care about keys.
>>>>
>>>> No, the problem concerns the use of the Linux keyring (specifically, trusted
>>>> keys and other hardware-managed keys) with cryptographic algorithms.
>>>>
>>>>    From a security standpoint, AF_ALG and keyctl's trusted keys are a perfect
>>>> match to manage secure encryption and decryption, so why not do the same with
>>>> KPP operations (or other cryptographic operations)?
>>>
>>> I generally find the AF_ALG API ugly to use, but I can see the use
>>> case for symmetric algorithms, where one needs to encrypt/decrypt a
>>> large stream in chunks. For asymmetric operations, like signing and
>>> KPP it doesn't make much sense to go through the socket API. In fact
>>> we already have an established interface through keyctl(2).
>>
>> I see, but if we consider shared secret support, for example, keyctl doesn't
>> support ECDH, while AF_ALG allows you to choose whether to use DH or ECDH.
> 
> But this is exactly the point: unlike symmetric algorithms, where you
> can just use any blob with any algorithm, you can't use an RSA key for
> ECDH for example. That is, you cannot arbitrarily select an algorithm
> for any key and the algorithm is a property attached to the key
> itself. So if you "cast" a blob to an EC key, you would need to select
> the algorithm at cast time and the implementation should validate if
> the blob actually represents a valid EC key (with all the proper
> checks, like if the key is an a big in and is less than the order
> group etc).

I understand your point; however, I believe that allowing the AF_ALG developer 
to use a generic data blob (of the appropriate size, of course) as a key is more 
versatile and allows for easier implementation of future extensions.

> With AF_ALG you would need to do this validation for every
> crypto operation, which is not very efficient at the very least.

I think this might be acceptable if we consider the security we gain compared to 
using any existing user-space implementation!

>> Furthermore, AF_ALG allows us to choose which driver actually performs the
>> encryption operation!
> 
> This is indeed a limitation of the current keyctl interface, but again
> - we probably should not select the algorithm here, but we should
> consider extending it so the user can specify a particular crypto
> driver/implementation.

Furthermore, I think one solution isn't mutually exclusive. So, why not give the 
developer the freedom to choose which interface to use? ;)

Furthermore, there's nothing stopping us from strengthening the current AF_ALG 
support so that it can also be used well with asymmetric keys.

>> In my opinion, keyctl is excellent for managing key generation and access, but
>> using AF_ALG for using them isn't entirely wrong even in the case of asymmetric
>> keys and, in my opinion, is much more versatile.
>>
>>> Now, in my opinion, the fundamental problem here is that we want to
>>> use trusted keys as asymmetric keys, where currently they are just
>>> binary blobs from a kernel perspective (so suitable only for symmetric
>>> use). So instead of the AF_ALG extension we need a way to "cast" a
>>> trusted key to an asymmetric key and once it is "cast" (or type
>>> changed somehow) - we can use the established keyring interfaces both
>>> for signatures and KPP.
>>
>> IMHO the fact that trusted keys are binary blobs is perfect for use with AF_ALG,
>> where we can specify different algorithms to operate on. :)
>>
>> Ciao,
>>
>> Rodolfo
>>
>> --
>> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
>> Linux Device Driver                          giometti@linux.it
>> Embedded Systems                     phone:  +39 349 2432127
>> UNIX programming


-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

