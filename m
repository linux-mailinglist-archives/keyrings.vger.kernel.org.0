Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2333747CD
	for <lists+keyrings@lfdr.de>; Wed,  5 May 2021 20:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhEESFg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 5 May 2021 14:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbhEESEz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 5 May 2021 14:04:55 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E071C06135D
        for <keyrings@vger.kernel.org>; Wed,  5 May 2021 11:02:59 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso2542326otl.0
        for <keyrings@vger.kernel.org>; Wed, 05 May 2021 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EkOFpIfIbTV26rdHVkQ0ScdgGkxleiBN1dtxgsOyQI8=;
        b=WDs01NpyL+pQQ5J0fpQMx7+UJWwje0K7gqjVH3snQ0OlSHw0GRM+IcVaCmXcSMqaC6
         GkAa0kCbC3FHOStwcx71nykw3fJoegYem4Uy7L9HoVzzr1eJDO8MVNx4JrnBi2NxWSVL
         moBboqfk90my+7Q2g6JLVmMjHsoAqyj3cH6rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EkOFpIfIbTV26rdHVkQ0ScdgGkxleiBN1dtxgsOyQI8=;
        b=ZbWGgoscENPGOG4ykGxkZtii4/jvqzjdwmWtp6aRDArkuM9tPsB8ny8HQoY8Ozy/5q
         4Cq2IM6Gl7PF9X8om9qn7T4Hr44sQFIMhijzJzjWDhdKA/AUgH8UDrIHUbFN7YVRfJZk
         IVK5uC0fZrneXgSdp3toMtZcw5vRCmNmgU7vLXJXa6mh/WfZq3A4j5FrEpgJUCAxEuVS
         RZTfESMma/63MJAgbozh5BGPJoykPcUmRB00KP74dSgutA1R3IknC1qwoohqwIIxc0nO
         UaJOoCrS7ALiid1bzTwZLfBpCI0QEoAJzh2VnOJevx7+srgusghKdGlgZPPICw4wTGfH
         REMQ==
X-Gm-Message-State: AOAM5302B7YvcAJNNZbyIrXbggWIVfsMQiasQPogwGO+h/6matW84emt
        nqRI1GryxBFc0ASZCzDTRfcw8ZxfefEyqQ==
X-Google-Smtp-Source: ABdhPJzRoVlV0zhl1wj8ZsOiUkyjMtrihIlYeetN7iZ9r0Itt2V54k72Cb68Z1rWteWu8wayRxgwdQ==
X-Received: by 2002:a9d:6951:: with SMTP id p17mr12022661oto.222.1620237778434;
        Wed, 05 May 2021 11:02:58 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id x141sm1476778oif.13.2021.05.05.11.02.57
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 11:02:57 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso2499228otn.3
        for <keyrings@vger.kernel.org>; Wed, 05 May 2021 11:02:57 -0700 (PDT)
X-Received: by 2002:a05:6830:a:: with SMTP id c10mr24829836otp.21.1620237776769;
 Wed, 05 May 2021 11:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210220013255.1083202-1-matthewgarrett@google.com>
 <CAE=gft4HnQKP3RK1hOGpThccLPanQzWpssCsEyUQGLbTMpzrFw@mail.gmail.com>
 <YJIOdNdWTClIXYZz@kernel.org> <YJIOuTbf91DCEkDe@kernel.org>
In-Reply-To: <YJIOuTbf91DCEkDe@kernel.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 5 May 2021 11:02:20 -0700
X-Gmail-Original-Message-ID: <CAE=gft6Z1+kt_6sqRcpFh-=C0ir4cqEkC7p1WcPFhnkWgtprYA@mail.gmail.com>
Message-ID: <CAE=gft6Z1+kt_6sqRcpFh-=C0ir4cqEkC7p1WcPFhnkWgtprYA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Enable hibernation when Lockdown is enabled
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-integrity@vger.kernel.org, linux-pm@vger.kernel.org,
        keyrings@vger.kernel.org, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>, rjw@rjwysocki.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 4, 2021 at 8:19 PM Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 05, 2021 at 06:18:15AM +0300, Jarkko Sakkinen wrote:
> > On Tue, May 04, 2021 at 02:56:35PM -0700, Evan Green wrote:
> > > Does anyone know if this series is abandoned, or is Matthew planning
> > > to do another spin? Email to matthewgarrett@google.com bounces.
> > >
> > > -Evan
> >
> > Good question.
> >
> > It could be that because James' patches did not end up to 5.12, but 5.13
> > instead, Matthew has just put this into hold for a while.

Ah, thanks for the context. Which patches are those?

> >
> > I mean the review comments I gave, were relatively cosmetic.
> >
> > If I was the author, that's at least I might have done...
>
> Few months can pass surprisingly fast if you have all sorts of stuff going
> on :-)

Hehe or an entire year can blur by if you're not careful.

>
> /Jarkko
