Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C63B72DEF3
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 15:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfE2NzB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 09:55:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36867 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbfE2NzA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 May 2019 09:55:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id r10so2098071otd.4
        for <keyrings@vger.kernel.org>; Wed, 29 May 2019 06:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nM5sARwl1sa6eKAt0TFAWgWgCUxEcRSflyzlX/iZ/I0=;
        b=TDpMdfiPMalEB65wrfFO9vQnV66CDUVVsnceJGFqxwVbsOzJKJN4XL6ebaxInDxwQ6
         CxMEeflhVKUqQNAMf1p8L5/mzYyRQwUlI2OwatEjKJRL65iaOBKNUE15Fy+ze3F8t9mt
         eGE0P2vDBd3x6qnnvpQ8bI8vvtbJQJdACM1S5CbYB+evSW+oYi3oflUGZgrnSwIR/HFU
         EebYb8F4pud8IfMbmsliewKR/BYQi0QRAsuPMWuQin/ILGCxtoi01tmLqGGNISklQcME
         cZaeZPBQ55Q+4Gz3cgbe5Tm9AUDtN/ct6Y95VgS4JE9C0UZ8WXm5PGF2sZE2JTmHu4Jg
         vQeg==
X-Gm-Message-State: APjAAAUxABXu9oTVXebWeC9dM7MCbs8XCzzt7RP6F4+EECeVTJwl9O5G
        FzimHOxuMrGVBdSTQZK4RMAJrwAv0qH4Y8O1hNzApg==
X-Google-Smtp-Source: APXvYqx5L2FXD+FJD8L1eOO9aY2gVIaqbDDMOY5p1VOc5JZc9oWxReoCMUFWC4TCwWN492EVwTb0tWzzDMn3CXcCMkk=
X-Received: by 2002:a05:6830:154c:: with SMTP id l12mr27476389otp.66.1559138099890;
 Wed, 29 May 2019 06:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190521100034.9651-1-omosnace@redhat.com> <20190525031028.GA18491@sol.localdomain>
In-Reply-To: <20190525031028.GA18491@sol.localdomain>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Wed, 29 May 2019 15:54:48 +0200
Message-ID: <CAFqZXNsarmCWSvohKsWVtdSrFAkELrd4=VvwL-u_Mcc7oWNy5A@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - implement keyring support
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Milan Broz <gmazyland@gmail.com>,
        Ondrej Kozina <okozina@redhat.com>,
        Daniel Zatovic <dzatovic@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, May 25, 2019 at 5:10 AM Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, May 21, 2019 at 12:00:34PM +0200, Ondrej Mosnacek wrote:
> > This patch adds new socket options to AF_ALG that allow setting key from
> > kernel keyring. For simplicity, each keyring key type (logon, user,
> > trusted, encrypted) has its own socket option name and the value is just
> > the key description string that identifies the key to be used. The key
> > description doesn't need to be NULL-terminated, but bytes after the
> > first zero byte are ignored.
> >
> > Note that this patch also adds three socket option names that are
> > already defined and used in libkcapi [1], but have never been added to
> > the kernel...
> >
> > Tested via libkcapi with keyring patches [2] applied (user and logon key
> > types only).
> >
> > [1] https://github.com/smuellerDD/libkcapi
> > [2] https://github.com/WOnder93/libkcapi/compare/f283458...1fb501c
> >
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
>
> The "interesting" thing about this is that given a key to which you have only
> Search permission, you can request plaintext-ciphertext pairs with it using any
> algorithm from the kernel's crypto API.  So if there are any really broken
> algorithms and they happen to take the correct length key, you can effectively
> read the key.  That's true even if you don't have Read permission on the key
> and/or the key is of the "logon" type which doesn't have a ->read() method.

Well, initially I was looking for a "KEY_NEED_USE" permission that
would allow using the key for encryption/decryption, but not to
actually read it. But then I was told by some people that the
KEY_NEED_SEARCH permission already serves exactly this purpose (i.e.
that when you can find the key, it means you can use it). I would
imagine that any practical use case for trusted keys would involve
encrypting/decrypting some data with the key (maybe not flowing
directly from/to userspace, but what use is a key with which you can
encrypt only some "internal" data...?), so I'm not sure where we want
to draw the boundary of what is safe to do with (userspace-unreadable
but findable) keyring keys... Maybe the keyring API needs some way to
control the intended usage of each key (something a bit like the "key
usage" in X.509 certificates [1]) - so you can e.g. mark some key to
be used for XYZ, but not for AF_ALG or dm-crypt...

Either way, I agree that this functionality opens up a potential
security hole (in that it makes it much more likely that a
vulnerability in the crypto drivers or crypto algorithms themselves
can reveal the value of a key that is not supposed to be readable by
userspace). However, I'm not sure how to mitigate this without some
new "KEY_NEED_PROCESS_ARBITRARY_DATA" permission or something... For
now I can at least add a Kconfig option to enable/disable keyring
support in AF_ALG so that people/distros who want both keyring and
AF_ALG enabled, but do not want to expose keyring keys via AF_ALG, can
just disable it.

BTW, I'm still undecided if I should convert this patch to use key IDs
rather than descriptions, but I tend to prefer to stay with the
current approach (mainly because it would be a lot of effort to
rewrite everything :)

[1] https://tools.ietf.org/html/rfc5280#section-4.2.1.3




--
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
