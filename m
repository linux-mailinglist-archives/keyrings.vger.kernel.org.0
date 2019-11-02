Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B59AED049
	for <lists+keyrings@lfdr.de>; Sat,  2 Nov 2019 19:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfKBSx5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 2 Nov 2019 14:53:57 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36911 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBSx5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 2 Nov 2019 14:53:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id v2so13475191lji.4
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFZsrTxHj8UNSOV0MW3iX+ZNPh241BxYI9RJCfbRj4I=;
        b=fwWi36Cjm33TVpJsMKyyeNJuPa+EzO/w2jcz8N5ivZnB2LBgFElTwve7u7JUY1CQlk
         LBP3NYhj8mwMGDKFLZC3aAKJjtxEeb837zFLkONBVlInZ3n9BYz2CiSK5BYhQEqMplN+
         cxbruKuD+a9IFTjckV4CYWfQYTCffHao0G3wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFZsrTxHj8UNSOV0MW3iX+ZNPh241BxYI9RJCfbRj4I=;
        b=hHl1/8qNTj75YzujYAex2YSURgc4A6asmaBgsSL3+8uPefyENVGdFVcAvI1cNJr8/o
         cywfDqmVNgG6WxJx3UBlfG9DuXovm26cJTxPhVJNHolHabmub3qhmYHXBKDerf2p6kFy
         4OmrtVde/Szu7h8D24aOhJpSZYRl/kz7OA2Fit7wOftO8r1ImWRFRuiCjbuZxHc3WBCU
         nzvlfUxJXrw5KZDHJ7F1kyhT2RpUlo8cBMOZlL9j1rCm1W45D4FWFk8H+S2oeigySzmz
         fPipLS7R7yGlyzor+aNFT5bP7YYh+8PPak2LlcC57TpNpRpzqYJSpL42G0IYY9jFe9pk
         hcPQ==
X-Gm-Message-State: APjAAAX7pQU6vFs/H1UekvBpo54qs/ho+RDXMPUm1r47dMIepGeBsGEE
        HihS4Mc1Z5ofC0EN+XZlYlHkyD61e3Y=
X-Google-Smtp-Source: APXvYqyjf77jKOtpKSV/Tnc2GtKc2mmPF9fHRGYda7qrqdfvIAKT6UofVu8Swef1Lb6GkKJ6D0A3Aw==
X-Received: by 2002:a2e:3505:: with SMTP id z5mr11958638ljz.126.1572720835071;
        Sat, 02 Nov 2019 11:53:55 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id t25sm3798261ljj.93.2019.11.02.11.53.54
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id a6so6044838lfo.3
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
X-Received: by 2002:ac2:4c86:: with SMTP id d6mr11465241lfl.106.1572720834124;
 Sat, 02 Nov 2019 11:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <30394.1571936252@warthog.procyon.org.uk> <c6e044cc-5596-90b7-4418-6ad7009d6d79@yandex-team.ru>
 <17311.1572534953@warthog.procyon.org.uk>
In-Reply-To: <17311.1572534953@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 11:53:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_X_7JSYT-a3qHrzvuWGMyffDWtQ4n7adBp_fe5w0BsA@mail.gmail.com>
Message-ID: <CAHk-=wg_X_7JSYT-a3qHrzvuWGMyffDWtQ4n7adBp_fe5w0BsA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     David Howells <dhowells@redhat.com>
Cc:     Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
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

On Thu, Oct 31, 2019 at 8:16 AM David Howells <dhowells@redhat.com> wrote:
>
> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> wrote:
>
> > Similar synchronization is required for reusing memory after vmsplice()?
> > I don't see other way how sender could safely change these pages.
>
> Sounds like a point - if you have multiple parallel contributors to the pipe
> via vmsplice(), then FIONREAD is of no use.  To use use FIONREAD, you have to
> let the pipe become empty before you can be sure.

Well, the rules for vmsplice is simply to not change the source pages.
It's zero-copy, after all.

If you want to change the source pages, you need to just use write() instead.

That said, even then the right model isn't fsync(). If you really want
to have something like "notify me when this buffer has been used", it
should be some kind of sequence count thing, not a "wait for empty".

Which might be useful in theory, but would be something quite
different (and honestly, I wouldn't expect it to find all that
widespread use)

             Linus
