Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5DB115A7A
	for <lists+keyrings@lfdr.de>; Sat,  7 Dec 2019 02:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfLGBEC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 6 Dec 2019 20:04:02 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33425 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfLGBEB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 6 Dec 2019 20:04:01 -0500
Received: by mail-lj1-f196.google.com with SMTP id 21so9605701ljr.0
        for <keyrings@vger.kernel.org>; Fri, 06 Dec 2019 17:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xp39wpo5AR+pbRP/tZoeRSZICS3SHzWRMfhJEvbxIGA=;
        b=F9QgFlzOLVDvV/NH9kO5C38Tw6X+Hr1zV9nvDrPtaW9IdmdHU1TNQTmWgtmr08QLWs
         m/LzPoUZk/NRRXSGyCni67pyjPAjI1csctIc4AcmS9vEoOX/8bco5LDaWzkI+5Pvvxsm
         tA5h/kF2wpsxbPSmFh84K3eYpHR4dbqT6qkZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xp39wpo5AR+pbRP/tZoeRSZICS3SHzWRMfhJEvbxIGA=;
        b=fvWvEgy0m4LIYUPFoFc2GlznV3z1B+zVdKkx3BxDfpkYg8IKb9lVm+RMA3WcjDGLWO
         96/hh90pyW3L73G9U3QoksLnDQHFyJKw8wdwxsAiJ/Csdb+Spieud+igwjk/cy8S0Ljh
         a5HjpSM/fc0HiARBoEWb9Vzpu9VTFeOSC/5uU4oRdJLeasv/b2J4cwNhcVhnJctBGXDm
         vqbcs8RYBv9+r3uPKMXRMYnGu7g3WF1FogOqtNlAhtvBR8ZgWDqsR1/j0sIEjKQMiXBA
         ncL4Lh2aG7oS2KZ5WczEEXzsxrcXHLL5nWOStteSE4b/U6v+hNE8kHUxIiSWvbk9jq55
         U4rQ==
X-Gm-Message-State: APjAAAX7gejJOaBz0r5TPamwbLi7d/nXnPdtYDtowY/2L9XGV6VHc7ig
        ooZuacjsEpTxermgHfoa2x+qVKzVQhQ=
X-Google-Smtp-Source: APXvYqw/Dbl0HVrBYHgnJ2kJlrLmrAz090WMUCmyQsxRBM+OEwnoCvB8U/u6mEZeiTqiCwI9MpjEGw==
X-Received: by 2002:a2e:2914:: with SMTP id u20mr9874754lje.219.1575680639282;
        Fri, 06 Dec 2019 17:03:59 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id e20sm7230278ljk.44.2019.12.06.17.03.56
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 17:03:57 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 9so6588174lfq.10
        for <keyrings@vger.kernel.org>; Fri, 06 Dec 2019 17:03:56 -0800 (PST)
X-Received: by 2002:ac2:555c:: with SMTP id l28mr9400181lfk.52.1575680636244;
 Fri, 06 Dec 2019 17:03:56 -0800 (PST)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
 <20191206214725.GA2108@latitude> <CAHk-=wga0MPEH5hsesi4Cy+fgaaKENMYpbg2kK8UA0qE3iupgw@mail.gmail.com>
 <20191207000015.GA1757@latitude>
In-Reply-To: <20191207000015.GA1757@latitude>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Dec 2019 17:03:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEa5oNcQ9+9fai1Awqktf+hzz_HZmChi8HZJWcL62+Cw@mail.gmail.com>
Message-ID: <CAHk-=wjEa5oNcQ9+9fai1Awqktf+hzz_HZmChi8HZJWcL62+Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring,
 not cursor and length [ver #2]
To:     Johannes Hirte <johannes.hirte@datenkhaos.de>
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Dec 6, 2019 at 4:00 PM Johannes Hirte
<johannes.hirte@datenkhaos.de> wrote:
>
> Tested with 5.4.0-11505-g347f56fb3890 and still the same wrong behavior.

Ok, we'll continue looking.

That said, your version string is strange.

Commit 347f56fb3890 should be  "v5.4.0-13174-g347f56fb3890", the fact
that you have "11505" confuses me.

The hash is what matters, but I wonder what is going on that you have
the commit count in that version string so wrong.

                   Linus
