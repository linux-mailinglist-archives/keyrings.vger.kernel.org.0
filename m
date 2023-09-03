Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5837E790DC8
	for <lists+keyrings@lfdr.de>; Sun,  3 Sep 2023 21:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbjICTkC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 3 Sep 2023 15:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjICTkC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 3 Sep 2023 15:40:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3C994
        for <keyrings@vger.kernel.org>; Sun,  3 Sep 2023 12:39:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f2f43d5a0so698896f8f.1
        for <keyrings@vger.kernel.org>; Sun, 03 Sep 2023 12:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693769997; x=1694374797; darn=vger.kernel.org;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0CQhxFPixHFd1Efr5gk68vD9XypjiOct/BzdYlXpMQ=;
        b=T11IszA4873lnkn9aDdsdQdFZ5cUG1B166RBLzcNmA13K6IAXNh/8c/Dbaa2YFxOiR
         9pct5hFe5M0zZPQHHsNVkSR27cHKNmHX9pSNIgtvTLJawoe1aU6/rL4yGRTeu9uHoRO7
         ZgwOkoZoWJpXSBLXfHnFJ1LSkHP3UzK8Nm3pLGZRbNvgy8psUotZKUM2xnZYjT+zl2Ve
         RwcddWOy5/yRBkEeZmg79YhF45uUp7qPok/RPEYnviLuKAFgFH7nMC0xPxKFA0Ma8Qrj
         CVc94xOWgKo41GJxH9yTYApIAk0S8OOEeaULzXuurgpNT0DvAiEGSmRlzEndpaNK/Nwr
         aoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693769997; x=1694374797;
        h=reply-to:date:from:to:subject:content-description
         :content-transfer-encoding:mime-version:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0CQhxFPixHFd1Efr5gk68vD9XypjiOct/BzdYlXpMQ=;
        b=Ts5zbK7YWTzgl7jDyo1I8007sWNZgtI0lxJWVjqmCxcjVaYIQg+vyFmVhM5qhq1fXP
         DVupOsiM86P/yRsTYaZhsmJAZPqckmx36a9oMtC8J4qvrHW1jnb6CGgx+47tHz4peMxU
         xSy5cfxM6aQacQAGA5IRHj0e1f0RlzKj5lnEcv/8kXQ6w821B0WyWItqYwcraRDm4rzZ
         PM7m7JSjy2ew/INmr0xmKRUEoPJueRxWCzQDv2gKb1BUbVLkUa+NbyYVTkyGYlhsAtMw
         +40mACcUO6K0r+udyE3NyiTfAcpnYF6eBV89KAuA97PV2nrcMhB3YNIqg89OaX8QKpyO
         84qA==
X-Gm-Message-State: AOJu0YyMKSIW6fgTOl9pWdzA4ojFAs0Rbs0eGaTFA93lbppRAUY73xKC
        7o5bD3kNe9uZCiUspGuUto08aRtFJ15UwA==
X-Google-Smtp-Source: AGHT+IFF1kIaTupYLuqNWBoj0mRKih8WbpXDj9BYHWLdxcijX4cofCUyR6AdH7stESGEyLzt2lmuxg==
X-Received: by 2002:adf:e485:0:b0:31a:d7fc:28f with SMTP id i5-20020adfe485000000b0031ad7fc028fmr6376330wrm.19.1693769997045;
        Sun, 03 Sep 2023 12:39:57 -0700 (PDT)
Received: from [10.29.137.43] ([105.113.64.43])
        by smtp.gmail.com with ESMTPSA id p15-20020a5d68cf000000b0031416362e23sm12587395wrw.3.2023.09.03.12.39.55
        for <keyrings@vger.kernel.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Sep 2023 12:39:56 -0700 (PDT)
Message-ID: <64f4e10c.5d0a0220.c0fd9.7ab3@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: FROM LEGAL DEPARTMENT, THIS IS DEADLNE
To:     keyrings@vger.kernel.org
From:   "LEGAL  DEPT. X" <akamadavidson@gmail.com>
Date:   Sun, 03 Sep 2023 12:39:51 -0700
Reply-To: info658@daum.net
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS autolearn=no autolearn_force=no version=3.4.6
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
