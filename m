Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6C425B2ED
	for <lists+keyrings@lfdr.de>; Wed,  2 Sep 2020 19:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIBR24 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Sep 2020 13:28:56 -0400
Received: from fallback18.mail.ru ([185.5.136.250]:41232 "EHLO
        fallback18.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBR2y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Sep 2020 13:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=b+R5dO7CUQNjuWMspNeSPFMnq8gRt6Bg2LxpwUJeQK4=;
        b=jU1RfYHzuSsdiK670Pz5MYh7AKmmXwXALPClilf4T3AMLnZUgRIBhGUYFau1U+CRnOAb1oZ9vzBfZeO4ow+IuHjCH4LAK9+3Vel5o0j9537Zg1nRmFSYPWRhIlCZoG7U4LQEoOT4tfk0XHorkgs/SXFDmYJzROfuQmxMZHHJWoM=;
Received: from [10.161.64.47] (port=46438 helo=smtp39.i.mail.ru)
        by fallback18.m.smailru.net with esmtp (envelope-from <alexey_krasikov@mail.ru>)
        id 1kDWYz-0004ml-U4; Wed, 02 Sep 2020 20:28:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=b+R5dO7CUQNjuWMspNeSPFMnq8gRt6Bg2LxpwUJeQK4=;
        b=tlHZsEwa3g8QY+LjZ2GwzFezlNXVZ1PQTgWBODE75uPbmjuk08Vyb6m/sOmEZwpktSwNhjEIpAZ/oH/n5uKwap2YwGaUMbBtj9QRzQHFpIwIGBz3fSHbDpnFqdL8Szgb8JzOuTorrhgGAvUmesRy3yo3mwYGQEhSD5EM2jZtNQw=;
Received: by smtp39.i.mail.ru with esmtpa (envelope-from <alexey_krasikov@mail.ru>)
        id 1kDWYr-0005mc-VX; Wed, 02 Sep 2020 20:28:42 +0300
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        dhowells@redhat.com
Cc:     Greg KH <greg@kroah.com>,
        Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
 <20200615170043.GA5416@linux.intel.com>
 <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
 <20200622123028.GA3502713@kroah.com> <20200623012859.GI28795@linux.intel.com>
 <5b6f4d9c-ef6f-d456-096f-4673c85d4dbd@mail.ru>
 <20200703011447.GA294568@linux.intel.com>
From:   Alexey Krasikov <alexey_krasikov@mail.ru>
Message-ID: <a8c50741-c109-8e32-e09a-e3bf2de50b50@mail.ru>
Date:   Wed, 2 Sep 2020 20:28:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200703011447.GA294568@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD91257DD5FEC048BDB3834139C8F2AF541600FCD908162DAE1182A05F53808504067C2B7FC16963A7F389957A679E68531CC9A884133831B48F649426F9B741B02
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE781307CBDB76B677BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637103BD9D8542B9C568638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC9B593ABB9C10A3FA3F2E439A7F1C000C8D90B8A4F78D1E9C389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7328B01A8D746D8839FA2833FD35BB23DF004C90652538430F06F277DF7B2D6ED7B076A6E789B0E975F5C1EE8F4F765FCCD8DAA7A11EFD9E5D81D268191BDAD3DBD4B6F7A4D31EC0B7A15B7713DBEF166D81D268191BDAD3D78DA827A17800CE79A12DC3F304A1AFDCD04E86FAF290E2DDA63EEEA5E5E9D65089D37D7C0E48F6CA18204E546F3947C0FC70B58D375E76AC6EABA9B74D0DA47C8A9BA7A39EFB7666BA297DBC24807EA089D37D7C0E48F6C8AA50765F79006371DFCA364D66B4E43EFF80C71ABB335746BA297DBC24807EA27F269C8F02392CDCDCF839C8780CBD93C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-C8649E89: 33E7035C9D31CB9C43FB9B540346B6C3A52149AD21DF6BF48060665AECEA0553DA9B28093C2978969F595CEF8576C34B
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHFGiWaM2DrndVAjaD3smMA==
X-Mailru-Sender: A124683AC41E55E24C57C1CD43F0BA4997F993AA56DAF6C50CD32B44F69E232225ABFE81B4F753085060D601A64F5073C77752E0C033A69E940053A32376DA02CA80753D337B88823453F38A29522196
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B420B1FC84709EBAA704FE14E431BD5FF0DDF2C11F4447C18668F3CF0E9FE49B69218D052558E13C499C9632B0EC72746D5C1D16CA47F271646DCCD8356F071643
X-7FA49CB5: 0D63561A33F958A5F6510BAD5B81176C5638EFE41B5C36393B66D596F6B9B31E8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC83647649DEED5BBCB92E66D81D268191BDAD3DC09775C1D3CA48CFB2EB64187AD9D165BA3038C0950A5D36C8A9BA7A39EFB7668729DE7A884B61D135872C767BF85DA29E625A9149C048EEB89ED3C7A62817811F42DF47398C4A6D4AD6D5ED66289B524E70A05D1297E1BB35872C767BF85DA227C277FBC8AE2E8BC1729CB7872DA5F275ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojHFGiWaM2DrlSBONRV7TvCg==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C90051785D1A6F86B1351766CF62C915FE4AD6067F59AFEFB189506869FDE987C96F7E7143E3D63322ACF3DDE9B364B0DF289D092D71F61A4B7D9E6CF1C79009A2470AE208404248635DF
X-Mras: Ok
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 7/3/20 4:14 AM, Jarkko Sakkinen wrote:
> On Sun, Jun 28, 2020 at 03:27:37AM +0300, Alexey Krasikov wrote:
>> On 6/23/20 4:28 AM, Jarkko Sakkinen wrote:
>>> On Mon, Jun 22, 2020 at 02:30:28PM +0200, Greg KH wrote:
>>>> On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
>>>>> On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
>>>>>> On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
>>>>>>> On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
>>>>>>>> On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
>>>>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>>>>> $ keyctl describe $KEYID
>>>>>>>>> 5927639: alswrv-----v------------  1000  1000 user: john
>>>>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>>>>> $ keyctl describe $KEYID
>>>>>>>>> 5927639: alsw-v-----v------------  1000  1000 user: john
>>>>>>>>> $ keyctl print $KEYID
>>>>>>>>> smith
>>>>>>>> A keyring default permissions are 0x3f3f0000.
>>>>>>>> A key default permissions are 0x3f010000.
>>>>>>>>
>>>>>>>> Because of this:
>>>>>>>>
>>>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>>>> keyctl_setperm: Permission denied
>>>>>>>>
>>>>>>>> Are you sure that your example is correct?
>>>>>>>>
>>>>>>>> /Jarkko
>>>>>>> Yes, this example works correctly.
>>>>>>>
>>>>>>> Why do you think, that the current keyring and key rights
>>>>>>>
>>>>>>> shoukd not allow this to be done?
>>>>>> I'm just saying that I cannot figure out your point in the cover letter.
>>>>>> It contains random dumps of keyctl output.
>>>>>>
>>>>>> Maybe a better idea would be to write a test script that demonstrates
>>>>>> the issue?
>>>>>>
>>>>>> /Jarkko
>>>>> + alexey_krasikov@mail.ru
>>>>>
>>>>> Possible you may not be able to reproduce the problem because you have a
>>>>> different version of Linux.
>>>>>
>>>>> I get to reproduce the problem on two systems:
>>>>>
>>>>> Linux 4.14.74-28+yc11.91
>>>>>
>>>>> and
>>>>>
>>>>> Linux ubuntu 4.15.0-106-generic
>>>> Both of those are distro-specific kernels, can you reproduce this on
>>>> 5.8-rc2 or 5.7 as released from kernel.org?
>>> Alexey,
>>>
>>> A shell script containing the keyctl command chain with some output, and
>>> then your version of the output when running the script would be also
>>> very useful for better comparison.
>>>
>>> /Jarkko
>> Ok. I have the following script:
>>
>> ----------------------------------------------------------------------------
>> #!/usr/bin/sh
>>
>> uname -r
>>
>> KEYID=$(keyctl add user john smith @u)
>> keyctl describe $KEYID
>> keyctl setperm $KEYID 0x3d000000
>> keyctl describe $KEYID
>> keyctl print $KEYID
> pam_keyinit.so should create user keyring when the login session is
> created. If the user space stack is working correclty, you should not
> end up to be the possessor for the user keyring.
>
> However, I can simulate your environment with the session keyring:
>
> KEYID=`keyctl add user john smith @s`
>
> keyctl describe $KEYID
> keyctl setperm $KEYID 0x3d000000
> keyctl describe $KEYID
> keyctl print $KEYID
>
> And yes I do get:
>
> 564302411: alswrv-----v------------  1000  1000 user: john
> 564302411: alsw-v------------------  1000  1000 user: john
> smith
>
> Here's another sequence that also removes setattr:
>
> KEYID=`keyctl add user john smith @s`
>
> keyctl describe $KEYID
> keyctl setperm $KEYID 0x08000000
> keyctl describe $KEYID
> keyctl print $KEYID
>
> 700153280: alswrv-----v------------  1000  1000 user: john
> keyctl_describe_alloc: Permission denied
> smith
>
> David, this look at least with a quick sight somewhat weird: my
> possessor permissions are only "search", so why does reading the
> payload succeed?
>
> /Jarkko
ping

-- 
With best regards,
Alexey Krasikov,
+7-999-789-0-789

