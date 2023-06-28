Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3DE7416DD
	for <lists+keyrings@lfdr.de>; Wed, 28 Jun 2023 18:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjF1Q7O (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 28 Jun 2023 12:59:14 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:50382 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjF1Q7N (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 28 Jun 2023 12:59:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 44DF36140C;
        Wed, 28 Jun 2023 16:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6551C433CD;
        Wed, 28 Jun 2023 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687971552;
        bh=LrHjHQSwdNQGHtEkQVYKmKzA2tViYdbwAogYEXzqJgY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ViZotiUikf8kR4aXhy6Fx7TM60HL9xoKUeFSb9rfe40DnzMZFpl4p/pvwgN7mvCdY
         OoK0QvtLBWGYAHeBlK5xBeuvyTYhXLt7VDSuf4BsaWjkUBKPWw8n+badIIjUndx/y9
         Lf9zB4QCwLUI6XHl9HyIjJmYz8t6je8nkmd4M0HXcAIVext6D28tI4OChPUCK4ScG8
         UBWLRusPo7DCBA/4zm+cYRFvd5kmmZ5OAKxAIJT8fFwDQUmDwK2C5VWwE471R6sOcj
         6/6UIvVRsGJ+8c2waF8w3aznKu7ZPHZ0b2NqXTg0cDGnfC3L4/X5t/ZIz1qmgrJ/Bk
         xRzrb8i2V0dZg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so1559303e87.1;
        Wed, 28 Jun 2023 09:59:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDxW5NTVN53s0Sqk+i5wWWqPg4wrVFbKN0PTIX5dweFvLyTX5a4k
        T9av2RjAfchBkQGsobOTNB9DlK6UBSTWOKkIjIo=
X-Google-Smtp-Source: ACHHUZ6B9VuLFedt2FPDopT5YybzuVpL7NvxjigsX/gYx/x/LWLNG9Mo/GkszeeihYDbmQmu6PdSzNDRjLuJ6Yg4Cys=
X-Received: by 2002:a05:6512:239a:b0:4f8:6ac4:1aa9 with SMTP id
 c26-20020a056512239a00b004f86ac41aa9mr864855lfv.21.1687971550606; Wed, 28 Jun
 2023 09:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au> <570802.1686660808@warthog.procyon.org.uk>
 <ZIrnPcPj9Zbq51jK@gondor.apana.org.au> <CAMj1kXHcDrL5YexGjwvHHY0UE1ES-KG=68ZJr7U=Ub5gzbaePg@mail.gmail.com>
 <ZJlf6VoKRf+OZJEo@gondor.apana.org.au> <CAMj1kXHQKN+mkXavvR1A57nXWpDBTiqZ+H3T65CSkJN0NmjfrQ@mail.gmail.com>
 <ZJlk2GkN8rp093q9@gondor.apana.org.au> <20230628062120.GA7546@sol.localdomain>
In-Reply-To: <20230628062120.GA7546@sol.localdomain>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 28 Jun 2023 18:58:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
Message-ID: <CAMj1kXEki6pK+6Gm-oHLVU3t=GzF8Kfz9QebTMKQcwtuqCsUgw@mail.gmail.com>
Subject: Re: [v2 PATCH 0/5] crypto: Add akcipher interface without SGs
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 28 Jun 2023 at 08:21, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Jun 26, 2023 at 06:13:44PM +0800, Herbert Xu wrote:
> > On Mon, Jun 26, 2023 at 12:03:04PM +0200, Ard Biesheuvel wrote:
> > >
> > > In any case, what I would like to see addressed is the horrid scomp to
> > > acomp layer that ties up megabytes of memory in scratch space, just to
> > > emulate the acomp interface on top of scomp drivers, while no code
> > > exists that makes use of the async nature. Do you have an idea on how
> > > we might address this particular issue?
> >
> > The whole reason why need to allocate megabytes of memory is because
> > of the lack of SG lists in the underlying algorithm.  If they
> > actually used SG lists and allocated pages as they went during
> > decompression, then we wouldn't need to pre-allocate any memory
> > at all.
>
> I don't think that is a realistic expectation.  Decompressors generally need a
> contiguous buffer for decompressed data anyway, up to a certain size which is
> 32KB for DEFLATE but can be much larger for the more modern algorithms.  This is
> because they decode "matches" that refer to previously decompressed data by
> offset, and it has to be possible to index the data efficiently.
>
> (Some decompressors, e.g. zlib, provide "streaming" APIs where you can read
> arbitrary amounts.  But that works by actually decompressing into an internal
> buffer that has sufficient size, then copying to the user provided buffer.)
>
> The same applies to compressors too, with regards to the original data.
>
> I think the "input/output is a list of pages" model just fundamentally does not
> work well for software compression and decompression.  To support it, either
> large temporary buffers are needed (they might be hidden inside the
> (de)compressor, but they are there), or vmap() or vm_map_ram() is needed.
>
> FWIW, f2fs compression uses vm_map_ram() and skips the crypto API entirely...
>
> If acomp has to be kept for the hardware support, then maybe its scomp backend
> should use vm_map_ram() instead of scratch buffers?
>

Yeah, but we'll run into similar issues related to the fact that
scatterlists can describe arbitrary sequences of sub-page size memory
chunks, which means vmap()ing the pages may not be sufficient to get a
virtual linear representation of the buffers.

With zswap being the only current user, which uses a single contiguous
buffers for decompression out of place, and blocks on the completion,
the level of additional complexity we have in the acomp stack is mind
boggling. And the scomp-to-acomp adaptation layer, with its fixed size
per-CPU in and output buffer (implying that acomp in/output has a
hardcoded size limit) which are never freed makes it rather
unpalatable to me tbh.
