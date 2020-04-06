Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BA019FB69
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgDFR0Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:26:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37388 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgDFR0Y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=q9CGTy2dc0MrY9cMsMeMUAWfqIRDO4jAB1O3OBknZB8=; b=XD9ULJvK1A0c/SvJDtNXABwnkO
        q6V6WTCsRVQMGZAOQJtEG1yW9Cj1QbMiEvHrNlGL50EXlc8TJxSiSyhSNpg3vAzNDiPdfp50jwilf
        OwG/Tm7zSYHrJybEWgPCyim+srezIdWLQ7uydH+6stOg5kDI6GS3PTn6hR2M8hMA1y97s42CIdCfR
        4Zbj1JJIRt7d0f9QEtdxrnHvwcl3kckU7w8uKXJlSsgcd2Pk5j+I9/gwtlSBDO9FHgZAcO4S2my/j
        oVp+HPogBzxcjgvW12kNo8Uowg9CYVkvIVPGG181fSAXpUXZYZxeAuB0QWTEqqZt0UGnayxTDaXdH
        E4w+vY+w==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLVVq-000608-H7; Mon, 06 Apr 2020 17:26:18 +0000
Date:   Mon, 6 Apr 2020 10:26:18 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200406172618.GH21484@bombadil.infradead.org>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com>
 <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
 <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com>
 <adc76d7c441e8f10697b61ceaff66207fb219886.camel@perches.com>
 <CAHk-=wgyt8j5rEnyKE8YdrRjQof1kvyom1CensTE0-Bp-meGnA@mail.gmail.com>
 <7eb36a794df38c885689085618a8a4ff9df3dd2c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb36a794df38c885689085618a8a4ff9df3dd2c.camel@perches.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 06, 2020 at 10:20:24AM -0700, Joe Perches wrote:
> > You really don't seem to get the whole "kzfree() has absolutely
> > _nothing_ to do with kzalloc() apart from a dubious implementation
> > details".
> 
> API function naming symmetry is good.

It's good when there's actual symmetry between the two functions.

kvalloc() memory should be freed with kvfree().  That makes
sense.  kzalloc() memory should not normally be freed with kzfree().
The symmetry hurts you, not helps you.

