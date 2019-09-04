Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D89A966B
	for <lists+keyrings@lfdr.de>; Thu,  5 Sep 2019 00:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbfIDW20 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Sep 2019 18:28:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38479 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730447AbfIDW20 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Sep 2019 18:28:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id c12so295874lfh.5
        for <keyrings@vger.kernel.org>; Wed, 04 Sep 2019 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N2MMR8Y9nF2WKJ/GwXu7Orie3221sa5b9mT2pSMScP0=;
        b=fJ3Uw5l+iJ6RQgyGxaGpdfmIjWnE5F6x31rjDuCqfKxB8VAjbqJtmAWjWR9quPy177
         kSc2B1tiYJnm6N1rDryl38O0XT+KrCxDR5lxJB7HlM5pTNWW6oATfW3XbXy7OWukzkZ2
         g/kQFWidQUGLu16LN7J3E3MLC7X6Q8WHam9qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N2MMR8Y9nF2WKJ/GwXu7Orie3221sa5b9mT2pSMScP0=;
        b=ZHDfdCxx8GCf/RDu0NcACSoRa915t079UCLva75SfKNqnA+V11LnNP7ru3F7ViBKB3
         GnyetMfOOXMXCjog0SH1LhJ86CjfzSBn1KpveF7NjnmvVRcWD98nBOPtx4S5bDe10dd/
         Yd7AFfWYlTNxf34mQFb2fE5IsOnNnaXmwgvnmEpk2GHllf6T/UqO+viIYgzaPuu5l9+l
         3flj2vBorgEOKDA9QAioUVZEAOyE9bBejE55coOZEaMuxUx3/o0qIpogAZ+WCEoLIXEa
         KGuizKfrJm9isY4LmoK1uQTizG/KYmrNN8iKqp2MZHnbLqYpbd/L1ysuqi40S4Ge+H4k
         Wvaw==
X-Gm-Message-State: APjAAAWRpeG/VIoyV9UItLVhcpIKfcdt1kmrVQF9zeXlADWDDxP26RDZ
        aVNRzJKOeYAFx1z+VXmt9eicl14RaRg=
X-Google-Smtp-Source: APXvYqxTxldWmg6YzygfUV8HRhrOF/oJFTO8FdLFX/dkIzIGIJSOyLuqmYaS9ojVx8fr4J6FUzeukQ==
X-Received: by 2002:ac2:530e:: with SMTP id c14mr221725lfh.165.1567636103388;
        Wed, 04 Sep 2019 15:28:23 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id b7sm42606lfp.27.2019.09.04.15.28.22
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 15:28:22 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id x18so346318ljh.1
        for <keyrings@vger.kernel.org>; Wed, 04 Sep 2019 15:28:22 -0700 (PDT)
X-Received: by 2002:a05:651c:1104:: with SMTP id d4mr7069ljo.90.1567636101831;
 Wed, 04 Sep 2019 15:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
In-Reply-To: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 15:28:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
Message-ID: <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Keyrings, Block and USB notifications [ver #8]
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        nicolas.dichtel@6wind.com, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Sep 4, 2019 at 3:15 PM David Howells <dhowells@redhat.com> wrote:
>
>
> Here's a set of patches to add a general notification queue concept and to
> add event sources such as:

Why?

I'm just going to be very blunt about this, and say that there is no
way I can merge any of this *ever*, unless other people stand up and
say that

 (a) they'll use it

and

 (b) they'll actively develop it and participate in testing and coding

Because I'm simply not willing to have the same situation that
happened with the keyring ACL stuff this merge window happen with some
other random feature some day in the future.

That change never had anybody else that showed any interest in it, it
was never really clear why it was made, and it broke booting for me.

That had better never happen again, and I'm tired of seeing
unexplained random changes to key handling that have one single author
and nobody else involved.

And there is this whole long cover letter to explain what the code
does, what you can do with it, and what the changes have been in
revisions, but AT NO POINT does it explain what the point of the
feature is at all.

Why would we want this, and what is the advantage over udev etc that
already has event handling for things like block events and USB
events?

What's the advantage of another random character device, and what's
the use? Who is asking for this, and who would use it? Why are keys
special, and why should you be able to track events on keys in the
first place? Who is co-developing and testing this, and what's the
point?

Fundamentally, I'm not even interested in seeing "Reviewed-by". New
features need actual users and explanations for what they are, over
and beyond the developer itself.

IOW, you need to have an outside person step in and say "yes, I need
this". No more of these "David makes random changes without any
external input" series.

                 Linus
