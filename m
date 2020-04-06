Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFBE19FB6C
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729474AbgDFR06 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:26:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40850 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgDFR06 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:26:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id 19so550247ljj.7
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZ491r7mDp3NDGymaETOvU1g3XqdwBRrxA5tOEnLogQ=;
        b=TqT24X/roRyAPe/JsynU8OkUqA1rxBWWzcUz5j29g3Du7td4vZHNVUC2hMk5WxnZd7
         c+wZk984zgeiXHuk1D3Kt5ZpxP8uIhsfoiMSa9R8Gp0iWBBs407XpAutonvox1XnKfup
         764yY8jwfyqkWl6S3b1Pd2NMdj7LmkhrBR+b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZ491r7mDp3NDGymaETOvU1g3XqdwBRrxA5tOEnLogQ=;
        b=qIA9iTtjBTu5m2YuySpd6sb7ZwqzT3Zq58eMhD2bRPAyo3IS2XqmAeIzckmTpANE1d
         wkxomK+DhQXTALv41hGDsY11st6Zlf/m6ihnnbvoYal0zV8tgTUFkE4Yqi/agiqaCMCG
         0w6SS6kNb0mJ5lBeeCSV1M3vQaA3/EePD7mwfPA1VomKSa53c/KkjPHfYzdgTdKR1Qmi
         bpVM9glL83/ZzC4RI0GltKItXlXK96yUystpl8lWWOWMQU5y/AmmNETc7pLJBky+rrO6
         2ne0PFywWa+uuqRBvzsuAtHokvZZ4v5Fedi48yoN7djDIl3iZ4yKufUK1sRQQIZx0BWI
         Yzng==
X-Gm-Message-State: AGi0PuaUzyuNN0d3kc4Zh8LtjWclHu5s0hXnqo8DxceAxriajr45cC/u
        HpLuXXr1BN9PqHs676TJH+UtoRVbvHc=
X-Google-Smtp-Source: APiQypL8UOPsjxtqyN0CS17Ca52Za1sjrckMHS7nj/h3FwVMed1N/Z18OnAIrikqHgAFo4vEOnWLvg==
X-Received: by 2002:a2e:5844:: with SMTP id x4mr217249ljd.40.1586194014931;
        Mon, 06 Apr 2020 10:26:54 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 9sm12438740ljf.0.2020.04.06.10.26.53
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 10:26:54 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id f20so610401ljm.0
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:26:53 -0700 (PDT)
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr214337lji.150.1586194013190;
 Mon, 06 Apr 2020 10:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
 <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <334933.1586190389@warthog.procyon.org.uk> <dbfcbbd55c63fc87bfb31af3cae1b15e04d8a821.camel@perches.com>
In-Reply-To: <dbfcbbd55c63fc87bfb31af3cae1b15e04d8a821.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 10:26:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPHA4XbL-CVTDBwjYzUJwaGYriGD44uvOaqQai+zOw6A@mail.gmail.com>
Message-ID: <CAHk-=wiPHA4XbL-CVTDBwjYzUJwaGYriGD44uvOaqQai+zOw6A@mail.gmail.com>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Joe Perches <joe@perches.com>
Cc:     David Howells <dhowells@redhat.com>,
        Waiman Long <longman@redhat.com>,
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

On Mon, Apr 6, 2020 at 10:12 AM Joe Perches <joe@perches.com> wrote:
>
> Add yet another alloc flag like __GFP_SENSITIVE
> and have kfree operate on that and not have a
> kfree_sensitive at all.

That sounds potentially sensible. Maybe even a SLAB_SENSITIVE to mark
a whole slab cache sensitive for kmem_cache_create().

I'm not sure how controlled the allocations are, though. The
allocations that get used for keys etc might come from outside the
crypto layer.

                Linus
