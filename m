Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F065A9221
	for <lists+keyrings@lfdr.de>; Thu,  1 Sep 2022 10:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbiIAIeC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 1 Sep 2022 04:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbiIAIeA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 1 Sep 2022 04:34:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26360128568
        for <keyrings@vger.kernel.org>; Thu,  1 Sep 2022 01:34:00 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 76so16842822pfy.3
        for <keyrings@vger.kernel.org>; Thu, 01 Sep 2022 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=GEkmI4ZvKZl82sHggCnjGq/UdNYxYpp0H0F3YlvJt5g0tq5AsAmX8KgOfa3uELbKGS
         nKBqInCsgzIQA7NMVpChoGef27EUPtdZViwr34ncBj9aR44dU+RLkJg0i+IQrZCeTPVu
         xZGj+oWa57jM94m9UoLNa7hoUu+56+dB1cVGnwV4j9pSiELqMAiiAd336QBf0hBGRW7J
         YrcYgqPEdb7wQj4PvrdmlJIsTDNx1HlhSsoDcC1ogJBVHB8ZYQ5xWqVFWqzgtthC9MaO
         nO6PhWVRJFW4ZVqAGk6V0WlxU/tWtHXcKGSBm+PDGpUd0LFMot7SFWjdtYhaCDLZQEvG
         3R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=ZDX74eH22tzltkplDpInvPK9fXcTgzJFFjfsr7L9HnbHkQjL4+7Mnb0GWG4/kbvzjF
         3UJ3d00MjG+anhLkvBMyOj53bXFfTzXuD82HX6WgB9t7qv8/GNtq1FHiuO8IGQ2huHnv
         KQOhQOTgi1+oDfre8ETxaRC1FL8LkvnNX4VTge1svUOJCyCYFlQTSqoXbpUHwSsrKVUb
         iLR20SV/LaPLc64LNO2XLxhENOQEPFJFIR2slIalXBSCju6niFXUOoUjA8bH1jNP/l+A
         nd4aUVb5EGzLanBMK6mb851WzSeG+7AXZXyr7TKhW1c8vMIHh4fZZoOk6tn1Q4zFhOfW
         QK5w==
X-Gm-Message-State: ACgBeo3d5cLLkfHcCTit4OhXtu1uWiDFW+SkjlG+mJhV5mzyQB1rnA/G
        aWUTbSRDzhtYd45znA744Vw9TO9GAUTm1tvnNXUZqFBh
X-Google-Smtp-Source: AA6agR5mSEDsKJDtA8brPfXhHgEbYwryKybf7X5y7yZtIQuKsH+YJvMVpuVqrDrHVnvPIRPpWzKbeu85LPdyswypbnc=
X-Received: by 2002:a05:6a00:cc5:b0:537:1c47:8b0 with SMTP id
 b5-20020a056a000cc500b005371c4708b0mr29880207pfv.25.1662021239609; Thu, 01
 Sep 2022 01:33:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:168f:b0:2d7:8c1f:4922 with HTTP; Thu, 1 Sep 2022
 01:33:59 -0700 (PDT)
Reply-To: maryalbert00045@gmail.com
From:   Mary Albert <tinaeevan@gmail.com>
Date:   Thu, 1 Sep 2022 09:33:59 +0100
Message-ID: <CADEuEs9sT2cy4brnHxahg55Y57LEi02BXGJ5WTBQeQZ8qHKBgA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:444 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tinaeevan[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maryalbert00045[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
Hello,
how are you?
