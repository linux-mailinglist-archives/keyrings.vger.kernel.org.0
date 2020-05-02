Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB371C21D1
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 02:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgEBAPS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 May 2020 20:15:18 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:57547 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbgEBAPR (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 1 May 2020 20:15:17 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8dac3d7a
        for <keyrings@vger.kernel.org>;
        Sat, 2 May 2020 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=xArW0Tt0LPV9u+5H1DjkH6M+yA4=; b=ugLP3y
        TqoDYEtXYKUfSZykUGyZPDZni8F8xcfo/ltMimFjuWPnINahHpd6Emtwu9FF7yE0
        m38GpZi7jeOuwp+C8MHoBVpFqawEIoAxL63813LaEju3BXJNZvHrvS5xoRtCdzyL
        sVgmsRlAL4Ivm8dlmHQCoYjoGPsJ/RDEDs4qCE51x9a4Kbj3hM5mQDSgBGSmK3ID
        dkhFbJp3fg3Y/uto2BhObWF2t5N45Lf2dC2ET72CH/gNifW3oDvmTsuGqPzoVm7K
        eS3J0P4OxV7Lw95IXGIZVBh4JWHUfNT/m4evdbxqTguFVQq8KMZyf1DuywOmmmX4
        XjYQitoz5jfiB+Dw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 145609ca (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <keyrings@vger.kernel.org>;
        Sat, 2 May 2020 00:03:11 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id r2so5939136ilo.6
        for <keyrings@vger.kernel.org>; Fri, 01 May 2020 17:15:16 -0700 (PDT)
X-Gm-Message-State: AGi0PuZmEEkYoZl2+YsA736KE8maIvJbJHgnJ4FOJbAv3gEIMCr9Ecr9
        6Sfe4i7Ah2yGNeUtlFFdV9GD91Dl4j5LqyvC7Vw=
X-Google-Smtp-Source: APiQypJ4EmnKEDwD/gQQdw2h/xxynhdgE+9RC5Boyi9nSp9XQMhDaFiKWqTBhHBIswIG/TLcmRrOhlj5NrDeuWQrsWQ=
X-Received: by 2002:a92:d4c4:: with SMTP id o4mr6428914ilm.38.1588378515633;
 Fri, 01 May 2020 17:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200501222357.543312-1-Jason@zx2c4.com> <20200501230913.GB915@sol.localdomain>
 <CAHmME9rpZGiwrK93=+6z8qBdDVs273MaR_boDd1xjjZRwbqpKQ@mail.gmail.com> <20200502001409.GD915@sol.localdomain>
In-Reply-To: <20200502001409.GD915@sol.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 1 May 2020 18:15:04 -0600
X-Gmail-Original-Message-ID: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
Message-ID: <CAHmME9rvp4JrER0RPp=VgYwYL87jntwW8vWNANzubH3Ah_8Oow@mail.gmail.com>
Subject: Re: [PATCH] security/keys: rewrite big_key crypto to use Zinc
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, May 1, 2020 at 6:14 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, May 01, 2020 at 06:06:17PM -0600, Jason A. Donenfeld wrote:
> > Hey Eric,
> >
> > Thanks for the review.
> >
> > I'll add `select CONFIG` as you suggested. I agree about trying to
> > move as much as possible out of crypto and into lib/crypto. Breaking
> > those dependency cycles won't be easy but perhaps it'll be possible to
> > chip away at that gradually. (I'd also lib a
> > lib/crypto/arch/{arch}/..., but I guess that's a separate discussion.)
> >
> > I'll also change -EINVAL to -EBADMSG. Nice catch.
> >
> > Regarding the buffer zeroing... are you sure? These buffers are
> > already being copied into filesystem caches and all sorts of places
> > over which we have zero control. At that point, does it matter? Or do
> > you argue that because it's still technically key material, we should
> > zero out both the plaintext and ciphertext everywhere we can, and
> > hopefully at some point the places where we can't will go away? IOW,
> > I'm fine doing that, but would like to learn your explicit reasoning
> > before.
>
> It's true that the buffer zeroing doesn't matter in big_key_preparse() because
> the buffer only holds the encrypted key (which is what the shmem file will
> contain).  But in big_key_read(), the buffer holds the decrypted key.  So it's
> at least needed there.  Having it in both places for consistency might be a good
> idea.

Alright. v2 coming your way shortly.


Jason
