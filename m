Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9252D19FAAB
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgDFQox (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:44:53 -0400
Received: from smtprelay0228.hostedemail.com ([216.40.44.228]:52410 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729042AbgDFQox (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:44:53 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id AC18E8378BA1;
        Mon,  6 Apr 2020 16:44:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:965:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:4321:4385:4390:4395:5007:6691:7904:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:30054:30060:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: bomb61_4778f7b443b57
X-Filterd-Recvd-Size: 1970
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Mon,  6 Apr 2020 16:44:51 +0000 (UTC)
Message-ID: <adc76d7c441e8f10697b61ceaff66207fb219886.camel@perches.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     David Howells <dhowells@redhat.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 06 Apr 2020 09:42:52 -0700
In-Reply-To: <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
         <20200406023700.1367-1-longman@redhat.com>
         <319765.1586188840@warthog.procyon.org.uk>
         <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
         <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-04-06 at 09:41 -0700, Linus Torvalds wrote:
> On Mon, Apr 6, 2020 at 9:12 AM Joe Perches <joe@perches.com> wrote:
> > While I agree with Linus about the __ prefix,
> > the z is pretty common and symmetric to all
> > the <foo>zalloc uses.
> 
> Yes, we have a pattern of 'z' for zero.
> 
> But the _operation_ isn't symmetric.
> 
> "kzalloc()" has absolutely _nothing_ to do with "kzfree()". They are
> not some kind of "opposite symmetric operation".  They are totally
> different. They have absolutely nothing in common.

Dubious assertion.  Both end up with zeroed memory.


