Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654C35398ED
	for <lists+keyrings@lfdr.de>; Tue, 31 May 2022 23:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348085AbiEaVmh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 May 2022 17:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236826AbiEaVmg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 May 2022 17:42:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB412632
        for <keyrings@vger.kernel.org>; Tue, 31 May 2022 14:42:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cx11so145868pjb.1
        for <keyrings@vger.kernel.org>; Tue, 31 May 2022 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=kdTSJmnbBK4N/virhew8A7fzQDKu0iWJnLEnGHSX4Dw=;
        b=W9LG+IrPePRSKsl4XJfcZJb8rbNJscurgNdEuj2rHeFpqPwcJJeDpRPEj43mgl6u5C
         aPpbLi0m6nT4qgWb/jk4eGQtZ/7ikLjJlugMPbIgCN1Fde1JFNVTNBXeZ1Y6/HZySfRD
         K2uN2jdjpJoXS7HQtRbA2LA/7SXH3KSgEaNWPF4EUeJhyNzHy1oRa8lgtcUeCuy0bMNS
         QfwmgExURaT2ARHcxBAoAI5eVgMbKsBT5K/Cjfu7v0VH4vH0m8uY4ZLeFO8fOz2b/4+Z
         uPeEuFtrKRUadXRAi6/r+Oq2K3DS1Skt/vCS4QBh2DsK0I/CcOruSr+boBwbBOwklrxf
         8Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=kdTSJmnbBK4N/virhew8A7fzQDKu0iWJnLEnGHSX4Dw=;
        b=caduOePyQbNfnj2vZIhxd2/gvBGWDmt/KWcpCf6gIMmysdupgq5IOjn4WcC8U1ne49
         eSZnBIXwrI4bMzjiL1K19dRmt7q56M94ofrdUt0oKpu4E0WyCyIC936R3gebHf05UOVB
         ++jV2RnyZfS8bRdKn0CA52ohr0B8QSkUdC+S+AGWzhP5BQ1jSELABg+zDyBqIX2sdXTP
         R4ZpZC/O0ReUyUQk25Uz6Ai7zH1E82s6oSd/q/sQ8oiJAROA1Kl9HyA/Yv33i32XobB8
         QrlUs5ohVpiJfgUyC+ry0OjggTD2/ipvYZ2P3xRVKL7K8D48NZTv6zCB5JeZjAf9QaF5
         xvUA==
X-Gm-Message-State: AOAM532V+H7/7PSrVD2911BYQE0FDB3x5nHacw+7Zdo4H/36L5yimSTl
        jSkuKzLTWai3+MDdUg9v/vf5PWJhRM/CBu6/b98=
X-Google-Smtp-Source: ABdhPJxebVXW16yjBDQDP1FSC37uauLl8hY+jyG6mrQxwZ7J7opdaDWo+Pwe0U/TWZYENfFadP7yFJwVBG0WqAdUDeU=
X-Received: by 2002:a17:90a:9505:b0:1df:2162:2bb5 with SMTP id
 t5-20020a17090a950500b001df21622bb5mr30721887pjo.73.1654033355504; Tue, 31
 May 2022 14:42:35 -0700 (PDT)
MIME-Version: 1.0
Sender: msjulietkipkalyakone@gmail.com
Received: by 2002:a05:6a10:af88:b0:299:25c0:e424 with HTTP; Tue, 31 May 2022
 14:42:34 -0700 (PDT)
From:   Lisa Williams <lw4666555@gmail.com>
Date:   Tue, 31 May 2022 22:42:34 +0100
X-Google-Sender-Auth: dGHoiU-A2d-8cJN8dTTH7K3O_8Q
Message-ID: <CALXZWUrfo5BqaAJqpdixNiZq7_=1dHNUJFH=opUWMqLjgTKdzQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
Hi Dear

My name is Lisa Williams, I am from United States of America, Its my
pleasure to contact you for new and special friendship, I will be glad to
see your reply for us to know each other better

Yours
Lisa
