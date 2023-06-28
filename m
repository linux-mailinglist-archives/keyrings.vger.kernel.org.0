Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA27740C76
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 11:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjF1JJe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 05:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbjF1IuN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 04:50:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB2A1FED;
        Wed, 28 Jun 2023 01:49:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 057076131A;
        Wed, 28 Jun 2023 06:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060BAC433C8;
        Wed, 28 Jun 2023 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687933282;
        bh=S0mOI7jpmYwxZG2bLczj5KSpX82KzQBUCLq1L8pxtlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LXHOTJgEaUDoz43LYSW97aaS0yNe+xmOKt/tUoVfhd2a1mqId6tHjbDMaS+rAwZ4G
         54ZaLFLJQIgqsV91HkAeX/upPc43skWMZ9xxK+zXhivnEKGA1EORTNWph8tlmtEksG
         72EJNyXCEXGoWqIkxX6mU9QjMYuHUEFDNGVXCbHdIH2puUPquNtqKA7zT5Fo1sIzPk
         AjucFoQn/sLacxEQAmZ4qmKaoBKyWKZ45SqHXdY52ddTjEOriKoYA8gJMGrZaUDnY7
         9cZ43Ip/hIg1InVUHrxPn14hCwn1QWMFKM7ADc3kl6ZSCTU5E5SKquMESAJ0/V72Ip
         RCaEdT3WCk+yg==
Date:   Tue, 27 Jun 2023 23:21:20 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
Message-ID: <20230628062120.GA7546@sol.localdomain>
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
 <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
 <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au>
 <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
 <ZJlk2GkN8rp093q9@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJlk2GkN8rp093q9@gondor.apana.org.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jun 26, 2023 at 06:13:44PM +0800, Herbert Xu wrote:
> On Mon, Jun 26, 2023 at 12:03:04PM +0200, Ard Biesheuvel wrote:
> >
> > In any case, what I would like to see addressed is the horrid scomp to
> > acomp layer that ties up megabytes of memory in scratch space, just to
> > emulate the acomp interface on top of scomp drivers, while no code
> > exists that makes use of the async nature. Do you have an idea on how
> > we might address this particular issue?
> 
> The whole reason why need to allocate megabytes of memory is because
> of the lack of SG lists in the underlying algorithm.  If they
> actually used SG lists and allocated pages as they went during
> decompression, then we wouldn't need to pre-allocate any memory
> at all.

I don't think that is a realistic expectation.  Decompressors generally need a
contiguous buffer for decompressed data anyway, up to a certain size which is
32KB for DEFLATE but can be much larger for the more modern algorithms.  This is
because they decode "matches" that refer to previously decompressed data by
offset, and it has to be possible to index the data efficiently.

(Some decompressors, e.g. zlib, provide "streaming" APIs where you can read
arbitrary amounts.  But that works by actually decompressing into an internal
buffer that has sufficient size, then copying to the user provided buffer.)

The same applies to compressors too, with regards to the original data.

I think the "input/output is a list of pages" model just fundamentally does not
work well for software compression and decompression.  To support it, either
large temporary buffers are needed (they might be hidden inside the
(de)compressor, but they are there), or vmap() or vm_map_ram() is needed.

FWIW, f2fs compression uses vm_map_ram() and skips the crypto API entirely...

If acomp has to be kept for the hardware support, then maybe its scomp backend
should use vm_map_ram() instead of scratch buffers?

- Eric
