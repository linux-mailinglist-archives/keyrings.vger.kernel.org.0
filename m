Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5C5741744
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 19:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjF1Rdv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 13:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjF1Rdu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 13:33:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D132102;
        Wed, 28 Jun 2023 10:33:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B10C26137D;
        Wed, 28 Jun 2023 17:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D8C433C0;
        Wed, 28 Jun 2023 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687973628;
        bh=FFK1RedAlXNFUFd7AdyMs0ux5WTdb9ONI7Npv4Huoh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C+GnBWF30xMVt8pD4YGKVduZBNR5QOe3HWJE2tnwbyKNDMohqi1i4EX5bHR01lF2S
         lIhdP1rdAMIWS4kE4uw7Ht6br5NAmuD8KL2V9LNA5ZC0hLCYhZvvwslcCwrfIlOzIg
         DSdy1IqdIZJ1bIGFLdM7vosNxyqMraj0MBWjnfsqguqE1pQN0wMoESqe5e0veRtMPp
         4RlJ60VjuER39p8Xvc23bMNHnyhZ5W1XghdGFdKg0jXZQMAHdhmElgPxFEKrx1TX7F
         aeXk/MXBGCgIYSduHtQa2d2os8t8GjJo8O+ThmfCVUYHuP7gOAg9l0GGQK6QkT+QU/
         lbifH2YEe1jWA==
Date:   Wed, 28 Jun 2023 10:33:46 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
Message-ID: <20230628173346.GA6052@sol.localdomain>
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
 <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
 <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au>
 <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
 <ZJlk2GkN8rp093q9@gondor.apana.org.au>
 <20230628062120.GA7546@sol.localdomain>
 <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jun 28, 2023 at 06:58:58PM +0200, Ard Biesheuvel wrote:
> On Wed, 28 Jun 2023 at 08:21, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Mon, Jun 26, 2023 at 06:13:44PM +0800, Herbert Xu wrote:
> > > On Mon, Jun 26, 2023 at 12:03:04PM +0200, Ard Biesheuvel wrote:
> > > >
> > > > In any case, what I would like to see addressed is the horrid scomp to
> > > > acomp layer that ties up megabytes of memory in scratch space, just to
> > > > emulate the acomp interface on top of scomp drivers, while no code
> > > > exists that makes use of the async nature. Do you have an idea on how
> > > > we might address this particular issue?
> > >
> > > The whole reason why need to allocate megabytes of memory is because
> > > of the lack of SG lists in the underlying algorithm.  If they
> > > actually used SG lists and allocated pages as they went during
> > > decompression, then we wouldn't need to pre-allocate any memory
> > > at all.
> >
> > I don't think that is a realistic expectation.  Decompressors generally need a
> > contiguous buffer for decompressed data anyway, up to a certain size which is
> > 32KB for DEFLATE but can be much larger for the more modern algorithms.  This is
> > because they decode "matches" that refer to previously decompressed data by
> > offset, and it has to be possible to index the data efficiently.
> >
> > (Some decompressors, e.g. zlib, provide "streaming" APIs where you can read
> > arbitrary amounts.  But that works by actually decompressing into an internal
> > buffer that has sufficient size, then copying to the user provided buffer.)
> >
> > The same applies to compressors too, with regards to the original data.
> >
> > I think the "input/output is a list of pages" model just fundamentally does not
> > work well for software compression and decompression.  To support it, either
> > large temporary buffers are needed (they might be hidden inside the
> > (de)compressor, but they are there), or vmap() or vm_map_ram() is needed.
> >
> > FWIW, f2fs compression uses vm_map_ram() and skips the crypto API entirely...
> >
> > If acomp has to be kept for the hardware support, then maybe its scomp backend
> > should use vm_map_ram() instead of scratch buffers?
> >
> 
> Yeah, but we'll run into similar issues related to the fact that
> scatterlists can describe arbitrary sequences of sub-page size memory
> chunks, which means vmap()ing the pages may not be sufficient to get a
> virtual linear representation of the buffers.

Yes, that is annoying...  Maybe the acomp API should not support arbitrary
scatterlists, but rather only ones that can be mapped contiguously?

> 
> With zswap being the only current user, which uses a single contiguous
> buffers for decompression out of place, and blocks on the completion,
> the level of additional complexity we have in the acomp stack is mind
> boggling. And the scomp-to-acomp adaptation layer, with its fixed size
> per-CPU in and output buffer (implying that acomp in/output has a
> hardcoded size limit) which are never freed makes it rather
> unpalatable to me tbh.

Either way, I think the way out may be that zcomp should support *both* the
scomp and acomp APIs.  It should use scomp by default, and if someone *really*
wants to use a hardware (de)compression accelerator, they can configure it to
use acomp.

Also, I see that crypto/scompress.c currently allocates scratch buffers (256KB
per CPU!) whenever any crypto_scomp tfm is initialized.  That seems wrong.  It
should only happen when a crypto_acomp tfm that is backed by a crypto_scomp tfm
is initialized.  Then, if acomp is not used, all this craziness will be avoided.

- Eric
