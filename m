Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AAA6211AD
	for <lists+keyrings@lfdr.de>; Tue,  8 Nov 2022 14:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbiKHNAa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 8 Nov 2022 08:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234169AbiKHNA3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 8 Nov 2022 08:00:29 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C1BCC3
        for <keyrings@vger.kernel.org>; Tue,  8 Nov 2022 05:00:28 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h14so13718150pjv.4
        for <keyrings@vger.kernel.org>; Tue, 08 Nov 2022 05:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=XETXBtTHxT8O9lEtIq5ncLGj9sYLhdrn4/5Cxvti7i/QBeK4+hmKuAyy2oXKq5qHml
         VrWVtdTp5JHme9A7PLI6lvDvmwQAgtwrUY8RtbsBUbWqzdWSzefYx0v6FDT8dtfxu5UX
         KelCmfxAwxEPkl520z7AVXWhhiBBTr7czuMlmYnmCvMG/Av3ZrfMJCVAH9s1+RjDa/+c
         /MIv3xtGjX44JTcfJpxVLZbzsY2/SlMWf3iCObQln28KlCgaxqtnEhyudiIO9Ft/9xH5
         3akibPs/URJsQkuLbIoyQ4SP/ED7A0nRtsU+d66IQXqklyG2WovfSCxuBjE+katZm/hf
         B4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=13JsEnVMh6BX2Z6s+bvD0H4HGZd2pVpBliZrTjNK3lgTNq4k6JaGDgPSkeiuShBb5U
         w7USjOBIEGPgmalPhLMgbSBCJmTTgnKzl9Zm0a1PKIYVnvpJwH0Ql64wNJXScDO8bfGn
         4bWBZuB1m5TCvVdhi1trrsKSfxLFS89+KH1WlX7oT/OHfYji41RcBYDPmeMVJPHBH68Z
         SVjGMJYxFVTNUDgwSKCHHLe165NrJ1zxPeioF2I2w0gq8eKVnI5pL8OWfqPrIrIfmK/S
         gwxMcvOG3z4OWUOMmrbrIjyvqLwO0KHj63aQpxDq8wonKcAZdHq1FKFvSYktDYiE7RLN
         rEuw==
X-Gm-Message-State: ACrzQf1al30KfEknbS/aPhwBOefgKY7W1IkPI58dh8eMcan+WaTohOfr
        /HLOjgvrLIvUzkx9Z5E8NXBsWchGI4N3+NY0tvE=
X-Google-Smtp-Source: AMsMyM4ujiEJd+P/qX7JcyRZHqMlQY/Y1LyPpVOx0sZ+QLRUwhk5iLoU+/+SPHF4jZRZYeWrsrgQKPlcFRYKM3FCVOE=
X-Received: by 2002:a17:90a:cf06:b0:212:d9ab:811b with SMTP id
 h6-20020a17090acf0600b00212d9ab811bmr58203396pju.65.1667912428115; Tue, 08
 Nov 2022 05:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7022:6296:b0:46:e088:36ba with HTTP; Tue, 8 Nov 2022
 05:00:27 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham " <kojofofone@gmail.com>
Date:   Tue, 8 Nov 2022 13:00:27 +0000
Message-ID: <CAPFeOzqLTzkAmRpecpSgoBp-S20R3ucdMXCoAxBBj0KCW3h+ag@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
