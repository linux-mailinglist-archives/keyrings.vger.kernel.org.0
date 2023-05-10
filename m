Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A165C6FDFB8
	for <lists+keyrings@lfdr.de>; Wed, 10 May 2023 16:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbjEJONx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 May 2023 10:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236978AbjEJONw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 May 2023 10:13:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B1D1737
        for <keyrings@vger.kernel.org>; Wed, 10 May 2023 07:13:51 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ad819ab8a9so49159781fa.0
        for <keyrings@vger.kernel.org>; Wed, 10 May 2023 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683728030; x=1686320030;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=hETyBJ0F979Dl6jRjXX16MCibWBU2x1BuGYpzOZVrU1MMnuvWShRwOnH7SW/hob64C
         PIFUhVq41UPXfshjcxzyHGnwAx+QJXldxkvd6FXgSD0D7nS2uQ0t1u0k8IEmqAJjvH+A
         /oSNZnNukiVxjo55O8Ch+3ndS5FJ5swRiIHIiygCggzS5rDqPD87PUlDoUDwZUqNSEqY
         uwlT2JU205HTPirb2mnAEAVKH0aHwh0joPAvbBoJhdgpcQzKG0JtCYWRxHfhtrPCCZFr
         gUhaxI9PZZ3L9ZQpUlrUJFTwUqhY2UgUQ6vhQoCP73ovS/y7dmJ0thPesxvbj9WAuF5E
         Cggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728030; x=1686320030;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=S+uuLU3rXDWb+OJ5BPGv6TwAkbuP+1lDMDhzDi5DnZxrFcc7DOrnouZ8aRHLVTR1+F
         Q1COqM8qmruI7vvS+uFkiYvKPZ315Qe+2YSe0AV1OzztTXZOkOaexl5iuW+O0yD/mT/7
         ZDyy5hrM2rwGcIJrBy2MqfSz+fAMhly13JVZTGF3DBpK3o+OpONgkScDpYF8f/AdX+ED
         uLU0yYdBaGyt8TQ/zM+FbY5jUxHurUvVw4aEA86hIziAXkEX2U2U+evy6orGVHU1XqQ2
         vxZ7ACli8HSQMh23v2Tq7VkBRc+C5dlBzwE30WhAdx971eVstekIcUN3BzZhOI6n0m1t
         JUsw==
X-Gm-Message-State: AC+VfDy5oNqNCK5NV23r8dyJU5jDOh+IP5E673RIkhXx0PAfZXq1gaGS
        iPtLuebbNqicE6CL8QJzoKnhNQXdpqnyBjJKPDs=
X-Google-Smtp-Source: ACHHUZ42utbqUOCxFw5AVrkvXcjrg9Y52ug71ZOjfrEBHMTg2jzuRSXBasZIqO26e9ARK5L1P0x8Ej6/Vvsn4qZQogg=
X-Received: by 2002:a2e:a167:0:b0:2ad:b9e0:cdd with SMTP id
 u7-20020a2ea167000000b002adb9e00cddmr571250ljl.41.1683728029492; Wed, 10 May
 2023 07:13:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98cf:0:b0:2ac:a011:b92d with HTTP; Wed, 10 May 2023
 07:13:49 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <info.ninacoulibaly11@gmail.com>
Date:   Wed, 10 May 2023 07:13:49 -0700
Message-ID: <CAKjR=UR3Mwrcu8Gw9rQxng7R3bGw4ux-NEqy-XzEpmLT2XPtnQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
