Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2EC14FEE4
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2020 20:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgBBTab (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 2 Feb 2020 14:30:31 -0500
Received: from mailomta31-sa.btinternet.com ([213.120.69.37]:38169 "EHLO
        sa-prd-fep-049.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726943AbgBBTab (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 2 Feb 2020 14:30:31 -0500
Received: from sa-prd-rgout-004.btmx-prd.synchronoss.net ([10.2.38.7])
          by sa-prd-fep-049.btinternet.com with ESMTP
          id <20200202193027.PFCH6374.sa-prd-fep-049.btinternet.com@sa-prd-rgout-004.btmx-prd.synchronoss.net>;
          Sun, 2 Feb 2020 19:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1580671827; 
        bh=ot265DuLcDvIJkdqGUGmd6GlvLE0HkQlV2rrUvZoH+M=;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:MIME-Version;
        b=tbCdy18Vr/+ILNrEQIZ3QKUZ5r0fMa1vttHDYGWVCrPAie/T4SLYBx4cUlK4UxPRIdXOhyeYOvYfvT+qN/ef5xlOIAsOueMIFzyUFzDhNUOLAkedNvt21HNxpYA21h3C5v4z5uWa+crU4aHFPtiGefalCXeNdQARtfihjvmnkQV3+OBC3u8Gc4TzYQqF09nl8SGwqLIPpUHxyUcD57Sz6GN9q+E4HiRccCVAQenxBIO1ghHa7p2+9Unjlq4Mg7/IheMBgJoqKuMVa1FgYdLlaETe4603zcUAViBV/CyDxmJ0/rTR12cd8DtKzllFKIxuVguzSILm93SJTG/jXtFUMQ==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [31.49.56.38]
X-OWM-Source-IP: 31.49.56.38 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrgeehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeefuddrgeelrdehiedrfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeefuddrgeelrdehiedrfeekpdhmrghilhhfrhhomhepoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeoughhohifvghllhhssehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehkvgihrhhinhhgshesvhhgvghrrdhkvghrnhgvlhdrohhrgheqpdhrtghpthhtohepoehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgheqpdhrtghpthhtohepoehlihhnuhigqdhsvggtuhhrihhthidqmhhoughulhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphht
        thhopeeophgruhhlsehprghulhdqmhhoohhrvgdrtghomheqpdhrtghpthhtohepoehrihgthhgrrhgupggtpghhrghinhgvsheshhhothhmrghilhdrtghomheqpdhrtghpthhtohepoehsughssehthigthhhordhnshgrrdhgohhvqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (31.49.56.38) by sa-prd-rgout-004.btmx-prd.synchronoss.net (5.8.337) (authenticated as richard_c_haines@btinternet.com)
        id 5E1A2CBA036A7478; Sun, 2 Feb 2020 19:30:27 +0000
Message-ID: <459818a9ad1c808298bf3d7c9bcb130323d30e97.camel@btinternet.com>
Subject: Re: SELinux: How to split permissions for keys?
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     Stephen Smalley <sds@tycho.nsa.gov>,
        David Howells <dhowells@redhat.com>, paul@paul-moore.com
Cc:     keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 02 Feb 2020 19:30:26 +0000
In-Reply-To: <50f98f04-d00e-ae54-9a90-d0ff10be515a@tycho.nsa.gov>
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
         <4057700.1579792320@warthog.procyon.org.uk>
         <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
         <50f98f04-d00e-ae54-9a90-d0ff10be515a@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2020-01-23 at 15:35 -0500, Stephen Smalley wrote:
> On 1/23/20 10:46 AM, Stephen Smalley wrote:
> > On 1/23/20 10:12 AM, David Howells wrote:
> > > Hi Stephen,
> > > 
> > > I have patches to split the permissions that are used for keys to
> > > make 
> > > them a
> > > bit finer grained and easier to use - and also to move to ACLs
> > > rather 
> > > than
> > > fixed masks.  See patch "keys: Replace uid/gid/perm permissions 
> > > checking with
> > > an ACL" here:
> > > 
> > >     
> > > https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-acl
> > >  
> > > 
> > > 
> > > However, I may not have managed the permission mask
> > > transformation inside
> > > SELinux correctly.  Could you lend an eyeball?  The change to
> > > the 
> > > permissions
> > > model is as follows:
> > > 
> > >      The SETATTR permission is split to create two new
> > > permissions:
> > >       (1) SET_SECURITY - which allows the key's owner, group and
> > > ACL 
> > > to be
> > >           changed and a restriction to be placed on a keyring.
> > >       (2) REVOKE - which allows a key to be revoked.
> > >      The SEARCH permission is split to create:
> > >       (1) SEARCH - which allows a keyring to be search and a key
> > > to be 
> > > found.
> > >       (2) JOIN - which allows a keyring to be joined as a
> > > session 
> > > keyring.
> > >       (3) INVAL - which allows a key to be invalidated.
> > >      The WRITE permission is also split to create:
> > >       (1) WRITE - which allows a key's content to be altered and
> > > links 
> > > to be
> > >           added, removed and replaced in a keyring.
> > >       (2) CLEAR - which allows a keyring to be cleared
> > > completely.  
> > > This is
> > >           split out to make it possible to give just this to an 
> > > administrator.
> > >       (3) REVOKE - see above.
> > > 
> > > The change to SELinux is attached below.
> > > 
> > > Should the split be pushed down into the SELinux policy rather
> > > than 
> > > trying to
> > > calculate it?
> > 
> > My understanding is that you must provide full backward
> > compatibility 
> > with existing policies; hence, you must ensure that you always
> > check the 
> > same SELinux permission(s) for the same operation when using an
> > existing 
> > policy.
> > 
> > In order to support finer-grained distinctions in SELinux with
> > future 
> > policies, you can define a new SELinux policy capability along with
> > the 
> > new permissions, and if the policy capability is enabled in the
> > policy, 
> > check the new permissions rather than the old ones. A recent
> > example of 
> > adding a new policy capability and using it can be seen in:
> > https://lore.kernel.org/selinux/20200116194530.8696-1-jeffv@google.com/T/#u
> > although that patch was rejected for other reasons.
> > 
> > Another example was when we introduced fine-grained distinctions
> > for all 
> > network address families, commit
> > da69a5306ab92e07224da54aafee8b1dccf024f6.
> > 
> > The new policy capability also needs to be defined in libsepol for
> > use 
> > by the policy compiler; an example can be seen in:
> > https://lore.kernel.org/selinux/20170714164801.6346-1-sds@tycho.nsa.gov/
> > 
> > Then future policies can declare the policy capability when they
> > are 
> > ready to start using the new permissions instead of the old.
> > 
> > > Thanks,
> > > David
> > > ---
> > > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > > index 116b4d644f68..c8db5235b01f 100644
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -6556,6 +6556,7 @@ static int
> > > selinux_key_permission(key_ref_t 
> > > key_ref,
> > >   {
> > >       struct key *key;
> > >       struct key_security_struct *ksec;
> > > +    unsigned oldstyle_perm;
> > >       u32 sid;
> > >       /* if no specific permissions are requested, we skip the
> > > @@ -6564,13 +6565,26 @@ static int
> > > selinux_key_permission(key_ref_t 
> > > key_ref,
> > >       if (perm == 0)
> > >           return 0;
> > > +    oldstyle_perm = perm & (KEY_NEED_VIEW | KEY_NEED_READ | 
> > > KEY_NEED_WRITE |
> > > +                KEY_NEED_SEARCH | KEY_NEED_LINK);
> > > +    if (perm & KEY_NEED_SETSEC)
> > > +        oldstyle_perm |= OLD_KEY_NEED_SETATTR;
> > > +    if (perm & KEY_NEED_INVAL)
> > > +        oldstyle_perm |= KEY_NEED_SEARCH;
> > > +    if (perm & KEY_NEED_REVOKE && !(perm &
> > > OLD_KEY_NEED_SETATTR))
> > > +        oldstyle_perm |= KEY_NEED_WRITE;
> > > +    if (perm & KEY_NEED_JOIN)
> > > +        oldstyle_perm |= KEY_NEED_SEARCH;
> > > +    if (perm & KEY_NEED_CLEAR)
> > > +        oldstyle_perm |= KEY_NEED_WRITE;
> > > +
> > 
> > I don't know offhand if this ensures that the same SELinux
> > permission is 
> > always checked as it would have been previously for the same 
> > operation+arguments.  That's what you have to preserve for
> > existing 
> > policies.
> 
> As Richard pointed out in his email, your key-acl series replaces
> two 
> different old permissions (LINK, SEARCH) with a single permission
> (JOIN) 
> in different callers, so by the time we reach the SELinux hook we
> cannot 
> map it back unambiguously and provide full backward
> compatibility.  The 
> REVOKE case also seems fragile although there you seem to distinguish
> by 
> sometimes passing in OLD_KEY_NEED_SETATTR and sometimes not?  You'll 
> have to fix the JOIN case to avoid userspace breakage.
> 
> You may want to go ahead and explicitly translate all of the
> KEY_NEED 
> permissions to SELinux permissions rather than passing the key 
> permissions directly here to avoid requiring that the values always 
> match.  The SELinux permission symbols are of the form
> CLASS__PERMISSION 
> (NB double underscore), e.g. KEY__SETATTR, generated automatically
> from 
> the security/selinux/include/classmap.h tables to the 
> security/selinux/av_permissions.h generated header. Most hooks
> perform 
> such translation, e.g. file_mask_to_av().  You will almost certainly 
> need to do this if/when you introduce support for the new permissions
> to 
> SELinux.


This problem has now been fixed in [1].
It passes the current selinux-test-suite (except test/fs_filesystem
regression).

As the fix now includes a new 'key_perms' policy capability to allow
use of the extended key permissions, I've updated libsepol and the
selinux-testsuite test/keys to test these.

I'll submit two RFC patches that will allow [1] to be tested with
'key_perms' true or false.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-next



