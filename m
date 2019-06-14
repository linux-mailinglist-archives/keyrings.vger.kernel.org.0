Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9144B46C7D
	for <lists+keyrings@lfdr.de>; Sat, 15 Jun 2019 00:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfFNWop (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 18:44:45 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38164 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfFNWop (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 18:44:45 -0400
Received: by mail-ed1-f65.google.com with SMTP id r12so3452566edo.5
        for <keyrings@vger.kernel.org>; Fri, 14 Jun 2019 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h2YsZJ/hpz/dktPd7lJ9/WdLKqP8cOEcDv4gWF/xH7M=;
        b=Y2t0/2mr8aihOd4yjitVfbPHHMKDHwZD9B6ADKgMF/1yloLEFDKbVCRHfVvaojZBhW
         X9iJJUE6HuWUrExWayDRtjj+0OY9xfenQmbiD65VYnZPJOUFGdTbi3xuEA07tqg3ncbv
         ajDe+y4rUbN/CGxSwjohrEi6tZZ+rb0czHc523vfaeBuj/plC1g5QA1E/xwdWDUbC4Hd
         RklEBmoxmZUKNVrU/LEZqMvsSeLzhM9NmIDLrG2hAKwrIZM2QBMIxo1U2J3pm1Yk5ZQ5
         p0ydX7NAPzB8rkCRYyO5wZUKpOOL548iP7pggw258oF7RxeVGfPE4TrDcwadMkWMbA1a
         BUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h2YsZJ/hpz/dktPd7lJ9/WdLKqP8cOEcDv4gWF/xH7M=;
        b=eBPlLtxNutOHuY1neD9moAq5qg0XZXofYIMnrNFWtu2nrhHBHi8Zj8CEG1ib5tJpG7
         PjOJHIn9amtT52LK60tB/AECmt+sm1c7pPAgLUNiirqIWEB1wi/oTFinRm4Q1/vi4vm5
         I9OJum7LqkfBfHJG9AKgilJWOOocwjS4cyYq0RXLOuNzrXjUTaHK46AH/Njp5c/gQ6sQ
         6jl6zZsRgzoLsY/pCtk97DMhJWb++LIUmqw16ezIQVmvHr6V+tCHGAmYZ8qO2zBmTA61
         wHMb9H3qZQGsLN1wScp9x9x6337GcjzNQBgXKAf41tEIL7LzTQ/Z8ZZJ/HOeVci9obTt
         wNFQ==
X-Gm-Message-State: APjAAAXum6KXLKqRuXEkaTDI1PL6KsxPjtIZkfR2Znp6qOM9lMjKjWnd
        CahU3k5POvG6MCs2mo2mj/1h/g==
X-Google-Smtp-Source: APXvYqzu11aNlHQ8Ctnz/nojH1rYOSaIZ8gUOC9DmalwLiJMfeuh07K661B4hMO+kTvku1uEQp/sMw==
X-Received: by 2002:a17:906:b2c6:: with SMTP id cf6mr66162140ejb.274.1560552283205;
        Fri, 14 Jun 2019 15:44:43 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id j19sm1212825edr.69.2019.06.14.15.44.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 15:44:42 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 42D7D1032BB; Sat, 15 Jun 2019 01:44:43 +0300 (+03)
Date:   Sat, 15 Jun 2019 01:44:43 +0300
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
Subject: Re: [PATCH, RFC 20/62] mm/page_ext: Export lookup_page_ext() symbol
Message-ID: <20190614224443.qmqolaigu5wnf75p@box>
References: <20190508144422.13171-1-kirill.shutemov@linux.intel.com>
 <20190508144422.13171-21-kirill.shutemov@linux.intel.com>
 <20190614111259.GA3436@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614111259.GA3436@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jun 14, 2019 at 01:12:59PM +0200, Peter Zijlstra wrote:
> On Wed, May 08, 2019 at 05:43:40PM +0300, Kirill A. Shutemov wrote:
> > page_keyid() is inline funcation that uses lookup_page_ext(). KVM is
> > going to use page_keyid() and since KVM can be built as a module
> > lookup_page_ext() has to be exported.
> 
> I _really_ hate having to export world+dog for KVM. This one might not
> be a real issue, but I itch every time I see an export for KVM these
> days.

Is there any better way? Do we need to invent EXPORT_SYMBOL_KVM()? :P

-- 
 Kirill A. Shutemov
