Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CC25034B4
	for <lists+keyrings@lfdr.de>; Sat, 16 Apr 2022 09:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiDPHrJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 16 Apr 2022 03:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiDPHrJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 16 Apr 2022 03:47:09 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E445F94E1
        for <keyrings@vger.kernel.org>; Sat, 16 Apr 2022 00:44:38 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id r11so5914339ila.1
        for <keyrings@vger.kernel.org>; Sat, 16 Apr 2022 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=VmSYSz/AyOFz+H6ta8+kyrjR0LLSBvvd0T0uo2ZcxgQLOEQU9VNcifasSOer9q9kze
         KjWptBg3gU1kFew1rj29G8a4Ber0jV23tVGg3gr1Ronyk3MFEf6WlvPIqgjJdw3wf3KO
         h8Fg3Wxjkwj5RdR9NZymRgBol/99IReQy4kd6IoMSlSausPojF3Ndf9+9ytjMmH9/+8b
         g2Yh7pZh0TsEmB0v7Y8hrOHN9dlfvitvkUaieXANve6R87H/dfGMEOfex/jzkIUdru7+
         9u4WBAa5zc13Fb1JGUKTzyATUh71qrWYP0XskA7ylopb41HL75rEeTcwnAphqnGpeshq
         t3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=LOuvyPEQy4B8ciA17CKRw7bRwPPBy2xG5W55nk7XKdniHAmjNvP9x+BpUOFJNSGlN3
         8cHmIFqxxmls53w3zRup05KSPiV9Q2pqllu/A+XJDKKmr3I3etWxZB3uwhadUEHsaG1y
         ORSrt0BkuVXCgLETjOpS+bWsvnRVqAL1Cee9DQOGRHdzKfgiEUsU8GzCStzNecgEWZ/d
         giM7n99fpV5wtHeIre7UcqyNfy6YEnOZC3Y41kJM43xV7YisNQ4dcrR5fF8gcNX/HPil
         H+bCx/D2pLdFt65f2Mi/JXBLg8h4uOy+St0K/MrZ//XASUKY30nGM34yTul0C0O9NbKE
         CC7g==
X-Gm-Message-State: AOAM530iG/XExcytqHB59GnMQenw37YcCb09/8VnZfil5VTZy/ZyriOk
        IaNSIALZafkRfLrLSvVjvSyUCNXiBYDFaNkOVqo=
X-Google-Smtp-Source: ABdhPJzpLfG8Z6lAG7RLwJd+8BuWyBvdRIlCty8IIVZhEJOO2nMyiOhzv4cgskp6gKvtocUh5FuP55gGt/t5b0H9uxA=
X-Received: by 2002:a92:508:0:b0:2cb:ebd8:a76b with SMTP id
 q8-20020a920508000000b002cbebd8a76bmr1005004ile.156.1650095077326; Sat, 16
 Apr 2022 00:44:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:1309:0:0:0:0 with HTTP; Sat, 16 Apr 2022 00:44:36
 -0700 (PDT)
Reply-To: daniel.seyba@yahoo.com
From:   Seyba Daniel <royhalton13@gmail.com>
Date:   Sat, 16 Apr 2022 09:44:36 +0200
Message-ID: <CALSxb2ycZD=O037rgHbPS=X+y-s9seT0yktanh0jBuOn82nJQw@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [royhalton13[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [royhalton13[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
