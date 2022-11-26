Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1064639569
	for <lists+keyrings@lfdr.de>; Sat, 26 Nov 2022 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKZKmV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 26 Nov 2022 05:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiKZKmU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 26 Nov 2022 05:42:20 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5261D30B
        for <keyrings@vger.kernel.org>; Sat, 26 Nov 2022 02:42:19 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id b81so3144245vkf.1
        for <keyrings@vger.kernel.org>; Sat, 26 Nov 2022 02:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wlb4SYlCkKFrC3vDbrNKcnlsbFr9aWDknzVh2AdUFE=;
        b=mil7fCwjmywD4SHD45amYqnnKyrI9UM0Jn+OJlEJ3QHiG3vuDVRjKPOTvG5WVaAWj+
         JlqFCToc98X8urOLKF7aBF110X4/k7PO55mPiG3jxE8/4Scd7YqG+wloTNN6JsJojQKP
         tkEzJO6qbZ7g1plyriHt9CJBJsHtyJH1mj+FoRG1LN8UUY0Fv8Ll2yzgz2UYwOvgKjKo
         pgUZyZpQuzBU+giXGRfoC8VQB90ieH0+Ttg66kd17w+LtZ6h5Ibr/ejUGZ/xrf8NaFJY
         nwdze2Xinewa96LMmUnWupM/yv/n7h0RhAI3unoN5TW+oVZ5RyBrSWMr4a3o7ux6zstU
         mMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wlb4SYlCkKFrC3vDbrNKcnlsbFr9aWDknzVh2AdUFE=;
        b=F97Uc4nkZGm/1SX9A8bUgSwLq1bPRf8v1irHtRHMK5Dtd8m5TXXQIiRvdQsvg4gDtq
         MrQetP6Bs5KiFZ4WhI9ZUscU5dls1DYY5J65JKlUyBjyiIrrRv+R9Wd4V6BUo19dI9Ea
         foiikB8I8cAHMskxmvwVrnLHjAPpa4ujS2cKqOfVygs6XrIkZfWKx7YsjvWHD/PZS+Dx
         Y6NtNJDmtEBu+L4NM34ytKx1BPXWIIdDxT4G+b51ldmkYpuAGpDKQ14MDB4tHK2KfLiV
         j9qGobB7z1XNYL/rV9Di64RUP2Rpyw2NP1n0nAaG+a0ZB3UaygCbmDvnIlZJv12gaY4e
         ScgQ==
X-Gm-Message-State: ANoB5pk0k1VID37x9ZQcDnBocuB2CnU1IyvWs9kpNLZiTgbJTRcK77Dv
        LV+gpfeXG6VLMbcJayPlxRidnjYdcGu207O/4qw=
X-Google-Smtp-Source: AA0mqf48e3xpSr9HtmX7H3DgQUEcDxQfrI3dz1DEiR93nlV3bn1CTx+fR1SR/je0sJTlWzCFLT0wEey/etEyur4t0wY=
X-Received: by 2002:a05:6122:ca9:b0:3ac:fba7:fc83 with SMTP id
 ba41-20020a0561220ca900b003acfba7fc83mr14996427vkb.23.1669459338633; Sat, 26
 Nov 2022 02:42:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:1e4a:0:b0:418:a433:d6f5 with HTTP; Sat, 26 Nov 2022
 02:42:17 -0800 (PST)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly211@gmail.com>
Date:   Sat, 26 Nov 2022 10:42:17 +0000
Message-ID: <CACmoC-1LL3B-X4_rr68iVAZpVZg4bN8bOGq5jikB4YgYj3c4xg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
