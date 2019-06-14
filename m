Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26E46C74
	for <lists+keyrings@lfdr.de>; Sat, 15 Jun 2019 00:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfFNWld (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 18:41:33 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41712 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfFNWld (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 18:41:33 -0400
Received: by mail-ed1-f66.google.com with SMTP id p15so5609755eds.8
        for <keyrings@vger.kernel.org>; Fri, 14 Jun 2019 15:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kKBlaaZ2e0R8Qmq/ym3o296XdTEZmGz+dmrLAMFTTnM=;
        b=CPGuBSov5EtyIvw2ZTZfpLXH+m7nArR8FUWgvlBePXdjMMPA+IllY65N5XVaJeFXGX
         S+EacF/ActYMQZRJhhIJSfzfPop2+kZjoBgPJHcx2z7p74dlBg7IqjzTZHOH9FY6/FML
         ANudxrhtB9aceq/ZfOdQyRFEixvnwgQkUXUiC7Etp+RfnHnVOMi2aXkzm1Sb6OiKEhpk
         /5FhyQKkpk+Sf0MdmVKR3Ybqhj011xuJYbjEXw5yYkJ2a1UmUhyXcG5zJOlWCYCvWUfA
         nRLArs2z6tB3k5oWgjh6c060atJzsvPn8rYXaHW2T2LLR+ioz03Ty/SSN2uIo8CUCZAH
         qyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kKBlaaZ2e0R8Qmq/ym3o296XdTEZmGz+dmrLAMFTTnM=;
        b=nHtuBUV3aCS7KVBpysTAMoZskIH+z2PfgvaCtlnv+aaKOT+y1qt9XtqOqZ+VHf7lsk
         NV619B1olM4HbVR7kV8fJZne047CkCh/6bxg5IsJOlHISdlxT+ItiT1D9Bk1sFu/LwSw
         UNGfACT/l/lrlkh+hxwi5LEL9AYnd/MTJZxkFoMUcH31vtVqp0+0ERxDJ5+f0rc/SJLI
         XwqppnEVjDiNXK1OeBrhwqzvNfG1T5m+xqWrnOAJ8+I2fFzYpooc1FjOOoJFQIeL6Aj7
         yAJv4inBbXb7ONs65sHqkqVK91nETd/2H2Obs6OoDKl5dyychMC7y9bYrkfikRiGIvf1
         GKKg==
X-Gm-Message-State: APjAAAX75DB62Vqkmf0VLmvBu0T8Kbds2nIWoCoyZ8Y7lo/9EoJL4WdI
        Qvyi+yXMamYIZkFj/GoVo1XXVw==
X-Google-Smtp-Source: APXvYqzGx/+9/zTI71X2KsJYZP9s0HxE5l2n9lbx9/IlAC6AFkQjQN9+Z7eAaIEasZDypTRFQX080A==
X-Received: by 2002:a50:f4d8:: with SMTP id v24mr3644568edm.166.1560552091661;
        Fri, 14 Jun 2019 15:41:31 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id i16sm845646ejc.16.2019.06.14.15.41.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 15:41:30 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 453FB1032BB; Sat, 15 Jun 2019 01:41:31 +0300 (+03)
Date:   Sat, 15 Jun 2019 01:41:31 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>,
        David Howells <dhowells@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai Huang <kai.huang@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Alison Schofield <alison.schofield@intel.com>,
        linux-mm@kvack.org, kvm@vger.kernel.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH, RFC 13/62] x86/mm: Add hooks to allocate and free
 encrypted pages
Message-ID: <20190614224131.q2gjai32la4zb42p@box>
References: <20190508144422.13171-1-kirill.shutemov@linux.intel.com>
 <20190508144422.13171-14-kirill.shutemov@linux.intel.com>
 <20190614093409.GX3436@hirez.programming.kicks-ass.net>
 <20190614110458.GN3463@hirez.programming.kicks-ass.net>
 <20190614132836.spl6bmk2kkx65nfr@box>
 <20190614134335.GU3436@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614134335.GU3436@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jun 14, 2019 at 03:43:35PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 14, 2019 at 04:28:36PM +0300, Kirill A. Shutemov wrote:
> > On Fri, Jun 14, 2019 at 01:04:58PM +0200, Peter Zijlstra wrote:
> > > On Fri, Jun 14, 2019 at 11:34:09AM +0200, Peter Zijlstra wrote:
> > > > On Wed, May 08, 2019 at 05:43:33PM +0300, Kirill A. Shutemov wrote:
> > > > 
> > > > > +		lookup_page_ext(page)->keyid = keyid;
> > > 
> > > > > +		lookup_page_ext(page)->keyid = 0;
> > > 
> > > Also, perhaps paranoid; but do we want something like:
> > > 
> > > static inline void page_set_keyid(struct page *page, int keyid)
> > > {
> > > 	/* ensure nothing creeps after changing the keyid */
> > > 	barrier();
> > > 	WRITE_ONCE(lookup_page_ext(page)->keyid, keyid);
> > > 	barrier();
> > > 	/* ensure nothing creeps before changing the keyid */
> > > }
> > > 
> > > And this is very much assuming there is no concurrency through the
> > > allocator locks.
> > 
> > There's no concurrency for this page: it has been off the free list, but
> > have not yet passed on to user. Nobody else sees the page before
> > allocation is finished.
> > 
> > And barriers/WRITE_ONCE() looks excessive to me. It's just yet another bit
> > of page's metadata and I don't see why it's has to be handled in a special
> > way.
> > 
> > Does it relax your paranoia? :P
> 
> Not really, it all 'works' because clflush_cache_range() includes mb()
> and page_address() has an address dependency on the store, and there are
> no other sites that will ever change 'keyid', which is all kind of
> fragile.

Hm. I don't follow how the mb() in clflush_cache_range() relevant...

Any following access of page's memory by kernel will go through
page_keyid() and therefore I believe there's always address dependency on
the store.

Am I missing something?

> At the very least that should be explicitly called out in a comment.
> 

-- 
 Kirill A. Shutemov
