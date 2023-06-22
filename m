Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F9173ABC7
	for <lists+keyrings@lfdr.de>; Thu, 22 Jun 2023 23:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjFVVrA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Jun 2023 17:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjFVVq7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 22 Jun 2023 17:46:59 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662DD9B
        for <keyrings@vger.kernel.org>; Thu, 22 Jun 2023 14:46:58 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-3f9b258f3a2so585165e9.0
        for <keyrings@vger.kernel.org>; Thu, 22 Jun 2023 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687470417; x=1690062417;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CvZVAaGyJmecUZBTpejMmVlm5h9pZX7crIszrkFIDi8=;
        b=G/ia7AXeaDncjmVdcPYkUViLiNQTNJi5nnr3aVzsJ02ARkPMLpp3ooKr7cqUnuPztO
         3UMMBKEHuS7kLTMwUYEKkzDunt39ESqCIxcvyIUdrW/6DTmzLuEvn3xGhQEuV13bs/eD
         8h1wzdrfMhWy3pJml/AFlXyDZd4t4d9kEZEE7IJVVsUAK2IxyR9GK+OtSIrigbHaV3Sr
         yZCAHwwh4xcW8tFOdZnR0cmzLAIebMY1WAEC4YlR5qh2n3SnvQdy/kIpvZNcQQc5BVVw
         MAfIejlSmO5+ckvsoiXAtRIDLBskMXIJqfwEVzldC1dmpDIWdSU3tZjw0sKTxKNsqF8e
         uY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470417; x=1690062417;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvZVAaGyJmecUZBTpejMmVlm5h9pZX7crIszrkFIDi8=;
        b=gAJmhWnbm86Wt8ZT/TZiJ91R+ORICIgUhzyBpeZfAL6y2bclQHTM6Z9RS9jHhtyL6j
         1tfvCelnHiwf//YymBDNn9tg0CBtRfmjGd4gfVCG4Q1x5DUqyAJj5gtvANuoYMHaCIyo
         ZMr/hgRhr0KU6o411/xitJWHFH9DSTw8cZJsBbEDOWHpcCf88q5JllnjojbzP0fAY6QM
         +eMchsrVbz9MlUmeFHSI8kOP1yE4f8G2Hf8+EOEAui7UfQVXFGodUxj35dHY3IuPR0p0
         q+sU+qyjqmKkA2bHgXOTeGVA+4me30XqCd69xkWhebRl/Ae7LHtFp1W7g0PuVjcp9Lcx
         99/Q==
X-Gm-Message-State: AC+VfDzcNGtAgRswWnDU5JEpR19ZCaSSepli9+g2dTiqEk5/Q9QNgfU6
        GuLDVxxWPCaKh3W4NTWwTBd/Uf9ABNGfEnnaB9A=
X-Google-Smtp-Source: ACHHUZ4ZZ3ACZ/6ZD9gjBwSY6GdTh1Q+IrSI3XD3cTpDf16E/dK+0Bia2rAmpyMmLXpg556Gsz4pWchXnlj3eIfHRpg=
X-Received: by 2002:a05:600c:2290:b0:3f9:c9b7:1911 with SMTP id
 16-20020a05600c229000b003f9c9b71911mr3720189wmf.32.1687470416647; Thu, 22 Jun
 2023 14:46:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:704:b0:51:f0d4:ca9e with HTTP; Thu, 22 Jun 2023
 14:46:56 -0700 (PDT)
From:   Regions Bank <infounitt03@gmail.com>
Date:   Thu, 22 Jun 2023 22:46:56 +0100
Message-ID: <CAOhLnSH5uizjg-mYf3ZfywTQkoS6-FuXa-tBqF6Ms0-Wgrw2_Q@mail.gmail.com>
Subject: Kindly attend to this
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:343 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [infounitt03[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [infounitt03[at]gmail.com]
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Dear Sir/Ma,

We understand that you are very much aware that you have delayed the
process of this fund transfer. Be that as it may, you also should
embrace whatever comes out of this process, because you have exceeded
the time limit. We expect you to take prompt action to resolve this
within the next week.

Best Regards,

Mrs. Kate Daneila
Head of Strategic Planning
Regions Bank
Address: 1900 Fifth Avenue North
Birmingham, Alabama 35203
