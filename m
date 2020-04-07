Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E731A17D1
	for <lists+keyrings@lfdr.de>; Wed,  8 Apr 2020 00:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDGWNJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 18:13:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52022 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGWNJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 18:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=FXLhUp57gFBupyAqKDM1j0MtUkdYHWcwHronu354gjo=; b=NX6E/shBFjhTZtqoWnsQggljWV
        EyLgZ5kRMQApEWr518G4omxxKtjX1mcRuhtfdBXlhdfAoVdCjqsjGRdVXjbBHd58EvScCldFtbo2F
        hOA4FH2cuE/ghnQHveMeKwsRvzJSceJ3IbKxeE4Cs17bXDmbtKfsQTj9OljtwybWtCghbqN2ZCTG6
        6yO26v9Tf70S8HIBje/GJxVf8BXrhRRNtA0zto7fW6Xg29BSrXtEtdaSDXdp9wQtnL448t1XfMOGb
        27kv5jOh/xg54mKdmaIaR1N1tBzPa0ksGgQeqbilqU4O//Mhy9LRuhkF27lqjReRnOvBXme8yGguq
        Fl0fC2Xg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLwSl-0004xw-AZ; Tue, 07 Apr 2020 22:12:55 +0000
Date:   Tue, 7 Apr 2020 15:12:55 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200407221255.GM21484@bombadil.infradead.org>
References: <20200407200318.11711-1-longman@redhat.com>
 <0fe5dcaf078be61ef21c7f18b750c5dc14c69dd7.camel@perches.com>
 <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 07, 2020 at 04:45:45PM -0400, Waiman Long wrote:
> On 4/7/20 4:31 PM, Joe Perches wrote:
> > On Tue, 2020-04-07 at 16:03 -0400, Waiman Long wrote:
> >> +extern void kvfree_sensitive(const void *addr, size_t len);
> > Why should size_t len be required?
> >
> > Why not do what kzfree does and memset
> > the entire allocation? (area->size)
> 
> If the memory is really virtually mapped, the only way to find out the
> size of the object is to use find_vm_area() which can be relatively high
> cost and no simple helper function is available. On the other hand, the
> length is readily available in the callers. So passing the length
> directly to the kvfree_sensitive is simpler.

Also it lets us zero only the first N bytes of the allocation.  That might
be good for performance, if only the first N bytes of an M byte allocation
are actually sensitive.  I don't know if we have any such cases, but
they could exist.
