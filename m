Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A518C1A16A2
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgDGURJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:17:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36858 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgDGURJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:17:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id w145so3417052lff.3
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tqNU/lPOQShoDviss5cOicvqhvwtlk4dqmmrGpr1nC4=;
        b=AestyY1vTqwruS2SjIrVNUtcv5M8Rgu+CcoXa2Ec6+EMfNUym7BLVuLaqMEg4Qo83h
         Qnr6k3woR88ywv52t7EjGWsxUFiyzpMnJQ7/9g74RK12uuMuQBryg8i26qgkAh6zrbEf
         bvModrsMiA1tyaJ0cX/reQrpKDKOb9pKz3p18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tqNU/lPOQShoDviss5cOicvqhvwtlk4dqmmrGpr1nC4=;
        b=MEaTsfg4s0QLrV+GlNQliFeChHtLpmfeVLlHNy8rxv6SWLZK4d2DFdDPzb6C9AhI/J
         2jn5UQynpIUZXVX9tLqzHDyBnZz2Ttwm6QB9J6kGv/JnDmAkWti0/wxAPICXaMku434Z
         phz/LdqClWo4nifyNu5jyaH0AVqC6j/fTmWnQOqmmbsqanBIPf3v8z639bA/C5DZGFEI
         w0eaGeWSwcQkVfZjQ1nifVSrAr6FYrIal60P8iCGH2lclqJQZ87EUnOvBMz7SfnEFTtH
         x4ca+kcy7lq+hm7loAhvfsTHPfWlL/OoLvrZ/GOPT4mbP4ap2JdApRUnmWe/hBxK8i8Y
         8tcA==
X-Gm-Message-State: AGi0PubdMRqrrA9yhQ9f6F0kbaAczKzuEn/Q9xD5lPi8ecLc345oIZFH
        NzPdYNtRdigPZsD9uEpkPAnrQ/hUhyI=
X-Google-Smtp-Source: APiQypKgK+agfQfNs6w/Sd79LlsbolqioXfRgn5EntnP4IE7pAKN6tPpYtmcxAG7UkiTb2PXjpcwlw==
X-Received: by 2002:a19:f611:: with SMTP id x17mr2546058lfe.51.1586290625599;
        Tue, 07 Apr 2020 13:17:05 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id t8sm14612918lfe.31.2020.04.07.13.17.04
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:17:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id r17so3418158lff.2
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:17:04 -0700 (PDT)
X-Received: by 2002:a19:9109:: with SMTP id t9mr2511760lfd.10.1586290623763;
 Tue, 07 Apr 2020 13:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
In-Reply-To: <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 13:16:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
Message-ID: <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Joe Perches <joe@perches.com>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
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

On Mon, Apr 6, 2020 at 12:40 PM Joe Perches <joe@perches.com> wrote:
>
> 2.1.44 changed kfree(void *) to kfree(const void *) but
> I didn't find a particular reason why.

Because "free()" should always have been const (and volatile, for that
matter, but the kernel doesn't care since we eschew volatile data
structures).

It's a bug in the C library standard.

Think of it this way: free() doesn't really change the data, it kills
the lifetime of it. You can't access it afterwards - you can neither
read it nor write it validly. That is a completely different - and
independent - operation from writing to it.

And  more importantly, it's perfectly fine to have a const data
structure (or a volatile one) that you free. The allocation may have
done something like this:

   struct mystruct {
       const struct dictionary *dictionary;
       ...
   };

and it was allocated and initialized before it was assigned to that
"dictionary" pointer. That's _good_ code.

So it wasn't const before the allocation, but it turned const
afterwards, and freeing it doesn't change that, it just kills the
lifetime entirely.

So "free()" should take a const pointer without complaining, and saying

   free(mystruct->dictionary);
   free(mystruct);

is a sensible an correct thing to do. Warning about - or requiring
that dictionary pointer to be cast to be freed - is fundamentally
wrong.

We're not bound by the fact that the C standard library got their
rules wrong, so we can fix it in the kernel.

             Linus
