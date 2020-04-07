Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 048DB1A175A
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 23:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDGVZA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 17:25:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43224 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGVZA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 17:25:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id g27so5331303ljn.10;
        Tue, 07 Apr 2020 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GAtwCOX+dVfyCKVRB96BgVe7k8fkkTDmPi/mndtHbHE=;
        b=BgIKnNfS4RTbHgxPmKD4ikz7Ij+7CTthmYLhRnxOqyPogmv3ieCGlkMYQE40L6md9X
         aOFfMQFwTmjYEqERE6Kpu3d8krazLneOskIQJOfRlOr0ayxQua9/P/VrHys+HB+nT4M+
         ISmeXjLYowPohbdNIC1ovev8PQbzA0x9A58xsMXu5VNCVJX43B8u2G8OvW83ZOgTRYzg
         Ea67m1DIbEEd1nxLwkO6g7VvH130Da6uEUFTeMcH2kLN0L0S3VLhcKWbESLI4eC07ud5
         r/KEOI0xTJMLKxhZ8jwPWfYBCi68Vz6uUO2Z8hLCFQ8FVaK9x0neztbqdNyKUaJUHX0I
         Fz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GAtwCOX+dVfyCKVRB96BgVe7k8fkkTDmPi/mndtHbHE=;
        b=gRwFdavB6ZnEQ8xaNMuYyEv57kLS5qiovZtfKJjX78/WMnhusRSJ5dvXE4HwNQIC0o
         hAH99pEanrvdYN+aJwapRSfyAcaDNjdy7yIsskm/QCXSlle9cnGMoDJjNDhDjZXUTVYH
         g5xKY8CQqPYlV0B9lGraX+CHBEygCbaNDZaZ5/THK6G/43+oIzMC7nJ6NIySEkmjk2Nv
         OecobLMG22bAPbHR4y3pWygil//i7dgd6sZOHTxls+vMEEQdclFijM7hvdaheWbW/CNz
         T5tYloxyJfHjy0FWImWcDLaJRmJoIwYp0vU9+kurKeli0INgHIvW4J/P394+cB0L+1tj
         GBAg==
X-Gm-Message-State: AGi0PuYAw5SUUYJceyhnC72oyZ7LZlAcsi94eMWIfqEkivtGBiw+GKaK
        pZD62thfEU8cPEmw95Q4fPM=
X-Google-Smtp-Source: APiQypJ1CV9U1pJJ9r/hk6aiuySfuJxmSE5p3vbXxVLJwS8xCnpb+bQiM0C4oG89/Xtu400DJFfjsw==
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr2810591ljn.125.1586294696371;
        Tue, 07 Apr 2020 14:24:56 -0700 (PDT)
Received: from pc636 (h5ef52e31.seluork.dyn.perspektivbredband.net. [94.245.46.49])
        by smtp.gmail.com with ESMTPSA id y20sm12582621ljd.35.2020.04.07.14.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 14:24:55 -0700 (PDT)
From:   Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date:   Tue, 7 Apr 2020 23:24:47 +0200
To:     Linus Torvalds <torvalds@linux-foundation.org>
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
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
Message-ID: <20200407212447.GA29554@pc636>
References: <20200407200318.11711-1-longman@redhat.com>
 <0fe5dcaf078be61ef21c7f18b750c5dc14c69dd7.camel@perches.com>
 <67c51b03-192c-3006-5071-452f351aee67@redhat.com>
 <CAHk-=whV5Z4XioUOW0UM-PBrW7iqb0HwWKQU5Vn8b5pmsDm=Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whV5Z4XioUOW0UM-PBrW7iqb0HwWKQU5Vn8b5pmsDm=Ww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 07, 2020 at 02:01:01PM -0700, Linus Torvalds wrote:
> On Tue, Apr 7, 2020 at 1:45 PM Waiman Long <longman@redhat.com> wrote:
> >
> > If the memory is really virtually mapped, the only way to find out the
> > size of the object is to use find_vm_area() which can be relatively high
> > cost and no simple helper function is available.
> 
> We _could_ just push it down to a "vfree_sensitive()", and do it
> inside the vfree logic. That ends up obviously figuring out the size
> of the area eventually.
> 
> But since the vmalloc data structures fundamentally aren't irq-safe,
> vfree() actually has magical things like "if called in an interrupt,
> we'll delay it to work context".
> 
Just some thoughts. Sorry for jumping in.

Seems like there is only one place where we can "sleep". I mean when we
call vfree(). That is free_vmap_area_noflush() -> try_purge_vmap_area_lazy().
Basically try_purge_vmap_area_lazy() can call the schedule() what is not 
allowed for IRQs. Instead of inlining the try_purge_vmap_area_lazy()
into current context we can schedule_work(). And i think it makes sense
from many point of views.

Also, we can end up in zeroed non-existance vmap area if we do not find_vmap_area().

Thanks!

--
Vlad Rezki
