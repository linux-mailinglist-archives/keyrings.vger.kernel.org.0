Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0FC20C4F7
	for <lists+keyrings@lfdr.de>; Sun, 28 Jun 2020 02:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgF1A1u (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 27 Jun 2020 20:27:50 -0400
Received: from fallback12.mail.ru ([94.100.179.29]:34668 "EHLO
        fallback12.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgF1A1u (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 27 Jun 2020 20:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Y/TQ23415eCr+lcXGsUmV806sqxOsnfj8fI9JM2Q8sI=;
        b=imbIJqQxk+Dd/XsB3W+brgJwKjVpXAWfV8dvintppHgKnEkM5opPax+KzKxSxTuju+exY3maV9lvKsN41T3UqYXsxrNq6i7gkDRQRQwle9DykDxsHHTG9toNCZXL00HtUhwF8FvAefSIfYj4s0ZtfMjAuUTa+0f8dR2uhRyLSUY=;
Received: from [10.161.64.54] (port=52516 helo=smtp46.i.mail.ru)
        by fallback12.m.smailru.net with esmtp (envelope-from <alexey_krasikov@mail.ru>)
        id 1jpLAg-0002tz-3L; Sun, 28 Jun 2020 03:27:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Y/TQ23415eCr+lcXGsUmV806sqxOsnfj8fI9JM2Q8sI=;
        b=imbIJqQxk+Dd/XsB3W+brgJwKjVpXAWfV8dvintppHgKnEkM5opPax+KzKxSxTuju+exY3maV9lvKsN41T3UqYXsxrNq6i7gkDRQRQwle9DykDxsHHTG9toNCZXL00HtUhwF8FvAefSIfYj4s0ZtfMjAuUTa+0f8dR2uhRyLSUY=;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from <alexey_krasikov@mail.ru>)
        id 1jpLAY-0003vX-68; Sun, 28 Jun 2020 03:27:38 +0300
Subject: Re: [RFC PATCH 0/1] security/keys: remove possessor verify after key
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Greg KH <greg@kroah.com>
Cc:     Alexey Krasikov <alex-krasikov@yandex-team.ru>,
        dhowells@redhat.com, keyrings@vger.kernel.org, security@kernel.org,
        yc-core@yandex-team.ru
References: <20200529060040.29604-1-alex-krasikov@yandex-team.ru>
 <20200601173427.GA26455@linux.intel.com>
 <bd56baa2-9c8d-a0dd-419d-a3123a1f0fba@yandex-team.ru>
 <20200615170043.GA5416@linux.intel.com>
 <c3f47d1c-90a6-aa37-6692-d26202fa92d2@yandex-team.ru>
 <20200622123028.GA3502713@kroah.com> <20200623012859.GI28795@linux.intel.com>
From:   Alexey Krasikov <alexey_krasikov@mail.ru>
Message-ID: <5b6f4d9c-ef6f-d456-096f-4673c85d4dbd@mail.ru>
Date:   Sun, 28 Jun 2020 03:27:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623012859.GI28795@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AAC5A87EC32CE31E66C1D9D51859798985FEEC164A8ED648182A05F5380850403663535BF04DA9BF0BE144A9259775174CE35C4176DCE0359B56E914229AE90E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7705F446BE41E38A1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CDA089757FB31C668638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC3BE77AC7A04CCA66B0862FCF1300B234ADE68E00D9457C04389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7328B01A8D746D8839FA2833FD35BB23DF004C906525384303BDABC7E18AA350CD8FC6C240DEA76428AA50765F790063722C0DC005C880A51D81D268191BDAD3DBD4B6F7A4D31EC0BD28E6F1989ABE784D81D268191BDAD3D78DA827A17800CE771C1F35A80BCA24CEC76A7562686271E8729DE7A884B61D135872C767BF85DA29E625A9149C048EE0A3850AC1BE2E7352F65BD3C784FEF8F4AD6D5ED66289B524E70A05D1297E1BB35872C767BF85DA227C277FBC8AE2E8B041BD12FB6B4799375ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57285124B2A10EEC6C00306258E7E6ABB4E4A6367B16DE6309
X-C8649E89: E7FD7CEA01CDF6691A9B50488072862BEF0BBE558F9715EC3DDE7603B934BAD514DCF0BB2DCCBF21
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJ/juF8BuLySzi3WHEugRPQ==
X-Mailru-Sender: A124683AC41E55E24C57C1CD43F0BA49CA80C2F05B892778C232524236C3D26F54A42CAEBACFBF7E5060D601A64F5073C77752E0C033A69E940053A32376DA02CA80753D337B88823453F38A29522196
X-Mras: Ok
X-7564579A: EEAE043A70213CC8
X-77F55803: 669901E4625912A97F9F52485CB584D7271FD7DF62800FDCF8D8129B8F98F466D0FB691A116915888F3CE0131A6F5CBD8A1CB277A87538D3
X-7FA49CB5: 0D63561A33F958A5A47FFE841D8DD24325B3C82ECCC69F3EF885C7E88A305A8E8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F446042972877693876707352033AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A965834E70A05D1297E1BBBA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0BA90D7044347270F7B076A6E789B0E97A8DF7F3B2552694ABCFECBEA56A8F1E193EC92FD9297F6718AA50765F79006375F69D999597C3EA2A7F4EDE966BC389F395957E7521B51C24C7702A67D5C33162DBA43225CD8A89F616AD31D0D18CD5C156CCFE7AF13BCA4B5C8C57E37DE458B4C7702A67D5C3316FA3894348FB808DB48C21F01D89DB561574AF45C6390F7469DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJ/juF8BuLyT6aBftMMyHbA==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005C3FADA55C8765CC38AA5842156056E3DD0FB691A11691588345C11AF1AD87E65E7143E3D63322ACF3DDE9B364B0DF289D092D71F61A4B7D9E6CF1C79009A2470AE208404248635DF
X-Mras: Ok
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 6/23/20 4:28 AM, Jarkko Sakkinen wrote:
> On Mon, Jun 22, 2020 at 02:30:28PM +0200, Greg KH wrote:
>> On Mon, Jun 22, 2020 at 12:04:29PM +0300, Alexey Krasikov wrote:
>>> On 6/15/20 8:00 PM, Jarkko Sakkinen wrote:
>>>> On Tue, Jun 02, 2020 at 01:30:52PM +0300, Alexey Krasikov wrote:
>>>>> On Mon, June 1, 2020 at 08:34PM +300, Jarkko Sakkinen wrote:
>>>>>> On Fri, May 29, 2020 at 09:00:39AM +0300, Alexey Krasikov wrote:
>>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>>> $ keyctl describe $KEYID
>>>>>>> 5927639: alswrv-----v------------  1000  1000 user: john
>>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>>> $ keyctl describe $KEYID
>>>>>>> 5927639: alsw-v-----v------------  1000  1000 user: john
>>>>>>> $ keyctl print $KEYID
>>>>>>> smith
>>>>>> A keyring default permissions are 0x3f3f0000.
>>>>>> A key default permissions are 0x3f010000.
>>>>>>
>>>>>> Because of this:
>>>>>>
>>>>>> $ KEYID=$(keyctl add user john smith @u)
>>>>>> $ keyctl setperm $KEYID 0x3d000000
>>>>>> keyctl_setperm: Permission denied
>>>>>>
>>>>>> Are you sure that your example is correct?
>>>>>>
>>>>>> /Jarkko
>>>>> Yes, this example works correctly.
>>>>>
>>>>> Why do you think, that the current keyring and key rights
>>>>>
>>>>> shoukd not allow this to be done?
>>>> I'm just saying that I cannot figure out your point in the cover letter.
>>>> It contains random dumps of keyctl output.
>>>>
>>>> Maybe a better idea would be to write a test script that demonstrates
>>>> the issue?
>>>>
>>>> /Jarkko
>>> + alexey_krasikov@mail.ru
>>>
>>> Possible you may not be able to reproduce the problem because you have a
>>> different version of Linux.
>>>
>>> I get to reproduce the problem on two systems:
>>>
>>> Linux 4.14.74-28+yc11.91
>>>
>>> and
>>>
>>> Linux ubuntu 4.15.0-106-generic
>> Both of those are distro-specific kernels, can you reproduce this on
>> 5.8-rc2 or 5.7 as released from kernel.org?
> Alexey,
>
> A shell script containing the keyctl command chain with some output, and
> then your version of the output when running the script would be also
> very useful for better comparison.
>
> /Jarkko

Ok. I have the following script:

----------------------------------------------------------------------------
#!/usr/bin/sh

uname -r

KEYID=$(keyctl add user john smith @u)
keyctl describe $KEYID
keyctl setperm $KEYID 0x3d000000
keyctl describe $KEYID
keyctl print $KEYID
----------------------------------------------------------------------------

I installed the Manjaro distribution, updated the kernel to version 5.7.0-3,
and when running this script, I got the following output:

****************************************************************************
5.7.0-3-MANJARO
914983072: alswrv-----v------------  1000  1000 user: john
914983072: alsw-v------------------  1000  1000 user: john
smith
****************************************************************************

In fairness, I note that none of these distro-specific kernels
does not change the work logic of the Linux keyring.

/Alexey
