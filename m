Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EA773ABC6
	for <lists+keyrings@lfdr.de>; Thu, 22 Jun 2023 23:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjFVVq2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Jun 2023 17:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjFVVq1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 22 Jun 2023 17:46:27 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A781FEF
        for <keyrings@vger.kernel.org>; Thu, 22 Jun 2023 14:46:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-3fa0253b9e7so284555e9.1
        for <keyrings@vger.kernel.org>; Thu, 22 Jun 2023 14:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687470385; x=1690062385;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CvZVAaGyJmecUZBTpejMmVlm5h9pZX7crIszrkFIDi8=;
        b=XY0La2o3Lpjb06Lqs21X7rO8uhkpay1UUIyyqT4Wk8+PqMYJZhb4Rx+gIdriLR0RBz
         i7EG2vvUm81p0+EHoh7Z2uz4xzr0H5Z7yPesxJ2cL78VZOl9xGkChqfLuAg7woXW5JJo
         /DXLc+YSCkvp0f4FTZB5HzZWvK7vPRw7kP5wC0+RvSQbgZpGoEjTzDewsWI0xAZMval4
         MxHqPMAptZpZbimzRy/nbtlEMHnq97gwFllyoqEwHbENbXa0vZIB+eHKcNWHfHnt4r9W
         eid3dRUGnL2g+aKB0TIW6ques9RYNitXO6R689rUA7SUOFzPL7U1xHHOANg5f1nqkahD
         BwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470385; x=1690062385;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvZVAaGyJmecUZBTpejMmVlm5h9pZX7crIszrkFIDi8=;
        b=FwAY80NI8Qseww6JBEvNJTMglLVLZRraBwAz/YWXLy4Uw/Cm4/bVb2mKlOhhZ4Qx0p
         BjDCTmD6ZGs2c0Ez0fSKv5yhYs+qT2yQoRj49K4mZvh0YsSDW+JapWSiWi2fJC+sLmJq
         /U0loXkhAn9CMFbhWkTJ2y+ac6YkFMs3FgoNPMrs5Es/f2Q5+IlM/oDDT9kK8Eyfmuhl
         cOGWQX2vjrOp6nBIO9XH8hkHSdPkJHOUDK19UeNrIcfXHufBT8Yup+h7y6Wa3kie0zaI
         k3uEvrl23U7wMcr+pH1LQEzST/r3UgJQhEkov8I9KiaeyxBCObpykMqSQMemm2dCvi6R
         BVeg==
X-Gm-Message-State: AC+VfDwLpCIxo6ktlC6ayB6p+f4p2fMicSOUM+13yY1foDwI/OWIUYaW
        EPwls9NyNeTbPEgsLm+URCUEx07H5YxzN4SqcYM=
X-Google-Smtp-Source: ACHHUZ665nGdt2P3B/tk8QkCqVi3Czf1Fx4yNsFmEmZTD33ucBl5ML/OM1KauQyRE8rHiBCNHyPWzQQg44/YApgyTn8=
X-Received: by 2002:a1c:cc07:0:b0:3f7:c92:57a0 with SMTP id
 h7-20020a1ccc07000000b003f70c9257a0mr17939605wmb.14.1687470384732; Thu, 22
 Jun 2023 14:46:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:704:b0:51:f0d4:ca9e with HTTP; Thu, 22 Jun 2023
 14:46:24 -0700 (PDT)
From:   Regions Bank <infounitt03@gmail.com>
Date:   Thu, 22 Jun 2023 22:46:24 +0100
Message-ID: <CAOhLnSGZqv41xyh0Xhv+CnbUece-GdjyJj3wcM+v4=M24zEJpg@mail.gmail.com>
Subject: Emergency reply me
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:344 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4997]
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
