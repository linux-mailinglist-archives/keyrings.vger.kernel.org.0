Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EC6718A69
	for <lists+keyrings@lfdr.de>; Wed, 31 May 2023 21:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjEaTrB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 May 2023 15:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjEaTq4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 May 2023 15:46:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F882126
        for <keyrings@vger.kernel.org>; Wed, 31 May 2023 12:46:55 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso452215e9.2
        for <keyrings@vger.kernel.org>; Wed, 31 May 2023 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685562414; x=1688154414;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HK0RFywdSsNntOxVLfzJzNsfyUp59dFPyDwTV+yc1c=;
        b=lEuer0lrPsxYiGwBB38M45mMsRkDeeMPuZSVk004HOx6uoBCqtX0fc6VBhApTfbpG2
         bQs4tONi1lx+biRbOuKwpDLHfICYk6zlg7Eh6WJMi7jKnWdMv64ravpuU3nfjESk2FQu
         rV7sLHja/OxS1eB8B3XFkIkBrtw3o8V+RA618mvC5oNQrQETxdTmlOdzpzYcku/5XZ0V
         n4jh79U1llxHLoZrGgrNAjFPKWHWE3o4pJNXg0tDhnUr/hDlhiNH3UvlvyxQSMIRVrFX
         rrhnoXCsTksfIUGuElU0heRtlfCpR7PoCFzh6tu1zFqcrT1D+eIcCVGSMhmB2z4GFU4I
         kIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685562414; x=1688154414;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HK0RFywdSsNntOxVLfzJzNsfyUp59dFPyDwTV+yc1c=;
        b=lpjv9zNJBm5uF6lXxT8afjbxrz+nudbl/u93/nFbbNRv7I60qSHijrrwN3BgkMnzwK
         QUGeqoQWqHoJQivujbyexbslE+IRYTC4g/M/5g+/C/pMujSt+pkShQ+VlZU2Ihn+ruxg
         EIHPKRDFQeOme1JQZlx2o6OyJaOqndY7a4uqYP6IvhBxOOJ9/NOnfCRkSmVOSmcR5Daz
         4SBaxXrD/V0Gryw9+HurggWONslHcbiOIjLRcqrUp7BSWF3P6pJNaFJ33HzjJ2E/hSn8
         O63EHtukniicru9hYJlBbVKEwTa9Wc+HDU7ZeA20m21JbV8aJ+gxBJ+wj4oyYaP2AeIy
         fVTQ==
X-Gm-Message-State: AC+VfDwvL9cnQ/yIWejP18/UbBc4rZkaWGDYvxvzjUb3yRiHvLmEoHKi
        Jxa4clkcOos89dpGe/apwXZTAGqcLUiVIeMFRDc=
X-Google-Smtp-Source: ACHHUZ5Sik3QowU/NQng3muPNqwaNa+DkuNTe6YnzsGB9nimMdjazXwpmPNMMgAMKmx8P5OcRYrmEnCxFDrzjfRAZQU=
X-Received: by 2002:a1c:f407:0:b0:3f5:1980:ad3b with SMTP id
 z7-20020a1cf407000000b003f51980ad3bmr281780wma.5.1685562413716; Wed, 31 May
 2023 12:46:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:11d0:b0:30a:f176:e9e7 with HTTP; Wed, 31 May 2023
 12:46:53 -0700 (PDT)
Reply-To: g.davidgold@yahoo.com
From:   FINANCIAL INVESTMENT COMPANY <gold09265@gmail.com>
Date:   Wed, 31 May 2023 12:46:53 -0700
Message-ID: <CAG3SBqLnCR1sNJydgHuAV1qM7Dah2bLqVM_OZuFLynZ5G6SBNg@mail.gmail.com>
Subject: RE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:32f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gold09265[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gold09265[at]gmail.com]
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

-- 
Dear Sir/Madam

We are a private registered financial investment company. We have the
mandate of a private investor who wishes to invest his funds
anonymously in an existing business project.
As a Private financial and investment company, we are seeking
individuals or firms with funds management abilities that can manage
the funds into a profitable investment.
From these funds, we are also able to provide financial banking
instruments such as BGs, SBLCs and comfort letters of credits for any
projects requiring such support.
If you or your firm needs Loan to support your existing project, we
will be able to work with you.
You may want to recommend us to your client who may benefit from the investment.

Sincerely
Gold David
