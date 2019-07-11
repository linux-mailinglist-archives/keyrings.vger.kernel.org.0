Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FA265009
	for <lists+keyrings@lfdr.de>; Thu, 11 Jul 2019 03:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfGKB70 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Jul 2019 21:59:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37033 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727622AbfGKB70 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Jul 2019 21:59:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so4068598ljn.4
        for <keyrings@vger.kernel.org>; Wed, 10 Jul 2019 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NiaFfYJ216nYjgBrBY5JKQAHNiRjdATog8sl2JxZW+g=;
        b=MQOzZI79mvoiVs1sgBWHfqE+YJM9b7M05jQpHMpAAyRFe0Cs7GZ1SKjYmbrPj6ztHM
         B7Jmo2E1tOKxmtYLHAeJfiv0Yw5iWNpJ6su3Aywbxq++FWe46hRTt1FaTYFdrs51gDai
         Fc+1NUhQh/izklmNT0WE5mkHqoWlVg+hybjs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NiaFfYJ216nYjgBrBY5JKQAHNiRjdATog8sl2JxZW+g=;
        b=PKnLpsqMl8ls9aGtHsB9ecp3qUOU97+pA7B5YDoYVZ1kjDx2X2k/pB/YF5m+Lh4pZ2
         lhsdLWS+FdqI7ocx2nLutLezancU/4sUg7lzvb5m/LXeQRgG4koYyaHV6FhnDChP3Mkd
         8asIOYmSCyDXo7briaHZ+moyMkNZ5yOMsajFkOxdCI9xpOka4k+9r2DmipKg01ih5MpW
         f2JoXPtmZlqKacavB/HTi5lc6Pw7KfhcJu8o+yoejW7LB9Xr9KUqUJSVb+MMbJ9NmAQq
         rG3QocSJLkrQ8cD4R165eqs+MOhs0KKu0Y28w0pPVtcy6W7rLC1jKsshrr1LIkJQWxDx
         NDjw==
X-Gm-Message-State: APjAAAVHrIlA/amOagmlOxKDD+eELYiDwP0xccCus8sLd/9byDB1uztb
        vQJvH5SYm46VDOM6wWDpg8yi3QlikdE=
X-Google-Smtp-Source: APXvYqxC6OQC3R0CJkKAF+pYZw56oRMiqhGauMCJjEdzOuNbOPjQ5ppsN2QlLlWbK2FvEFTrM8SM6Q==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr723441ljm.182.1562810363483;
        Wed, 10 Jul 2019 18:59:23 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id s7sm729243lje.95.2019.07.10.18.59.21
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 18:59:22 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id z15so2888333lfh.13
        for <keyrings@vger.kernel.org>; Wed, 10 Jul 2019 18:59:21 -0700 (PDT)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr355474lft.79.1562810361547;
 Wed, 10 Jul 2019 18:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <28477.1562362239@warthog.procyon.org.uk> <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
In-Reply-To: <20190710201552.GB83443@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 10 Jul 2019 18:59:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
Message-ID: <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>, keyrings@vger.kernel.org,
        Netdev <netdev@vger.kernel.org>, linux-nfs@vger.kernel.org,
        CIFS <linux-cifs@vger.kernel.org>, linux-afs@lists.infradead.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jul 10, 2019 at 1:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Also worth noting that the key ACL patches were only in linux-next for 9 days
> before the pull request was sent.

Yes. I was not entirely happy with the whole key subsystem situation.
See my concerns in

  https://lore.kernel.org/lkml/CAHk-=wjEowdfG7v_4ttu3xhf9gqopj1+q1nGG86+mGfGDTEBBg@mail.gmail.com/

for more. That was before I realized it was buggy.

So it really would be good to have more people involved, and more
structure to the keys development (and, I suspect, much else under
security/)

Anyway, since it does seem like David is offline, I've just reverted
this from my tree, and will be continuing my normal merge window pull
requests (the other issues I have seen have fixes in their respective
trees).

                 Linus
