Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B81EB1A168C
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgDGUJf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:09:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37984 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbgDGUJd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:09:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id v16so5200775ljg.5
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3sghJldqMMjWeerVBLUfhc/cQuHU1aQm4qS6KijAW8Q=;
        b=LIs7mHA3OXPjMsaXtYIk07UvtJnPGY4OLuhw5yUdciWXo/7JrrEmPqgnrwGk7LYTDy
         rq/7n66O3MT27zCaMgmAZUsQHre2pHLQbaKY/YARTqgYJVheydI5BKhcTlTAQdZtVZZq
         45bOqqTdfPd9zcZUW/Ki0gAVMMNSm+WBI9Bqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sghJldqMMjWeerVBLUfhc/cQuHU1aQm4qS6KijAW8Q=;
        b=EYwoJ92/lBznhGaZb92XY6PKc6gQ8tQubNERS6OA6UrnBJFSp9aoy93b9C3kM3/zy6
         z52kSCzY2kAvTFwC9ZK5Aapl+O2Zroj4GFpbx8Ygkpdg2HXEasRzgum0S7LUd7vdBgqO
         CnVpiWVxhZ7zOu+QhxVgKpq8UdqAEPoPfMD5jAIdtb41xarix93AcnfHX1ySRpj+JE+d
         o3Df/fPJJgBIJr/ZbRtwQvcZKHRMqOd8AsB9ewBvguIQ68ZsDuOAGXVj4AX24f+j2nz2
         4GJvASjiz5IdAAjKnVV31u2Mc5WKAEjlf0SV5sqIUiNy5lPNlUdnHrfSCJNYXVViPfNF
         PyiA==
X-Gm-Message-State: AGi0PuYX6DUD2zZsPqTc2jKX4TxvIdXxylasQ0zsTmsCAzRFQTorGUDj
        cbFFtYV8XvinX25cR3L1o7rNOWu69pc=
X-Google-Smtp-Source: APiQypJ1w0R1ULJkRbpv3QY0nYUL5/Z9GFN0bCqM2siPCgeNpBubSHi7G1R6KAVeqqlcGnWb/nJwtA==
X-Received: by 2002:a2e:9616:: with SMTP id v22mr2625222ljh.107.1586290169360;
        Tue, 07 Apr 2020 13:09:29 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id b16sm12228327ljh.20.2020.04.07.13.09.27
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:09:27 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id g27so5129699ljn.10
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 13:09:27 -0700 (PDT)
X-Received: by 2002:a2e:8911:: with SMTP id d17mr2856344lji.16.1586290167180;
 Tue, 07 Apr 2020 13:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200407200318.11711-1-longman@redhat.com>
In-Reply-To: <20200407200318.11711-1-longman@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 13:09:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4YYef26dFX2o9iAKts6vuPceUNg7Bdq32REnvfOWiog@mail.gmail.com>
Message-ID: <CAHk-=wh4YYef26dFX2o9iAKts6vuPceUNg7Bdq32REnvfOWiog@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data objects
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 7, 2020 at 1:03 PM Waiman Long <longman@redhat.com> wrote:
>
> For kvmalloc'ed data object that contains sensitive information like
> cryptographic key, we need to make sure that the buffer is always
> cleared before freeing it. Using memset() alone for buffer clearing may
> not provide certainty as the compiler may compile it away. To be sure,
> the special memzero_explicit() has to be used.

Ack. Since this isn't exactly high-priority, I'm assuming it will go
through the usual channels (ie Andrew).

             Linus
