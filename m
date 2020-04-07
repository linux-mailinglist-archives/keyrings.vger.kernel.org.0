Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E221A16C8
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgDGU1S (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:27:18 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36718 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGU1R (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:27:17 -0400
Received: by mail-lf1-f68.google.com with SMTP id w145so3437478lff.3
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vULJyP67JBNxuLxHNrQncN4uZpPg3T+lQ2vheCSCnts=;
        b=Co/TSBn32SZzvluykyMIO4sU64Cf1AfgWv4n1Ae9afPaloY7VXr8XtXadW7RVEAJTs
         vKV3XqBLwUf5Lgvpk3GujRZVBG8OK5QgWjcN+ys77+yQtLlPkGtl5ki0fbBk2eZ4dECK
         i/T/hdMlpAbmHPRqD3BIA2AO4cpGwlth3++mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vULJyP67JBNxuLxHNrQncN4uZpPg3T+lQ2vheCSCnts=;
        b=Vl82qgIfbm2SFwVUwUKst+qRQn67ckN/xlRYHN29eX44o06fnVbtyEbpWHEKTU3LbB
         xLmI7jTxUcAEgCzZnngvXo36B9u8y5V0aH322owU0JXQh5gs3A9sqBbN4oTbx7Vhy7fc
         yCjcEyn4mnoKXroNpzAmQHJ2PewhVocUWrjbVGyfm5JSxm3cyxM1yoAJI+fgxMwihSv6
         c6GdETQonZO+VBORpdvylW+/o/LdWaWxWGpfU9P/K3BK/npiKBqzebKYOH8X5Dr6yL2N
         BUmpBP4j/nLrG/BSVQWAKGjsTlqp9XxTwm0DEH8xYnBM3QqsKbf//NJYrlt91fFUZYdo
         SpqQ==
X-Gm-Message-State: AGi0PuaPiZPIl8SJNDp9ERKVI1fRWo0qAEPoWd+3jMFwlfAOyupe4R3z
        2t6BPQbrWpez5sPEI1lANhqxWDADI3k=
X-Google-Smtp-Source: APiQypK7Z4I/9L6n2p4JBrf2Ly35WBT/U96OgnCKopa71lFxOpbC2sBT5ylinqHMhDLtU+RMamBfnw==
X-Received: by 2002:ac2:53a6:: with SMTP id j6mr2508829lfh.153.1586291234862;
        Tue, 07 Apr 2020 13:27:14 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id x29sm10901479lfn.64.2020.04.07.13.27.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:27:13 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id t11so3434764lfe.4
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:27:13 -0700 (PDT)
X-Received: by 2002:ac2:4466:: with SMTP id y6mr2501400lfl.125.1586291232936;
 Tue, 07 Apr 2020 13:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com>
 <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
In-Reply-To: <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 13:26:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com>
Message-ID: <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com>
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

On Tue, Apr 7, 2020 at 1:16 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Think of it this way: free() doesn't really change the data, it kills
> the lifetime of it. You can't access it afterwards - you can neither
> read it nor write it validly. That is a completely different - and
> independent - operation from writing to it.

Side note: I'd really love to be able to describe that operation, but
there's sadly no such extension.

So the _real_ prototype for 'free()'-like operations should be something like

    void free(const volatile killed void *ptr);

where that "killed" also tells the compiler that the pointer lifetime
is dead, so that using it afterwards is invalid. So that the compiler
could warn us about some of the most trivial use-after-free cases.

Because we've had even those trivially stupid ones

Yes, obviously various analysis systems do exactly that kind of
analysis (and usually go much further), but then it's external things
like coverity etc.

The point being that the lifetime of an object is independent from
being able to write to an object, and the "const" in the "free()" is
not "I promise to not write to it", but "I can accept a constant
pointer".

We've had a number of places in the kernel where we do that kind of
"lifetime" marking explicitly by assigning a NULL (or invalid value)
to the pointer when we free it.

I have this dim memory of us even (long long long ago) trying to use a
#define kfree() ... to do that, but it turns out to be basically
impossible to get the proper "use once" semantics, so it doesn't work
if the argument to kfree() has side effects.

               Linus
