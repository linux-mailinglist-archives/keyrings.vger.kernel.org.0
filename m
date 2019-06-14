Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0BA45E23
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2019 15:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfFNN2j (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 09:28:39 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35504 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfFNN2i (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 09:28:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id p26so3550146edr.2
        for <keyrings@vger.kernel.org>; Fri, 14 Jun 2019 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/bEFMtHnd0Lq4R6BgJaHDb9jSNJdzL1pBjuE2g5cik8=;
        b=voy0OQVzAPCvIAmwQgiYtlSleenOKuT/qpb01Z/+4pGuPKe1skxIJEkKDPpwS9HC3H
         d2duEeopfKNnnkQCjYrCgqImAQqW5bLMgwugLa222v0jda83+go22NOjY5PWaEnTSvyV
         KLhBwBJPS7SZJtXCtxB7OvQQqgSQ3kPKWmFUA1MJa9Wrfld0MCSAXdHUdWfClFnEwpgf
         sOPE6zcJmB0iiUGNc4akPixQ19M5SCYisvcVkA0vU6UsVVet+GzmRtabFV//WJ5mNMyj
         qJmJDuvP10aBanhB/RZD0uRXen4zbe9eWcwwuargF/sjpjd9dhGMdU11acHxnHjo9xUZ
         o5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/bEFMtHnd0Lq4R6BgJaHDb9jSNJdzL1pBjuE2g5cik8=;
        b=ILgxC8i5InDQQyobj51RMO4mUaOHLeFxK0JTt9E8nGl0vZ3bSphg2UqfkG8A9EpkWm
         rVTlD2B8k00M1FmjPoPXMnrje6RyMX1m8srlZbH73v5yXtLVNXqR99obz4g+Ep0eTiLa
         /KJIrz0+Dbry1mD5XrSmDWDPqU2AgF2bU5557ceyU657ip8phm1J/mvhYq0f/+AlJzVV
         7Jh7ql/vdGC1RQWslkuftIg0isxL97UwO81WpVfA2on2DbO3lSD6amR2JvWypNh+TENX
         CWanYaWNMr9ptDgnQFWM9fZ8VIihXaMe8XbkczaBYrYjG3knIukRx7ayLuY32AlllZH5
         n3Cg==
X-Gm-Message-State: APjAAAWhcPmrWk20sfjzMh6pdgo8bTGuDIoIun9i+xYPI92VfZdKbu38
        tJ4NAmY8HqtW45cjpXRoaOHrrg==
X-Google-Smtp-Source: APXvYqwTjBWiaWugHv92n/VOXJckmXdJ0ij79tTSCt3WN5QrjcsRYX/bfqnOjwWa25VDWFa14JeAyw==
X-Received: by 2002:a50:b178:: with SMTP id l53mr75879420edd.244.1560518916776;
        Fri, 14 Jun 2019 06:28:36 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id 34sm901697eds.5.2019.06.14.06.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 06:28:36 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 8857010086F; Fri, 14 Jun 2019 16:28:36 +0300 (+03)
Date:   Fri, 14 Jun 2019 16:28:36 +0300
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
Message-ID: <20190614132836.spl6bmk2kkx65nfr@box>
References: <20190508144422.13171-1-kirill.shutemov@linux.intel.com>
 <20190508144422.13171-14-kirill.shutemov@linux.intel.com>
 <20190614093409.GX3436@hirez.programming.kicks-ass.net>
 <20190614110458.GN3463@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614110458.GN3463@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jun 14, 2019 at 01:04:58PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 14, 2019 at 11:34:09AM +0200, Peter Zijlstra wrote:
> > On Wed, May 08, 2019 at 05:43:33PM +0300, Kirill A. Shutemov wrote:
> > 
> > > +		lookup_page_ext(page)->keyid = keyid;
> 
> > > +		lookup_page_ext(page)->keyid = 0;
> 
> Also, perhaps paranoid; but do we want something like:
> 
> static inline void page_set_keyid(struct page *page, int keyid)
> {
> 	/* ensure nothing creeps after changing the keyid */
> 	barrier();
> 	WRITE_ONCE(lookup_page_ext(page)->keyid, keyid);
> 	barrier();
> 	/* ensure nothing creeps before changing the keyid */
> }
> 
> And this is very much assuming there is no concurrency through the
> allocator locks.

There's no concurrency for this page: it has been off the free list, but
have not yet passed on to user. Nobody else sees the page before
allocation is finished.

And barriers/WRITE_ONCE() looks excessive to me. It's just yet another bit
of page's metadata and I don't see why it's has to be handled in a special
way.

Does it relax your paranoia? :P

-- 
 Kirill A. Shutemov
