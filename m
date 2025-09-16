Return-Path: <keyrings+bounces-3005-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEBB59500
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 13:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F46481D1F
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DE52D3EE3;
	Tue, 16 Sep 2025 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="Q4aKG0Gn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B32D3ECF
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021668; cv=none; b=P+qz3nNeaJn7zeMWOJRwUDDVYYuiy4Nc4BM477GHKA1y3CdSWDKss/J2c7+nlIPB008p/oPVOg8HmR4/kdF+W6av0Wy+GVmXJJjILcoVqZDzWOqpUBZ3olPodMvxYEYVRKziv/I7+hUsemFaE5Xha4j9FgAW6jCUBDdPIpZ41vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021668; c=relaxed/simple;
	bh=Vu7q5K44by3gRNg9xWCjU9JjMl8le+gA/WjVOxuq3io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtRPWSsdttgt8Uasg7+DsBTqk8etZQvafZdDNASuHvmg3VZxLs2HRUeDK1qoEJdhyEG3j7NmTsReEk4YXr8/mNtjq/iNg1XkLvfswc1vA1l6xyeNEH5lttYOBkrVrV48zvkRbWxEiX1eFSDBO/zIa53r1e/Pp79aOy5rFNvMhho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=Q4aKG0Gn; arc=none smtp.client-ip=62.149.158.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id yTk6uH7veloieyTk6ucXff; Tue, 16 Sep 2025 13:21:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1758021662; bh=Vu7q5K44by3gRNg9xWCjU9JjMl8le+gA/WjVOxuq3io=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=Q4aKG0GnxEdJcSjuhmbyFXJ7CufE1ALf7IQFD9rM9xOZVmDGc8ptiZXdhpa2q53Wm
	 vee6wX/U8DGMVOW6PgT7f31L5cdqtuQqkZAqWqJGVmkReFBeVaxX5vmLh6MOGad7uC
	 2Lq+2Gl74a259w8tNCZs7TRlLgTPqniKBwMvaSGrANb1EBnUjgbBX4E1LA3GunxM72
	 0plgTfryDvbjk1hplwBbz8re0iWtGSxaR3+R4rSfXDd2ZaXLDqTvYqPZdAMyP5NBXU
	 aGWdIZOsaih2ntIELJOllpADuKDlu8b8P3veDP6s5/+073u5kbpwg+nWW6LeKZbvDn
	 /z6OzHgVBltrw==
Message-ID: <ef47b718-8c6b-4711-9062-cc8b6c7dc004@enneenne.com>
Date: Tue, 16 Sep 2025 13:21:02 +0200
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
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <CALrw=nEadhZVifwy-SrFdEcrjrBxufVpTr0BSnnCJOODioE1WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAxgkrqOL4RpzVRAfC7dIYsB5s9WxLAtz0wzUGg0woDghJJNwNnc1BmqP+qkOxMnKs31pZ5gWCcY9qg7M0Dpxy7ekvR78jEDTgL+heHjiys73EpN5Cqw
 +zeaSRJ3zi1efz+4Lo2pvw5xOX/Tjpudd0gCVw9zJV9zO94cemfCOkqx4PIjnFxRYBRO0tebegJF/OUrwKk0JmVzNfzbCwCKyGoDXw1PdC/HNuF1jWLke/Uo
 /Y9zPLaF+7AYwNQwefpONmzLK0PXrT38vujQmNi0hnljselBC8qKxmhYqMxpZOm7EQ+Y0GH0xfPCpv7sfVnnlOoJRXLddJQ4ZeCi2Qn0Dg1pJO2TPInvdeto
 hcOX9eKob/W7X+hSVbd+5Vzd66tlfq9dh0l6Rb5oW2vkboPeFA4t8f7WcFBbifSNT4Is3/iU

On 16/09/25 12:21, Ignat Korchagin wrote:
> On Tue, Sep 16, 2025 at 9:22 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>
>> On 16/09/25 06:10, Herbert Xu wrote:
>>> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
>>>>
>>>> The main purpose of using this implementation is to be able to use the
>>>> kernel's trusted keys as private keys. Trusted keys are protected by a TPM
>>>> or other hardware device, and being able to generate private keys that can
>>>> only be (de)encapsulated within them is (IMHO) a very useful and secure
>>>> mechanism for storing a private key.
>>>
>>> If the issue is key management then you should be working with
>>> David Howell on creating an interface that sits on top of the
>>> keyring subsystem.
>>>
>>> The Crypto API doesn't care about keys.
>>
>> No, the problem concerns the use of the Linux keyring (specifically, trusted
>> keys and other hardware-managed keys) with cryptographic algorithms.
>>
>>   From a security standpoint, AF_ALG and keyctl's trusted keys are a perfect
>> match to manage secure encryption and decryption, so why not do the same with
>> KPP operations (or other cryptographic operations)?
> 
> I generally find the AF_ALG API ugly to use, but I can see the use
> case for symmetric algorithms, where one needs to encrypt/decrypt a
> large stream in chunks. For asymmetric operations, like signing and
> KPP it doesn't make much sense to go through the socket API. In fact
> we already have an established interface through keyctl(2).

I see, but if we consider shared secret support, for example, keyctl doesn't 
support ECDH, while AF_ALG allows you to choose whether to use DH or ECDH. 
Furthermore, AF_ALG allows us to choose which driver actually performs the 
encryption operation!

In my opinion, keyctl is excellent for managing key generation and access, but 
using AF_ALG for using them isn't entirely wrong even in the case of asymmetric 
keys and, in my opinion, is much more versatile.

> Now, in my opinion, the fundamental problem here is that we want to
> use trusted keys as asymmetric keys, where currently they are just
> binary blobs from a kernel perspective (so suitable only for symmetric
> use). So instead of the AF_ALG extension we need a way to "cast" a
> trusted key to an asymmetric key and once it is "cast" (or type
> changed somehow) - we can use the established keyring interfaces both
> for signatures and KPP.

IMHO the fact that trusted keys are binary blobs is perfect for use with AF_ALG, 
where we can specify different algorithms to operate on. :)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

