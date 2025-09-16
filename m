Return-Path: <keyrings+bounces-3009-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C9B596FE
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 15:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60D3F7AC4E0
	for <lists+keyrings@lfdr.de>; Tue, 16 Sep 2025 13:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963331C2DB2;
	Tue, 16 Sep 2025 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="Hg1hyFGx"
X-Original-To: keyrings@vger.kernel.org
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C921CC58
	for <keyrings@vger.kernel.org>; Tue, 16 Sep 2025 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028063; cv=none; b=nZ3BqfxN4fU9VgWq1s79TRt6A4YhuLABp5IH3HWsVpsrJ6FL5yzzhtwb11cx8gOMg0jkPr5ecpFJxfv1tpqEU9iGFvAFXaAfR+jMQEH8LBGnWo7NoI3odI1jmJz9QO2X9nLnIt+NbCUhoqqysERIeiY8bmyWfJCC9iXSN9VuS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028063; c=relaxed/simple;
	bh=G5i6Vvy9Us+7ePSgpZfFSxHW56ndonX+dXYe3XEyFUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYsGQh9m0nwCBVA0Zur5l/FyvdmO+4ZcbK3MXiBNqhsTrAvciPu5UGJuPlQ/8mAH2gnmRiVaw6QgCJbKx68V5kS9TX39Ynzc2Qz/ZbNFNJKFhatJMIvRMHSDN1MFrwo+Li2lkxFZoF7u8NSQwhK/OCNiz9GTitULOi+CYJRpAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=Hg1hyFGx; arc=none smtp.client-ip=62.149.158.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id yVPFuIXUKloieyVPFudIGY; Tue, 16 Sep 2025 15:07:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1758028058; bh=G5i6Vvy9Us+7ePSgpZfFSxHW56ndonX+dXYe3XEyFUE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=Hg1hyFGxh/Q0sGpNzWccC79Ukk2PSoGEK3j/c5OSEVw0Kw4OKQ0JUBRmQg6KJaJrd
	 Ca36xy21lzAfIzfQJBHQCNnNgxkCKyEZK2kQCvcZipQ7eNcE91/bL5GHXGkqrze8Ko
	 vM6+AYK5LNpnfrxUJIxqfvI3bXBbkiSqszx95zzYuHZV/GR0EDVfbKBVw9i7LxOGrn
	 f+1rY/9dehvoWRyJI4M66n5C7cOV35zGBPvZ9Jj9fsr4foV+e00E1Bv0IuUgs0b3Mm
	 axJZ8U/BXe3vH2ryeZMdROOLFWJUnhNgCSKbLTYzbl5O5mbm8Fssyj3bCkf31ERcN1
	 RGjO4hrm9qQKA==
Message-ID: <6eccae32-7340-4950-9454-2f6323146126@enneenne.com>
Date: Tue, 16 Sep 2025 15:07:37 +0200
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
 <ca36a11e-ca2e-41ee-b0d3-f56586d50fd4@enneenne.com>
 <CALrw=nFSsFYtz0vo7fGyBFCZ+HGHPGSVvoDECiSWfSVbPz4OeA@mail.gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <CALrw=nFSsFYtz0vo7fGyBFCZ+HGHPGSVvoDECiSWfSVbPz4OeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCB8eFyvvfwc7y7iIsQLKydmRwqCWj3aU7EZ2ebFMMjKUR6TZhAHZRzCNxDpnIFP5YPPjss2eYgtw9mBSuINRLWf00yTBSl/A5FXEbuhyuIrIv7/sn3+
 LMkLxkDSE0UKIFQXgzGggate+knJkyX2ngzOTX6GRUoiA2PYZOSesuniTWU40RTIYEQe1jWs8FFvv7lmxeyCZpyUM3UAytLZFqfcaLe6VkfHKy0BMXkvF2rp
 NZDaO21f4ThJTh4p5jGkyZQ74jTm99hfxVizxra1lRoD+5KfljlR43GrR6yEt6tCBn61qJsueVxUlp+rLXxpUBfX/+wKK3hgVEdqeRzSsbAD1rX2mZXwit/7
 9giMVoWgsuRitvzJ/H2ldzPwSTTii+Peiy9yzeqKMKJeZoED4RYys27aDFHea31GxGFpafp+

