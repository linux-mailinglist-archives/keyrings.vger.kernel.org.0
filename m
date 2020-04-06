Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DB019F9DD
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgDFQME (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:12:04 -0400
Received: from smtprelay0164.hostedemail.com ([216.40.44.164]:42242 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728707AbgDFQMD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:12:03 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 37DF0100E7B72;
        Mon,  6 Apr 2020 16:12:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:965:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2828:2892:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4362:4385:4390:4395:5007:6119:6691:7903:7904:8660:9163:10004:10400:10848:11232:11658:11914:12050:12296:12297:12740:12760:12895:13148:13161:13229:13230:13439:14096:14097:14181:14659:14721:21080:21433:21627:21795:21939:21990:30029:30054:30075:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: rest46_4bb8419fa601a
X-Filterd-Recvd-Size: 3233
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Mon,  6 Apr 2020 16:12:00 +0000 (UTC)
Message-ID: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
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
Date:   Mon, 06 Apr 2020 09:10:02 -0700
In-Reply-To: <319765.1586188840@warthog.procyon.org.uk>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
         <20200406023700.1367-1-longman@redhat.com>
         <319765.1586188840@warthog.procyon.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 2020-04-06 at 17:00 +0100, David Howells wrote:
> Joe Perches <joe@perches.com> wrote:
> 
> > > This patch introduces a new kvfree_sensitive() for freeing those
> > > sensitive data objects allocated by kvmalloc(). The relevnat places
> > > where kvfree_sensitive() can be used are modified to use it.
> > 
> > Why isn't this called kvzfree like the existing kzfree?
> 
> To quote Linus:
> 
> 	We have a function for clearing sensitive information: it's called
> 	"memclear_explicit()", and it's about forced (explicit) clearing even
> 	if the data might look dead afterwards.
> 
> 	The other problem with that function is the name: "__kvzfree()" is not
> 	a useful name for this function. We use the "__" format for internal
> 	low-level helpers, and it generally means that it does *less* than the
> 	full function. This does more, not less, and "__" is not following any
> 	sane naming model.
> 
> 	So the name should probably be something like "kvfree_sensitive()" or
> 	similar. Or maybe it could go even further, and talk about _why_ it's
> 	sensitive, and call it "kvfree_cleartext()" or something like that.
> 
> 	Because the clearing is really not what even matters. It might choose
> 	other patterns to overwrite things with, but it might do other things
> 	too, like putting special barriers for data leakage (or flags to tell
> 	return-to-user-mode to do so).
> 
> 	And yes, kzfree() isn't a good name either, and had that same
> 	memset(), but at least it doesn't do the dual-underscore mistake.
> 
> 	Including some kzfree()/crypto people explicitly - I hope we can get
> 	away from this incorrect and actively wrong pattern of thinking that
> 	"sensitive data should be memset(), and then we should add a random
> 	'z' in the name somewhere to 'document' that".

Thanks.

While I agree with Linus about the __ prefix,
the z is pretty common and symmetric to all
the <foo>zalloc uses.

And if _sensitive is actually used, it'd be
good to do a s/kzfree/kfree_sensitive/ one day
sooner than later.


