Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC35F3506
	for <lists+keyrings@lfdr.de>; Thu,  7 Nov 2019 17:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKGQwN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 7 Nov 2019 11:52:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38251 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729895AbfKGQwN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 7 Nov 2019 11:52:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id v8so3063758ljh.5
        for <keyrings@vger.kernel.org>; Thu, 07 Nov 2019 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QmbLva0bcejWfZ5vroXCCCNjtDh9+KzeuzRfAkUcNVw=;
        b=RC+2jxnet1c9HEhXNBxtTTpEfLinckdbFJn5Bmrik3m/W7Num2OjpLxTQS23AoRNRr
         Aj4dYDnclnksK9me7oG5iyDsfchGPA4TwVOyMbOGN2PJFpJroPg+VNW7luk63nWV0aoz
         X/nFl5ue/aQhw5K+6Ogz8TNi8yWG86H2/HKz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QmbLva0bcejWfZ5vroXCCCNjtDh9+KzeuzRfAkUcNVw=;
        b=ApOqAxuKwVGXeKuato8jZIsVnHFl1jqFBa7U3HYEx5JBAmGp76RMPobnjnDR0UjcVR
         /FIYLt1AqI36wf6yDNLhhG4YjV6PnMmffgWRsdCoCpTRcnYq/rsXN4kE/o7TGgY7646O
         ehvuCpF5PtU8zLSBqs2slwiITqRwkyI2axFIQ/4Q71rX1A7V2avFeHcZpXno7TiEk786
         Mz+CBCuA1ctsTfSfU3VlD1suAgeyltB+DlKz/UZh1CKPvB2OoHwRGfIuroB4qOPLcQ89
         hAesAUPCQa51hnZw2ay6qwy9XcU/yFTvYpl0bLCEr64VdlxhqiJZJ5tEQsHB6nNNeenj
         zUGw==
X-Gm-Message-State: APjAAAWWegYy1v7zFwvWAs8EubRs/BbeIc/J39QFvB19wqfHb3WyEgkK
        9UzjXMe1D2ntO8+rw3PXDoxCTDRkx3U=
X-Google-Smtp-Source: APXvYqwkV0/2TSpfMvw6wiJDtpe3is9kt0ph5KP1pQYRiOQAZtwz4qwF/LuxKXe0XhJ11lPZNwbdnQ==
X-Received: by 2002:a2e:970e:: with SMTP id r14mr3077908lji.57.1573145529404;
        Thu, 07 Nov 2019 08:52:09 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id o196sm1449634lff.59.2019.11.07.08.52.06
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 08:52:07 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id z12so2119464lfj.9
        for <keyrings@vger.kernel.org>; Thu, 07 Nov 2019 08:52:06 -0800 (PST)
X-Received: by 2002:ac2:5bca:: with SMTP id u10mr3159115lfn.134.1573145526683;
 Thu, 07 Nov 2019 08:52:06 -0800 (PST)
MIME-Version: 1.0
References: <157262967752.13142.696874122947836210.stgit@warthog.procyon.org.uk>
 <20191107090306.GV29418@shao2-debian>
In-Reply-To: <20191107090306.GV29418@shao2-debian>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 7 Nov 2019 08:51:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
Message-ID: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
Subject: Re: [pipe] d60337eff1: phoronix-test-suite.noise-level.0.activity_level
 144.0% improvement
To:     lkp report check <rong.a.chen@intel.com>
Cc:     David Howells <dhowells@redhat.com>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        lkp@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Nov 7, 2019 at 1:03 AM lkp report check <rong.a.chen@intel.com> wrote:
>
> FYI, we noticed a 144.0% improvement of phoronix-test-suite.noise-level.0.activity_level due to commit:
>
> commit: d60337eff18a3c587832ab8053a567f1da9710d2 ("[RFC PATCH 04/11] pipe: Use head and tail pointers for the ring, not cursor and length [ver #3]")

That sounds nice, but is odd. That commit really shouldn't change
anything noticeable. David, any idea?

               Linus