On 16/09/25 14:43, Ignat Korchagin wrote:
> On Tue, Sep 16, 2025 at 1:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>
>> On 16/09/25 13:56, Ignat Korchagin wrote:
>>> On Tue, Sep 16, 2025 at 12:21 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>>>
>>>> On 16/09/25 12:21, Ignat Korchagin wrote:
>>>>> On Tue, Sep 16, 2025 at 9:22 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>>>>>
>>>>>> On 16/09/25 06:10, Herbert Xu wrote:
>>>>>>> On Mon, Sep 15, 2025 at 05:47:56PM +0200, Rodolfo Giometti wrote:
>>>>>>>>
>>>>>>>> The main purpose of using this implementation is to be able to use the
>>>>>>>> kernel's trusted keys as private keys. Trusted keys are protected by a TPM
>>>>>>>> or other hardware device, and being able to generate private keys that can
>>>>>>>> only be (de)encapsulated within them is (IMHO) a very useful and secure
>>>>>>>> mechanism for storing a private key.
>>>>>>>
>>>>>>> If the issue is key management then you should be working with
>>>>>>> David Howell on creating an interface that sits on top of the
>>>>>>> keyring subsystem.
>>>>>>>
>>>>>>> The Crypto API doesn't care about keys.
>>>>>>
>>>>>> No, the problem concerns the use of the Linux keyring (specifically, trusted
>>>>>> keys and other hardware-managed keys) with cryptographic algorithms.
>>>>>>
>>>>>>     From a security standpoint, AF_ALG and keyctl's trusted keys are a perfect
>>>>>> match to manage secure encryption and decryption, so why not do the same with
>>>>>> KPP operations (or other cryptographic operations)?
>>>>>
>>>>> I generally find the AF_ALG API ugly to use, but I can see the use
>>>>> case for symmetric algorithms, where one needs to encrypt/decrypt a
>>>>> large stream in chunks. For asymmetric operations, like signing and
>>>>> KPP it doesn't make much sense to go through the socket API. In fact
>>>>> we already have an established interface through keyctl(2).
>>>>
>>>> I see, but if we consider shared secret support, for example, keyctl doesn't
>>>> support ECDH, while AF_ALG allows you to choose whether to use DH or ECDH.
>>>
>>> But this is exactly the point: unlike symmetric algorithms, where you
>>> can just use any blob with any algorithm, you can't use an RSA key for
>>> ECDH for example. That is, you cannot arbitrarily select an algorithm
>>> for any key and the algorithm is a property attached to the key
>>> itself. So if you "cast" a blob to an EC key, you would need to select
>>> the algorithm at cast time and the implementation should validate if
>>> the blob actually represents a valid EC key (with all the proper
>>> checks, like if the key is an a big in and is less than the order
>>> group etc).
>>
>> I understand your point; however, I believe that allowing the AF_ALG developer
>> to use a generic data blob (of the appropriate size, of course) as a key is more
>> versatile and allows for easier implementation of future extensions.
>>
>>> With AF_ALG you would need to do this validation for every
>>> crypto operation, which is not very efficient at the very least.
>>
>> I think this might be acceptable if we consider the security we gain compared to
>> using any existing user-space implementation!
> 
> I don't think the alternative approach I proposed compromises on
> security. That is it has the same security level (using a trusted key
> to do ECDH without exposing it to userspace). Unless I'm missing
> something?

Sorry, my bad. I wasn't referring to your suggestion but to any other user-space 
only KPP (or signature) implementation that doesn't use trusted keys (e.g., 
OpenSSL, etc.).

>>>> Furthermore, AF_ALG allows us to choose which driver actually performs the
>>>> encryption operation!
>>>
>>> This is indeed a limitation of the current keyctl interface, but again
>>> - we probably should not select the algorithm here, but we should
>>> consider extending it so the user can specify a particular crypto
>>> driver/implementation.
>>
>> Furthermore, I think one solution isn't mutually exclusive. So, why not give the
>> developer the freedom to choose which interface to use? ;)
>>
>> Furthermore, there's nothing stopping us from strengthening the current AF_ALG
>> support so that it can also be used well with asymmetric keys.
>>
>>>> In my opinion, keyctl is excellent for managing key generation and access, but
>>>> using AF_ALG for using them isn't entirely wrong even in the case of asymmetric
>>>> keys and, in my opinion, is much more versatile.
>>>>
>>>>> Now, in my opinion, the fundamental problem here is that we want to
>>>>> use trusted keys as asymmetric keys, where currently they are just
>>>>> binary blobs from a kernel perspective (so suitable only for symmetric
>>>>> use). So instead of the AF_ALG extension we need a way to "cast" a
>>>>> trusted key to an asymmetric key and once it is "cast" (or type
>>>>> changed somehow) - we can use the established keyring interfaces both
>>>>> for signatures and KPP.
>>>>
>>>> IMHO the fact that trusted keys are binary blobs is perfect for use with AF_ALG,
>>>> where we can specify different algorithms to operate on. :)
>>>>
>>>> Ciao,
>>>>
>>>> Rodolfo
>>>>
>>>> --
>>>> GNU/Linux Solutions                  e-mail: giometti@enneenne.com
>>>> Linux Device Driver                          giometti@linux.it
>>>> Embedded Systems                     phone:  +39 349 2432127
>>>> UNIX programming
>>
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

