Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9188D1A0782
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 08:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgDGGnY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 02:43:24 -0400
Received: from smtprelay0124.hostedemail.com ([216.40.44.124]:39070 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726865AbgDGGnY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 02:43:24 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 6F365838437C;
        Tue,  7 Apr 2020 06:43:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:965:966:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:2892:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4385:4390:4395:5007:6119:7903:10004:10400:10848:11232:11658:11914:12048:12297:12663:12740:12760:12895:13069:13076:13311:13357:13439:14096:14097:14181:14659:14721:21080:21324:21627:30041:30054:30075:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: bell44_74a655a6ef330
X-Filterd-Recvd-Size: 2602
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Tue,  7 Apr 2020 06:43:21 +0000 (UTC)
Message-ID: <07e49a285eff9a22476c6b1c396485f6d5d39002.camel@perches.com>
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive
 data objects
From:   Joe Perches <joe@perches.com>
To:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     linux-mm@kvack.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
Date:   Mon, 06 Apr 2020 23:41:23 -0700
In-Reply-To: <1e4a6174-04be-6c05-fd6e-b43fefd317fc@redhat.com>
References: <20200406185827.22249-1-longman@redhat.com>
         <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
         <1e4a6174-04be-6c05-fd6e-b43fefd317fc@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-04-06 at 22:16 -0400, Waiman Long wrote:
> On 4/6/20 3:38 PM, Joe Perches wrote:
> > On Mon, 2020-04-06 at 14:58 -0400, Waiman Long wrote:
> > > For kvmalloc'ed data object that contains sensitive information like
> > > cryptographic key, we need to make sure that the buffer is always
> > > cleared before freeing it. Using memset() alone for buffer clearing may
> > > not provide certainty as the compiler may compile it away. To be sure,
> > > the special memzero_explicit() has to be used.
> > [] 
> > >  extern void kvfree(const void *addr);
> > > +extern void kvfree_sensitive(const void *addr, size_t len);
> > Question: why should this be const?
> > 
> > 2.1.44 changed kfree(void *) to kfree(const void *) but
> > I didn't find a particular reason why.
> 
> I am just following the function prototype used by kvfree(). Even
> kzfree(const void *) use const. I can remove "const" if others agree.

No worries.  Nevermind me...

Lots of warnings if allocated pointers are const, so const is necessary
in the definition and declaration.

struct foo {
	...
};

struct bar {
	const struct foo *baz;
	...
};

some_func(void)
{
	bar.baz = kvalloc(...);
}

kvfree can't free bar.baz if it's defined with void * without warning,
so it must be const void *.

Apologies for the noise.


