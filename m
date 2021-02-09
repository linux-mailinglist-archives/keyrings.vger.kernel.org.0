Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC24315A8B
	for <lists+keyrings@lfdr.de>; Wed, 10 Feb 2021 01:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhBJAEF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Feb 2021 19:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhBIWHM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Feb 2021 17:07:12 -0500
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [IPv6:2001:1600:3:17::8faf])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744A4C08EB2A
        for <keyrings@vger.kernel.org>; Tue,  9 Feb 2021 13:55:20 -0800 (PST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DZxTf2FcKzMqGbp;
        Tue,  9 Feb 2021 22:53:10 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DZxTc3C9Szlh8TK;
        Tue,  9 Feb 2021 22:53:08 +0100 (CET)
Subject: =?UTF-8?Q?Re=3a_Conflict_with_Micka=c3=abl_Sala=c3=bcn=27s_blacklis?=
 =?UTF-8?Q?t_patches_=5bwas_=5bPATCH_v5_0/4=5d_Add_EFI=5fCERT=5fX509=5fGUID_?=
 =?UTF-8?Q?support_for_dbx/mokx_entries=5d?=
To:     Eric Snowberg <eric.snowberg@oracle.com>,
        David Howells <dhowells@redhat.com>
Cc:     dwmw2@infradead.org, Jarkko Sakkinen <jarkko@kernel.org>,
        James.Bottomley@HansenPartnership.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, jmorris@namei.org, serge@hallyn.com,
        ardb@kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
        lszubowi@redhat.com, javierm@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Tyler Hicks <tyhicks@linux.microsoft.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
 <1103491.1612369600@warthog.procyon.org.uk>
 <10e6616e-0598-9f33-2de9-4a5268bba586@digikod.net>
 <A5B5DEC0-E47A-4C3D-8E79-AF37B6C2E565@oracle.com>
 <7924ce4c-ea94-9540-0730-bddae7c6af07@digikod.net>
 <BFC930B3-7994-4C5B-A8EF-1DD1C73F5750@oracle.com>
 <dc6a4524-3935-fda6-40a8-cebf80942cdf@digikod.net>
 <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
 <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
 <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <456712ef-1349-ffe2-9e34-7d49848980ff@digikod.net>
Date:   Tue, 9 Feb 2021 22:53:34 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <74EC102D-BD18-4863-A7FB-C88439654C8C@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 09/02/2021 00:05, Eric Snowberg wrote:
> 
>> On Feb 6, 2021, at 11:30 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>
>> On 06/02/2021 02:14, Eric Snowberg wrote:
>>
>>> I have done some additional testing, I am seeing a regression. The blacklist 
>>> keyring is no longer picking up any of the hashes from the dbx during boot. 
>>> I backed out the merge with my changes  (fdbbe7ceeb95090d09c33ce0497e0394c82aa33d) 
>>> and still see the regression.  I then backed out Mickaël merge
>>> (5bf1adccf5c41dbdd51d1f4de220d335d9548598) and it fixes the regression.
>>>
>>> On a x86 with the updated dbx from uefi.org, I’d expect to see 234 bin hash entries
>>> in the blacklist keyring.  With the current merged code, there is none.
>>
>> Hum, I missed a part in refactoring (commit
>> f78e50c8f750c0ac6767ac1ed006360cf77c56c4). :/
>> Could you please test the following patch?
>>
>> diff --git a/certs/blacklist.c b/certs/blacklist.c
>> index 07c592ae5307..f998a2e85ddc 100644
>> --- a/certs/blacklist.c
>> +++ b/certs/blacklist.c
>> @@ -197,13 +197,16 @@ int mark_hash_blacklisted(const u8 *hash, size_t
>> hash_len,
>>                enum blacklist_hash_type hash_type)
>> {
>>        const char *buffer;
>> +       int err;
>>
>>        buffer = get_raw_hash(hash, hash_len, hash_type);
>>        if (IS_ERR(buffer))
>>                return PTR_ERR(buffer);
>> +       err = mark_raw_hash_blacklisted(buffer);
>>        kfree(buffer);
>> -       return 0;
>> +       return err;
>> }
> 
> I applied this patch, it works better, but there is still a regression. 
> Most of the hashes show up in the blacklist keyring now.  However some 
> do not, here is what I see in the log during boot:
> 
> [    2.321876] blacklist: Problem blacklisting hash (-13)
> [    2.322729] blacklist: Problem blacklisting hash (-13)
> [    2.323549] blacklist: Problem blacklisting hash (-13)
> [    2.324369] blacklist: Problem blacklisting hash (-13)
> 
>> Is it possible to test these kind of dbx blacklist with Qemu?
> 
> Yes, just use OVMF. 
> 

My changes (with the fix) don't change the previous semantic. I just
tested without my changes and with my changes (and the fix), and I get
the same result: 184 bin hashes with
https://uefi.org/sites/default/files/resources/dbxupdate_x64.bin

Could you please re-test and if there is still an issue bisect and share
the certificates causing this issue?

David, do you want me to send the two new patches or an updated full
patch series?
