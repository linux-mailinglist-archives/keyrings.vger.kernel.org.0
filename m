Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD0B74E37C6
	for <lists+keyrings@lfdr.de>; Tue, 22 Mar 2022 05:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiCVECN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Mar 2022 00:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiCVECG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Mar 2022 00:02:06 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B0B659A
        for <keyrings@vger.kernel.org>; Mon, 21 Mar 2022 21:00:39 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o6so22425460ljp.3
        for <keyrings@vger.kernel.org>; Mon, 21 Mar 2022 21:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JLOgWgapC5LbjRMZnf3mts13pKbjy4ygNLAd0qKfGls=;
        b=cdc7GpVrI0zcK39IPv9L+gcUSEhYmB2rprwN8ri5f073/Vz2TjFezln5gK5nPCGVfT
         36UbdGnLCUJfLBzDJbKRl70yPyADMWXvUGe2v5xJ5KvYvagUsbBSsnyN4KNBaID63jAY
         QBSe5FrF7RHN+8wn0oGyv2YoXciL3vHSkcFeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JLOgWgapC5LbjRMZnf3mts13pKbjy4ygNLAd0qKfGls=;
        b=P81C8q8GRHa7CU0Gaz081ijCptUyiepzACzl97OT4jpAf3wLRMCosMxm730/cDIuV8
         r/fx03sTrA3YvMer5NZJ7yn+axDQ0Jkve9fKuKCfSEmHNgan7zimPswLh6eiiOQgoI1M
         UQnBK7yMgg1P8RuSC36NtaCiJyh++Po5GeinGCKiaeqvYan1Qk4H27qqDDBq4rQ3c3Xa
         1jaIGtQ3CDeJ0OZA+TfF3gR3/qbnziB6rsCI2Jf+f0F/jQ3ZnhP6BA8d7sQKadjTnCuk
         RTVpLIBcL9THgz8/NvDc4U6PlPvI3vUFqdX8aqLlaYo4x5vZvix9WiirwlArHgTD7Pd8
         v7Bw==
X-Gm-Message-State: AOAM531QRPStQkEel2F+urRUYpGbesOUIVKsRvFwngjdJ+T0z8XgGfz5
        Mr+wIJUhip/ikXoCCgQUg9rEJDby6VBbHW0Nunw=
X-Google-Smtp-Source: ABdhPJzHoj3rAQYBxo9e6zkt6esOK8VTHfwpPG92NlsfPkZUp6E3E4UjmuMahErt8suohekDQJF3SA==
X-Received: by 2002:a2e:8714:0:b0:249:7c99:ab5a with SMTP id m20-20020a2e8714000000b002497c99ab5amr9404721lji.204.1647921637634;
        Mon, 21 Mar 2022 21:00:37 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id e16-20020a196910000000b0044a13085dd5sm1174485lfc.270.2022.03.21.21.00.36
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 21:00:36 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id p15so17010604lfk.8
        for <keyrings@vger.kernel.org>; Mon, 21 Mar 2022 21:00:36 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr16561843lfs.27.1647921636431; Mon, 21
 Mar 2022 21:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <164786764630.1025645.12332376420230352947.stgit@warthog.procyon.org.uk>
In-Reply-To: <164786764630.1025645.12332376420230352947.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 21:00:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipjbxwH+w-w8QMjPY7f0UFskLOb4smmDRe_7HtyxoHEw@mail.gmail.com>
Message-ID: <CAHk-=wipjbxwH+w-w8QMjPY7f0UFskLOb4smmDRe_7HtyxoHEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] watch_queue: A couple more fixes
To:     David Howells <dhowells@redhat.com>
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Jann Horn <jannh@google.com>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 21, 2022 at 6:01 AM David Howells <dhowells@redhat.com> wrote:
>
> The fixes are also available through git:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-fixes

You have the dubious distinction of being the second pull today that
didn't use a signed tag.

Of 46 pulls today, only two were untagged branches, with the rest
using signed tags.

              Linus
