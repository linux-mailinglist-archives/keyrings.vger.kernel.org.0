Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FCB74D8D0
	for <lists+keyrings@lfdr.de>; Mon, 10 Jul 2023 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjGJOSs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 10 Jul 2023 10:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjGJOSr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 10 Jul 2023 10:18:47 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899C2183
        for <keyrings@vger.kernel.org>; Mon, 10 Jul 2023 07:18:44 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-57722942374so57681647b3.1
        for <keyrings@vger.kernel.org>; Mon, 10 Jul 2023 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688998723; x=1691590723;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=q2ItwvE3B68UPz1tfr4+uTao47eeNBiSoBrzDRGxCgps5w77eumJoGzjJG5rB12kPa
         B4vyuyBuGP8Z2riXoA0OV3C801C/0oBOr/3y89Fij6aqdCNFiWgwvZBxtVTD2EgdR2gO
         MzEyG/RdEyO7uICVCSlCQ4JpzYj6MGQQ/7OSATcVABZLHSDlpvfSHTLNCo9qbR5uM7o6
         UC6sFwR4UBo6u04TePcqUpW5ATdFMyXWYg74uuE/o/PGEg5YR6g4hRf8+CTg97UoO/Fk
         Px7etwBGFPptnnX08S75IK0OwcFaKk07A3DYFyItP3vVWAW5fne5IJ+rBdlEONeGXLwV
         A2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688998723; x=1691590723;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvhbKHPRKfMEJS6inHuIrpCpyOh87s7quIhd+QJ98f4=;
        b=aVigJjLpb0coFxn6qi9flKSgoekWGMBcPuw20k/8TutvG2t1oTTQ4LxKlCH+/YQvKr
         UPjJfsPaGfxS6nDNInzJEVTUWpcpvLHL+nC85J3c5GcWVG9+uYq6/luBCQwpN8GhFD+f
         4Pp9I5Gaj/h1/EOZwlXrJzff3p5dTj4o5g5ACm38p6z/Mx4U8jXZvInSkCki/5KWZIgb
         GcTwsaEwVJzGDtj/gHwoyZdE0qAkh9KGk+3xLjKYHDF94ZlxGO1yDr6F64TDM5aH1YjP
         kfxDVBlvh/l7cuYHtFPuBjSjWRKftoWIOwVq1LyT/QivF5H5Tw9friMo5pHcBHLDDLb6
         BPYw==
X-Gm-Message-State: ABy/qLZV4lJLy996ZNi/XqWd7qfgMyJrN4LBCrFdH6jUhZBrv/XJn+iu
        Tncm/UdTQCxWNMHUkWZeq4k50dVodKCr5P5GPc8=
X-Google-Smtp-Source: APBJJlEGuTx2Y9CYBuEyMZMPqTOQQcUHkTy6XFVIEvg2p0jpPTf5F/y7sxu9fb/TrjZoDaYDFy65OptfQ5XYuWWgTSY=
X-Received: by 2002:a81:6c8a:0:b0:565:c1a7:d197 with SMTP id
 h132-20020a816c8a000000b00565c1a7d197mr11901769ywc.39.1688998723671; Mon, 10
 Jul 2023 07:18:43 -0700 (PDT)
MIME-Version: 1.0
Reply-To: salkavar2@gmail.com
Sender: mrseedwards7@gmail.com
Received: by 2002:a05:7108:2b54:b0:31f:8363:fa4a with HTTP; Mon, 10 Jul 2023
 07:18:40 -0700 (PDT)
From:   "Mr. Sal Kavar" <salkavar2@gmail.com>
Date:   Mon, 10 Jul 2023 07:18:40 -0700
X-Google-Sender-Auth: iea9YULxCb_S09ViU8DMYBrpCD8
Message-ID: <CA+-WbAVeL-dfESjEzkQN8ZVbEXaUvJUA+QBQ-4Aims=Qnk1aSg@mail.gmail.com>
Subject: Yours Faithful,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:1143 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrseedwards7[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [salkavar2[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [salkavar2[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.6 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.7 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I assume you and your family are in good health.

Overdue and unclaimed sum of $15.5m, (Fifteen Million Five Hundred
Thousand Dollars Only) when the account holder suddenly passed on, he
left no beneficiary who would be entitled to the receipt of this fund.
For this reason, I have found it expedient to transfer this fund to a
trustworthy individual with capacity to act as foreign business
partner.

You will take 45% 10% will be shared to Charity in both countries and
45% will be for me.

Yours Faithful,
Mr.Sal Kavar.
