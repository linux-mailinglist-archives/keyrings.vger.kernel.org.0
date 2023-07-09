Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FA274C137
	for <lists+keyrings@lfdr.de>; Sun,  9 Jul 2023 08:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbjGIGMI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 9 Jul 2023 02:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGIGMI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 9 Jul 2023 02:12:08 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92545FF
        for <keyrings@vger.kernel.org>; Sat,  8 Jul 2023 23:12:06 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5634d8d1db0so2611374eaf.0
        for <keyrings@vger.kernel.org>; Sat, 08 Jul 2023 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688883126; x=1691475126;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=YZqlccB5BAn+Od7tZ2z8hTwbJDlJRiu9vgyF1mFcBEEZ4NMtscFAFWB00MQ3cHiXVM
         Vv4laBVLJ5cfesGn3CQF4Y3MiCJbC2VS3z9lMe/jnZrGGOKYhlKAPWfUegOYhjRJXe8w
         9VhzPp2Mv6zEVMQ/x0sd1hQ8z1kVO93ES7u10kTQWFT3E98IjaS6x3YNzKWS9b7y4GVc
         +vqtSvKVz5xJ0tiGXVKh2MZfe3ybBc7u+lhxjoqRFSaeicx3sptIaTOebbU5ann6Ep7i
         j4Q0HIgPN8kcEm2tRCYa5g9MLKKfnbyj9XrA4+ivCJIz1OAn48RetzHwbquU0gTL1nv+
         /6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688883126; x=1691475126;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=RWkKa1W7IqFuGBTVBG0lD5FBxE+1ig/kxCmv1tFGXPaXGw2DHcBtX6t/7AGV0pN2lq
         gOI9ehdxl6j1ALrohpWOOTBXDyR3HVuqsajI0+PxIoWMH3B8IpcpyBXqWxiG/CnvQEj6
         Wg7cRZP1+L+Xgmbw7Reo7HR2I2dVafrj6cuxj0DlFWwgh36T6+UWJ6i3nknVXxi9b95r
         K006/sMbH08fNLPcQFgAP7ecGvwcWsOcPXzpfcvEsaSbM66TDGgoBAjCAZF4UeWK4jzB
         5QSzRZzrUdUsZtB/PXAp7gFsFEm4sdDADDoEjpgIk0nIa87uOUR3F4rhS9uM+ZnDzRVe
         KJ7w==
X-Gm-Message-State: ABy/qLYye98coAtnJdORjsG0MNglunQ5bQqBlskYOhamD9o4WnQYYYEi
        rgNzq7ly1RoOLXFUAbqDG2/if4vP03EWrmLdbx8=
X-Google-Smtp-Source: APBJJlE4GMQIpElKusnhsC3j2JbMeno2beSk2Z2pHuezjspje+6jsl43BdnZRBKyeXOetGei85gKJ2s6z2yA10+FGiI=
X-Received: by 2002:a4a:e83c:0:b0:55e:5c65:c6cd with SMTP id
 d28-20020a4ae83c000000b0055e5c65c6cdmr7014719ood.6.1688883125859; Sat, 08 Jul
 2023 23:12:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:18b:b0:122:db4b:7f79 with HTTP; Sat, 8 Jul 2023
 23:12:05 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info@gmail.com>
Date:   Sun, 9 Jul 2023 06:12:05 +0000
Message-ID: <CABAHEt5mrn8ccxrkeqBDF5s=3rcuoJXBOD1nnfUp+5jH_QMwBg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
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

Dear,

I am interested to invest with you in your  country with total trust
and I hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that I can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
