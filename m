Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F4A311F5C
	for <lists+keyrings@lfdr.de>; Sat,  6 Feb 2021 19:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhBFSbM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 6 Feb 2021 13:31:12 -0500
Received: from smtp-190b.mail.infomaniak.ch ([185.125.25.11]:51179 "EHLO
        smtp-190b.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231152AbhBFSbK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 6 Feb 2021 13:31:10 -0500
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DY17143fgzMpp8q;
        Sat,  6 Feb 2021 19:30:21 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DY16z0VSqzlh8TQ;
        Sat,  6 Feb 2021 19:30:18 +0100 (CET)
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
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <99066eb7-53ac-41b0-46cf-36ea3d7f6590@digikod.net>
Date:   Sat, 6 Feb 2021 19:30:33 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <188DE1AF-A011-4631-B88A-2C4324DA013B@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 06/02/2021 02:14, Eric Snowberg wrote:
> 
>> On Feb 5, 2021, at 3:27 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>
>>
>> On 05/02/2021 01:24, Eric Snowberg wrote:
>>>
>>>> On Feb 4, 2021, at 1:26 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>>>
>>>>
>>>> On 04/02/2021 04:53, Eric Snowberg wrote:
>>>>>
>>>>>> On Feb 3, 2021, at 11:49 AM, Mickaël Salaün <mic@digikod.net> wrote:
>>>>>>
>>>>>> This looks good to me, and it still works for my use case. Eric's
>>>>>> patchset only looks for asymmetric keys in the blacklist keyring, so
>>>>>> even if we use the same keyring we don't look for the same key types. My
>>>>>> patchset only allows blacklist keys (i.e. hashes, not asymmetric keys)
>>>>>> to be added by user space (if authenticated), but because Eric's
>>>>>> asymmetric keys are loaded with KEY_ALLOC_BYPASS_RESTRICTION, it should
>>>>>> be OK for his use case.  There should be no interference between the two
>>>>>> new features, but I find it a bit confusing to have such distinct use of
>>>>>> keys from the same keyring depending on their type.
>>>>>
>>>>> I agree, it is a bit confusing.  What is the thought of having a dbx 
>>>>> keyring, similar to how the platform keyring works?
>>>>>
>>>>> https://www.spinics.net/lists/linux-security-module/msg40262.html
>>>>>
>>>>>
>>>>>> On 03/02/2021 17:26, David Howells wrote:
>>>>>>>
>>>>>>> Eric Snowberg <eric.snowberg@oracle.com> wrote:
>>>>>>>
>>>>>>>> This is the fifth patch series for adding support for 
>>>>>>>> EFI_CERT_X509_GUID entries [1].  It has been expanded to not only include
>>>>>>>> dbx entries but also entries in the mokx.  Additionally my series to
>>>>>>>> preload these certificate [2] has also been included.
>>>>>>>
>>>>>>> Okay, I've tentatively applied this to my keys-next branch.  However, it
>>>>>>> conflicts minorly with Mickaël Salaün's patches that I've previously merged on
>>>>>>> the same branch.  Can you have a look at the merge commit
>>>>>>>
>>>>>>> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-next&id=fdbbe7ceeb95090d09c33ce0497e0394c82aa33d
>>>>>>>
>>>>>>> 	(the top patch of my keys-next branch)
>>>>>>>
>>>>>>> to see if that is okay by both of you?  If so, can you give it a whirl?
>>>>>
>>>>>
>>>>> I’m seeing a build error within blacklist_hashes_checked with
>>>>> one of my configs.
>>>>>
>>>>> The config is as follows:
>>>>>
>>>>> $ grep CONFIG_SYSTEM_BLACKLIST_HASH_LIST .config
>>>>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=“revocation_list"
>>>>>
>>>>> $ cat certs/revocation_list
>>>>> "tbs:1e125ea4f38acb7b29b0c495fd8e7602c2c3353b913811a9da3a2fb505c08a32”
>>>>>
>>>>> make[1]: *** No rule to make target 'revocation_list', needed by 'certs/blacklist_hashes_checked'.  Stop.
>>>>
>>>> It requires an absolute path.
>>>
>>> Ok, if I use an absolute path now with CONFIG_SYSTEM_BLACKLIST_HASH_LIST 
>>> it works.
>>>
>>>> This is to align with other variables
>>>> using the config_filename macro: CONFIG_SYSTEM_TRUSTED_KEYS,
>>>> CONFIG_MODULE_SIG_KEY and now CONFIG_SYSTEM_REVOCATION_KEYS.
>>>
>>> I just did a quick test with CONFIG_SYSTEM_TRUSTED_KEYS. It looks like we 
>>> can use either a relative or absolute path with CONFIG_SYSTEM_TRUSTED_KEYS. 
>>> Shouldn’t this be consistent?
>>
>> CONFIG_SYSTEM_TRUSTED_KEYS (and similar config) works with relative path
>> to $(srctree) not $(srctree)/certs as in your example.
> 
> Correct, I had "certs" in my relative path.
> 
>> We can make CONFIG_SYSTEM_BLACKLIST_HASH_LIST works with $(srctree) with
>> this patch:
>>
>> diff --git a/certs/Makefile b/certs/Makefile
>> index eb45407ff282..92a233eaa926 100644
>> --- a/certs/Makefile
>> +++ b/certs/Makefile
>> @@ -14,6 +14,8 @@ $(eval $(call config_filename,SYSTEM_BLACKLIST_HASH_LIST))
>>
>> $(obj)/blacklist_hashes.o: $(obj)/blacklist_hashes_checked
>>
>> +CFLAGS_blacklist_hashes.o += -I$(srctree)
>> +
>> targets += blacklist_hashes_checked
> 
> After applying this patch, CONFIG_SYSTEM_BLACKLIST_HASH_LIST now works
> like the other filename macros.  It seems like this would be a good
> addition.

I'll send a patch with this.

> 
> I have done some additional testing, I am seeing a regression. The blacklist 
> keyring is no longer picking up any of the hashes from the dbx during boot. 
> I backed out the merge with my changes  (fdbbe7ceeb95090d09c33ce0497e0394c82aa33d) 
> and still see the regression.  I then backed out Mickaël merge
> (5bf1adccf5c41dbdd51d1f4de220d335d9548598) and it fixes the regression.
> 
> On a x86 with the updated dbx from uefi.org, I’d expect to see 234 bin hash entries
> in the blacklist keyring.  With the current merged code, there is none.

Hum, I missed a part in refactoring (commit
f78e50c8f750c0ac6767ac1ed006360cf77c56c4). :/
Could you please test the following patch?

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 07c592ae5307..f998a2e85ddc 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -197,13 +197,16 @@ int mark_hash_blacklisted(const u8 *hash, size_t
hash_len,
                enum blacklist_hash_type hash_type)
 {
        const char *buffer;
+       int err;

        buffer = get_raw_hash(hash, hash_len, hash_type);
        if (IS_ERR(buffer))
                return PTR_ERR(buffer);
+       err = mark_raw_hash_blacklisted(buffer);
        kfree(buffer);
-       return 0;
+       return err;
 }


Is it possible to test these kind of dbx blacklist with Qemu?
