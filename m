Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAFCD1A1716
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 23:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGVBX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 17:01:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44661 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGVBX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 17:01:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id z26so1203386ljz.11
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=epjd3hRndDDxUzNxhGw+kNUEWswsyoCP1k+ltMRz2F0=;
        b=Rea+dN4Po4ublGuumqEu1Z9YdmnTeD34HLjcUPAn4kHYHWLUNPIQ/VZCsT6xyf8JiS
         bmcrncrGMpFp3ozkp1oN3IxqZ435NGWt/x7uln8afuzN0jgjeD5EbAAwriXLYujNsWDj
         hGtKlgxlKKZWInJKxtH5YVmPqsKEobcBPvotE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=epjd3hRndDDxUzNxhGw+kNUEWswsyoCP1k+ltMRz2F0=;
        b=qFLBwNBr4RRj2gfzcFPgyxWadUqBz/22L3+HPLHAdhi7ncvq2ENhi31mosAAZP8kvL
         Ki0w/42H7Qr6nrlZ5MCl0wuyOamr2nY+TEuhdu7ZVbTVAPYKUiV25Ehw4hc/XCs+uuDw
         IHhoYWa0YxsV2X28GT3MsCtz8iltzxXq0BXcy+b4rh2evMn47PsMsd3stlaxOfVshkqh
         CvjVY3pzwjcucokC06b2BKyPfDpuBFdmc03ID/+AMoocow9qOFcuMjutY94qj5YgwuPc
         sIulIODm4HwYMc7Hmej9VxGbdNJbILgvhbwz2fU8nz0fD8t4jV/pYxEHHWXffRbVjT9S
         izCw==
X-Gm-Message-State: AGi0PuYts6MReKPu3nnOlCE3bNtzIFL0LsEPxf2mU+ZwddWMWNfjyOOv
        7GJ/0L5rromqJ1Q9RukX8/tE46BXGLM=
X-Google-Smtp-Source: APiQypKUn90174tlYxy4vTaQUEBg+wAYkpgclRCscMEkxmPxo/q49yoHDqhzooAOLOHEPKvoF8vl/A==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr2937571ljg.18.1586293278852;
        Tue, 07 Apr 2020 14:01:18 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id c21sm411905lfh.16.2020.04.07.14.01.17
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 14:01:17 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id q22so1570482ljg.0
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:01:17 -0700 (PDT)
X-Received: by 2002:a05:651c:50e:: with SMTP id o14mr2769380ljp.241.1586293277007;
 Tue, 07 Apr 2020 14:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200407200318.11711-1-longman@redhat.com> <0fe5dcaf078be61ef21c7f18b750c5dc14c69dd7.camel@perches.com>
 <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
In-Reply-To: <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 14:01:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whV5Z4XioUOW0UM-PBrW7iqb0HwWKQU5Vn8b5pmsDm=Ww@mail.gmail.com>
Message-ID: <CAHk-=whV5Z4XioUOW0UM-PBrW7iqb0HwWKQU5Vn8b5pmsDm=Ww@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Waiman Long <longman@redhat.com>
Cc:     Joe Perches <joe@perches.com>,
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

On Tue, Apr 7, 2020 at 1:45 PM Waiman Long <longman@redhat.com> wrote:
>
> If the memory is really virtually mapped, the only way to find out the
> size of the object is to use find_vm_area() which can be relatively high
> cost and no simple helper function is available.

We _could_ just push it down to a "vfree_sensitive()", and do it
inside the vfree logic. That ends up obviously figuring out the size
of the area eventually.

But since the vmalloc data structures fundamentally aren't irq-safe,
vfree() actually has magical things like "if called in an interrupt,
we'll delay it to work context".

So that "eventually" can be quite a bit later, and it would delay the
overwriting of the sensitive data if we did that.

So this patch does end up simpler, but for vfree data it is actually
technically the better approach too (since overwriting the sensitive
data asap is what you want).

            Linus
