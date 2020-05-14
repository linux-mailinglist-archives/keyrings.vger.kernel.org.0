Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C351D2F2F
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 14:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgENMI5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 08:08:57 -0400
Received: from smtprelay0116.hostedemail.com ([216.40.44.116]:40704 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgENMI5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 08:08:57 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 99D5A18224D7E;
        Thu, 14 May 2020 12:08:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:965:966:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3871:3872:3874:4321:4385:4390:4395:5007:6691:6742:10004:10400:10450:10455:10848:11026:11232:11473:11658:11914:12043:12297:12740:12760:12895:13069:13311:13357:13439:14659:14721:19904:19999:21080:21627:21966:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: taste99_13733fd571143
X-Filterd-Recvd-Size: 2031
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Thu, 14 May 2020 12:08:53 +0000 (UTC)
Message-ID: <c44df8c581014158b7b2753f446ea27741f40c94.camel@perches.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive
 data objects
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Balbir Singh <bsingharora@gmail.com>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Rientjes <rientjes@google.com>
Date:   Thu, 14 May 2020 05:08:52 -0700
In-Reply-To: <20200514120018.GA16070@bombadil.infradead.org>
References: <20200407200318.11711-1-longman@redhat.com>
         <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
         <20200514120018.GA16070@bombadil.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2020-05-14 at 05:00 -0700, Matthew Wilcox wrote:
> On Thu, May 14, 2020 at 09:00:40PM +1000, Balbir Singh wrote:
> > I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.
> > 
> > void kvfree_sensitive(const void *addr, size_t len)
> > {
> > 	preempt_disable();
> > 	if (likely(!ZERO_OR_NULL_PTR(addr))) {
> > 		memzero_explicit((void *)addr, len);
> > 		kvfree(addr);
> > 	}
> > 	preempt_enable();
> > }
> > EXPORT_SYMBOL(kvfree_sensitive);
> 
> If it's _that_ sensitive then the caller should have disabled preemption.
> Because preemption could otherwise have occurred immediately before
> kvfree_sensitive() was called.

static inline ?

