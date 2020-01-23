Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D99C1472A0
	for <lists+keyrings@lfdr.de>; Thu, 23 Jan 2020 21:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgAWUfC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 23 Jan 2020 15:35:02 -0500
Received: from UHIL19PA37.eemsg.mail.mil ([214.24.21.196]:22942 "EHLO
        UHIL19PA37.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgAWUfB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 23 Jan 2020 15:35:01 -0500
X-EEMSG-check-017: 69171289|UHIL19PA37_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; 
   d="scan'208";a="69171289"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UHIL19PA37.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 23 Jan 2020 20:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1579811698; x=1611347698;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=JBXsnsuaJMIGaBhtwPLzCkNeh9xjN5w1iZ4yQXbZoe4=;
  b=KiAOKYZrDKJmCaPvg/8vz2rFJNMzPw9pt7sTWg4ti0KUkCAXO8YG1SBb
   cL6wmw9mxUYHd+pl3v/VTl9EO0QB87EfixXUDCxxZ+YHs2tpA+BwePXUM
   UKuWOzWyzuketHCno1YS48UAS+JRhMrBOudRQ+gSp885j8Tk9RN/PSUtr
   pkNJFzbG/U3ZUzW2CxFdwZf0nmszqkpHGzbVz0btQ/8G1CtUKcf3jv47l
   PWhGAQgsSgddXefEVwl1khbUrsMamLXnwVg0nTG0qTTgPXcS/kT5L5fW2
   PtNhuveAZyH6RtkfLS88TcUc1tyLYIzUIMlmGmdqVpFr4lAhTNjti1k6R
   Q==;
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; 
   d="scan'208";a="38180455"
IronPort-PHdr: =?us-ascii?q?9a23=3AaoAEDxZaPOM15w6zn9yzmDT/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZps6/Zx7h7PlgxGXEQZ/co6odzbaP7+a6AydQv97B6ClELMUXEU?=
 =?us-ascii?q?ddyI0/pE8JOIa9E0r1LfrnPWQRPf9pcxtbxUy9KlVfA83kZlff8TWY5D8WHQ?=
 =?us-ascii?q?jjZ0IufrymUoHdgN6q2O+s5pbdfxtHhCanYbN1MR66sRjdutMZjId/Jas90A?=
 =?us-ascii?q?XFrmVHd+lVxG5jOFafkwrh6suq85Nv7ipdt+g9+8JcVKnxYrg1Q6FfADk6KW?=
 =?us-ascii?q?4++dfltQPETQuB53scVnsZnx9VCAXb7x/0Q4n8vDLiuuVyxCeVM8v2TaspWT?=
 =?us-ascii?q?u59KdkVAXoiCYcODEn9mzcl9F9g7haoBKloBx/3pLUbYSIP/dwYq/RYdUXTn?=
 =?us-ascii?q?daU81PSyJOHJ+zb4oXD+oAI+lYqZX9p0ATphe6HAWgGf/jxiNNinLw06I6ye?=
 =?us-ascii?q?AhGhzY0gImEdwFrXDYoMz7OaoWVOy4yrTDwzfeYPNMwTrz9YjGfA4vof+PU7?=
 =?us-ascii?q?x/f8XexkszGA3KlViQtY/oMimJ2ugRvWWW7extXv+vhW49rAFxpyCiyNowio?=
 =?us-ascii?q?bXnoIVyk7L9SNky4goIN23Ukp7Ydq6H5pQqiqXMJB2Td45Q2xzpCY7yqEJuZ?=
 =?us-ascii?q?68fCQQzpQn3ATQZ+aIc4iP/BLuTeCcKip2inJifbKwnRey8U64x+3/SMa0yl?=
 =?us-ascii?q?BKoTRBktXWsXANzRPT586aQfV+5keswSuD2g/c5+1eIU04iLDXJ4Auz7IujJ?=
 =?us-ascii?q?YfrELOFTLslkrslq+ZbEAk9/Ct6+Tgf7rpuIeRN5RxigHiKqQundG/AfggPg?=
 =?us-ascii?q?gOQWeb/eO82aX//ULjWrVKj+A2krLDvJDbI8QbqKm5AxRL3Yk/8Rq/Ezen38?=
 =?us-ascii?q?gYnXkANl5Ffg6Ij5P1NF3UJfD4DPO/j0ytkDdt2f/GIqXsDojCI3XMirvsfa?=
 =?us-ascii?q?tx51RCxAc809xT/Y9YBqkEIP3pW0/xsNLYDgU+Mwyx2+vnE8hy1pgFVGKTAq?=
 =?us-ascii?q?6WLKPSsViS6uIpOOmDfpUZuDn6K/g7//Lul2M2mUcBfam12psacG23HvRhI0?=
 =?us-ascii?q?SXf3XshtMBEXwRswokUuPllV2CXiRPZ3qoQ6084TQ7Apq8DYjfXoCtnKCB3C?=
 =?us-ascii?q?CjE51MZ2BJFlCMHm3yd4qZQ/gDdDqdIs97nTwFU7iuVZQh2Aq1uw/myrpnKP?=
 =?us-ascii?q?bU9TMCtZLlytd1+/ffmg019TxxF86dyX2CT3lonmMUQD87xKN/rlJ9y1eZ0K?=
 =?us-ascii?q?h4hfNYFcdI6vNXXQc1K4Tcw/Z5C9/sQALBeMmGSFK8TtWhGzExQco7w8USbE?=
 =?us-ascii?q?ZlB9WikhfD0jKxA7ALk7yLBZo08r/T3nXqOcZ9xGjJ1LM7g1klXMRPL2umib?=
 =?us-ascii?q?B79wTJAI7JiUqZnb6wdasAxC7N6HuDzW2WsUFcUQ5wV7jFXH8GakvNs9v2+l?=
 =?us-ascii?q?7CT6WvCbQ7MgpN0MuCKqxXZd30iVVJWuzuOMrRY22vgWe8HxWIya2WbIrsZW?=
 =?us-ascii?q?od2D/RCE8ekwAc5XyGLxQxBj+9o2LCCzxjDVbvY0Lq8eljp3K3V0w0wB+Qb0?=
 =?us-ascii?q?1nybW1/gUYheKTS/wNxLIIoiQhpCtuHFa7wd3WD8CMpw17fKVTMpsB5wJr3H?=
 =?us-ascii?q?zYu0RdOYOtK6R5zgoScwNoskfqzD1tB4lAmNRsp3QvmllcM6WdhWhdeiuY0J?=
 =?us-ascii?q?a4AbjeLm3/7Vj7cKLN8k3P29aRvKEU4bI3rEu171LhLVYr73gyi4od6HCb/J?=
 =?us-ascii?q?ifSVNJAJ8=3D?=
X-IPAS-Result: =?us-ascii?q?A2A3BgBdAipe/wHyM5BlHgELHINzBYEYVSASKoQSiQOGc?=
 =?us-ascii?q?gMBAQaBN4lvj2KBZwkBAQEBAQEBAQEtCgEBhEACgkI4EwIQAQEBBAEBAQEBB?=
 =?us-ascii?q?QMBAWyFNwyCOykBgnoBBSMPAQVBEAkCDgoCAiYCAlcGDQYCAQGCYz8BglYlD?=
 =?us-ascii?q?5E8m3aBMoQ1AYRIgTgGgQ4qjDF5gQeBOA+CLy4+gksZBBqBFAESAQeDKIJeB?=
 =?us-ascii?q?IddhVtKiXh6lmCCQ4JLhHWFQ4krBhuad5dAlDciNzBxKwgCGAghD4MoEj0YD?=
 =?us-ascii?q?YgIBReIZIVdIwMyAQGKfREXAoE6XwEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 23 Jan 2020 20:34:57 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 00NKYC6F250944;
        Thu, 23 Jan 2020 15:34:13 -0500
Subject: Re: SELinux: How to split permissions for keys?
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     David Howells <dhowells@redhat.com>
Cc:     Richard Haines <richard_c_haines@btinternet.com>,
        keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
 <4057700.1579792320@warthog.procyon.org.uk>
 <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
Message-ID: <50f98f04-d00e-ae54-9a90-d0ff10be515a@tycho.nsa.gov>
Date:   Thu, 23 Jan 2020 15:35:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/23/20 10:46 AM, Stephen Smalley wrote:
> On 1/23/20 10:12 AM, David Howells wrote:
>> Hi Stephen,
>>
>> I have patches to split the permissions that are used for keys to make 
>> them a
>> bit finer grained and easier to use - and also to move to ACLs rather 
>> than
>> fixed masks.  See patch "keys: Replace uid/gid/perm permissions 
>> checking with
>> an ACL" here:
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-acl 
>>
>>
>> However, I may not have managed the permission mask transformation inside
>> SELinux correctly.  Could you lend an eyeball?  The change to the 
>> permissions
>> model is as follows:
>>
>>      The SETATTR permission is split to create two new permissions:
>>       (1) SET_SECURITY - which allows the key's owner, group and ACL 
>> to be
>>           changed and a restriction to be placed on a keyring.
>>       (2) REVOKE - which allows a key to be revoked.
>>      The SEARCH permission is split to create:
>>       (1) SEARCH - which allows a keyring to be search and a key to be 
>> found.
>>       (2) JOIN - which allows a keyring to be joined as a session 
>> keyring.
>>       (3) INVAL - which allows a key to be invalidated.
>>      The WRITE permission is also split to create:
>>       (1) WRITE - which allows a key's content to be altered and links 
>> to be
>>           added, removed and replaced in a keyring.
>>       (2) CLEAR - which allows a keyring to be cleared completely.  
>> This is
>>           split out to make it possible to give just this to an 
>> administrator.
>>       (3) REVOKE - see above.
>>
>> The change to SELinux is attached below.
>>
>> Should the split be pushed down into the SELinux policy rather than 
>> trying to
>> calculate it?
> 
> My understanding is that you must provide full backward compatibility 
> with existing policies; hence, you must ensure that you always check the 
> same SELinux permission(s) for the same operation when using an existing 
> policy.
> 
> In order to support finer-grained distinctions in SELinux with future 
> policies, you can define a new SELinux policy capability along with the 
> new permissions, and if the policy capability is enabled in the policy, 
> check the new permissions rather than the old ones. A recent example of 
> adding a new policy capability and using it can be seen in:
> https://lore.kernel.org/selinux/20200116194530.8696-1-jeffv@google.com/T/#u
> although that patch was rejected for other reasons.
> 
> Another example was when we introduced fine-grained distinctions for all 
> network address families, commit da69a5306ab92e07224da54aafee8b1dccf024f6.
> 
> The new policy capability also needs to be defined in libsepol for use 
> by the policy compiler; an example can be seen in:
> https://lore.kernel.org/selinux/20170714164801.6346-1-sds@tycho.nsa.gov/
> 
> Then future policies can declare the policy capability when they are 
> ready to start using the new permissions instead of the old.
> 
>>
>> Thanks,
>> David
>> ---
>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>> index 116b4d644f68..c8db5235b01f 100644
>> --- a/security/selinux/hooks.c
>> +++ b/security/selinux/hooks.c
>> @@ -6556,6 +6556,7 @@ static int selinux_key_permission(key_ref_t 
>> key_ref,
>>   {
>>       struct key *key;
>>       struct key_security_struct *ksec;
>> +    unsigned oldstyle_perm;
>>       u32 sid;
>>       /* if no specific permissions are requested, we skip the
>> @@ -6564,13 +6565,26 @@ static int selinux_key_permission(key_ref_t 
>> key_ref,
>>       if (perm == 0)
>>           return 0;
>> +    oldstyle_perm = perm & (KEY_NEED_VIEW | KEY_NEED_READ | 
>> KEY_NEED_WRITE |
>> +                KEY_NEED_SEARCH | KEY_NEED_LINK);
>> +    if (perm & KEY_NEED_SETSEC)
>> +        oldstyle_perm |= OLD_KEY_NEED_SETATTR;
>> +    if (perm & KEY_NEED_INVAL)
>> +        oldstyle_perm |= KEY_NEED_SEARCH;
>> +    if (perm & KEY_NEED_REVOKE && !(perm & OLD_KEY_NEED_SETATTR))
>> +        oldstyle_perm |= KEY_NEED_WRITE;
>> +    if (perm & KEY_NEED_JOIN)
>> +        oldstyle_perm |= KEY_NEED_SEARCH;
>> +    if (perm & KEY_NEED_CLEAR)
>> +        oldstyle_perm |= KEY_NEED_WRITE;
>> +
> 
> I don't know offhand if this ensures that the same SELinux permission is 
> always checked as it would have been previously for the same 
> operation+arguments.  That's what you have to preserve for existing 
> policies.

As Richard pointed out in his email, your key-acl series replaces two 
different old permissions (LINK, SEARCH) with a single permission (JOIN) 
in different callers, so by the time we reach the SELinux hook we cannot 
map it back unambiguously and provide full backward compatibility.  The 
REVOKE case also seems fragile although there you seem to distinguish by 
sometimes passing in OLD_KEY_NEED_SETATTR and sometimes not?  You'll 
have to fix the JOIN case to avoid userspace breakage.

You may want to go ahead and explicitly translate all of the KEY_NEED 
permissions to SELinux permissions rather than passing the key 
permissions directly here to avoid requiring that the values always 
match.  The SELinux permission symbols are of the form CLASS__PERMISSION 
(NB double underscore), e.g. KEY__SETATTR, generated automatically from 
the security/selinux/include/classmap.h tables to the 
security/selinux/av_permissions.h generated header. Most hooks perform 
such translation, e.g. file_mask_to_av().  You will almost certainly 
need to do this if/when you introduce support for the new permissions to 
SELinux.
