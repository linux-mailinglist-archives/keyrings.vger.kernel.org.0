Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3331A1758
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 23:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgDGVW5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 17:22:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38568 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGVW4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 17:22:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id v16so5397802ljg.5
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqAA90EFEqaZqtfJsahs6rAmiP9w+6pABhPEUrk2J0s=;
        b=cWtyAfRJ6HZ9whZ7T1OwTqUkHj67UHyQLHNktG1URy3jMW58GkW80jxJjlj8gB7GhE
         3F0b04BHhGAUviItNAlVtNpm1kMC4wyjt5JtQfw/V+AcyE9EB5lvlfGHC0oM8Tdjg/zB
         YwojkZl7/nVdBy5im39XCep/6nxy8E2TkGYTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqAA90EFEqaZqtfJsahs6rAmiP9w+6pABhPEUrk2J0s=;
        b=B20pZoUu8XdWVpdchQl/FqW+EzpEzYnyYE5OLaGEsxTnKYjTTJKRrwvP4GpDv/VGPI
         C1bfJcY4StO1fib5auaxXNx74JYy2xSi9+i6FhtT2tKI5KPK7wxoHwJcBQlADHJ4XdqQ
         RsL5kvIELNYG/ASeskPtmjxc3vzqyujgC3V6EtOB7swNcO7bygtuvEhnhXmHHLwWZCOc
         zj3ElwK6NRVgportAcCSDsY/4mqnq2FZXW+T8u8iMs5cYRXcdIARYv5ITolxBPX/o4uW
         XoBCNc4sXCPb9JbZ0Oji10AAZDrS2Jj0R8jsPny60kFmik9iv91neXioNfhcdveypk6M
         xZ0A==
X-Gm-Message-State: AGi0PuaQgb+PVvAtWLLodbMWijtZuRtBd7y7lraUP3PVLEhihUAWxRgn
        LVwbq5F/bSPL+7ek76740Ll3Qgz+tXs=
X-Google-Smtp-Source: APiQypJa+ndRtORGlAT8W03+QY2rTFaXQXTQmMqOqwRa5o2gYI6/ZHiEUuQju9kI+iAgqttuLPeXjg==
X-Received: by 2002:a2e:3203:: with SMTP id y3mr2737042ljy.54.1586294572008;
        Tue, 07 Apr 2020 14:22:52 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id e4sm14001610lfn.80.2020.04.07.14.22.50
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 14:22:50 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id z26so1257909ljz.11
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:22:50 -0700 (PDT)
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr2888317ljp.204.1586294570185;
 Tue, 07 Apr 2020 14:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
 <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
 <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com> <699292.1586294051@warthog.procyon.org.uk>
In-Reply-To: <699292.1586294051@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 14:22:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwaNvyd1q=h0nUQio9byojpxufGkOiVfAh10woRs8KSA@mail.gmail.com>
Message-ID: <CAHk-=whwaNvyd1q=h0nUQio9byojpxufGkOiVfAh10woRs8KSA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     David Howells <dhowells@redhat.com>
Cc:     Joe Perches <joe@perches.com>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 7, 2020 at 2:14 PM David Howells <dhowells@redhat.com> wrote:
>
> It might be worth asking the compiler folks to give us an __attribute__ for
> that - even if they don't do anything with it immediately.  So we might have
> something like:
>
>         void free(const volatile void *ptr) __attribute__((free(1)));

Yeah, that sounds sane.

> There are some for allocation functions, some of which we use, though I'm not
> sure we do so as consistently as we should (should inline functions like
> kcalloc() have them, for example?).

I think that gcc supports a "malloc" attribute, but it's only used for
alias analysis optimizations, afaik (ie it says that the pointer the
function returns cannot alias anything else).

So we do have that "__malloc" thing, but I'm not sure how much it
actually matters.

And adding it to inline functions shouldn't be _wrong_, but it
shouldn't matter either, since I think the alias analysis would work
regardless.

I wonder how much of a code generation difference it makes. I suspect
not a lot, but maybe I'd be surprsied.

But yes, having the free attribute would be consistent (even if the
syntax for it might be as you suggest, kind of like the __printf()
attribute works). Even if it wasn't initially used for anything it
wouldn't hurt, and maybe some day it would improve warnings (and allow
the compiler to do the dead store elimination that started this whole
long set of threads in the first place..)

            Linus
