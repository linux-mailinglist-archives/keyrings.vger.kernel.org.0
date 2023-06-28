Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151E5741798
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjF1R4M (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 13:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjF1Rzg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 13:55:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9285726AB
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 10:55:34 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991ef0b464cso228772266b.0
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687974933; x=1690566933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzJ3agvy6aMZbDBLnBAFb3bF5ij6CYGOE1V5UUCtqi8=;
        b=e3EdsGQ9qS3fe+W38gTuA/gIWv/5nGlsXwqen/AwkR1V60xqcJGVjCVJ5oR6UQF5UD
         tkowzkQFjGIeYSHl+yAJc+85/9GOZvzbXJcesrsngSzqwi7lDLAq0vR9CBSqCleCHokV
         1Nw/6D4uNADzR04ouVMjFOAyu4gY5mDwD3T2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687974933; x=1690566933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzJ3agvy6aMZbDBLnBAFb3bF5ij6CYGOE1V5UUCtqi8=;
        b=LTjWoYGmQB1j4aFLjLwGTL+VWqaMx5MhMatFLO3W54ubYsGomSmMEvqkWMvxUxlPyu
         Q8HNzaAWrdbop8OX8F9wejJpyl38YIKj7pAJZb9APy3GkOThPRoAZV4N9uar6YYmpfw9
         Xu+uRBdm6KwxolWX0+v9+MziuJidqyf3R2JwGPr6AY1eWaZuugZmSCPE6xhyhNLzvjY3
         JC8tGIa7xKLY8UH2pKvtk8w/+BcwzOMsl6Lf16slWOFdp3FL/u0ym9NjPtCzPgxC8fwI
         8mR4YaH0uXSAUFVruW2BeWt+xHpdpgkO/zUlx7acay2Zjy/VlDnzJxFFWlQRerOhuTu2
         q9mg==
X-Gm-Message-State: AC+VfDzI5DOj1r8K0L0Wp5KmjXQbjZtQXTVyHRjAlxorPTOfN44bl57V
        F+vJZfm8SELwEC/sukQ/0cL3obszUhBltt3lNdyNj7IT
X-Google-Smtp-Source: ACHHUZ41qrwUXbEe+wJRlfYAX3lpPn7sz8jIpvCNy7Tc/0cmldnFMy9zA5lXIL7Egd41+RpH/uFAqw==
X-Received: by 2002:a17:907:3f21:b0:98d:abd4:4000 with SMTP id hq33-20020a1709073f2100b0098dabd44000mr697826ejc.35.1687974932937;
        Wed, 28 Jun 2023 10:55:32 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id gv18-20020a170906f11200b0098e0a937a6asm5362051ejb.69.2023.06.28.10.55.31
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 10:55:32 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51dd0205b2cso1616092a12.1
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 10:55:31 -0700 (PDT)
X-Received: by 2002:aa7:ce0e:0:b0:51b:c7fe:970 with SMTP id
 d14-20020aa7ce0e000000b0051bc7fe0970mr2089479edv.7.1687974931598; Wed, 28 Jun
 2023 10:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au> <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au> <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
 <ZJlk2GkN8rp093q9@gondor.apana.org.au> <20230628062120.GA7546@sol.localdomain>
 <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
 <20230628173346.GA6052@sol.localdomain> <CAMj1kXGBrNZ6-WCGH7Bbw_T_2Og8JGErZPdLHLQVB58z+vrZ8A@mail.gmail.com>
In-Reply-To: <CAMj1kXGBrNZ6-WCGH7Bbw_T_2Og8JGErZPdLHLQVB58z+vrZ8A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 28 Jun 2023 10:55:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5D7drbmMrdA+8rMGGvA-R1fUK3ZqZ=r1ccNMiDT8atA@mail.gmail.com>
Message-ID: <CAHk-=wi5D7drbmMrdA+8rMGGvA-R1fUK3ZqZ=r1ccNMiDT8atA@mail.gmail.com>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 28 Jun 2023 at 10:45, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Both the sole acomp h/w implementation and the zswap acomp conversion
> were contributed by HiSilicon, and the code is synchronous.

I really think people need to realize that the age of async external
accelerators is long long gone.

Yes, it was cool in the 80s.

But dammit, so was big hair, mullets, and Sony Walkmans.

Just give it up. It's a complete failure, and it is not making a come-back.

What is still relevant is:

 (a) inline accelerators

     Doing checksumming, big packets, encryption etc ON THE NETWORK
CARD as it is being sent out and received is still very much relevant.

     But not this crazy "CPU gives data to external accelerator, does
something else, and is notified of the result and goes back to look at
it" is bogus and completely wrong.

 (b) synchronous CPU accelerated routines

     Whether this is using just vector instructions, or special
hardware, they are synchronous, and they use CPU virtual addresses
directly.

and nothing else matters.

Christ, people, Metallica even wrote one of the greatest song of all
time about it! How much more proof do you need?

I seriously believe that the crypto layer should basically aim to get
rid of the silly async interface entirely. It adds no real value, and
it has caused endless amounts of pain.

                 Linus
