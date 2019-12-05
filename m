Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01515114811
	for <lists+keyrings@lfdr.de>; Thu,  5 Dec 2019 21:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbfLEU1P (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Dec 2019 15:27:15 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45937 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729502AbfLEU1O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 5 Dec 2019 15:27:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so3457431lfa.12
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 12:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K2nboj5xrRkV1yqHjA0Aj2mbWgmjh4x0SrJcMaszVtA=;
        b=TY6MoxQFBEklRwMxXtPk7pq3Wq5Rwa2J/YtugYsq/w1lH9+ERuu6f1+z8+8JuKIiKx
         YDkuPczmV+9Qf+ENZhlePKKmJs1rLUEQ7rx1SKksdo9OxMTgxyWfNyX7ZM9ZSUbccBnx
         JYw40/VtEd257BEbFslSJIyKBygobO7WiYq+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K2nboj5xrRkV1yqHjA0Aj2mbWgmjh4x0SrJcMaszVtA=;
        b=K2UFZnUP8LPNSuk5UqH5m4G7DH9bFYPAnxVe7EojsyWw1vqPnBOvKEutYWAPploGnM
         lupsH3+kr4ngxHGXbjO98pI7mbJRkeRx9VpnjozRNW+rgIDNAwsEYkXVp5l+m0DrAHMV
         cXJwGIWDkIjKUniyz1bM8Nb1cP4wRKV+DVvCXTH7Be3nb30YUj0xJ4Kpr72OT48ViAZL
         mz6CfXyXRleagKlLWOad6fhP8R/ne1/g4regGoWNqIweJae5Wnkp2CEl1xHfPnteR6Aq
         yJLSGWBk23sif/Z1WiW3W4ZYOIe5AAhlmfPNVpUDSWO+dvlnWcmotX0aZfMdiQpR5n2W
         CkjQ==
X-Gm-Message-State: APjAAAVZLqKU0QM3fck5fReci+WGKp0wh6Qx0mvwitwL9AaCkEnfTXjZ
        N3DSRG03I0UUU2XynhkgIhuEj/sCb3E=
X-Google-Smtp-Source: APXvYqyBE6BIHPncs542WLE37sj/LkLOi5HC1rDRbz4+8aHkexY5dFN0FY+KvjBdgV0lBhy8AgkQCQ==
X-Received: by 2002:a19:ed1a:: with SMTP id y26mr6193836lfy.73.1575577631493;
        Thu, 05 Dec 2019 12:27:11 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id l6sm5475760ljh.13.2019.12.05.12.27.09
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 12:27:09 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id j6so5128490lja.2
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 12:27:09 -0800 (PST)
X-Received: by 2002:a05:651c:239:: with SMTP id z25mr4294750ljn.48.1575577628995;
 Thu, 05 Dec 2019 12:27:08 -0800 (PST)
MIME-Version: 1.0
References: <31555.1574810303@warthog.procyon.org.uk>
In-Reply-To: <31555.1574810303@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Dec 2019 12:26:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj+_n63ps_-Rvwgo4S7rd2eLAVcJwbZee7iHZaO+1hvYQ@mail.gmail.com>
Message-ID: <CAHk-=wj+_n63ps_-Rvwgo4S7rd2eLAVcJwbZee7iHZaO+1hvYQ@mail.gmail.com>
Subject: Re: [GIT PULL] pipe: General notification queue
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Nov 26, 2019 at 3:18 PM David Howells <dhowells@redhat.com> wrote:
>
> Can you consider pulling my general notification queue patchset after
> you've pulled the preparatory pipework patchset?  Or should it be deferred
> to the next window?

So it's perhaps obvious by now, but I had delayed this pull request
because I was waiting to see if there were any reports of issues with
the core pipe changes.

And considering that there clearly _is_ something going on with the
pipe changes, I'm not going to pull this for this merge window.

I'm obviously hoping that we'll figure out what the btrfs-test issue
is asap, but even if we do, it's too late to pull stuff on top of our
current situation right now.

I suspect this is what you expected anyway (considering your own query
about the next merge window), but I thought I'd reply to it explicitly
since I had kept this pull request in my "maybe" queue, but with the
pipe thread from this morning it's dropped from that.

            Linus
