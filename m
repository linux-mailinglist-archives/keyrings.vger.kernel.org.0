Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8E119FB17
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgDFRMW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:12:22 -0400
Received: from smtprelay0060.hostedemail.com ([216.40.44.60]:55862 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729811AbgDFRMW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:12:22 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 452E818015864;
        Mon,  6 Apr 2020 17:12:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:965:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3872:3874:4321:4385:4390:4395:5007:7904:10004:10400:10848:11232:11658:11914:12050:12296:12297:12679:12740:12760:12895:13019:13069:13311:13357:13439:14181:14659:14721:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: rod06_144c12ce97501
X-Filterd-Recvd-Size: 1895
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Mon,  6 Apr 2020 17:12:19 +0000 (UTC)
Message-ID: <dbfcbbd55c63fc87bfb31af3cae1b15e04d8a821.camel@perches.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
From:   Joe Perches <joe@perches.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 06 Apr 2020 10:10:20 -0700
In-Reply-To: <334933.1586190389@warthog.procyon.org.uk>
References: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
         <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
         <20200406023700.1367-1-longman@redhat.com>
         <319765.1586188840@warthog.procyon.org.uk>
         <334933.1586190389@warthog.procyon.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-04-06 at 17:26 +0100, David Howells wrote:
> Joe Perches <joe@perches.com> wrote:
> 
> > While I agree with Linus about the __ prefix,
> > the z is pretty common and symmetric to all
> > the <foo>zalloc uses.
> > 
> > And if _sensitive is actually used, it'd be
> > good to do a s/kzfree/kfree_sensitive/ one day
> > sooner than later.
> 
> How much overhead would it be to always use kvfree_sensitive() and never have
> a kfree_sensitive()?

Another possibility:

Add yet another alloc flag like __GFP_SENSITIVE
and have kfree operate on that and not have a
kfree_sensitive at all.



