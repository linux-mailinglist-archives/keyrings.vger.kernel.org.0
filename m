Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33A21F8460
	for <lists+keyrings@lfdr.de>; Sat, 13 Jun 2020 19:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgFMREM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 13 Jun 2020 13:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMREL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 13 Jun 2020 13:04:11 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95627C03E96F
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 10:04:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a9so14522447ljn.6
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8uOcP8wvI0VVU/9vs++U3KixSM8L7MBiXf+DxWGkO0I=;
        b=Yy3d5KdRDw1hzH1PEQuf/w+pL5E0KZICHKYeEpDF6h4E1JkwxsLxvUOA82j8ffi9wm
         G69M2LrhlOjYJ+LDuDQRsqubitClqczfsBDSYVR2HIzjv6ucIalMybe9rZVai3H50Ykg
         LtyaL1R6OHx6sisGgCxHaVvhg8CvecRUuLcqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8uOcP8wvI0VVU/9vs++U3KixSM8L7MBiXf+DxWGkO0I=;
        b=fFKD/NnAGyCCm4iEoWnAvpw9cP+8jv25y72TkxSJ3A1yAYGTdEI4cjbW2Y1mIPUWYF
         ur2A8rv0Y3VNkS8eXS7YOAou31ijtqfU8P3X5fmaGr6rjnztZk7k4F3Rc3QKOvi4ZWl8
         RE7rjFq82Hte/BqdXdDwmdx/8jY++bYqXF9PIq4Y1ru+KKkqy6zKGVipHhUQy05PvQQR
         /VvURvb0P8xNmBfkeylN08XbHI8VB6vekC/1JxTgCpHZChp2b9vpW5zAOzlUMWk15D4h
         QbbB3kQHvchrGqDhk8HatvU8EIAqhSCFjQ3fEQ9WzEckCL7QqTtV/nOWZ72X8wk4r2B6
         kOPw==
X-Gm-Message-State: AOAM53306VKWhy0HKia/sPr/OGDIj3n2TkVeIrFjQQFvCTIvJN27sFrU
        FH3txlwR/HTn58I6QzoDn7dwMyt+gh4=
X-Google-Smtp-Source: ABdhPJy9PmBQ2tLK7yHL3ORQRARA9KChWTO5uM7E4RFy+XENMxmO+/MlqnhKE0g3XyzkCxQL7ReqtQ==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr10115377ljo.261.1592067848085;
        Sat, 13 Jun 2020 10:04:08 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id q26sm2745883ljg.128.2020.06.13.10.04.07
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 10:04:07 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id e4so14532063ljn.4
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 10:04:07 -0700 (PDT)
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr9126775ljk.314.1592067847109;
 Sat, 13 Jun 2020 10:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <1503686.1591113304@warthog.procyon.org.uk> <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
 <CAHk-=whypJLi6T01HOZ5+UPe_rs+hft8wn6iOmQpZgbZzbAumA@mail.gmail.com>
 <3984625.1592053492@warthog.procyon.org.uk> <CAHk-=wh=9bYycJM5ginkkwymb3x-geMtiT5i2FvRS0zbKYR9LQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh=9bYycJM5ginkkwymb3x-geMtiT5i2FvRS0zbKYR9LQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 13 Jun 2020 10:03:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgX1WM-ST+imRUUKabBo8GodUkYLGSAZ9NsGyqjA-q1Ng@mail.gmail.com>
Message-ID: <CAHk-=wgX1WM-ST+imRUUKabBo8GodUkYLGSAZ9NsGyqjA-q1Ng@mail.gmail.com>
Subject: Re: [GIT PULL] General notification queue and key notifications
To:     David Howells <dhowells@redhat.com>
Cc:     Karel Zak <kzak@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
        dray@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, Ian Kent <raven@themaw.net>,
        andres@anarazel.de,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Jun 13, 2020 at 9:47 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> If we have multiple uses, and one of them notices some problem that
> requires any ABI changes, but the other one has already started using
> it, we'll have more problems.

Ok, it's merged in my tree, although I was somewhat unhappy about the
incomprehensible calling conventions of "get_pipe_info()". The random
second argument just makes no sense when you read the code, it would
have probably been better as a helper function or #define to clarify
the whole "for_splice" thing.

But let's see how it works and what actually happens.

               Linus
