Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EADB81506CE
	for <lists+keyrings@lfdr.de>; Mon,  3 Feb 2020 14:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgBCNT2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Feb 2020 08:19:28 -0500
Received: from UPDC19PA19.eemsg.mail.mil ([214.24.27.194]:38581 "EHLO
        UPDC19PA19.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgBCNT2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Feb 2020 08:19:28 -0500
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Feb 2020 08:19:26 EST
X-EEMSG-check-017: 53298529|UPDC19PA19_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; 
   d="scan'208";a="53298529"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UPDC19PA19.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 03 Feb 2020 13:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1580735526; x=1612271526;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bsrULKEkgZDGmAsNsDsRPCAXWpJCsAVicucmGfYRxRg=;
  b=AQkyl+lIq5V7dOrZANyVlOF8kHc8MKcaPcZlwQhXRD+GmEPUXuUAm2lz
   WYbbSHX5UpXJ8Zul4iwsdzxPBXbJcLJwtTrCkf4CiYQlkPvrvl+tFfoTP
   /eNSVZOvJMUowAQiFQUDimH8uuTnLA3bxPmG0kmeicPclx01y8jJHHURM
   lUR260mEX/W8uAcpMBmvj+ICG8S/nfzQp6Cc8NaUwtFmDxMgde4fjLqaN
   MTaf+AxXQsE4si2jM5qdMvIP5LT5MaIUOEnAN75SbKJj1Tnz+rATRXlJo
   N2/WyNxHDSMQFGQcsIgmjvqTP7f3WWABwu6OzDxDcK+7CvK1R1UmlF+CH
   g==;
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; 
   d="scan'208";a="38575293"
IronPort-PHdr: =?us-ascii?q?9a23=3AHmYzFhK/mWfwu6UWLNmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXKfvzrarrMEGX3/hxlliBBdydt6sYzbaJ+Py9ESxYuNDd6StEKMQNHz?=
 =?us-ascii?q?Y+yuwu1zQ6B8CEDUCpZNXLVAcdWPp4aVl+4nugOlJUEsutL3fbo3m18CJAUk?=
 =?us-ascii?q?6nbVk9Kev6AJPdgNqq3O6u5ZLTfx9IhD2gar9uMRm6twrcutQZjId4Jas8yB?=
 =?us-ascii?q?TFr3RIdu9LwW9kOU+fkwzz68ut8pNv6Thct+4k+8VdTaj0YqM0QKBCAj87KW?=
 =?us-ascii?q?41/srrtRfCTQuL+HQRV3gdnwRLDQbY8hz0R4/9vSTmuOVz3imaJtD2QqsvWT?=
 =?us-ascii?q?u+9adrSQTnhzkBOjUk7WzYkM1wjKZcoBK8uxxyxpPfbY+JOPZieK7WYMgXTn?=
 =?us-ascii?q?RdUMlPSyNBA5u8b4oRAOoHIeZYtJT2q18XoRejGQWgGObjxzlGiX/s2a0xzv?=
 =?us-ascii?q?ovHwfI0gc9G94CqXrZodHwOKoUTOu7zrTHzS/bYv1Lxzn95ojGfBMvr/6CUr?=
 =?us-ascii?q?1/c9bex0Y0GgPZjFids5DpMy+b2+kPtWWQ8upuVfioi24iswx/vySvydk0io?=
 =?us-ascii?q?nJmI0VzE3P+zh8wIkvId24TFB0YN65G5ZXrCGVKpB2T9g+Q2BopCk6yroGtY?=
 =?us-ascii?q?S9fCgR0psr3RHfa/uZc4WR5B/oSeifITB9hH1/ebK/gQ6/8Uu+xe3mUMm7zl?=
 =?us-ascii?q?JKojBCktnWuXAA0QHY5MufSvZl40us1jmC2xrT5+1ZO0w4i6XWJ4A7zrItkJ?=
 =?us-ascii?q?cYrF7NETXsmErsia+bbkAk+u+15Ov5erjmvZqcN5NsigH5L6QuhtSzAeQmPQ?=
 =?us-ascii?q?gKWGiW4fi826f5/U34XbVKlec6kqjfsJDUIsQbvbC2DBNP3oY/6xewEzem0N?=
 =?us-ascii?q?MCkXkBMF1FYw6Ig5LsO1HPJPD0Ffa/g1Kynzd33/3KI7LsD5rXInXDjbvtZ6?=
 =?us-ascii?q?hx5kFCxAYp0NxT/5dUBasAIPL3VE/xrtvYDhohPgyv3unnE85w1p8eWG2TAq?=
 =?us-ascii?q?+ZN7nesVmT5u01OeWMa4gVuCjlJ/g/+/HulWM5mUMafaSxx5sXaWy3HvR8LE?=
 =?us-ascii?q?WDfHXjmssOHn8KvgUkTezqjkONUSVIanmpQ6I85zc7CJ64AofZQICinqCB0D?=
 =?us-ascii?q?2nEZ1RY2BMEkqMHmvwd4WYR/cMbzqfLdJhkjwDW7muVYsh1RW1tALh0bpoMP?=
 =?us-ascii?q?fb+i0CupL/ztR6++rTlRQq/zxuE8udy32NT31znm4QXz85xr1/oUhmx1eby6?=
 =?us-ascii?q?d4nvhYGcVW5/NOVQc6L4DTw/ZmBND1XwLLZs2JR0q+QtW6HTExSco8w9wQbE?=
 =?us-ascii?q?d9AdWijxbD3yWxA7IOibyLC4I78rjG03jyOcl90XDG27clj1U8RctPL2KmjL?=
 =?us-ascii?q?Zl9wfPH47Jj1mZl6GyeKQHwiHN8GaDzWyTvEBXSwNwT6rFUm4FZkfMrtT2+F?=
 =?us-ascii?q?nCT7mwBrQjKAdBztSCKqRSYN3zkVpGXOvjOMjZY2+pn2ewBBCIxq6DbYbzYG?=
 =?us-ascii?q?USwjnSCFUekwAS4XaHNREyBiKmo23DETxuEUzgbljy8elxtny7VFU4zwKUYE?=
 =?us-ascii?q?170bq65BoVieabS/MJ0bIOoD0hpClsHFahw9LWDMKNpw5gfKVafNM8705L1W?=
 =?us-ascii?q?HHuAxnOJyvMaRii0UAcwR4oUzuzQ97CoZensgwqnMl0g5yJbif0FNbeDPLla?=
 =?us-ascii?q?z3b4fWIWn75hznS6fX3FzFmIKM+6wP4e40nF7UvAioEEc523970t9J3mGa64?=
 =?us-ascii?q?mMBw0XB9a5fk8p9hQyh7bFby05/MuA2X1rLqSwtiTqwd8lBOI5jB2neoEbeL?=
 =?us-ascii?q?uNCQvaC8QHA42rL+swlh6iaRdXEvpV8fsPI86+d/aAkJWuNeJkkSPu2X9L+6?=
 =?us-ascii?q?hhw0mM8Gx6UeeO0JEblaLLljCbXivx2Q/y+vv8nppJMHRLRTuy?=
X-IPAS-Result: =?us-ascii?q?A2DlAgAAGzhe/wHyM5BlHAEBAQEBBwEBEQEEBAEBgXuBf?=
 =?us-ascii?q?YEYVSASKoQUiQOGWQEBAQEBAQaBN4lvj2KBZwkBAQEBAQEBAQEtCgEBhEACg?=
 =?us-ascii?q?lg4EwIQAQEBBAEBAQEBBQMBAWyFNwyCOykBgwIBBSMVQRALGAICJgICVwYBD?=
 =?us-ascii?q?AYCAQGCYz8BglYlD6tNgTKENQGBFINNgTgGgQ4qjDp5gQeBOA+CLy4+gksZB?=
 =?us-ascii?q?BqBFAESAQeDKoJeBIdehVxKiTRGe5ZpgkWCToR4hUeJLQYbgkiIDpAyjmGIZ?=
 =?us-ascii?q?5REIjcwcSsIAhgIIQ87gm0SPRgNjiQFF4hkhV0jAzIBAYxCERcCgTpfAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 03 Feb 2020 13:12:04 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 013DBC5q143972;
        Mon, 3 Feb 2020 08:11:12 -0500
Subject: Re: SELinux: How to split permissions for keys?
To:     Richard Haines <richard_c_haines@btinternet.com>,
        David Howells <dhowells@redhat.com>, paul@paul-moore.com
Cc:     keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
 <4057700.1579792320@warthog.procyon.org.uk>
 <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
 <50f98f04-d00e-ae54-9a90-d0ff10be515a@tycho.nsa.gov>
 <459818a9ad1c808298bf3d7c9bcb130323d30e97.camel@btinternet.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <3d1923ec-f02b-6be7-b0c0-d3d6f539b034@tycho.nsa.gov>
Date:   Mon, 3 Feb 2020 08:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <459818a9ad1c808298bf3d7c9bcb130323d30e97.camel@btinternet.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2/2/20 2:30 PM, Richard Haines wrote:
> On Thu, 2020-01-23 at 15:35 -0500, Stephen Smalley wrote:
>> On 1/23/20 10:46 AM, Stephen Smalley wrote:
>>> On 1/23/20 10:12 AM, David Howells wrote:
>>>> Hi Stephen,
>>>>
>>>> I have patches to split the permissions that are used for keys to
>>>> make
>>>> them a
>>>> bit finer grained and easier to use - and also to move to ACLs
>>>> rather
>>>> than
>>>> fixed masks.  See patch "keys: Replace uid/gid/perm permissions
>>>> checking with
>>>> an ACL" here:
>>>>
>>>>      
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-acl
>>>>   
>>>>
>>>>
>>>> However, I may not have managed the permission mask
>>>> transformation inside
>>>> SELinux correctly.  Could you lend an eyeball?  The change to
>>>> the
>>>> permissions
>>>> model is as follows:
>>>>
>>>>       The SETATTR permission is split to create two new
>>>> permissions:
>>>>        (1) SET_SECURITY - which allows the key's owner, group and
>>>> ACL
>>>> to be
>>>>            changed and a restriction to be placed on a keyring.
>>>>        (2) REVOKE - which allows a key to be revoked.
>>>>       The SEARCH permission is split to create:
>>>>        (1) SEARCH - which allows a keyring to be search and a key
>>>> to be
>>>> found.
>>>>        (2) JOIN - which allows a keyring to be joined as a
>>>> session
>>>> keyring.
>>>>        (3) INVAL - which allows a key to be invalidated.
>>>>       The WRITE permission is also split to create:
>>>>        (1) WRITE - which allows a key's content to be altered and
>>>> links
>>>> to be
>>>>            added, removed and replaced in a keyring.
>>>>        (2) CLEAR - which allows a keyring to be cleared
>>>> completely.
>>>> This is
>>>>            split out to make it possible to give just this to an
>>>> administrator.
>>>>        (3) REVOKE - see above.
>>>>
>>>> The change to SELinux is attached below.
>>>>
>>>> Should the split be pushed down into the SELinux policy rather
>>>> than
>>>> trying to
>>>> calculate it?
>>>
>>> My understanding is that you must provide full backward
>>> compatibility
>>> with existing policies; hence, you must ensure that you always
>>> check the
>>> same SELinux permission(s) for the same operation when using an
>>> existing
>>> policy.
>>>
>>> In order to support finer-grained distinctions in SELinux with
>>> future
>>> policies, you can define a new SELinux policy capability along with
>>> the
>>> new permissions, and if the policy capability is enabled in the
>>> policy,
>>> check the new permissions rather than the old ones. A recent
>>> example of
>>> adding a new policy capability and using it can be seen in:
>>> https://lore.kernel.org/selinux/20200116194530.8696-1-jeffv@google.com/T/#u
>>> although that patch was rejected for other reasons.
>>>
>>> Another example was when we introduced fine-grained distinctions
>>> for all
>>> network address families, commit
>>> da69a5306ab92e07224da54aafee8b1dccf024f6.
>>>
>>> The new policy capability also needs to be defined in libsepol for
>>> use
>>> by the policy compiler; an example can be seen in:
>>> https://lore.kernel.org/selinux/20170714164801.6346-1-sds@tycho.nsa.gov/
>>>
>>> Then future policies can declare the policy capability when they
>>> are
>>> ready to start using the new permissions instead of the old.
>>>
>>>> Thanks,
>>>> David
>>>> ---
>>>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>>>> index 116b4d644f68..c8db5235b01f 100644
>>>> --- a/security/selinux/hooks.c
>>>> +++ b/security/selinux/hooks.c
>>>> @@ -6556,6 +6556,7 @@ static int
>>>> selinux_key_permission(key_ref_t
>>>> key_ref,
>>>>    {
>>>>        struct key *key;
>>>>        struct key_security_struct *ksec;
>>>> +    unsigned oldstyle_perm;
>>>>        u32 sid;
>>>>        /* if no specific permissions are requested, we skip the
>>>> @@ -6564,13 +6565,26 @@ static int
>>>> selinux_key_permission(key_ref_t
>>>> key_ref,
>>>>        if (perm == 0)
>>>>            return 0;
>>>> +    oldstyle_perm = perm & (KEY_NEED_VIEW | KEY_NEED_READ |
>>>> KEY_NEED_WRITE |
>>>> +                KEY_NEED_SEARCH | KEY_NEED_LINK);
>>>> +    if (perm & KEY_NEED_SETSEC)
>>>> +        oldstyle_perm |= OLD_KEY_NEED_SETATTR;
>>>> +    if (perm & KEY_NEED_INVAL)
>>>> +        oldstyle_perm |= KEY_NEED_SEARCH;
>>>> +    if (perm & KEY_NEED_REVOKE && !(perm &
>>>> OLD_KEY_NEED_SETATTR))
>>>> +        oldstyle_perm |= KEY_NEED_WRITE;
>>>> +    if (perm & KEY_NEED_JOIN)
>>>> +        oldstyle_perm |= KEY_NEED_SEARCH;
>>>> +    if (perm & KEY_NEED_CLEAR)
>>>> +        oldstyle_perm |= KEY_NEED_WRITE;
>>>> +
>>>
>>> I don't know offhand if this ensures that the same SELinux
>>> permission is
>>> always checked as it would have been previously for the same
>>> operation+arguments.  That's what you have to preserve for
>>> existing
>>> policies.
>>
>> As Richard pointed out in his email, your key-acl series replaces
>> two
>> different old permissions (LINK, SEARCH) with a single permission
>> (JOIN)
>> in different callers, so by the time we reach the SELinux hook we
>> cannot
>> map it back unambiguously and provide full backward
>> compatibility.  The
>> REVOKE case also seems fragile although there you seem to distinguish
>> by
>> sometimes passing in OLD_KEY_NEED_SETATTR and sometimes not?  You'll
>> have to fix the JOIN case to avoid userspace breakage.
>>
>> You may want to go ahead and explicitly translate all of the
>> KEY_NEED
>> permissions to SELinux permissions rather than passing the key
>> permissions directly here to avoid requiring that the values always
>> match.  The SELinux permission symbols are of the form
>> CLASS__PERMISSION
>> (NB double underscore), e.g. KEY__SETATTR, generated automatically
>> from
>> the security/selinux/include/classmap.h tables to the
>> security/selinux/av_permissions.h generated header. Most hooks
>> perform
>> such translation, e.g. file_mask_to_av().  You will almost certainly
>> need to do this if/when you introduce support for the new permissions
>> to
>> SELinux.
> 
> 
> This problem has now been fixed in [1].
> It passes the current selinux-test-suite (except test/fs_filesystem
> regression).
> 
> As the fix now includes a new 'key_perms' policy capability to allow
> use of the extended key permissions, I've updated libsepol and the
> selinux-testsuite test/keys to test these.
> 
> I'll submit two RFC patches that will allow [1] to be tested with
> 'key_perms' true or false.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-next

Was that kernel patch ever posted to selinux list and/or the selinux 
kernel maintainers?  I don't recall seeing it.  If not, please send it 
to the selinux list for review; at least one selinux maintainer should 
ack it before it gets accepted into any other tree.



