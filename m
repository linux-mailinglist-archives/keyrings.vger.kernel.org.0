Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CC421D548
	for <lists+keyrings@lfdr.de>; Mon, 13 Jul 2020 13:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgGMLxP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 13 Jul 2020 07:53:15 -0400
Received: from fallback19.mail.ru ([185.5.136.251]:60652 "EHLO
        fallback19.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbgGMLxP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 13 Jul 2020 07:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=+S5JHkKW9+FHdWGoj4RyihrwviK50HPc+kPBUmITQ7g=;
        b=KUMjbb/jc8WbHSBQzI8AzNAVu94ZwoxND0gBf9TZvF1lhzIzGLv8utX727xl1N/uFKebE+yc4rLsKnsmGYUSMBZKUk3VtuTCGKbNEa6NPVQaLGU0tZUI/7npZSiui2HCVO6NA2px0kei1j7VN+VhC7YzRXVB4FAabxgCw/uGwug=;
Received: from [10.161.64.59] (port=44388 helo=smtp51.i.mail.ru)
        by fallback19.m.smailru.net with esmtp (envelope-from <alexey_krasikov@mail.ru>)
        id 1jux1C-00068b-U6; Mon, 13 Jul 2020 14:53:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=+S5JHkKW9+FHdWGoj4RyihrwviK50HPc+kPBUmITQ7g=;
        b=KUMjbb/jc8WbHSBQzI8AzNAVu94ZwoxND0gBf9TZvF1lhzIzGLv8utX727xl1N/uFKebE+yc4rLsKnsmGYUSMBZKUk3VtuTCGKbNEa6NPVQaLGU0tZUI/7npZSiui2HCVO6NA2px0kei1j7VN+VhC7YzRXVB4FAabxgCw/uGwug=;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <alexey_krasikov@mail.ru>)
        id 1jux15-0008Jo-7B; Mon, 13 Jul 2020 14:53:03 +0300
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
Message-ID: <530d953e-53af-8bcf-cbab-488b1e0415ef@mail.ru>
Date:   Mon, 13 Jul 2020 14:53:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703011447.GA294568@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9BB76C036EA8E79ACB03C072647AE8C234E562997A1F066A9182A05F53808504035B0C200CF791A8F1FACAA4B55FEA2E20BADDACD08383A1E31A5F0B74333A545
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75A6765C746F51968EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637822A0A225AD602F38638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC849E690DF9422295D2A1B12B0B40119C007CE24364D1D4BD389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23DF004C906525384303BDABC7E18AA350CD8FC6C240DEA76428AA50765F7900637A48B146B3093E884D81D268191BDAD3DBD4B6F7A4D31EC0B6941894150739B64D81D268191BDAD3D78DA827A17800CE729330EC21E61B5F9EC76A7562686271E8729DE7A884B61D135872C767BF85DA29E625A9149C048EE0A3850AC1BE2E7351CE60B8040019C364AD6D5ED66289B524E70A05D1297E1BB35872C767BF85DA227C277FBC8AE2E8B9BFB91CAEB05C77775ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-C8649E89: DAA6FA378130EB66EF3A48D5847A24693E53358F44D1933E07994C9F630A894F53CE06398DF4287F9F595CEF8576C34B
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7M7hD4t88wnFK7Kje40KYQ==
X-Mailru-Sender: A124683AC41E55E24C57C1CD43F0BA4946620CAFBFE8B0951F04E53D16D876B4F88D7C6D21B679195060D601A64F5073C77752E0C033A69E940053A32376DA02CA80753D337B88823453F38A29522196
X-Mras: Ok
X-7564579A: EEAE043A70213CC8
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDC710A732BED9FF229641D32D495C0217C92F7018BF4E54462777ACD9A69DA1B17
X-7FA49CB5: 0D63561A33F958A52C020B63E3FE25FEB5A1E035E62E1323628718AE786D08B38941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C22498E169FBA46AE3C8776E601842F6C81A12EF20D2F80756B5F13660E01DFBDB6B6089D37D7C0E48F6CA18204E546F3947CC0F9454058DFE53CC6EABA9B74D0DA47C8A9BA7A39EFB7666BA297DBC24807EA089D37D7C0E48F6C8AA50765F7900637E62180BDA7F10F15EFF80C71ABB335746BA297DBC24807EA27F269C8F02392CDCDCF839C8780CBD93C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7M7hD4t88wnf8gq6nDz4JA==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005F4843EF15D8AD6F802C75BDF98FA533E641D32D495C0217C2001C5CE591D6099E7143E3D63322ACF3DDE9B364B0DF289D092D71F61A4B7D9E6CF1C79009A2470AE208404248635DF
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

/Alexey
