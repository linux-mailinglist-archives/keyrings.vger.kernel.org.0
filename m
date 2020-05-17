Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03831D64FF
	for <lists+keyrings@lfdr.de>; Sun, 17 May 2020 02:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgEQAoy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 16 May 2020 20:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgEQAoy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 16 May 2020 20:44:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C368C061A0C;
        Sat, 16 May 2020 17:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=oXEwYMh56jP/jhXSylitEbrYxOmXJzOOvEwzfWzqxsY=; b=qAKXBD7IRVa5nZGnQMYp7EAHiS
        QHFpaF2P1IVwaqinpvrE797uhAPmiooSzWNW6DLG0iVscFGcXXrfhWHtWiLxWf9WKnYYZX09j8GKd
        N9/um3djtTvFtOW9I4vj7jCkKZMKmLkNLhFHE4q5FuAOBA5m5IvCHZqN9SN4PwIvmtMfb0I1BX+yg
        Zrqc6/XeNs+SHPvs0JIMfcUS7zvVxwdp8J/jeeh0TP0kI1QDOvgvS15/TKc04HnMXO/0kxj+h9lhu
        ZU8I6fv8ZSjXvNJAiYKZ9oESe5BiihA7RGH76iy5krBASPeFxB02doNP1BdoOpBtu01hQmczm8iJw
        5tlBWcfA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ja7Px-0005su-Jb; Sun, 17 May 2020 00:44:37 +0000
Date:   Sat, 16 May 2020 17:44:37 -0700
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
Message-ID: <20200517004437.GN16070@bombadil.infradead.org>
References: <20200407200318.11711-1-longman@redhat.com>
 <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
 <20200514120018.GA16070@bombadil.infradead.org>
 <f779dea1-3b50-e354-3914-7394b4473f5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f779dea1-3b50-e354-3914-7394b4473f5b@gmail.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, May 17, 2020 at 10:27:39AM +1000, Balbir Singh wrote:
> On 14/5/20 10:00 pm, Matthew Wilcox wrote:
> > On Thu, May 14, 2020 at 09:00:40PM +1000, Balbir Singh wrote:
> >> I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.
> >>
> >> void kvfree_sensitive(const void *addr, size_t len)
> >> {
> >> 	preempt_disable();
> >> 	if (likely(!ZERO_OR_NULL_PTR(addr))) {
> >> 		memzero_explicit((void *)addr, len);
> >> 		kvfree(addr);
> >> 	}
> >> 	preempt_enable();
> >> }
> >> EXPORT_SYMBOL(kvfree_sensitive);
> > 
> > If it's _that_ sensitive then the caller should have disabled preemption.
> > Because preemption could otherwise have occurred immediately before
> > kvfree_sensitive() was called.
> > 
> 
> May be, but the callers of the API have to be explictly aware of the contract.
> I don't disagree with you on what you've said, but I was referring to the
> intent of freeing sensitive data vs the turn around time for doing so.

It's the caller's information.  They should be aware of their own
requirements.  If they do something like:

p = kmalloc();
preempt_disable();
construct(p);
use(p);
preempt_enable();
kvfree_sensitive(p);

there's really nothing we can do to help them inside kvfree_sensitive().
Actually, can you come up with a scenario where disabling preemption
inside kvfree_sensitive() will help with anything?
