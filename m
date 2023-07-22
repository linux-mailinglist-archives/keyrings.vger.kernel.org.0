Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1083A75DDD6
	for <lists+keyrings@lfdr.de>; Sat, 22 Jul 2023 19:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjGVRcT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 22 Jul 2023 13:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjGVRcS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 22 Jul 2023 13:32:18 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316561BFC
        for <keyrings@vger.kernel.org>; Sat, 22 Jul 2023 10:32:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8ad356fe4so18902535ad.2
        for <keyrings@vger.kernel.org>; Sat, 22 Jul 2023 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690047137; x=1690651937;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=MTZfTuwR/x/8JAbLLhYJUlBZiQtXJQXKMGVFuFjZXNwTmm68tEw1ebK+T1qJBEPIUz
         ceM/kz3qJG2zNIaqkoEMDtGEo5OpWU0uNqPG/CoSjO/bfV2ayL33nvVy6x4bOrO0ISli
         acyU2M715VkEqyHpnTWNKLux+GfieKgDUvJaEqd4j3D85g7fUIaH2CT/9sk8TI+sDbqU
         TKITTy6d+/Smx6L78QN0KmKqrE4p94p3Os1Idm0CJwhqnIo7A2Al9t+6TgZfoqzbMgbv
         UGY+llS5jMPT7BD8BRqAMruJDNuJSwotFfw3GxmsepQbd6zoKOnLA/DF4z65rCgxpxe3
         kCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690047137; x=1690651937;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwQ9KTk0AvNg4YEGpLO6Mzd1tQ0NGTk2GH4qBYSzWYc=;
        b=RZ7lCaKQjr+2kAUusvNHToSfZYMxXYACag6TB+iWN5TLr0novtmyWaD5zgFNhdeF6Z
         X9JLIL26KdtSXRQ+Z4dHWvTfSwzGS9fce1YqXUnK0Pb+9IqsdIYkd3SVgxSAoDzqp3GR
         eFkmuw7/Ewf+rDpbf81ar2t+vEA+ufUZVtmoWjzDrUx60wK32x1ePF6Juk65+3zZVMbE
         WDSb0a6Dv13QIKUBMfhJRQiEoNTrjnapZK4e7x3PQdth/I6ypDmzg5t+veubs8CoS/1z
         DbCmw3SzIqnU25xWp67Tcf+Xf5TXAt3i0LhLhtNiTEM35n26FeBCD69/AOTS6DlImBjn
         9T+g==
X-Gm-Message-State: ABy/qLbgIgqaKP0wAAPYywXIkpz3laqJDf1P+Fy71kvdkV2A1AGpobu+
        jW0TKIdtHKDKEdQnGKJSWAKyF6kDK10p5RJffGc=
X-Google-Smtp-Source: APBJJlFo3oTRudH6iPejGC/vkL1JrK1YzjDvKL4cCDt9m/lN+gZLead+wSNE2U8+3+dQA/5Zs1BJMCSKFQsI3lISst8=
X-Received: by 2002:a17:902:74c2:b0:1bb:8c24:8396 with SMTP id
 f2-20020a17090274c200b001bb8c248396mr1236007plt.52.1690047137645; Sat, 22 Jul
 2023 10:32:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:556:b0:130:f967:83dc with HTTP; Sat, 22 Jul 2023
 10:32:17 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <barr.freemanukoh@gmail.com>
Date:   Sat, 22 Jul 2023 19:32:17 +0200
Message-ID: <CAB6WZPqrD+a2Kkm0ByL0O8x=GuX29YZ1gu9Hyn_kHVrGaiyDhw@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXmSwg15DXoNeZINek15XXoNeUINeQ15zXmdeaINec157XmdeT16Ig
16nXkdeo16bXldeg15kg15zXl9ec15XXpyDXkNeZ16rXmiDXkNecINeq15TXodehINec15TXqdeZ
15Eg15zXpNeo15jXmdedDQo=
