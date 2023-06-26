Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D35F73DBFA
	for <lists+keyrings@lfdr.de>; Mon, 26 Jun 2023 12:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjFZKDV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 26 Jun 2023 06:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjFZKDU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 26 Jun 2023 06:03:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA84F7;
        Mon, 26 Jun 2023 03:03:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D826C60DCE;
        Mon, 26 Jun 2023 10:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394BCC433C0;
        Mon, 26 Jun 2023 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687773798;
        bh=UqNdbH12vGv5bgEgr6ErXvWYZgLTnT4RZ3ci+ioCggY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HOakoZYe27iHTkmoM8p8IdHE1d6aWQoubYIMBZcgRrq/bXTTs52BmL07BUA6/kow3
         KZLmtv1Dhpppl+rdO+rkPs777E0wJRTY2x4Z43uEVnS5qEpx5bfdkw0eyXwqcy7z90
         I3Vo2Ou31xGbd6ey5PD47KqDuGnk1f2dOVIl6nzQdFjSMqZCGVXWFmlO/uwk349M5/
         z6Ax6Mk7MD8CSYRgkOJ3D3+YXrGGrAgOfAGlntpPRdrOFyho4GzGeK8FlqSNJTnD4/
         ytkWbzn351l0dZUDYM9YdGwB1lQws0TUX6zybDGD/TGPPzCSorkFdt1WHUBQ4wpRaB
         6SdVevqw8mm8Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b698937f85so22416281fa.2;
        Mon, 26 Jun 2023 03:03:18 -0700 (PDT)
X-Gm-Message-State: AC+VfDwoyioyJQztzTYwT8mHH0+Cf+vs+1+pXiVz7/9BW1GypnUmaT6E
        VGC0dOYOOBhxlVnrRL1l4l8uLbsk+hZkJBUHkfc=
X-Google-Smtp-Source: ACHHUZ6WBRhppGAheC2cWLxGnGslGAqI+xmQyi3z+afwiGCyVs6PbvlaYJWdAYIYRp0W5WsAnPAxFZD55fLt8DNzDb4=
X-Received: by 2002:a2e:9cd1:0:b0:2b4:70c1:b484 with SMTP id
 g17-20020a2e9cd1000000b002b470c1b484mr15570073ljj.38.1687773796264; Mon, 26
 Jun 2023 03:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au> <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au>
In-Reply-To: <ZJlf6VoKRf+OZJEo@gondor.apana.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 26 Jun 2023 12:03:04 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
Message-ID: <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 26 Jun 2023 at 11:53, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Mon, Jun 26, 2023 at 11:21:20AM +0200, Ard Biesheuvel wrote:
> >
> > As I asked before, could we do the same for the acomp API? The only
> > existing user blocks on the completion, and the vast majority of
> > implementations is software only.
>
> We already have scomp.  It's not exported so we could export it.
>
> However, compression is quite different because it was one of the
> original network stack algorithms (IPcomp).  So SG will always be
> needed.
>
> In fact, if anything SG fits quite well with decompression because
> it would allow us to allocate pages as we go, avoiding the need
> to allocate a large chunk of memory at the start as we do today.
>
> We don't make use of that ability today but that's something that
> I'd like to address.
>

OK, so you are saying that you'd like to see the code in
net/xfrm/xfrm_ipcomp.c ported to acomp, so that IPcomp can be backed
using h/w offload?

Would that be a tidying up exercise? Or does that actually address a
real-world use case?

In any case, what I would like to see addressed is the horrid scomp to
acomp layer that ties up megabytes of memory in scratch space, just to
emulate the acomp interface on top of scomp drivers, while no code
exists that makes use of the async nature. Do you have an idea on how
we might address this particular issue?
