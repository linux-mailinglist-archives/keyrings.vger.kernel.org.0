Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E54E713378
	for <lists+keyrings@lfdr.de>; Sat, 27 May 2023 10:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjE0IsF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 27 May 2023 04:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjE0IsE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 27 May 2023 04:48:04 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0262CEA
        for <keyrings@vger.kernel.org>; Sat, 27 May 2023 01:48:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so10421605e9.1
        for <keyrings@vger.kernel.org>; Sat, 27 May 2023 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685177281; x=1687769281;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBYjhjPWDIeW/liWUe+wiuocZI9Tazf3Ctcc4Qyz83o=;
        b=gP9nVg3o/7q7THeGgiiS0QZEEdpF9YVqIIh+w8KAjq8mpeVXJRSdMPsF6sjitxQ6QQ
         GlGmNoWpxQg3MPX5g3i57mPIs7CMg1f8Sm+lHCHlKxpWSIkpLMOWeL+aHQKUrLMMUInr
         CUL97dIaK2yCL1UHgRDNhFHdkHXqbZzPzVwMWXmSLMTBZdsZqSm2NlgxkL9n6Ueru9TJ
         zKaVdWRyepifHZYlAThQVz91MTuqynttzTjVc+URSxrM7zSfoR4qqwWIiVZJgHnWoa+Y
         5gpcJkJkZ9CcZMGa8L+66bUmaAyDu90VwDRIpOmW/gcxgf+W9SuuHp4mNF2yDVMLow2x
         uCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685177281; x=1687769281;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBYjhjPWDIeW/liWUe+wiuocZI9Tazf3Ctcc4Qyz83o=;
        b=LXcS5ArFqwi6I8r4UR4njHA1G/5E5GAHKTv/hoJkfK0OuhUWs1zSdW1fuCIn5u8AI8
         vxhan8uypWK9LAohzdCF+AJXS55l80Ae8XGAWhOXCTT580Wras/n7z6gCFeoYhj0wDLS
         +CUSFHRFGlJGo/CJ9TNgY4xqsY0DPENlanw70ZFvJc3nhZkUBi0bXl4Y1YbJgCDoaC41
         cMEKu18kfbcySNs8kBNplK7pKiAKPrAs6Mbfp3jZF0wFOapkweBX2vby355Azcjhf2za
         zfmZnIjGBJj6w/cmg8hv0kw2pv0FcTw9WDX83yBfIaRXLUro121iRWdi2e2ARDZBj0mJ
         aTgw==
X-Gm-Message-State: AC+VfDyCmHm/mFVt8XB9akerqwjszvSbWmqzPKOze7t8FkPmYlYL40C/
        MhXRlBeiPSFq9veuvm0ZwPbf4vWdQi+W0FKIucw=
X-Google-Smtp-Source: ACHHUZ7Qfv15iqsQhaolmChTo3aH7gpG/24bjv+2NhQpZbw63bZA31kL1AT2+Xopqp0XCPC1Z9IkXaRCx47IxiQciyQ=
X-Received: by 2002:a05:600c:21cf:b0:3f1:bb10:c865 with SMTP id
 x15-20020a05600c21cf00b003f1bb10c865mr3657284wmj.38.1685177281230; Sat, 27
 May 2023 01:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:67cb:0:b0:30a:d9a0:8ebe with HTTP; Sat, 27 May 2023
 01:48:00 -0700 (PDT)
Reply-To: cafod@mail.com
From:   "Chine McDonald." <johnmorgan2053@gmail.com>
Date:   Sat, 27 May 2023 08:48:00 +0000
Message-ID: <CAAfNtrzsT7YsknGLC7bCB7h0ca4gv7bAE+77BtpKOUiuj1YXGQ@mail.gmail.com>
Subject: CAFOD
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

CAFOD Christian Aid London
35 Lower Marsh
Waterloo
London
SE1 7RL
United Kingdom


The Christian Aid London is on annual forum program of selecting
individuals, groups and organizations in coordinating to reach the aim
of assisting the Less Provided, Widows, HIV Patients and Orphanages.

We have this ban to select irrespective of faith, as we work through
people of all faith and none. You are been chosen as one of our
coordinator in your area to reach the aforementioned under privileged
ones.

We have mapped out sum fund for this program which is to be giving to
you for the assistance of the people around you. We trust God that you
will work with us accordingly. Reply for your interest.

Thanks and God bless you.

Ms. Chine McDonald.
