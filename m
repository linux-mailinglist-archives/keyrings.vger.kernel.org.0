Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0190E3EF9BA
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 06:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbhHREyY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 00:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237752AbhHREyW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 00:54:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93420C061764
        for <keyrings@vger.kernel.org>; Tue, 17 Aug 2021 21:53:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g13so1836285lfj.12
        for <keyrings@vger.kernel.org>; Tue, 17 Aug 2021 21:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6K3+N3LYrTw7honvxshLdEmV5XuzaI7RIQ6phcsSuqs=;
        b=PMOjOlGYA8htOgmQ85BkiqbjuX25YAO64oKb0lJyjDOWObdytQ/NuwquW22Q6SsImv
         ONkEw7ASyg72uJzDI00etWlR005j4RuaerlWqgYid/lBgJhfWqroVyTGyfm+10YWt1RE
         IhOCuqLYRFKOWzOs+njufqJUTl6tDAEAxqofqPejffXiZ4kjFF/tsFlgzoloc5SeeNAv
         0EDtsmjT3KKbL2ryi8x4kTrCHl2l/RoOKeCnfj3yHwIxajrdmN+a3cmr/MKC+Q0PPqby
         E7/AheMP1fCmnoSgjNMidl0ZorUNVAJktffOd7pmG++IaUrcvu3IW2pparCgKxal7wWw
         +MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6K3+N3LYrTw7honvxshLdEmV5XuzaI7RIQ6phcsSuqs=;
        b=gwdGPRZGg3T6u51UKnFyXV9jk3MUYfSHWA+s2R3L2nh0ct6BFvyMfP9B40xnUPcIT3
         Yfoyplxi6Q3VjiesbEzy4BxK6UXMp5pR2DgdN2ECGFR7Jqr03LHX9DxH1KaQXMSiZD23
         tlOWWjHNJSXdF/qG8yFtOsI4WXiDk3+t6paVv2SK3ErHauOp9n7T891B4ZyQzpIA+BJI
         aNXaJCeqceXl8bT0G19nwqrC0EG2+pIb7b/Vx8iqCdQMZESL4a46JC8JdLsl4sw1q05A
         P6olGyXQ3bofFcM+c3y7lurgtY+ezqkrqBtd2OAMlpTebD8Sob2NvJs2lX+eCBuSqdzC
         euZQ==
X-Gm-Message-State: AOAM5314OD7jyAy9cMUWnHYTyyBRdVgY+ohiSv9CGwppt+waQ5T5JHAH
        L7H2xfI/9HvnOy6ybYjbjAIqRw/jCTCNCvkQHdWidQ==
X-Google-Smtp-Source: ABdhPJzzVy3i/YL271hD0LPO7hSavfFPRoKZqMe7jV9Gv3YssPhhOr2s5XndnaUsuIYHNkYUWODkRVaV8/1DYvrjlH4=
X-Received: by 2002:a05:6512:c24:: with SMTP id z36mr5140198lfu.194.1629262426962;
 Tue, 17 Aug 2021 21:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210806150928.27857-1-a.fatoum@pengutronix.de>
 <20210809094408.4iqwsx77u64usfx6@kernel.org> <YRGVcaquAJiuc8bp@gmail.com>
 <20210810180636.vqwaeftv7alsodgn@kernel.org> <YRLJmaafp941uOdA@gmail.com>
 <20210810212140.sdq5dq2wy5uaj7h7@kernel.org> <YRLvPJehAeMiYb2Z@gmail.com>
 <20210811001743.ofzkwdwa6rcjsf4d@kernel.org> <d4f5c2593380c82ceebae2c8782a1c440b35f165.camel@linux.ibm.com>
 <YRQF09f8st95yrFZ@gmail.com> <0e69a0aa394dd20347b06ae4e700aa17d52583ef.camel@linux.ibm.com>
 <a6eb6f38-b9f4-c59c-4181-2049f181e67d@pengutronix.de> <285cb263d9c1c16f3918c98dd36074ef16568e6d.camel@linux.ibm.com>
 <b77836af-42a1-5aca-9363-d050352bd8aa@pengutronix.de> <f4264f0a83c1b080ad2a22d63ecf1fcca87dfebb.camel@linux.ibm.com>
In-Reply-To: <f4264f0a83c1b080ad2a22d63ecf1fcca87dfebb.camel@linux.ibm.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 18 Aug 2021 10:23:35 +0530
Message-ID: <CAFA6WYOgt9JYSSHL056ZBzCY93xHB8H=9BoN8YbqeFtevfDOpg@mail.gmail.com>
Subject: Re: [PATCH v2] fscrypt: support trusted keys
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Eric Biggers <ebiggers@kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        kernel <kernel@pengutronix.de>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Bottomley <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        linux-fscrypt@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 17 Aug 2021 at 19:54, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Tue, 2021-08-17 at 16:13 +0200, Ahmad Fatoum wrote:
> > On 17.08.21 15:55, Mimi Zohar wrote:
> > > I have no opinion as to whether this is/isn't a valid usecase.
> >
> > So you'd be fine with merging trusted key support as is and leave encrypted
> > key support to someone who has a valid use case and wants to argue
> > in its favor?
>
> That decision as to whether it makes sense to support trusted keys
> directly, based on the new trust sources, is a decision left up to the
> maintainer(s) of the new usecase and the new trust sources maintainer
> Jarkko.
>

I would be in favor of supporting the use of trusted keys directly
when it comes to TEE as a trust source.

-Sumit

> thanks,
>
> Mimi
>
