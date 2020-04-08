Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC28A1A1948
	for <lists+keyrings@lfdr.de>; Wed,  8 Apr 2020 02:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgDHAh0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 20:37:26 -0400
Received: from smtprelay0086.hostedemail.com ([216.40.44.86]:35160 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726406AbgDHAh0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 20:37:26 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id EC792180240BA;
        Wed,  8 Apr 2020 00:37:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 30,2,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:965:966:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2740:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4385:4390:4395:5007:6119:7904:8603:10010:10400:10848:11026:11232:11658:11914:12296:12297:12740:12760:12895:13069:13141:13230:13311:13357:13439:14096:14097:14659:14721:14819:21080:21324:21627:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:1:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cough31_235fb3002fe5a
X-Filterd-Recvd-Size: 2519
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Wed,  8 Apr 2020 00:37:22 +0000 (UTC)
Message-ID: <bc4500becb77f4e6396f69cc354ceb46c2aebb04.camel@perches.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive
 data objects
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Rientjes <rientjes@google.com>
Date:   Tue, 07 Apr 2020 17:35:24 -0700
In-Reply-To: <20200407221255.GM21484@bombadil.infradead.org>
References: <20200407200318.11711-1-longman@redhat.com>
         <0fe5dcaf078be61ef21c7f18b750c5dc14c69dd7.camel@perches.com>
         <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
         <20200407221255.GM21484@bombadil.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2020-04-07 at 15:12 -0700, Matthew Wilcox wrote:
> On Tue, Apr 07, 2020 at 04:45:45PM -0400, Waiman Long wrote:
> > On 4/7/20 4:31 PM, Joe Perches wrote:
> > > On Tue, 2020-04-07 at 16:03 -0400, Waiman Long wrote:
> > > > +extern void kvfree_sensitive(const void *addr, size_t len);
> > > Why should size_t len be required?
> > > 
> > > Why not do what kzfree does and memset
> > > the entire allocation? (area->size)
> > 
> > If the memory is really virtually mapped, the only way to find out the
> > size of the object is to use find_vm_area() which can be relatively high
> > cost and no simple helper function is available. On the other hand, the
> > length is readily available in the callers. So passing the length
> > directly to the kvfree_sensitive is simpler.
> 
> Also it lets us zero only the first N bytes of the allocation.  That might
> be good for performance, if only the first N bytes of an M byte allocation
> are actually sensitive.  I don't know if we have any such cases, but
> they could exist.

I would really doubt it as the allocation of
sensitive data should generally be separate.

Also, a similar argument could apply to
kzfree/kfree_sensitive.


