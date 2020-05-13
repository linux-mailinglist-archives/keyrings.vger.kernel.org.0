Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182191D0500
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 04:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgEMCd0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 May 2020 22:33:26 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:54549 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgEMCd0 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 12 May 2020 22:33:26 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4040115;
        Wed, 13 May 2020 02:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=9cAMlLbYwy7YxFnVgonuDYVCQ7Y=; b=1m1PFJ
        2B+8CtLPfFKydV2Eqa4Iou4wbcYCYArA8utEK56pKUtvPY8GyQDYxSflLjzyeySc
        XVCoTB3ryeoFAOK1PJgt/GKg8T6VWi/SKiUUg0VCvhPTtgNLyLAj9J8arRB1Q/jK
        XVs4nbCnzQnmzE5bflXX58+mr5wfZOcesWXaNWPoL9j+KdeFfh/F0C2G6ZhRc+At
        NaXpXlxgGtS77ZgZEedUSyOTwbZaLGXqZ3VnL82nV9T3lZFyoysQEatZ3+gdT208
        I65k13q3L3wDSLzTiAUOW+4kOCBLaqMleGTlAEQ3NzD3v9BDrzB3FdZaoywd+vOr
        kNo19N145XvIZ5pg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba827fd7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 13 May 2020 02:19:52 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id n11so14472540ilj.4;
        Tue, 12 May 2020 19:33:23 -0700 (PDT)
X-Gm-Message-State: AGi0PubuQIJiEkmUBthIeKfwhA5OV4ke/LgdMGbmqUnV3sk16AOOZtHw
        72zVfiv+lc7gzdxW/E0a9+3H0JbN3nJmC6tAjjo=
X-Google-Smtp-Source: APiQypJgh8pw02tJhFhZVYZHUeMe4CkR7vQq3ZoiDzB43+wYjuX9PsMkHQ584E/CvIIJSREZQMxGHmOWxbe4h+OTD5M=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr25252998ilg.231.1589337202376;
 Tue, 12 May 2020 19:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com>
 <20200511215101.302530-1-Jason@zx2c4.com> <2620780.1589289425@warthog.procyon.org.uk>
 <CAHmME9q-TxHo5o63rxHzKwV_kWV9u+MoxBQM5Yz3hODGCj7RhQ@mail.gmail.com> <2858489.1589321003@warthog.procyon.org.uk>
In-Reply-To: <2858489.1589321003@warthog.procyon.org.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 12 May 2020 20:33:11 -0600
X-Gmail-Original-Message-ID: <CAHmME9r4Pag4ML-GVaKHFTZ_T_unhWg1LxVuEk6wKp006ZAFXg@mail.gmail.com>
Message-ID: <CAHmME9r4Pag4ML-GVaKHFTZ_T_unhWg1LxVuEk6wKp006ZAFXg@mail.gmail.com>
Subject: Re: [PATCH v3] security/keys: rewrite big_key crypto to use library interface
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com,
        Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 12, 2020 at 4:03 PM David Howells <dhowells@redhat.com> wrote:
>
> Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > So long as that ->update function:
> > 1. Deletes the old on-disk data.
> > 2. Deletes the old key from the inode.
> > 3. Generates a new key using get_random_bytes.
> > 4. Stores that new key in the inode.
> > 5. Encrypts the updated data afresh with the new key.
> > 6. Puts the updated data onto disk,
> >
> > then this is fine with me, and feel free to have my Acked-by if you
> > want. But if it doesn't do that -- i.e. if it tries to reuse the old
> > key or similar -- then this isn't fine. But it sounds like from what
> > you've described that things are actually fine, in which case, I guess
> > it makes sense to apply your patch ontop of mine and commit these.
>
> Yep.  It calls big_key_destroy(), which clears away the old stuff just as when
> a key is being destroyed, then generic_key_instantiate() just as when a key is
> being set up.
>
> The key ID and the key metadata (ownership, perms, expiry) are maintained, but
> the payload is just completely replaced.

Okay, in that case, take my:

    Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

And then perhaps you can take both my patch and your addendum into keys-next.

Jason
