Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B443422EDC
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 19:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbhJERRI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 13:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhJERRI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Oct 2021 13:17:08 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31B3C061749
        for <keyrings@vger.kernel.org>; Tue,  5 Oct 2021 10:15:17 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k7so38507539wrd.13
        for <keyrings@vger.kernel.org>; Tue, 05 Oct 2021 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aYgvStYcOejtbxI3GBqAVA0PqeF45Re1v5iKKxMB0b8=;
        b=oZomKywjpSlz/lBpue6LRwIeQfneUymX/ysx3izeUIXyExVOlsyuAyr2SGp7iY2tYH
         694e1CsH6noXTZJAVm+bboYsJKntp/IRARCgrbeXw4ZC+FJJJd4pr36Xezb0ri8es3tm
         c2FjbR7pHiakCLZ0f6/dwuFXY79Mk6UcBQxEWGFp/1fxLQ7lletDjCb5LGPWZyMEMTfE
         FS8qkcW4DO+8p15QejwflEzzooEML9rnoDtj5tgHIHyPtJvAue3he6mp2LM94i1pFshp
         9m0bCV09V3hzwtxgZx6MO/lPHo9EOGcxwCIiZFUytujB+dVdNPXUBaPn1dPDWu0Gcuej
         mB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYgvStYcOejtbxI3GBqAVA0PqeF45Re1v5iKKxMB0b8=;
        b=jLhyKovQ4lyn/s2AqNESpB7Y1dITsAZrGthKoVnX+vpLxoXFi7Mv0ssikxKVuKMiCT
         VMZ633ZuUDnbilJc3mt2CvZZkjistSU81mLHrmNapfVIMeqwVpBRZt6xdHTTtRGMav/q
         yzId0jiMw4qB32MJwgS7SsLMhqbkOKT3uA/5V2IgUkFvz3AXtsr0xayOGTyVgNJ4Z1Qp
         Cf2I6YtYRd4n9IANvYichY4V28OopXy7nFuV6DfxhG5m3PVEPfqKFGZo5WAjoo5bp6pm
         PTE+vKZEMX43y25NJ0mgETBxnVWQeHYbN/Lmkj0dudwbE7xLvbBHkVZnQuoxUxsdgzvm
         PtJQ==
X-Gm-Message-State: AOAM530TtTg7IODmkYS6O/I6ViHGUnGqjAdtmcttPeYSEA6I08tOfIyF
        DqIj38bMlSbwM0QVaHA4/b6nlf6h8E/KCeiPFZdRXg==
X-Google-Smtp-Source: ABdhPJzCHlUM6CFs4wkG/LtO9IAanQ4F1107oJ25Yj7xAgfOPExUNELwXT9bvyaRFMIoDOmrUD7w5N20XZrGkUIKgc8=
X-Received: by 2002:adf:ab57:: with SMTP id r23mr23864345wrc.199.1633454115815;
 Tue, 05 Oct 2021 10:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211005161833.1522737-1-lee.jones@linaro.org> <YVyE3Ax1PRtiBwf+@gmail.com>
In-Reply-To: <YVyE3Ax1PRtiBwf+@gmail.com>
From:   Adam Langley <agl@google.com>
Date:   Tue, 5 Oct 2021 10:14:58 -0700
Message-ID: <CAL9PXLws4DjvPB=1KNpom3W52pXNauXQ4V==MprDx73YQ1-sgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile out
 deprecated APIs
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 5, 2021 at 10:01 AM Eric Biggers <ebiggers@kernel.org> wrote:
> I ran into these same -Wdeprecated-declarations compiler warnings on another
> project that uses the ENGINE API to access OpenSSL's support for PKCS#11 tokens.
> The conclusion was that in OpenSSL 3.0, the new API for PKCS#11 support isn't
> actually ready yet, so we had to keep using the ENGINE API and just add
> -Wno-deprecated-declarations to the compiler flags.
>
> Your patch just removes support for PKCS#11 in that case, which seems
> undesirable.  (Unless no one is actually using it?)

The patch removes support when OPENSSL_NO_ENGINE is defined, but
that's not defined by default in OpenSSL 3.0. (Unless something
changed recently.)

When OPENSSL_NO_ENGINE is defined, ENGINE support is not compiled into
OpenSSL and the headers don't include the functions:
https://github.com/openssl/openssl/blob/master/include/openssl/engine.h
.


Cheers

AGL
