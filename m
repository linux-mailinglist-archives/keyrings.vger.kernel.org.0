Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98DE73DC13
	for <lists+keyrings@lfdr.de>; Mon, 26 Jun 2023 12:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjFZKOM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 26 Jun 2023 06:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjFZKOL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 26 Jun 2023 06:14:11 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB7B12B;
        Mon, 26 Jun 2023 03:14:09 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qDjE8-007JHy-KW; Mon, 26 Jun 2023 18:13:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 26 Jun 2023 18:13:44 +0800
Date:   Mon, 26 Jun 2023 18:13:44 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
Message-ID: <ZJlk2GkN8rp093q9@gondor.apana.org.au>
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
 <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
 <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au>
 <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 26, 2023 at 12:03:04PM +0200, Ard Biesheuvel wrote:
>
> In any case, what I would like to see addressed is the horrid scomp to
> acomp layer that ties up megabytes of memory in scratch space, just to
> emulate the acomp interface on top of scomp drivers, while no code
> exists that makes use of the async nature. Do you have an idea on how
> we might address this particular issue?

The whole reason why need to allocate megabytes of memory is because
of the lack of SG lists in the underlying algorithm.  If they
actually used SG lists and allocated pages as they went during
decompression, then we wouldn't need to pre-allocate any memory
at all.

It's not going to be easy of course since we need to convert
every single algorithm.  Perhaps what we could do in the mean
time is to get the scomp implementations do exponential retries
(e.g., start with allocating size * 2, if that fails then double
it, up to whatever we currently pre-allocate).

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
