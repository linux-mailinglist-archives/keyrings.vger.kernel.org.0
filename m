Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDD60741947
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 22:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjF1UKZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 16:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjF1UKW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 16:10:22 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3E91FE7
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 13:10:21 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991fee3a6b1so27179566b.0
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687983020; x=1690575020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qSvBLBYpZuuz4eEfb9EgOEcdzuOPHgtqP5O4l7UwFR4=;
        b=OV1AlVjyMN0qrciURfDjBYW+KkQ5Hch4eZ/Tpys8dZK2Co50OkgVr2OdpsZl5ozDt2
         kKgt5ZBqcO/AOUlr6fcGWmCRPjyPXqoU9ZZVbrzLZepF1xmB0/GLc4s2SuJvcBE6BruM
         6Ig0wq8khqJxCMMrMFrRyrljX4bj3aacjEnW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687983020; x=1690575020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSvBLBYpZuuz4eEfb9EgOEcdzuOPHgtqP5O4l7UwFR4=;
        b=Gs0kwIH1FinXcWkDK2w/tFOVF9jlgrZt4AtcvDjvgnMMVHrNxX/drl/oOJmBnZ4eJD
         grBeTjX8Xje+6AaBGwYH0+z/a9jINGqYdyTDkOTA9NcoDOnOPS6wlxle6IwlV04j2fo+
         6zXgYrgdr81rCIhfF2fjuq1/Suf+0Gm0MqS8H1plyyeLZUV+Y9xw3wL3n3tkHoz4ZHsB
         WX7DW5ExnVmhzdyqFdOilcPXEv9+tezg8w6jTL2BiO9FK8EcFTfevYleetTXf3Hq9vej
         eANInxGyUo+z4Yp2CLjixwmr6Wq3hs+e0gn5AXU2KTPPczPhomv8jkYsvuedPxGWn/n+
         50xw==
X-Gm-Message-State: AC+VfDwH8/FwTQyRrjm7yhZY3WvpTrtBzWGE3IX16F+ZRU5DN5YXqIqX
        44qOQQqf6OZWfCZn6DbZV9ID3tG2ty5P8Kpmm0fNZBYX
X-Google-Smtp-Source: ACHHUZ4xuRcGiOsmwppta3PpeAioD72FDMv4PxaC7cRSQMZSQokwMS0tIcjWpIk1ksTYL+0OLtN9Bg==
X-Received: by 2002:a17:907:80c:b0:974:1d8b:ca5f with SMTP id wv12-20020a170907080c00b009741d8bca5fmr31868732ejb.9.1687983019928;
        Wed, 28 Jun 2023 13:10:19 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id e8-20020a1709062c0800b009786c8249d6sm6101798ejh.175.2023.06.28.13.10.18
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:10:19 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so6295456a12.2
        for <keyrings@vger.kernel.org>; Wed, 28 Jun 2023 13:10:18 -0700 (PDT)
X-Received: by 2002:a05:6402:148e:b0:51d:7fa6:62ca with SMTP id
 e14-20020a056402148e00b0051d7fa662camr10124675edv.14.1687983018674; Wed, 28
 Jun 2023 13:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au> <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au> <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
 <ZJlk2GkN8rp093q9@gondor.apana.org.au> <20230628062120.GA7546@sol.localdomain>
 <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
 <20230628173346.GA6052@sol.localdomain> <CAMj1kXGBrNZ6-WCGH7Bbw_T_2Og8JGErZPdLHLQVB58z+vrZ8A@mail.gmail.com>
 <CAHk-=wi5D7drbmMrdA+8rMGGvA-R1fUK3ZqZ=r1ccNMiDT8atA@mail.gmail.com> <3695542.1687977261@warthog.procyon.org.uk>
In-Reply-To: <3695542.1687977261@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 28 Jun 2023 13:10:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2-sXtHKGTsKfcMXLkvHRDiU1nQBYwB8sLo3jXfzq+cw@mail.gmail.com>
Message-ID: <CAHk-=wg2-sXtHKGTsKfcMXLkvHRDiU1nQBYwB8sLo3jXfzq+cw@mail.gmail.com>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
To:     David Howells <dhowells@redhat.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
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

On Wed, 28 Jun 2023 at 11:34, David Howells <dhowells@redhat.com> wrote:
>
> What about something like the Intel on-die accelerators (e.g. IAA and QAT)?  I
> think they can do async compression.

I'm sure they can. And for some made-up benchmark it might even help.
Do people use it in real life?

The *big* wins come from being able to do compression/encryption
inline, when you don't need to do double-buffering etc.

Anything else is completely broken, imnsho. Once you need to
double-buffer your IO, you've already lost the whole point.

           Linus
