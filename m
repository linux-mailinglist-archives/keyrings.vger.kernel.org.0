Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C0954B05E
	for <lists+keyrings@lfdr.de>; Tue, 14 Jun 2022 14:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244071AbiFNMO4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Jun 2022 08:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357007AbiFNMOV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Jun 2022 08:14:21 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A8130F74
        for <keyrings@vger.kernel.org>; Tue, 14 Jun 2022 05:14:14 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id s20-20020a056830439400b0060c3e43b548so6420081otv.7
        for <keyrings@vger.kernel.org>; Tue, 14 Jun 2022 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lBFrwc11MgcaK75qf3EwNhKoIfwLYz4Dn7scEjO7Hwc=;
        b=UNA00ExpSe/IYk9qRpK3nhNY3MQGhIZVH9b+TBjq+LdlUjXIh78z6gPdY8GF0sQHK1
         HJ2n3gfPpUPhyyacfGQvRyEpF1QlynrQ30w+G5Aew5oVgyNdOMVYVhySdHNUBZObva2y
         PuLir0DHRxYshYjhyycNkTLQ7VsAQLmTK6m5EVJfcKtgRbmxa7D08ugJk7y5pLRJ/ze1
         6cL1+ieOt2sNltOPHDSKZebgxow79UdI2TUNij2cNTn50jsq9VR126vHNmWni88LExVM
         7xKsxa1nHQ7JrwK4VAXG7j0wCn6FqCQrLI4ANDOm8760jdm8KbeqIvWnFua/uGvpfZQ4
         nejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lBFrwc11MgcaK75qf3EwNhKoIfwLYz4Dn7scEjO7Hwc=;
        b=k466BKD351ZXdtjkJh5TMIKSEDMLW06P+/fl4cvyRZ2dHbTb8A6LXTKmIIgNTSuUuC
         m406zg9z3+AXZvJISguEyGWYnX0Ww3cUjk8ubBjdDTX/iPPZ2RXpmIed7mLdOAcpdkpu
         X0YKpeEn+t+zfBOjUq4BBAAm6vvzYcQVCcP/jxsVA5ccca/twxB7C5gt0vHtnRFF+1D3
         fhW4+fzwBAOcdNRuyco/2p8aU6nmAo4zjKgG7Li75HBQYj+5e2GF8ItJtP5ylufm3ckV
         y48LLEaLUsBm/jm9nUoO6piRelKK5741e5wv05KdxzJyfI+2hV3Oms4H5Uutf759dnyt
         AYqQ==
X-Gm-Message-State: AOAM531BFoiw7sUo4talGPy156UCqvHFFWDXj6hddv6eTX0qZhu+i6hC
        lpVekBYkus53g58uTI9s7GblOqF6p127WSNt/Wc=
X-Google-Smtp-Source: ABdhPJxH036Sb3549Y0f3hc7Zhwns93SCbnuybCuqmcROW8sIBDtc8O0vPfU6QLql+6epoXLTxfkWaoTwfvvDQjMptA=
X-Received: by 2002:a05:6830:1691:b0:60c:1eb1:6ddf with SMTP id
 k17-20020a056830169100b0060c1eb16ddfmr1906144otr.205.1655208853785; Tue, 14
 Jun 2022 05:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:c46:0:b0:42d:ab20:ed24 with HTTP; Tue, 14 Jun 2022
 05:14:13 -0700 (PDT)
From:   Daniel Affum <danielaffum05@gmail.com>
Date:   Tue, 14 Jun 2022 15:14:13 +0300
Message-ID: <CAPkju_PQmptLCUNLrFjDqn4sN-xwFQ9XOg5Cv+KN_pd6V1aXpA@mail.gmail.com>
Subject: Confirm Receipt
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello Dear,

I am Daniel Affum a retired civil servant i have a  business to
discuss with you from the Eastern part of Africa aimed at agreed
percentage upon your acceptance of my hand in business and friendship.
Kindly respond to me if you are interested to partner with me for an
update.Very important.

Yours Sincerely,
Daniel Affum.
Reply to:danielaffum005@yahoo.com
