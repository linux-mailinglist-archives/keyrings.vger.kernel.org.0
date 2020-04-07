Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCAF1A18CE
	for <lists+keyrings@lfdr.de>; Wed,  8 Apr 2020 01:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDGXud (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 19:50:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45232 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDGXud (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 19:50:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id t17so5627815ljc.12
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zksoCklR8z1unQJuTBJp3Rro9MEQv7rmoj+ED3C7oyg=;
        b=Td8kk/wwBIcNQ5/edS+wLaYx9ypQ0Xx+RdI4BqPcVFzedqFgesVW8C0IjQkk8xO+9c
         GFfwVFDIaBwoUeYyZ+F2+9SFOMkc4tW9LFJGDZ9t5P2P4MDclhoZQ8m9RwKd8bXmmICe
         ThbWpWcO8nS2CaXOD7SirGXBzJ6n6RI04OA4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zksoCklR8z1unQJuTBJp3Rro9MEQv7rmoj+ED3C7oyg=;
        b=YDhTffcYCAMNm5H/xDB1spkeTOmYanE42FUBLZ/uq1lar0w6v3CBiY7IrNryPZB9fj
         oaNzWwhoRd++1L6KwPHETbJplwFPxC/cWn1PInI+/l3A0LtB7iptBDyFM7eLfGqiiY2N
         DTIpRvtOceZT6oBe7u34CTTcbbOc8kJ6p/RRpb874kZKFs8sTkxT9Apcri0mUg3pWHwo
         VdulTey1aTVa7bvI6yFP6nQGFbowX50Sk3qU9/4aQDbJNqiz0BaBm3INQFVlxb7JEi/Q
         bGbeD5n+n1gzhjwgGOj4HcwOxYzyAPfN36p/A3GL6XVitwzyJN/vNdoNo7/2NPAzlENE
         +Y2Q==
X-Gm-Message-State: AGi0PuYfqgI6Xg4d1t/xwR423Geah2n0dhWlkKtbA2FG9l/1qFxBKIkd
        IwPKBC/ZmdY440QL9Mdo6PRJJ8Ijy+c=
X-Google-Smtp-Source: APiQypL6ojWIy3HfGmT52GFQ8JX1gZj7/MZ+DLsVrLzP+xM+Mj4QrZSO9gQFxAgjtdb2QJZNI83WYg==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr3226318lji.267.1586303429450;
        Tue, 07 Apr 2020 16:50:29 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id x28sm14222018lfq.46.2020.04.07.16.50.27
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 16:50:28 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id r24so5687936ljd.4
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 16:50:27 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr2966560ljc.209.1586303427328;
 Tue, 07 Apr 2020 16:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
 <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
 <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com>
 <699292.1586294051@warthog.procyon.org.uk> <CAHk-=whwaNvyd1q=h0nUQio9byojpxufGkOiVfAh10woRs8KSA@mail.gmail.com>
 <749735.1586300050@warthog.procyon.org.uk>
In-Reply-To: <749735.1586300050@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 16:50:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJ4A8h=Qqq-mYuQ1CwyQkquQpNfHmeOkkbsPtb19+z5Q@mail.gmail.com>
Message-ID: <CAHk-=wjJ4A8h=Qqq-mYuQ1CwyQkquQpNfHmeOkkbsPtb19+z5Q@mail.gmail.com>
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
        David Rientjes <rientjes@google.com>, law@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 7, 2020 at 3:54 PM David Howells <dhowells@redhat.com> wrote:
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527
>
> With regard to this, I've got back "not sure what Linus was talking about WRT
> DSE, if he's got examples he could pass along, they'd be appreciated"

I'll do that. We have real examples in the kernel, although they
probably aren't all that _important_.

I don't see that comment on the bugzilla, but I'll put the stupid
example in there too.

One such example would be kernel/async.c: async_run_entry_fn(), where we have

        /* 2) remove self from the pending queues */
        spin_lock_irqsave(&async_lock, flags);
        list_del_init(&entry->domain_list);
        list_del_init(&entry->global_list);

        /* 3) free the entry */
        kfree(entry);
        atomic_dec(&entry_count);

and while it's good form to do "list_del_init()" on those fields in
entry, the fact that we then do "kfree(entry)" right afterwards means
that the stores that re-initialize the entry list are dead.

So _if_ we had some way to tell the compiler that "hey, kfree(ptr)
kills the lifetime of that object", the compiler could eliminate the
dead stores.

I think that dead store elimination is perhaps less important than if
the compiler could warn about us stupidly using the dead storage
afterwards, but I mention it as a "it can actually matter for code
generation" example too.

Now, the above is a particularly stupid example, because if we cared,
we could just turn the "list_del_init()" into a plain "list_del()",
and simply not do the unnecessary re-initialization of the list entry
after removing it.

But I picked a stupid example because it's easy to understand.

Less stupidly, we sometimes have "cleanup" functions that get rid of
things, and are called before you free the underlying storage.

And there, the cleanup function might be used in general, and not only
just before freeing. So the re-initialization could make sense in that
context, but might again be just dead stores for the actual final
freeing case.

Is this a big deal? No it's not. But it's not really any different
from the dead store elimination that gcc already does for local
variables on stack.

          Linus
