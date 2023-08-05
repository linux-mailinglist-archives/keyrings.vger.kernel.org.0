Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42DE770E25
	for <lists+keyrings@lfdr.de>; Sat,  5 Aug 2023 08:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjHEGiO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 5 Aug 2023 02:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjHEGiN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 5 Aug 2023 02:38:13 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57799FC
        for <keyrings@vger.kernel.org>; Fri,  4 Aug 2023 23:38:12 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-522c9d388d2so3419211a12.3
        for <keyrings@vger.kernel.org>; Fri, 04 Aug 2023 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691217491; x=1691822291;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=jUUF0VxzcK5rFrjriYlTBcgXU2JhOz1cB15uSuSugt2AnmgeXCelrolP+ZIlitbw66
         uMJVsChSqproIC4pbLQtVYqYQo1+q7JjldF05ceHXKoYxt1OJiEipZp2a4AL3j55pJAG
         T8BR9WzLsH0NWZfmaGHsYvBJCBkx1NkcIUhfKsobmlfMqQgvwZWgC7bniuZHL/H8uUaw
         rlaWHY6F9HCQL3nLDt1inxyQYwZDghZCnRp063PInaJ+7ilK0oYP0v0N1Urhz2bf8/3O
         OBjUCn3cy77W4YgeKmzEn+hcUDBGB/g5KtCPerrN6Qs63gfQfybUhc6Xox8KJWH2lXmC
         wYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691217491; x=1691822291;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=Me9DVKYno6OOTsueSIfilXMK2NVUqwJEXKpTCRQBc8xNSZ7GoVje063kR61QB9Y4V0
         VKPiw8ThkenEWdAMnaBEN/xydpkhFrh5k8MKn9JjAN8qcKfrvRFvCgIO7FunpUvCPtf5
         9//NYo60aZpMo0FJytk6e0paVhOp7/Ff+NZKbGtW2zldc6ENyqcH3DLrjUnRMM5zzc9S
         6YCRjrldG1HjcEab0iZ6lVle8fWuznJVhzezqw2Sf7ackDRsm6gFtShwik4B5KOwTnHr
         mzs8yxbTlZ6vdGF8KIBONNWttJsRwvl3nHP0OgUyzkb3+xAX/TnAu7x/6mq2on6x9fXa
         4QfA==
X-Gm-Message-State: AOJu0Yy+JkNTcnaje59liYpsuvoV0jPeq+6lKIqEZmjcr6YJx/11IEXw
        ce1M6PH2GxouInuoIwgJ1bcdBzoMtq+1UgNPFuQ=
X-Google-Smtp-Source: AGHT+IErx2QyibtDAj1UZpZ7CF6crMnGUbJDagC0oYAcFWx4VM1B6ZvWOGpX2eDWeMssO6sDd8ygeopDUr2DtVdRxuI=
X-Received: by 2002:aa7:ccd2:0:b0:522:45db:48e1 with SMTP id
 y18-20020aa7ccd2000000b0052245db48e1mr2862070edt.31.1691217490643; Fri, 04
 Aug 2023 23:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:6629:b0:df:940:19b1 with HTTP; Fri, 4 Aug 2023
 23:38:10 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   Bintu Felicia <bimmtu@gmail.com>
Date:   Sat, 5 Aug 2023 07:38:10 +0100
Message-ID: <CAAF5RuyAstj_aNt4=9isuh=YJOE4tHO7zqgAKyrdD3b0X1u+hw@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
