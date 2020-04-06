Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982FB19FC7A
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 20:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDFSGX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 14:06:23 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42758 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgDFSGX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 14:06:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so677433ljp.9
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BisFcRtdDqZDWx9x/qe3YqGCVBMdPDBaYv2iQPpKZGk=;
        b=hycTOvQuFUOqWorRTq3COTwoQhv5QArTInVPi3BJzNZEYA8ClFHnf/Pog4SwnExpqW
         O0t2iPzj1sC3CqfuWGAAmBs3m/sWjxm/70oydN4qonvFZVSKIYy24kF2rhRlFk/itgBj
         OXm3JM0/7A+VH/EVB7RjlP5C0H9ZpQ3DCrkLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BisFcRtdDqZDWx9x/qe3YqGCVBMdPDBaYv2iQPpKZGk=;
        b=TYzpKcPdPmH2euQJqPpfpvKLld9jpVCjgdZZvrXvMjiX0HrqdS+EYkkWzBm6OL9eid
         oT94x/HIxhRkS3Vu0n3WFMZqCdS4VRlAPCEOkpu74ETQdmEwTAKBO8SN+Lc8iM547zOf
         qXYgHp43LfFdrHxus0c+03JqBqhg9OStgTqmSAGJ9bMH3k+whU8aiyAFhvQ3iukUhbmv
         17+zMJaKHucsXqxtMJE6iOqOZBhcZEAbAYnGBjg4Yr0b25c1OPm6kVIA9O/WHx5ybtex
         fpENyI6KkiYfkTIwvRIENueahNAkENf4WZJSeMXjoQieDVRAAFwxkB/6YI7pdk6OTyy/
         Cskw==
X-Gm-Message-State: AGi0PuadQc3pA8npOk+7x1aUMdb1r9O030lVkKJV/VJV+L9tifmApR08
        BwYntzd9Xboavse2kWxPdahYANUJ7JM=
X-Google-Smtp-Source: APiQypLACmXHeAb96MWaNwzDTibQo+HoNVIUH25wcKOD5ym+d1cr/bIzuJtvoKOAYQJAqozZlANDUA==
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr284469ljn.125.1586196379859;
        Mon, 06 Apr 2020 11:06:19 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id y16sm10055856ljc.78.2020.04.06.11.06.18
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 11:06:18 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id g27so668911ljn.10
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 11:06:18 -0700 (PDT)
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr319344lji.150.1586196377903;
 Mon, 06 Apr 2020 11:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com> <19cbf3b1-2c3f-dd0f-a5c6-69ca3f77dd68@redhat.com>
In-Reply-To: <19cbf3b1-2c3f-dd0f-a5c6-69ca3f77dd68@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 11:06:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjiHUWLZWKZJ4eU+RrOc2xNZCHn4ETmJ0S+H=Eig28Cw@mail.gmail.com>
Message-ID: <CAHk-=wgjiHUWLZWKZJ4eU+RrOc2xNZCHn4ETmJ0S+H=Eig28Cw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Waiman Long <longman@redhat.com>
Cc:     Joe Perches <joe@perches.com>, David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 6, 2020 at 10:59 AM Waiman Long <longman@redhat.com> wrote:
>
> I have actually been thinking about that. I saw a couple of cases in the
> crypto code where a memzero_explicit() is followed by kfree(). Those can
> be replaced by kfree_sensitive.

Ack.

Doing that (and renaming kvzfree) should be a fairly straightforward
coccinelle patch.

Somebody (maybe you) asked whether we could just use
kvfree_sensitive() for everything, We probably could. The extra test
is cheap - much cheaper than the memzero_explicit().

That said, _there_ I think that consistency with regular kfree/kvfree
naming means that we might as well keep separate names, and keep the
kmalloc->kfree_sensitive and kvmalloc->kvfree_sensitive pairing. Even
if technically we could do with just the one function that works for
both cases.

            Linus
