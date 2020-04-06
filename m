Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4961619F819
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 16:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgDFOkC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 10:40:02 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53176 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728566AbgDFOkC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 10:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3AZQaHvV6HY7ZEgP+flSvFuWBowXtcYeUgk6HyT0388=; b=DU7X6AEW4T91imZK6UpDtwkFoc
        AOtXF/9J/iSX/VJH8KlWNJUJdhnL2vOr3RilPx/Y2HzGNpxfgw8o4cQB62sJQcwqmoBG+uGRgaoud
        txDnk7BS96aR2TOZYWccnZIpi2eak+eXOKWNluYvUEVyU1d3/5+cxYsg/M7XGZQ8dKVpxCOwdjg28
        4Vmm0fyCcNd+hjGT4UJbvNOiT/UUE3XBbwR7e7onP/JZUPLbrYMSQBLfZDNftRYj9hvpfk3xS0McY
        aVmmJgTdDskhFp3YXT/zf5LxXWZyI4/CE08Jgul3AZwYlGklZrhEJLtxLn9ck1ACrkJsT0MYlxyVA
        vvi8bTMA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLSul-0005uy-I5; Mon, 06 Apr 2020 14:39:51 +0000
Date:   Mon, 6 Apr 2020 07:39:51 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200406143951.GD21484@bombadil.infradead.org>
References: <20200406023700.1367-1-longman@redhat.com>
 <alpine.DEB.2.21.2004052119530.243304@chino.kir.corp.google.com>
 <3f6658e5-0082-7759-1d08-eda9cb3eba2f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6658e5-0082-7759-1d08-eda9cb3eba2f@redhat.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 06, 2020 at 10:36:07AM -0400, Waiman Long wrote:
> ZERO_OR_NULL_PTR is defined in slab.h. Using it may cause some header
> file dependency problem. To guard against the possibility of 0-length
> allocation request, how about just

Why is all the kvalloc/kvfree crap in mm.h to begin with?  slab.h is
a more sensible place to put it.  I had a patch to do that once, but I
think it went stale before I posted it.
