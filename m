Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E399A65485D
	for <lists+keyrings@lfdr.de>; Thu, 22 Dec 2022 23:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiLVW2D (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Dec 2022 17:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiLVW2C (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 22 Dec 2022 17:28:02 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D2413DC3
        for <keyrings@vger.kernel.org>; Thu, 22 Dec 2022 14:28:01 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id o5so3040249wrm.1
        for <keyrings@vger.kernel.org>; Thu, 22 Dec 2022 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q1rvneH2ay3MzDgRuf8vVMN8EmWy6DV7KmPo4nvLNXE=;
        b=PArmJrrXAzc7JddnmonMhDpK+MLH3BP+WQfpEaqsU6RAzPZsgfAAYh2QFI01zXxfoZ
         uo6s+5sYDvcoXOvMlXIKBl5R0Ikx76CRtXzlCpO2xopKaNqVEofSAVXRYrR0Fx6Y+opb
         CEipR0M2wq9TWoekFfvtjv7FhVeh0TKzz4T9TZvaW5cmxFdE4/7fPqtFJK8gd1Q1X6dV
         ZQ4h1jKILcfWTq8Emmpdz19bYNh+nPoOgc3lFOiWUi1oXj6X2tXmeNIJoSibdoLBc49W
         /ZUmWb0ri3Fx36b48sgUxR6GHNBj1qWUBI70EoJBIXry22Hd2HK4GZ32xBUMwB3363Dq
         7awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1rvneH2ay3MzDgRuf8vVMN8EmWy6DV7KmPo4nvLNXE=;
        b=L2VLpawOU4EbIrm5LJ1ScKjuvDq20PW6GLB4/Oc/ID7BXEvoAYtz8RY8QF4D6hKNki
         AOE6cqJtMiDbE2+zo9RVfTh/8DXnhLjwUi4hZAuX6njPql18Ufy0GzrRMuMCWhvt1i0F
         xJ6i7dwE3WBW7KWZKnDjybk3MT/UDdbWoZvJPwGlT9OSU7kZXEABRaliYGpxPA1s2MrN
         GWmogTKYWaAo5A+FNulnxrP6WL1TSJLUO+lfT9TXYwbgS+ixRSWDJG+p79NHCoklTYmK
         GuEbSFXvElDZYu+b/3IPT7BAjeMPUyXPM9Y8IvPGlloZFgIEckILCTv3tud+8nHhCaLP
         yADA==
X-Gm-Message-State: AFqh2ko/rWHN8enrPtgMMWCTJsJPRfo9JVEIi7b22EgvxldxqeHtokmR
        t3/R+10ps+qw/g62iu/gxGrYLKdDPq8yli95Gws=
X-Google-Smtp-Source: AMrXdXsNBDKcjig84FPA11rQwba5mDDsqS9R6Hyu8orK8tAieGag9XN57U0f0E4E9pkyU9bBjJGgtehAC8l2vactUHE=
X-Received: by 2002:a5d:590e:0:b0:242:1c5f:ee55 with SMTP id
 v14-20020a5d590e000000b002421c5fee55mr291435wrd.712.1671748080026; Thu, 22
 Dec 2022 14:28:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6000:15c4:b0:242:3ae8:f526 with HTTP; Thu, 22 Dec 2022
 14:27:59 -0800 (PST)
From:   CITI BANK <bank90083@gmail.com>
Date:   Thu, 22 Dec 2022 14:27:59 -0800
Message-ID: <CAP4wrVbbrU3uUOJO_EB+_2jQ8pkZSHpVXjU5M0hV+AgFicZSAg@mail.gmail.com>
Subject: PAYMENT NOTIFICATION
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_SCAM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_MONEY,UPPERCASE_75_100,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:435 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bank90083[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bank90083[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  2.0 HK_SCAM No description available.
        *  2.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Citibank, 1107 Broadway Branch
Full Service Brick and Mortar Office
1107 Broadway
New York, NY 10010

SIR

THIS IS THE MANAGER CITIBANK INTERNATIONAL.WE ARE IN CHARGE AND
ASSIGN PAYMENT BANK FOR CONTRACTORS PAYMENT.I HEREBY INFORM YOU ON THE
NEW  DEVELOPMENT AND THE FILE BROUGHT BEFORE MY TABLE FOR REMMITANCE.

THERE IS ONE MR RANDALL BOCIAN FROM UNITED STATE OF AMERICA WITH THE
FOLLOWING BANKING INFORMATION BELOW WHO CLAIM TO BE YOUR NEXT OF
KIN,WHOM  INFORMED US THAT YOU DIED OF A THROAT CANCER AND HE IS TO
RECEIVE YOUR  CONTRACT SUM.

HUNTINGTON NATIONAL BANK
Bank Add:17 South High Street Columbus, OH 43216
RANDALL BOCIAN
ABA/RTN: 044000024
Account No.: 02771751152
SWIFT: HUNTUS33

PLEASE I WANT YOU TO URGENTLY REPLY THIS MAIL IF IT IS NOT TRUE OR
ONCE WE DID NOT HEAR FROM YOU WE WILL GO AHEAD AND MAKE THIS PAYMENT.


Robert Baker

Account Officer
