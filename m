Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484A519ECEA
	for <lists+keyrings@lfdr.de>; Sun,  5 Apr 2020 19:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgDERcD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 5 Apr 2020 13:32:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33024 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgDERcD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 5 Apr 2020 13:32:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id h6so5370688lfc.0
        for <keyrings@vger.kernel.org>; Sun, 05 Apr 2020 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zcbh6sH9SJBGE+Cjk3XFguwEqI2IKXqqQBtRFq6gvFQ=;
        b=R07dbyu7Y0eMKVM4FedC3n/xof3lreuns2KIRBmYuFzNApajuKhjO7x1wg1aWKkMhh
         dwTz+7LXu6F7lM4s5hAWcEoHMHg14h+cQpmTR9fdFNXDCp6e2xdLcSoC3KXYyqK/QeGu
         RsK9JhsA+jl8afkEI+uxGrG60T2A4hCuJEIG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zcbh6sH9SJBGE+Cjk3XFguwEqI2IKXqqQBtRFq6gvFQ=;
        b=nBT5dH47QhQf6sUQKlTVaTOfY2PuLVjeWDVjC5wDO0E9ywRse3SCEQRXDpgmgSF3sS
         N7xhTOPnr9KSC57YPK0BTWRkpFCC+FnRNEGQukJh01mmGwpM+3l8h5z07vPVC2b12ij9
         +aIE2jitMsO1RwJnKfrYeyR/v+PH1RYLWYoq6rOtyzw2HQK0E13UxoZRAfsiQcY6lW2m
         dwPndOIQOiR6YFaDXowVVoijtkgdNwpuYZCwAVHqFxyBZ7Go5zUPDQZiJYEeDZ5iDP1V
         Q1ZskAwElYO46hg8cqJ6fwhKpWU8dKCJnJSq6eJm0z9YpderaMW3//Ik7HERRkHmOand
         vHBQ==
X-Gm-Message-State: AGi0PuZfo+eaU7t8FlhDpIY1U5tj93UuPnqTcgVP8qI3VbheNBnrL0KS
        KAq8ylfQQH13Y7cN1d5vRkQrGyEMNt0=
X-Google-Smtp-Source: APiQypIGpnARwABJyfE93t6zQ19sQeStMHi47vlMwmEDouxaV8EsQMi25P+Y2eiGRNTzrhFHZCdhSA==
X-Received: by 2002:ac2:4199:: with SMTP id z25mr10954912lfh.90.1586107919625;
        Sun, 05 Apr 2020 10:31:59 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id b16sm8645691ljh.20.2020.04.05.10.31.57
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 10:31:58 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id l11so2445653lfc.5
        for <keyrings@vger.kernel.org>; Sun, 05 Apr 2020 10:31:57 -0700 (PDT)
X-Received: by 2002:a05:6512:14a:: with SMTP id m10mr6564163lfo.152.1586107917356;
 Sun, 05 Apr 2020 10:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <1437197.1585570598@warthog.procyon.org.uk> <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
 <78ff6e5d-9643-8798-09cb-65b1415140be@redhat.com> <3567369.1586077430@warthog.procyon.org.uk>
In-Reply-To: <3567369.1586077430@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Apr 2020 10:31:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-6906+D68VHWv_SCvWUSG8R9w=js7kExmTum90Evu4g@mail.gmail.com>
Message-ID: <CAHk-=wg-6906+D68VHWv_SCvWUSG8R9w=js7kExmTum90Evu4g@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
To:     David Howells <dhowells@redhat.com>
Cc:     Waiman Long <longman@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sun, Apr 5, 2020 at 2:04 AM David Howells <dhowells@redhat.com> wrote:
>
> Should this be moved into core code, rather than being squirrelled away in
> security/keys/?

Yes. I do think that that __kvzfree() function makes sense in general
(the same way that kzfree does).

I just happen to despise the name, and think that the implementation
isn't great.

It also probably makes no sense to make it an inline function. It's
not like that function is done for performance reasons, and it might
only get worse if we then end up making it cause barriers or something
for CPU data leakage issues or whatever.

           Linus
