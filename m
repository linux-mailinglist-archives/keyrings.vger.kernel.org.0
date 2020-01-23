Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E20B3146D61
	for <lists+keyrings@lfdr.de>; Thu, 23 Jan 2020 16:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgAWPwu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 23 Jan 2020 10:52:50 -0500
Received: from UHIL19PA37.eemsg.mail.mil ([214.24.21.196]:9988 "EHLO
        UHIL19PA37.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgAWPwt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 23 Jan 2020 10:52:49 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Jan 2020 10:52:49 EST
X-EEMSG-check-017: 69023795|UHIL19PA37_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; 
   d="scan'208";a="69023795"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UHIL19PA37.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 23 Jan 2020 15:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1579794339; x=1611330339;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=drKQCENr0Kbe/HhOd4zAwQrBmEXx0ecJBZBdpVLXjO4=;
  b=iDRa+VGM2A/6B+/HfdQzdiCRspv2JiHmD/3+jxPkQuky7e08PrL6bfj9
   lv4rfSbnb8e2qDP0r0i6XWRnhy3q17o9WmmxNJTy4MbgWCGRSN0tpuPAJ
   2N7aFpCn/cb+GA8v68g8FMSX8UhHSnT1NeJwjZaoKY9fJsrL4Wkb2rraf
   wkq16DFF3gbU+GV/sXOG2WKSatKarjy/I548ItEcduBsnL7gRr6Qsy7pu
   3XklsuPmbraHA6OiEmgDQ0oiTKFViOqLOoWm5U+MwHnwI5QKfbRJ6G6dk
   oscXrbITS1K/cLpETu460juEwc4jKUDmQge+xnb91cN+v96iBqXWGDaaK
   g==;
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; 
   d="scan'208";a="32254759"
IronPort-PHdr: =?us-ascii?q?9a23=3ALf4G2R3ezVxBiWOusmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZsesUL//xwZ3uMQTl6Ol3ixeRBMOHsq4C0bCd7/6oGTRZp8rY6zZaKN0Efi?=
 =?us-ascii?q?RGoP1epxYnDs+BBB+zB9/RRAt+Iv5/UkR49WqwK0lfFZW2TVTTpnqv8WxaQU?=
 =?us-ascii?q?2nZkJ6KevvB4Hdkdm82fys9J3PeQVIgye2ba9vIBmsogjdq8YbjZF8JqovxR?=
 =?us-ascii?q?fErXpFcPlSyW90OF6fhRnx6tq+8ZJ57yhcp/ct/NNcXKvneKg1UaZWByk8PW?=
 =?us-ascii?q?Av483ruxjDTQ+R6XYZT24bjBlGDRXb4R/jRpv+vTf0ueR72CmBIM35Vqs0Vi?=
 =?us-ascii?q?i476dqUxDnliEKPCMk/W7Ni8xwiKVboA+9pxF63oXZbp2ZOOZ4c6jAZt4RW3?=
 =?us-ascii?q?ZPUdhNWCxAGoO8bpUAD+wdPeZDsoLxo0ICoQaiCQWwAe/izDFHhmXy3aYnze?=
 =?us-ascii?q?ovFw/I1xEkE94XvnnZqND5OaEPWu630abI1y3OYe5I1zfz6IbGcR4vrv+DUr?=
 =?us-ascii?q?1ybcXfxlIiFx/Hg1iKtYDpIz2Y2+YLvmOG7+RgT+Wvi2s/pg9svjig2N8sio?=
 =?us-ascii?q?nXiYIT11vK6CB5z5wxJd28VkF6YcOvHZxLty6HLIt7Wd8iQmF0tyY6zb0Ko5?=
 =?us-ascii?q?i7fDMQx5g9yB7fbOKHfpGO7xn+WuiRJjJ4i2hkeLK5nxuy8lavyvf6Vsaq1F?=
 =?us-ascii?q?ZGtC1FksPDtn0Lyhfd6dCHR+Ng8kqu1juDzQDe5vxeLUwqmqfXNYQtzqM2m5?=
 =?us-ascii?q?EOq0rMBDX2l1/zjKKOc0Uk/fWn5Pr/b7X9o5+cK5d0igbjMqQygsC/Afo3Mg?=
 =?us-ascii?q?wJX2WD5eSzzqfj/UzkQLVRlPE2k6/ZsJ7dJcQAuKG2HxVZ0poj6hmjDzem18?=
 =?us-ascii?q?4UnX8bI1JeZB2LlY3pO1DKIPzgDPe/hUqjkCtzyvzbMbDsDY/BI3jenLv7Y7?=
 =?us-ascii?q?pw5FBQxBAuwdxH4pJbELABIPb9Wk/rs9zYCwc0MxepzOb8E9h9yoMfVn6PAq?=
 =?us-ascii?q?+eKq/St0SI6fg1L+mDY48Vpi7xK+I56P72kX85hVgdcLG00psXb3C5EOppI0?=
 =?us-ascii?q?GdYXr3mdoBC3kFsRc+TOPwlF2OSyJcZ3G3X6gk/DE0FJqmDZvfRoCqmLGBxi?=
 =?us-ascii?q?a7EYFWZm9cEFCDDG/neJmcVPcMci2SI8lhnSIfVbW6UIAhyRCutAnmy7V5NO?=
 =?us-ascii?q?rU/DMXtY752Ndp4O3TkAk49SZoAMSFz2GNU2Z0k3sLRzAo3KF/u019ylGM0a?=
 =?us-ascii?q?hjmPFYC9NT6O1TUgsgNp7T0fZ6C9bsVQLFZNuJT0ymQtq+CzErUt0x28MOY1?=
 =?us-ascii?q?p6G9i6lRDMwS6qA74Tl7yWC5056bzc33fvKMZn0XrG17cuj0MgQsRRMW2qnK?=
 =?us-ascii?q?l/9xLcB4TRiUWWi76qdbgA3C7K7GqDyWuOvEdFUA9/SKnFRm4QaVfLrdTj50?=
 =?us-ascii?q?PCU7+vBa0iMgtG1MGCN69KZcPygFVYS/fsJs7eb3iym2iuHxaIwK2DbI7wd2?=
 =?us-ascii?q?UaxiXdB1AOkxoP8naeKQg+GiChrnraDDxvE1Lvfkzt/fB9qHylVE80yR+Fb0?=
 =?us-ascii?q?l62rqr9R4am+acR+kQ3r0aoichrSt7HFKn09LREdqAqFkpQKIJTdoj4VsP9W?=
 =?us-ascii?q?XGugh5JdT0I6BlmVMadx9fpU7i1xxrTI5HlJ55gmktyV9JNa+A0F5HPwid1J?=
 =?us-ascii?q?T0N6yffnL+5zizeqXW3RfYy9/Q9aARvqdr427/tR2kQxJxu05s1MNYhj7Fvc?=
 =?us-ascii?q?TH?=
X-IPAS-Result: =?us-ascii?q?A2BsBQA0vyle/wHyM5BmHgELHIN4gRhVIBIqhBKJA4Z0B?=
 =?us-ascii?q?oE3iW+PYoFnCQEBAQEBAQEBAS0KAQGEQAKCQjgTAhABAQEEAQEBAQEFAwEBb?=
 =?us-ascii?q?IU3DII7KQGCeQEBAQECASMEEUEFCwsOCgICJgICVwYNBgIBAYJjPwGCVgUgD?=
 =?us-ascii?q?6tTdX8zhDUBgRSDNoE4BoEOKowxeYEHgREnD4IvLj6CSxkEGoEvgyiCXgSHX?=
 =?us-ascii?q?YYliTJGepZggkOCS4R1hUOJKwYbmneXQJQ3IjeBISsIAhgIIQ+DKBI9GA2IC?=
 =?us-ascii?q?AUXiGSFXSMDMgEBizUqgTpfAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 23 Jan 2020 15:45:38 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 00NFiurh108692;
        Thu, 23 Jan 2020 10:44:56 -0500
Subject: Re: SELinux: How to split permissions for keys?
To:     David Howells <dhowells@redhat.com>
Cc:     Richard Haines <richard_c_haines@btinternet.com>,
        keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
 <4057700.1579792320@warthog.procyon.org.uk>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
Date:   Thu, 23 Jan 2020 10:46:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <4057700.1579792320@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 1/23/20 10:12 AM, David Howells wrote:
> Hi Stephen,
> 
> I have patches to split the permissions that are used for keys to make them a
> bit finer grained and easier to use - and also to move to ACLs rather than
> fixed masks.  See patch "keys: Replace uid/gid/perm permissions checking with
> an ACL" here:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-acl
> 
> However, I may not have managed the permission mask transformation inside
> SELinux correctly.  Could you lend an eyeball?  The change to the permissions
> model is as follows:
> 
>      The SETATTR permission is split to create two new permissions:
>      
>       (1) SET_SECURITY - which allows the key's owner, group and ACL to be
>           changed and a restriction to be placed on a keyring.
>      
>       (2) REVOKE - which allows a key to be revoked.
>      
>      The SEARCH permission is split to create:
>      
>       (1) SEARCH - which allows a keyring to be search and a key to be found.
>      
>       (2) JOIN - which allows a keyring to be joined as a session keyring.
>      
>       (3) INVAL - which allows a key to be invalidated.
>      
>      The WRITE permission is also split to create:
>      
>       (1) WRITE - which allows a key's content to be altered and links to be
>           added, removed and replaced in a keyring.
>      
>       (2) CLEAR - which allows a keyring to be cleared completely.  This is
>           split out to make it possible to give just this to an administrator.
>      
>       (3) REVOKE - see above.
> 
> The change to SELinux is attached below.
> 
> Should the split be pushed down into the SELinux policy rather than trying to
> calculate it?

My understanding is that you must provide full backward compatibility 
with existing policies; hence, you must ensure that you always check the 
same SELinux permission(s) for the same operation when using an existing 
policy.

In order to support finer-grained distinctions in SELinux with future 
policies, you can define a new SELinux policy capability along with the 
new permissions, and if the policy capability is enabled in the policy, 
check the new permissions rather than the old ones. A recent example of 
adding a new policy capability and using it can be seen in:
https://lore.kernel.org/selinux/20200116194530.8696-1-jeffv@google.com/T/#u
although that patch was rejected for other reasons.

Another example was when we introduced fine-grained distinctions for all 
network address families, commit da69a5306ab92e07224da54aafee8b1dccf024f6.

The new policy capability also needs to be defined in libsepol for use 
by the policy compiler; an example can be seen in:
https://lore.kernel.org/selinux/20170714164801.6346-1-sds@tycho.nsa.gov/

Then future policies can declare the policy capability when they are 
ready to start using the new permissions instead of the old.

> 
> Thanks,
> David
> ---
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 116b4d644f68..c8db5235b01f 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6556,6 +6556,7 @@ static int selinux_key_permission(key_ref_t key_ref,
>   {
>   	struct key *key;
>   	struct key_security_struct *ksec;
> +	unsigned oldstyle_perm;
>   	u32 sid;
>   
>   	/* if no specific permissions are requested, we skip the
> @@ -6564,13 +6565,26 @@ static int selinux_key_permission(key_ref_t key_ref,
>   	if (perm == 0)
>   		return 0;
>   
> +	oldstyle_perm = perm & (KEY_NEED_VIEW | KEY_NEED_READ | KEY_NEED_WRITE |
> +				KEY_NEED_SEARCH | KEY_NEED_LINK);
> +	if (perm & KEY_NEED_SETSEC)
> +		oldstyle_perm |= OLD_KEY_NEED_SETATTR;
> +	if (perm & KEY_NEED_INVAL)
> +		oldstyle_perm |= KEY_NEED_SEARCH;
> +	if (perm & KEY_NEED_REVOKE && !(perm & OLD_KEY_NEED_SETATTR))
> +		oldstyle_perm |= KEY_NEED_WRITE;
> +	if (perm & KEY_NEED_JOIN)
> +		oldstyle_perm |= KEY_NEED_SEARCH;
> +	if (perm & KEY_NEED_CLEAR)
> +		oldstyle_perm |= KEY_NEED_WRITE;
> +

I don't know offhand if this ensures that the same SELinux permission is 
always checked as it would have been previously for the same 
operation+arguments.  That's what you have to preserve for existing 
policies.

>   	sid = cred_sid(cred);
>   
>   	key = key_ref_to_ptr(key_ref);
>   	ksec = key->security;
>   
>   	return avc_has_perm(&selinux_state,
> -			    sid, ksec->sid, SECCLASS_KEY, perm, NULL);
> +			    sid, ksec->sid, SECCLASS_KEY, oldstyle_perm, NULL);
>   }
>   
>   static int selinux_key_getsecurity(struct key *key, char **_buffer)
> 

