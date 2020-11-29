Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69BC2C77D6
	for <lists+keyrings@lfdr.de>; Sun, 29 Nov 2020 06:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgK2Fb2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 29 Nov 2020 00:31:28 -0500
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:52326 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725468AbgK2Fb1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 29 Nov 2020 00:31:27 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id B352F180154A5;
        Sun, 29 Nov 2020 05:30:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1434:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:7576:10004:10400:10848:11026:11232:11658:11914:12297:12663:12740:12760:12895:13069:13095:13161:13229:13311:13357:13439:14181:14659:14721:21080:21433:21627:30054:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: glass65_2d09b2427396
X-Filterd-Recvd-Size: 1523
Received: from XPS-9350.home (unknown [47.151.128.180])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Sun, 29 Nov 2020 05:30:45 +0000 (UTC)
Message-ID: <d9e5515497f5215294cf79bec973155d0132f25e.camel@perches.com>
Subject: Re: [PATCH] keys: remove trailing semicolon in macro definition
From:   Joe Perches <joe@perches.com>
To:     Jarkko Sakkinen <jarkko@kernel.org>, trix@redhat.com
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 28 Nov 2020 21:30:44 -0800
In-Reply-To: <20201129044514.GH39488@kernel.org>
References: <20201127191543.2854306-1-trix@redhat.com>
         <20201129044514.GH39488@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, 2020-11-29 at 06:45 +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 27, 2020 at 11:15:43AM -0800, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> > 
> > The macro use will already have a semicolon.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> 
> I'm in-between whether this is worth of merging. The commit message
> does not help with that decision too much.

It seems worthy of merging to me modulo whatver improvement is desired in
the commit message.

There are 3 existing uses of request_key_net.  All have a trailing semicolon.
There is 1 existing use of request_key_net_rcu.  It has a trailing semicolon.

No object change should occur.


