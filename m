Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF68A114573
	for <lists+keyrings@lfdr.de>; Thu,  5 Dec 2019 18:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbfLERNG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Dec 2019 12:13:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33954 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730016AbfLERNF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 5 Dec 2019 12:13:05 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so4501609ljc.1
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 09:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYNLY1IlQbFxutIFweWCQvjwN9b0IsGYV2okK9HrfFg=;
        b=Q0FUaDCgejnj2j913m9DkZ5BcPyxfvWCsvBxLXqstFY2bocRU9mYGGdVT6TyixAaF9
         S2hdwaxlIrLjm/VudylZUBLif/OSS4AVyaDGMpzqZdSB/9DnkfX4SEUoI9oj/pbE/ewR
         2kNMP8DNxG23lhz/9/1l0TfZQjJpzTexlyrHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYNLY1IlQbFxutIFweWCQvjwN9b0IsGYV2okK9HrfFg=;
        b=E0FOpd+o/AtzGplpDpY8YHwS3pczfG7bIoIaTuuj81Yj6XFsURj6lp+WrSzeE2XG+k
         A/MTUw8U18rqcG6HnUtUXI+ZuY6KCAmQtMILpoK7XR/w7YznJgq6NoWSFS9X/DTyHRmO
         CxTm+O1BQz0sz1h3j6qI5IoFTc7vhT1eiUl5wMtzMXxFRBVNZK2Xx2P6xICxx8fLdgHO
         nENbMOnS3Nug35UvroxuUyHBQdp6u0dwwQ2XFWiDM9EDtnTXYwQ/ppWQ8VKAd4x1i6qM
         2N7xiXArPiv9trFBYniTUAuKURMee17XDkAfZ1afn7NF3j2f6fPQU/Dq8O2oyKAdI438
         wnMA==
X-Gm-Message-State: APjAAAUf+vHcLF/9CN4bOLVm0A4Ymg7v0NQGtljJDir/Dxo32ua8llsP
        N3v1gzY+CJkVT8zhjDsNMV1F5Ck/cJs=
X-Google-Smtp-Source: APXvYqzbGahf4yFvq8SAMWV0OyY/0MkN5Ke+EF7ToHraV7ugh6dBLAHBaIP79gE7dVrih8p1TdOnjw==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr5989354ljg.166.1575565982609;
        Thu, 05 Dec 2019 09:13:02 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id c189sm1040623lfg.75.2019.12.05.09.12.59
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 09:12:59 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id v201so3039728lfa.11
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 09:12:59 -0800 (PST)
X-Received: by 2002:a19:4351:: with SMTP id m17mr6095833lfj.61.1575565978909;
 Thu, 05 Dec 2019 09:12:58 -0800 (PST)
MIME-Version: 1.0
References: <31452.1574721589@warthog.procyon.org.uk> <20191205125826.GK2734@twin.jikos.cz>
 <1593.1575554217@warthog.procyon.org.uk>
In-Reply-To: <1593.1575554217@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Dec 2019 09:12:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwwJ+ZEtycujFdNmpS8TjwCYyT+oHfV7d-GekyaX91xg@mail.gmail.com>
Message-ID: <CAHk-=wgwwJ+ZEtycujFdNmpS8TjwCYyT+oHfV7d-GekyaX91xg@mail.gmail.com>
Subject: Re: [GIT PULL] pipe: Notification queue preparation
To:     David Howells <dhowells@redhat.com>
Cc:     David Sterba <dsterba@suse.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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

On Thu, Dec 5, 2019 at 5:57 AM David Howells <dhowells@redhat.com> wrote:
>
> David Sterba <dsterba@suse.cz> wrote:
>
> > [<0>] pipe_write+0x1be/0x4b0
>
> Can you get me a line number of that?  Assuming you've built with -g, load
> vmlinux into gdb and do "i li pipe_write+0x1be".

If the kernel is built with debug info (which you need for the gdb
command anyway), it's much better to just use

   ./scripts/decode_stacktrace.sh

which gives all the information for the whole backtrace.

It would be interesting to hear if somebody else is waiting on the
read side too.

             Linus
