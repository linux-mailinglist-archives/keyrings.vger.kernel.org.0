Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1BD72C2AD
	for <lists+keyrings@lfdr.de>; Mon, 12 Jun 2023 13:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjFLLPa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Jun 2023 07:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238612AbjFLLPB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Jun 2023 07:15:01 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C663279E
        for <keyrings@vger.kernel.org>; Mon, 12 Jun 2023 04:03:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso48893681fa.0
        for <keyrings@vger.kernel.org>; Mon, 12 Jun 2023 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686567804; x=1689159804;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRIP4Ngsv8tynmfnC3OS0ihNZ3wiJGaxgTxD9HU3dcE=;
        b=R99dVwvUBWc+gpN2BuQw6iJIp1UZbjtxpu1hXMrHVSGqMX0xHO3k5k9k2ZQB3g5wX4
         nZ/CfWquvWLgrjy2sIgm42Ama6xTDchC1l/FazPbBZYtyTdPbaCXXgg1Yxy74kBauIEq
         yHtHrNDYraOwW5jCSObIDbBMMACsDEDSzICDi+U56VfWGayUNlUi0DNTSYCmM7VkNQFG
         xVkJwID9T9pnqHIarpye2CNKXp1S0l+XDasxlOX9t2A3qyCKnna4GDjq36hhldOI2AA6
         qfWSuVCrkR+SkNKCaY3PT8H5Vk/NnEdaI85TgmSDhDnr1LKc5CHgbx9rUgLm3DxqPgNw
         hRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567804; x=1689159804;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRIP4Ngsv8tynmfnC3OS0ihNZ3wiJGaxgTxD9HU3dcE=;
        b=aImMXmlw53pDGsRkw330vz0yNpPbcCgmjtbqqZ0jSCAjQ/fbhSPp8uz/qvGwZAry7y
         o6xUaWhiJpIGN07cjaDdQ7u7/h8ld0GKc9sBp4Id8WHf/4XMzhCh0ifqENBmRrc1Z/aG
         XbZpMkrYU6PpD+QZKAx98dM+mBGmxdgY6xUglL57PfVNB5SKv9VKrjzpjdShzs/0RqiI
         xjnYwNG/zrWgle0v3qeq8KIaKQl2NffGyDllbSbg2l3U36i8+glNnIz62kgQn+2b9mHA
         ouMLqeMJJNFDzQUk6cs8OqaZqIY7Jplmj2ZJ1aNzEiyPLigRMEkPuKKAJWrfe3HAlNsq
         ok/Q==
X-Gm-Message-State: AC+VfDxyaNvQeQesWJLn7XmIm0Fb8rBmLevEGNxzSlAQYDQXF9y8OXMZ
        dA06bKoRn9vNXFsSstNdGan5PgogHW69MSaZlk8=
X-Google-Smtp-Source: ACHHUZ7UNLPjI/tOwgMAvbzPQbhegv9ZbfqHVExkMxVrSL7dJ96pt3hcZU2hWpxiKriTpHLqSBCV0EonwwcsDIZAog0=
X-Received: by 2002:a2e:9012:0:b0:2a7:8150:82c1 with SMTP id
 h18-20020a2e9012000000b002a7815082c1mr2532083ljg.38.1686567804047; Mon, 12
 Jun 2023 04:03:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6022:51a8:b0:3e:1aa:1ee with HTTP; Mon, 12 Jun 2023
 04:03:22 -0700 (PDT)
Reply-To: aamiraabdellatif@gmail.com
From:   Aamira Abdellatif <malacklaire@gmail.com>
Date:   Mon, 12 Jun 2023 11:03:22 +0000
Message-ID: <CAAbeOBrffV6=ueckE3jGv0SLP_J_0k5BbepFcWLxooxxH0fSxQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
How are you?I am Aamira Abdellatif i will like to be your friend
please write me back  more details,if you are interested
