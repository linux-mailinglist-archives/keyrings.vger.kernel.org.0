Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3E828C176
	for <lists+keyrings@lfdr.de>; Mon, 12 Oct 2020 21:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388390AbgJLT26 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Oct 2020 15:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387797AbgJLT25 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Oct 2020 15:28:57 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F430C0613D0
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 12:28:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 77so9291919lfl.2
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBBv8x0EA+jyMbeGbj2AD5+EOk9EuJpVDyEvfsZ1FnQ=;
        b=Sg/dv0+6q/T5D5BigWu87HiS3Oyz1Gx2mRS8WRM0qJR+ZvzBax9hT9Li7FBVJE0ydo
         qxNsvOzo9+2aL74hch0pe/IBE/A3RgBB2mlynpMG99k3j8N5fOXAJq6TsU1kqDdSiWNJ
         88IXcUyrzO2MAL00aCNG8np3MdgE/b4+Tqkog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBBv8x0EA+jyMbeGbj2AD5+EOk9EuJpVDyEvfsZ1FnQ=;
        b=fv6pKxepj12FEwrWs7kXTrL17Ml9HYQR42qOfYwh+aUUFdhMCKtUkXXrgoMmxQXrut
         B3Cm7VUs1GR2T2MpXrOXjesD6owruDtGeZYRlYjyqqe9XqQaPT2Y3474gILOuyCwx8XU
         56BOxulT3Rw9HPeU5E/g93MqZOzHd6vexNK4JnPXPdogAMrNq33cOEPPLL9oN+6UIn5y
         hMVFbg/YbwEtvR4dslx2+L0UaxguKdKUFQqqGPxLphmgsz3f187O61+FQtLWpQDRDXGS
         TDUpGyGybWm+Uep6wVo1agyBf/qqqLfn4N4y4R7tAWwb+hki638cjIJphoNgGl7PoREo
         WbBw==
X-Gm-Message-State: AOAM532aBhQbce5t1Qfmor5i4gkpd7MmT/InVu8nzGS1X7djojPRk7kf
        vus4pNOBRur+BzDbeJNuHJiOFxa7VqlfPA==
X-Google-Smtp-Source: ABdhPJw8h3yBTbBtP0XqxVhiCvNFTeUvJX6iq5OUBWmoE23uartoUhPbANcf+LtZcXDlt5f0bsV+aA==
X-Received: by 2002:ac2:4a64:: with SMTP id q4mr3479210lfp.513.1602530935428;
        Mon, 12 Oct 2020 12:28:55 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id e189sm3256378lfd.227.2020.10.12.12.28.54
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 12:28:54 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id h20so17979946lji.9
        for <keyrings@vger.kernel.org>; Mon, 12 Oct 2020 12:28:54 -0700 (PDT)
X-Received: by 2002:a2e:9152:: with SMTP id q18mr10194176ljg.421.1602530934167;
 Mon, 12 Oct 2020 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKgNAkjMBGeAwF=2MKK758BhxvW58wYTgYKB2V-gY1PwXxrH+Q@mail.gmail.com>
 <CAHk-=wig1HDZzkDEOxsxUjr7jMU_R5Z1s+v_JnFBv4HtBfP7QQ@mail.gmail.com>
In-Reply-To: <CAHk-=wig1HDZzkDEOxsxUjr7jMU_R5Z1s+v_JnFBv4HtBfP7QQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Oct 2020 12:28:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfydyikU_KfHSLo1uMSs-vksDjYkdnyv1+89C32XwUOA@mail.gmail.com>
Message-ID: <CAHk-=wgfydyikU_KfHSLo1uMSs-vksDjYkdnyv1+89C32XwUOA@mail.gmail.com>
Subject: Re: Regression: epoll edge-triggered (EPOLLET) for pipes/FIFOs
To:     Michael Kerrisk-manpages <mtk.manpages@gmail.com>,
        Alexander Viro <aviro@redhat.com>
Cc:     David Howells <dhowells@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Ian Kent <raven@themaw.net>,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Oct 12, 2020 at 12:25 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, the old pipe behavior was that it would wake up writers whether
> they needed it or not [..]

That "writers" should be "readers", of course.

Although yes, that commit changed it for both readers and writers: if
the pipe was readable from before, then a writer adding new data to it
doesn't make it "more readable". Similarly, if a pipe was writable
before, and a reader made even more room in it, the pipe didn't get
"more writable".

So that commit removes the pointless extra wakeup calls that don't
actually make any sense (and that gave incorrect edges to the some
EPOLL case that saw an edge that didn't actually exist).

              Linus
