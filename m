Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0421622DECE
	for <lists+keyrings@lfdr.de>; Sun, 26 Jul 2020 13:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgGZLxr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 26 Jul 2020 07:53:47 -0400
Received: from fallback21.m.smailru.net ([94.100.176.131]:45642 "EHLO
        fallback21.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGZLxq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 26 Jul 2020 07:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject; bh=N9JNxl7+g3IRlYx1/96qRAkmweZM3Z+fgUvNLUjNr28=;
        b=u5FrUJNE0f6K5u7N9e66f5n97HUUbfgQAfRpMb80aLAFIz95DPFSON8ijgmfz0FlVJsVGkk0rSjMehn/5bJ+Yt35o+kXYNMBiCyx6kleixS99D/4tXd6Xh2eoZA/7k+y/SfJMVpn0Rzcaumlsod9CxJi7NbO5MF4eQNiqAN3b/0=;
Received: from [10.161.45.20] (port=38292 helo=smtp20.mail.ru)
        by fallback21.m.smailru.net with esmtp (envelope-from <alexey_krasikov@mail.ru>)
        id 1jzfDq-0005zE-3b; Sun, 26 Jul 2020 14:53:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject; bh=N9JNxl7+g3IRlYx1/96qRAkmweZM3Z+fgUvNLUjNr28=;
        b=u5FrUJNE0f6K5u7N9e66f5n97HUUbfgQAfRpMb80aLAFIz95DPFSON8ijgmfz0FlVJsVGkk0rSjMehn/5bJ+Yt35o+kXYNMBiCyx6kleixS99D/4tXd6Xh2eoZA/7k+y/SfJMVpn0Rzcaumlsod9CxJi7NbO5MF4eQNiqAN3b/0=;
Received: by smtp20.mail.ru with esmtpa (envelope-from <alexey_krasikov@mail.ru>)
        id 1jzfDh-0008QG-Bk; Sun, 26 Jul 2020 14:53:34 +0300
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
From:   Alexey Krasikov <alexey_krasikov@mail.ru>
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
 <530d953e-53af-8bcf-cbab-488b1e0415ef@mail.ru>
Message-ID: <28b7c123-10e5-62c4-47a7-3fe64c43594b@mail.ru>
Date:   Sun, 26 Jul 2020 14:53:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <530d953e-53af-8bcf-cbab-488b1e0415ef@mail.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90521F83352E4771D5DD7453594C4C6FC8EF94AB96FFA23D0182A05F5380850407BEEC672C171D560AE15AD0CC4F3E6D000E9A2DAC958D55AFE9C8CE5ABA45A7B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE754E958D11587BC68EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637328FC23D015AFE6E8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FCB5B48E3DAAA4CF04F75949886040D828614616B1AEF83CE1389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23DF004C906525384309383FD4D963104D47B076A6E789B0E975F5C1EE8F4F765FC557F2C6A21E40C883AA81AA40904B5D9CF19DD082D7633A0446828A5085A663B3AA81AA40904B5D98AA50765F7900637FED5254661D287A1D81D268191BDAD3D18080C068C56568E156CCFE7AF13BCA413377AFFFEAFD26923F8577A6DFFEA7C5C3943050577FBCB93EC92FD9297F6715571747095F342E857739F23D657EF2BD5E8D9A59859A8B62819857A95C66D5F089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E702ABEDDA51113D120200306258E7E6ABB4E4A6367B16DE6309
X-C8649E89: 005BF318B7F73E3FD9BECDF71E5FFDA9AA349961982CB29121B6E3FEEEBB56D8F5D7A4EB10B304EF9F595CEF8576C34B
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7nKDzOTMaCT20bBaPBmoDA==
X-Mailru-Sender: 00097D31F91C944BD6C0E88AD7FCCC151AACA13B6AA99C495D0C4AA13885D143C73907E849D9F604F8B61EA8833973416F53C80213D1719CDFA5B7B6157ABFAC165345FAB26C5F1467EA787935ED9F1B
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B43A7801844A72E373BDE407F6AFEC0A431DA4F08B1DBAB59F049FFFDB7839CE9E58E5BBD8367ED2F3F3F777B22F4B5D9D5A26026D6361BE88BEDD9C20DB7F4EEB
X-7FA49CB5: 0D63561A33F958A5810B042AEF65CC68C7C1412CAB559AE24892D9A72CFA60408941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364760DD3EA8D24872D7CD81D268191BDAD3DC09775C1D3CA48CF0E0DD297EED076AEBA3038C0950A5D36C8A9BA7A39EFB7668729DE7A884B61D135872C767BF85DA29E625A9149C048EEB89ED3C7A6281781DD0078234547CCE74AD6D5ED66289B524E70A05D1297E1BB35872C767BF85DA227C277FBC8AE2E8B47E915A23788DB9575ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7nKDzOTMaCQlp4zZkmWt3A==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005052887ACAD76BDA337E9721B699505D774161F20C20B508B7DB34D8E89655EEBE7143E3D63322ACF3DDE9B364B0DF289D092D71F61A4B7D9E6CF1C79009A2470AE208404248635DF
X-Mras: Ok
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 7/13/20 2:53 PM, Alexey Krasikov wrote:
> On 7/3/20 4:14 AM, Jarkko Sakkinen wrote:
>> On Sun, Jun 28, 2020 at 03:27:37AM +0300, Alexey Krasikov wrote:
>>> On 6/23/20 4:28 AM, Jarkko Sakkinen wrote:
>>>> On Mon, Jun 22, 2020 at 02:30:28PM +0200, Greg KH wrote:
>>>>> On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
>>>>>> On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
>>>>>>> On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
>>>>>>>> On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
>>>>>>>>> On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
>>>>>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>>>>>> $ keyctl describe $KEYID
>>>>>>>>>> 5927639: alswrv-----v------------  1000  1000 user: john
>>>>>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>>>>>> $ keyctl describe $KEYID
>>>>>>>>>> 5927639: alsw-v-----v------------  1000  1000 user: john
>>>>>>>>>> $ keyctl print $KEYID
>>>>>>>>>> smith
>>>>>>>>> A keyring default permissions are 0x3f3f0000.
>>>>>>>>> A key default permissions are 0x3f010000.
>>>>>>>>>
>>>>>>>>> Because of this:
>>>>>>>>>
>>>>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>>>>> keyctl_setperm: Permission denied
>>>>>>>>>
>>>>>>>>> Are you sure that your example is correct?
>>>>>>>>>
>>>>>>>>> /Jarkko
>>>>>>>> Yes, this example works correctly.
>>>>>>>>
>>>>>>>> Why do you think, that the current keyring and key rights
>>>>>>>>
>>>>>>>> shoukd not allow this to be done?
>>>>>>> I'm just saying that I cannot figure out your point in the cover 
>>>>>>> letter.
>>>>>>> It contains random dumps of keyctl output.
>>>>>>>
>>>>>>> Maybe a better idea would be to write a test script that 
>>>>>>> demonstrates
>>>>>>> the issue?
>>>>>>>
>>>>>>> /Jarkko
>>>>>> + alexey_krasikov@mail.ru
>>>>>>
>>>>>> Possible you may not be able to reproduce the problem because you 
>>>>>> have a
>>>>>> different version of Linux.
>>>>>>
>>>>>> I get to reproduce the problem on two systems:
>>>>>>
>>>>>> Linux 4.14.74-28+yc11.91
>>>>>>
>>>>>> and
>>>>>>
>>>>>> Linux ubuntu 4.15.0-106-generic
>>>>> Both of those are distro-specific kernels, can you reproduce this on
>>>>> 5.8-rc2 or 5.7 as released from kernel.org?
>>>> Alexey,
>>>>
>>>> A shell script containing the keyctl command chain with some 
>>>> output, and
>>>> then your version of the output when running the script would be also
>>>> very useful for better comparison.
>>>>
>>>> /Jarkko
>>> Ok. I have the following script:
>>>
>>> ---------------------------------------------------------------------------- 
>>>
>>> #!/usr/bin/sh
>>>
>>> uname -r
>>>
>>> KEYID=$(keyctl add user john smith @u)
>>> keyctl describe $KEYID
>>> keyctl setperm $KEYID 0x3d000000
>>> keyctl describe $KEYID
>>> keyctl print $KEYID
>> pam_keyinit.so should create user keyring when the login session is
>> created. If the user space stack is working correclty, you should not
>> end up to be the possessor for the user keyring.
>>
>> However, I can simulate your environment with the session keyring:
>>
>> KEYID=`keyctl add user john smith @s`
>>
>> keyctl describe $KEYID
>> keyctl setperm $KEYID 0x3d000000
>> keyctl describe $KEYID
>> keyctl print $KEYID
>>
>> And yes I do get:
>>
>> 564302411: alswrv-----v------------  1000  1000 user: john
>> 564302411: alsw-v------------------  1000  1000 user: john
>> smith
>>
>> Here's another sequence that also removes setattr:
>>
>> KEYID=`keyctl add user john smith @s`
>>
>> keyctl describe $KEYID
>> keyctl setperm $KEYID 0x08000000
>> keyctl describe $KEYID
>> keyctl print $KEYID
>>
>> 700153280: alswrv-----v------------  1000  1000 user: john
>> keyctl_describe_alloc: Permission denied
>> smith
>>
>> David, this look at least with a quick sight somewhat weird: my
>> possessor permissions are only "search", so why does reading the
>> payload succeed?
>>
>> /Jarkko
> ping
>
> /Alexey
ping, ping!!!

Hello everybody!

David, have you watched my correspondence with Jarkko?
Do you have any ideas about this strange behavior of keyctl?

/Alexey
