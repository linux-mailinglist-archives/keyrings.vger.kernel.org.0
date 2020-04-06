Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167E019FD76
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 20:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgDFSs1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 14:48:27 -0400
Received: from smtprelay0183.hostedemail.com ([216.40.44.183]:35024 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725887AbgDFSs1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 14:48:27 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 88B618378BB8;
        Mon,  6 Apr 2020 18:48:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:965:966:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2736:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3874:4321:4385:4390:4395:5007:7875:7903:8603:8700:10004:10400:10848:11232:11658:11914:12043:12050:12296:12297:12679:12740:12760:12895:13069:13161:13229:13311:13357:13439:14181:14659:14721:21080:21451:21627:21740:30012:30054:30060:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: view80_83acc3aa07734
X-Filterd-Recvd-Size: 2764
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Mon,  6 Apr 2020 18:48:24 +0000 (UTC)
Message-ID: <fa6260781d8a87ea04ac2014ddabaf7066fcdcec.camel@perches.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Waiman Long <longman@redhat.com>
Cc:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 06 Apr 2020 11:46:26 -0700
In-Reply-To: <CAHk-=wgjiHUWLZWKZJ4eU+RrOc2xNZCHn4ETmJ0S+H=Eig28Cw@mail.gmail.com>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
         <20200406023700.1367-1-longman@redhat.com>
         <319765.1586188840@warthog.procyon.org.uk>
         <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
         <19cbf3b1-2c3f-dd0f-a5c6-69ca3f77dd68@redhat.com>
         <CAHk-=wgjiHUWLZWKZJ4eU+RrOc2xNZCHn4ETmJ0S+H=Eig28Cw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-04-06 at 11:06 -0700, Linus Torvalds wrote:
> On Mon, Apr 6, 2020 at 10:59 AM Waiman Long <longman@redhat.com> wrote:
> > I have actually been thinking about that. I saw a couple of cases in the
> > crypto code where a memzero_explicit() is followed by kfree(). Those can
> > be replaced by kfree_sensitive.
> 
> Ack.
> 
> Doing that (and renaming kvzfree) should be a fairly straightforward
> coccinelle patch.

Not really as comment and prototype and existing cocci
scripts that contain kzfree are difficult to change.

A sed is straightforward and works well.

$ git grep -w --name-only kzfree | \
  xargs sed -i 's/\bkzfree\b/kfree_sensitive/'

For today's next that's:

$ git diff --shortstat
 116 files changed, 322 insertions(+), 322 deletions(-)

After this change:

The kernel-doc comment in slab_common.c should be
edited from zeroed to something else.

 * kfree_sensitive - like kfree but zero memory
 * @p: object to free memory of
 *
 * The memory of the object @p points to is zeroed before freed.
 * If @p is %NULL, kfree_sensitive() does nothing.
 *
 * Note: this function zeroes the whole allocated buffer which can be a good
 * deal bigger than the requested buffer size passed to kmalloc(). So be
 * careful when using this function in performance sensitive code.
 */


