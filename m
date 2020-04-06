Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3105919FB11
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgDFRMB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:12:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32920 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgDFRL7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:11:59 -0400
Received: by mail-lf1-f66.google.com with SMTP id h6so131620lfc.0
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JIHqbWEotAan/sewwDfvuRd/CvbCudC1wXEoK4uYwQI=;
        b=cCyfHsvSJIbBmPiEgqdHYbrCRkeZCLL0r8+OYWYvaP6ePmiCcvWmHGdWpIvR9wS7yH
         Qjaf2hfg8nqF8dZM3j9qgEUyAGV1loDukhbMsue6luVn6M6E5QsAdDS6GXk0FyXFT8ke
         MbrqoJpcYh6U+txeraXaFeVX/Z8k1Vrbk1lPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JIHqbWEotAan/sewwDfvuRd/CvbCudC1wXEoK4uYwQI=;
        b=DhmtGXB6iJ4resQPWWyRgSAx4yGvv6058Ij+QYWZayCiBnvn+HD1mPRtAn+ZYrFQYb
         UoxdJ1CEEAtA3b8XI0MvmiXFShQrlPq+lYRfY6IPiJ87NwEk1PnAknBEembWWIKWqJLt
         XVMMKSh6QHtw1mdh1cvnuBvu1k3+YPqGQPwbNgJOQ8QZm7iVADq9WwqLzlNbdBP+5zhz
         3YIciKnnC3bkQ4yAeetSj/TICOd4HiiNvQhCf8d/hZGNdiU4wz37Mr+UIHdqKdpPokPH
         dOYTh52oqIOpCdDzOp7OroM0HMbxi24Si7oB7M8BfOFtWHIVUf2mcZ86W43diR6EH1dI
         rr1g==
X-Gm-Message-State: AGi0PuY8FR2C8oobm9uHXP3sBVeQ20wk6kTYhUuuj9ec6WoNZXK0uPzt
        OKAJUSN7A1j+v2JclZZpB11o4Hlb4rQ=
X-Google-Smtp-Source: APiQypKmQ9mdW2IxMK4iKfBW0aIrZYyn4rgcLMimMKO4goPjISp7jY0jBJ4h9y7IOHm9gaFWeveGtw==
X-Received: by 2002:ac2:4295:: with SMTP id m21mr14196809lfh.132.1586193115920;
        Mon, 06 Apr 2020 10:11:55 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id q4sm964269lfk.67.2020.04.06.10.11.54
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 10:11:54 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id g27so469372ljn.10
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 10:11:54 -0700 (PDT)
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr166510ljp.204.1586193114144;
 Mon, 06 Apr 2020 10:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
 <CAHk-=whgvhyi_=2AsfFLUznqmrO9TOjuzTvcYHvCC=f0+Y7PkQ@mail.gmail.com> <adc76d7c441e8f10697b61ceaff66207fb219886.camel@perches.com>
In-Reply-To: <adc76d7c441e8f10697b61ceaff66207fb219886.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 10:11:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyt8j5rEnyKE8YdrRjQof1kvyom1CensTE0-Bp-meGnA@mail.gmail.com>
Message-ID: <CAHk-=wgyt8j5rEnyKE8YdrRjQof1kvyom1CensTE0-Bp-meGnA@mail.gmail.com>
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

On Mon, Apr 6, 2020 at 9:44 AM Joe Perches <joe@perches.com> wrote:
>
> Dubious assertion.  Both end up with zeroed memory.

You don't understand the function.

You ignored the part where the zeroed memory isn't even the _point_.

Yes, for kzalloc() it is.  There the zero is inherent and important.
People very much depend on it, and it's the whole point of that
function. The 'z' is not silent.

But for kzfree() it really really isn't.  There the zeroing is never
going to be seen by anybody wjho does the right thing, and is not
important at all - it's purely a "let's make sure old contents don't
leak".

The "zero" part is completely immaterial, it could just as well have
been a "memset(0xaa)" instead.

And you didn't seem to understand that kzfree() shouldn't use memset()
in the first place, so it's not even using the same operation.

You really don't seem to get the whole "kzfree() has absolutely
_nothing_ to do with kzalloc() apart from a dubious implementation
details".

Should you name all global variables with a 'z' in their name
somewhere? They start out zeroed too - so pretty much according to
your logic, they are exactly the same as 'kzalloc()'.

                Linus
