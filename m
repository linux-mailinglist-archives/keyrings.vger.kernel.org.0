Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 926FA1A1764
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 23:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDGVbS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 17:31:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40351 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgDGVbR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 17:31:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id j17so3535934lfe.7
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaANTB9nNT6txCWkp5q0unn31Ph9MDDOGwo0378128g=;
        b=IG+R0/ryQyxsm3aoO9zzMJijTHkszFi1ngFSZdu48/cZWTT+aLwliZsS6eelWRzhug
         Y4uVdfeOZeYoqfZDuNzkFzie3apptpcnSHImYRC3jQuhjNBu1vpBPHVxFh8BADZ/HBCH
         KHCUUNqVfwbgte5zG7M9cn/4DkmoO81yuy+s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaANTB9nNT6txCWkp5q0unn31Ph9MDDOGwo0378128g=;
        b=R4u28KH/lJbfVl3OLaEJ5fe4ZAUalniuqEhQ5eIGD6Qx4HCGlsu1mIy4hY2lUQYAUu
         WZhWcOEX4pY4BE3pswVOoDG9uS01Wfmb4iYIj4PXs1GMwabDGzY7rGTXFs5DUa2dHh/W
         mYdlsCjD/u2weINNCB26Ki/L7wJXEA+cGXY6nLiumsoh1+/E3bWCR3k85dMl0QmmpP1R
         Cq1ELXEZLuQkx/vN9ebUg39XAuKUkwRceRciGMZVSS3r+pixbJkNmzuPG8xCCuIXv8Tg
         wBNx7zTNula5qwbB91iMQDAL8sJVGqrRWoNIjh5sPPcfWN1hyX2OUrkQBc9+slc4xRWr
         Ok6Q==
X-Gm-Message-State: AGi0PuY6cEsbJCbpftMi+YGWilPR5he5s8atDD1jBqlmvwfpAMMLpE/n
        NV1L0BNFS6kXm802pVkVpakAwQYE558=
X-Google-Smtp-Source: APiQypIRQj5CKvJC2stikrPAnD/4DHQ4LMQa7MdxxLN0r0zP2owWgTdYlmxUKLXxhDrfCSFH16d0sg==
X-Received: by 2002:a19:550a:: with SMTP id n10mr2603588lfe.143.1586295075215;
        Tue, 07 Apr 2020 14:31:15 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id k6sm13903658lfm.91.2020.04.07.14.31.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 14:31:13 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id r17so3560499lff.2
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 14:31:13 -0700 (PDT)
X-Received: by 2002:ac2:4466:: with SMTP id y6mr2619685lfl.125.1586295072951;
 Tue, 07 Apr 2020 14:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200407200318.11711-1-longman@redhat.com> <0fe5dcaf078be61ef21c7f18b750c5dc14c69dd7.camel@perches.com>
 <67c51b03-192c-3006-5071-452f351aee67@redhat.com> <CAHk-=whV5Z4XioUOW0UM-PBrW7iqb0HwWKQU5Vn8b5pmsDm=Ww@mail.gmail.com>
 <20200407212447.GA29554@pc636>
In-Reply-To: <20200407212447.GA29554@pc636>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 14:30:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrZLs=+VkBXS_KWrMwoM2PRmw6mKEPJHRBQ_e3raFh9Q@mail.gmail.com>
Message-ID: <CAHk-=whrZLs=+VkBXS_KWrMwoM2PRmw6mKEPJHRBQ_e3raFh9Q@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Uladzislau Rezki <urezki@gmail.com>
Cc:     Waiman Long <longman@redhat.com>, Joe Perches <joe@perches.com>,
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

On Tue, Apr 7, 2020 at 2:25 PM Uladzislau Rezki <urezki@gmail.com> wrote:
>
> Seems like there is only one place where we can "sleep". I mean when we
> call vfree(). That is free_vmap_area_noflush() -> try_purge_vmap_area_lazy().
> Basically try_purge_vmap_area_lazy() can call the schedule() what is not
> allowed for IRQs. Instead of inlining the try_purge_vmap_area_lazy()
> into current context we can schedule_work(). And i think it makes sense
> from many point of views.

I don't think that's the only case.

Or rather, that may be the only case of _sleeping_, but we also aren't
irq-safe wrt locking.

And I'm not just talking about the vmap_purge_lock mutex, but all the
spinlocks etc we have.

That said, I haven't looked at that code in _ages_. Maybe those things
would be trivial to just turn into irq-safe ones and there are no real
latency issues anywhere.

                Linus
