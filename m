Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E810B790DBF
	for <lists+keyrings@lfdr.de>; Sun,  3 Sep 2023 21:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbjICTcz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 3 Sep 2023 15:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239445AbjICTcy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 3 Sep 2023 15:32:54 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11F6A7
        for <keyrings@vger.kernel.org>; Sun,  3 Sep 2023 12:32:51 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31dca134c83so657350f8f.3
        for <keyrings@vger.kernel.org>; Sun, 03 Sep 2023 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693769570; x=1694374370; darn=vger.kernel.org;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0CQhxFPixHFd1Efr5gk68vD9XypjiOct/BzdYlXpMQ=;
        b=r4/w8yQ3eOzBzEqBst5iEaDh5uDLYpZLipAXV86uMbpfFjQeOBohcHlq+6PffU4SYK
         978QOFCiNxH3oZXwAV9LXN9fhC6HgzmIjSo07MQYiOSyZpx4M+A7ACLrKSoy4mpUhC7E
         QEun6J68DpVMfyoY+IIqrj0as/GZ4SVfn9q66u5x+346vtpEiLJS1cu3ZZ9CWSr+KkvS
         TT2/feDOTN/rFQ/0TWJxN59Q4wKRQrX1m6ng5I3zVA9qjS6gBEl112sJsa04fNQUORqU
         Jeu0stnpv0h/FVIn9JA/a6HfZ+sOcM+5U4Tw145zqaVOY/YWrObH4Ux5oJc1OzKCA0hL
         z4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693769570; x=1694374370;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0CQhxFPixHFd1Efr5gk68vD9XypjiOct/BzdYlXpMQ=;
        b=lNvTa7dDAMnqfJv9ilwm7r1fFuTIkBnvscpkHvNskNyuzEnhaknd4F2BP3y/YJI+sh
         UoBhK5o07cLyouptzbDcrMoBm2cJlSKNQBSaA4xZx5AKp1opiPfBQTUGjtZ3CqtlM0BD
         2E9xOKFr0BcraroQj5YzHG/5DM5yAjcUAiG4UVnjGySA/76TYewD4lZ37UGtweHlmUHM
         FF/eBm2wDu+Q8HOf1lzBJDTaF/UnVVBIOdErdgmL2FU2iG97CroSYlHZ3UO/oNOiEQPz
         6IGLuQL3p8YCRFQjf4uWzMPxy8FkDxXQ3RDmTQIOxxT1EgrFke9+a4hw2MYYQ/+3NUcz
         HhbQ==
X-Gm-Message-State: AOJu0YxaDisGRJLSDV5ZQ72nd6Xb3CuyILtaONNOpOgK25MwFk9iL+S7
        deASTdbDaHa7b/p9I2P/uFKdoV/Gq588
X-Google-Smtp-Source: AGHT+IFYB93A7B37ln8As5ue7imZxSd9cYmLHTgW+03z67A9Z8kwlHDx0Qp/bVRvBN8a+k+0XacYVg==
X-Received: by 2002:a5d:4ac4:0:b0:319:7230:d76a with SMTP id y4-20020a5d4ac4000000b003197230d76amr6108864wrs.38.1693769570062;
        Sun, 03 Sep 2023 12:32:50 -0700 (PDT)
Received: from [10.29.137.43] ([105.113.64.43])
        by smtp.gmail.com with ESMTPSA id bp5-20020a5d5a85000000b0031f07d1edbcsm9756432wrb.77.2023.09.03.12.32.47
        for <keyrings@vger.kernel.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Sep 2023 12:32:49 -0700 (PDT)
Message-ID: <64f4df61.5d0a0220.5f389.ca9c@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: FROM LEGAL DEPARTMENT, THIS IS DEADLNE
To:     keyrings@vger.kernel.org
From:   "LEGAL  DEPT. X" <ab5175305@gmail.com>
Date:   Sun, 03 Sep 2023 12:32:45 -0700
Reply-To: info658@daum.net
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

With Due Respected Sir,
Noted  this   why is like this   people  attacks  good things and trying di=
storting image of good ones and bank. if your compensation  payment-of two =
millions dollars if is Not reality here   I will not be contacting you, you=
r funds is reality if you complete the legal needed-full things  here count=
 us your funds will be release to you by online account in next 48 hours  t=
hrough your local bank which you will do the transfer by yourself or we  he=
lp and transfer it, Respected my self again now if you are not interested t=
o complete this transaction with good mind let me know this will be cancel =
and the funds will be confiscator, we  are not forking you or beg to take y=
our compensation funds of two millions dollars that belong to you,

Ged Ward
Online Processing Officer
email   info658@daum.net

Thank
MRS.AKAMA  DAVDSON
LEGAL OFFICER
