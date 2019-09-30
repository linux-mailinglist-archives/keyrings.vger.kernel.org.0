Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D94AC2997
	for <lists+keyrings@lfdr.de>; Tue,  1 Oct 2019 00:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfI3Way (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 30 Sep 2019 18:30:54 -0400
Received: from mailomta4-sa.btinternet.com ([213.120.69.10]:12119 "EHLO
        sa-prd-fep-049.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726103AbfI3Wax (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 30 Sep 2019 18:30:53 -0400
X-Greylist: delayed 21059 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Sep 2019 18:30:51 EDT
Received: from sa-prd-rgout-002.btmx-prd.synchronoss.net ([10.2.38.5])
          by sa-prd-fep-043.btinternet.com with ESMTP
          id <20190930163950.NHCT22185.sa-prd-fep-043.btinternet.com@sa-prd-rgout-002.btmx-prd.synchronoss.net>;
          Mon, 30 Sep 2019 17:39:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1569861590; 
        bh=+SeJ1WREYlhqJPXs3tmm7vjk81Tcd0lvCurJa6NU0SU=;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:MIME-Version;
        b=QNh0aotNuBAO6KLVFZxlKNGtMxv+/UT0madPJGkKNb5PEONNytalcVWvZEnwsb5KF9xRq/usggwKHNnXbVtBEqYbs9mK0nI0SdChqt3fI4d9BbUrSQifuP05e/6jJCjx1eQV2TDV09x+lyxp6wsbTPYS4yxzO7gZcPj+PGyTdpMdYgpeYGH8mg5T/jHq7zbFL3dFFdQ1CtnEo1e9KN6jDo+p/veiHjrpWnK8gRDPq+nHzSUCRIE+/cxgkGEceAA/BJkoTPeUUXSlf5/SVE0FXx0iDHqMcVjgO0y9ViWf9YtvZv8TvZtd3QqVST0/1+EMcqCd/XuBaSqzoY6oiNPQXw==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [86.134.4.158]
X-OWM-Source-IP: 86.134.4.158 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecukfhppeekiedrudefgedrgedrudehkeenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeekiedrudefgedrgedrudehkedpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequceuqfffjgepkeeukffvoffkoffgpdhrtghpthhtohepoeguhhhofigvlhhlshesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeokhgvhihrihhnghhssehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssehhohhtmhgrihhlrdgtohhmqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (86.134.4.158) by sa-prd-rgout-002.btmx-prd.synchronoss.net (5.8.337) (authenticated as richard_c_haines@btinternet.com)
        id 5D8A3C8F00EF9490; Mon, 30 Sep 2019 17:39:50 +0100
Message-ID: <dc24a7ad0e3c191310128cba4e64123e5aa66692.camel@btinternet.com>
Subject: Re: [RFC PATCH 22/27] KEYS: Replace uid/gid/perm permissions
 checking with an ACL
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, SELinux <selinux@vger.kernel.org>
Date:   Mon, 30 Sep 2019 17:39:49 +0100
In-Reply-To: <32623.1550252354@warthog.procyon.org.uk>
References: <758871dc-15b7-ed5c-a119-a40037309507@tycho.nsa.gov>
         <155024683432.21651.14153938339749694146.stgit@warthog.procyon.org.uk>
         <155024709026.21651.7275876165845045967.stgit@warthog.procyon.org.uk>
         <32623.1550252354@warthog.procyon.org.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2019-02-15 at 17:39 +0000, David Howells wrote:
> Stephen Smalley <sds@tycho.nsa.gov> wrote:
> 
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -6560,6 +6560,7 @@ static int selinux_key_permission(key_ref_t
> > > key_ref,
> > >   {
> > >   	struct key *key;
> > >   	struct key_security_struct *ksec;
> > > +	unsigned oldstyle_perm;
> > >   	u32 sid;
> > >     	/* if no specific permissions are requested, we skip
> > > the
> > > @@ -6568,13 +6569,26 @@ static int
> > > selinux_key_permission(key_ref_t key_ref,
> > >   	if (perm == 0)
> > >   		return 0;
> > >   +	oldstyle_perm = perm & (KEY_NEED_VIEW | KEY_NEED_READ |
> > > KEY_NEED_WRITE
> > > +				KEY_NEED_SEARCH | KEY_NEED_LINK);
> > > +	if (perm & KEY_NEED_SETSEC)
> > > +		oldstyle_perm |= OLD_KEY_NEED_SETATTR;
> > > +	if (perm & KEY_NEED_INVAL)
> > > +		oldstyle_perm |= KEY_NEED_SEARCH;
> > > +	if (perm & KEY_NEED_REVOKE && !(perm & OLD_KEY_NEED_SETATTR))
> > > +		oldstyle_perm |= KEY_NEED_WRITE;
> > > +	if (perm & KEY_NEED_JOIN)
> > > +		oldstyle_perm |= KEY_NEED_SEARCH;
For JOIN tranlation this should be:
oldstyle_perm |= KEY_NEED_LINK;

I know a bit late but just got around to writing some 'keys' tests for
the selinux-testsuite and found the above.

> > > +	if (perm & KEY_NEED_CLEAR)
> > > +		oldstyle_perm |= KEY_NEED_WRITE;
> > > +
> > >   	sid = cred_sid(cred);
> > >     	key = key_ref_to_ptr(key_ref);
> > >   	ksec = key->security;
> > >     	return avc_has_perm(&selinux_state,
> > > -			    sid, ksec->sid, SECCLASS_KEY, perm, NULL);
> > > +			    sid, ksec->sid, SECCLASS_KEY,
> > > oldstyle_perm, NULL);
> > 
> > This might be ok temporarily for compatibility but we'll want to
> > ultimately
> > define the new permissions in SELinux and switch over to using them
> > if a new
> > policy capability bit is set to indicate that the policy supports
> > them.  We
> > should probably decouple the SELinux permission bits from the
> > KEY_NEED_*
> > values and explicitly map them all at the same time.
> 
> Sounds reasonable.  I should probably detach the first two ACL
> patches from
> the set and push them separately.
> 
> David

