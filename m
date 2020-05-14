Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F891D2F01
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 14:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgENMA3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 08:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENMA3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 08:00:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA975C061A0C;
        Thu, 14 May 2020 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=u6SWIOebjVUpIUlonH0OT1Sl21gs5ZK4m5BqWSJAe5U=; b=Ax2F6PvXgGBPCuj7csPD+sdscA
        aT3H6Piu24dzxMBTtpPx27gh9WwUx1cBSSDpkSwK+qVEMCOUH2anRxlOKeNh8vCXLmTuq7A5bYDXq
        br7S+5LFfOHIrt680JQQlgWvPF3+mbEIYRonaRApi5+QRHejilrf0WtGXr2dhbi5zok4UpG2zNSjl
        9KyTrvxi3CB2SCJCfveGShY6gLo1KxIPvuXraP1bsDX9S05TAYUQmp42uYKRRJD961kyPETUOwvDf
        yB+EwYikwVanafb9mq8MwUlZR9kp50No99RiVKQ95DaduGhVhtfAAgN6chUrk53MpVgV2LaxRm2W0
        GZYorDvA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jZCXC-0005jW-5u; Thu, 14 May 2020 12:00:18 +0000
Date:   Thu, 14 May 2020 05:00:18 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Balbir Singh <bsingharora@gmail.com>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200514120018.GA16070@bombadil.infradead.org>
References: <20200407200318.11711-1-longman@redhat.com>
 <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 14, 2020 at 09:00:40PM +1000, Balbir Singh wrote:
> I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.
> 
> void kvfree_sensitive(const void *addr, size_t len)
> {
> 	preempt_disable();
> 	if (likely(!ZERO_OR_NULL_PTR(addr))) {
> 		memzero_explicit((void *)addr, len);
> 		kvfree(addr);
> 	}
> 	preempt_enable();
> }
> EXPORT_SYMBOL(kvfree_sensitive);

If it's _that_ sensitive then the caller should have disabled preemption.
Because preemption could otherwise have occurred immediately before
kvfree_sensitive() was called.
