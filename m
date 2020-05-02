Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E4D1C21CF
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 02:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgEBAOL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 20:14:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:45522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgEBAOL (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 1 May 2020 20:14:11 -0400
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C46922072E;
        Sat,  2 May 2020 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588378451;
        bh=HnHf+gY7BYBzhEDwTYb/tWB822HC2bvXB5orRTh9yoE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z9/O7Lpbg/dt2rEg7S3R1AHnUBuQDUrs/bYIM/Zc+aMpkXVvPeVLUmGlmqU0wIY3s
         J3hXFgd0R/tU50eKwcGsJr3f/R+g3Rsb1hjd7AgyJR01rS5J+9bkG8TNwuffMwV3J7
         xsNZro8FiE6b/j4d3WBwnDKG9jfpsD+SAMrD+JYY=
Date:   Fri, 1 May 2020 17:14:09 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH] security/keys: rewrite big_key crypto to use Zinc
Message-ID: <20200502001409.GD915@sol.localdomain>
References: <20200501222357.543312-1-Jason@zx2c4.com>
 <20200501230913.GB915@sol.localdomain>
 <CAHmME9rpZGiwrK93=+6z8qBdDVs273MaR_boDd1xjjZRwbqpKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rpZGiwrK93=+6z8qBdDVs273MaR_boDd1xjjZRwbqpKQ@mail.gmail.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 01, 2020 at 06:06:17PM -0600, Jason A. Donenfeld wrote:
> Hey Eric,
> 
> Thanks for the review.
> 
> I'll add `select CONFIG` as you suggested. I agree about trying to
> move as much as possible out of crypto and into lib/crypto. Breaking
> those dependency cycles won't be easy but perhaps it'll be possible to
> chip away at that gradually. (I'd also lib a
> lib/crypto/arch/{arch}/..., but I guess that's a separate discussion.)
> 
> I'll also change -EINVAL to -EBADMSG. Nice catch.
> 
> Regarding the buffer zeroing... are you sure? These buffers are
> already being copied into filesystem caches and all sorts of places
> over which we have zero control. At that point, does it matter? Or do
> you argue that because it's still technically key material, we should
> zero out both the plaintext and ciphertext everywhere we can, and
> hopefully at some point the places where we can't will go away? IOW,
> I'm fine doing that, but would like to learn your explicit reasoning
> before.

It's true that the buffer zeroing doesn't matter in big_key_preparse() because
the buffer only holds the encrypted key (which is what the shmem file will
contain).  But in big_key_read(), the buffer holds the decrypted key.  So it's
at least needed there.  Having it in both places for consistency might be a good
idea.

- Eric
