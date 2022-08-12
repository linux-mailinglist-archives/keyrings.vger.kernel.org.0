Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05907591133
	for <lists+keyrings@lfdr.de>; Fri, 12 Aug 2022 15:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238126AbiHLNKA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Aug 2022 09:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiHLNJ7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Aug 2022 09:09:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562948993F
        for <keyrings@vger.kernel.org>; Fri, 12 Aug 2022 06:09:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i14so1952291ejg.6
        for <keyrings@vger.kernel.org>; Fri, 12 Aug 2022 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=DS60iJzfIvBYrZGyRNDnjLzZ+f63DwU/shhs5+AfgcxLnc4z5hKPxy9w5R/HgllZZQ
         N6zLld5rp+WFErwNzDNAeb032jL6x9peM/Y+riLDEnb+ZyvlpGS3Lc54C7jAALrW17hf
         VYqGKa1vPRN/te/Vzc/fdk2f09m0Ey8Ykf3iAVV4aqK2QEtYlimFPel0e4f31H8EFmO6
         /vVP99ALEEj+o6h8mDx0sEQmie5WFB/G9w413t4mTHDijy2t4gB5FpJmEBKty9W2I0tW
         aidCtcNnw7V537UEWEr5xgIQ8sv5OMydhGj5a4qVCEU241sWwAY4a5d1bjtv5TlxOjj/
         /cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=co93oPvEui1OZz4+ze9FwceiqDboeBSjtU5XCNDWudIvAcQAzmzNbTUmfxghlGEo4s
         +TtlR4Ml5FtBx9O9zvZf/VYq3liJmm6A3u+yOJbeTrN2jsyKM4hHrjuk9H7PMUrkpqFe
         nu0h5gOvKKYBxIFyH1L4lE91R8mYVaFy0XevZ/MOiaLXjx08z5ThmxuDK4v/pu6BgqPz
         xaEEeUTW10rl++OWBMKCXTTxHJKaCk0vP5nW2M2f8QD2okMA/ijVUDdMXd+MS/D4JSou
         1gmv4xs344dB6IaIrV4EmnKATtPFH3CXgEEbX7REj6wc1gqKKCD4H5XPWMmbOKW9DfPh
         BOyQ==
X-Gm-Message-State: ACgBeo3yqevxpXxGO6F5z5Fl3Nr5a7gW+ff6HvUPuSjh855D5QJ0RJJb
        OxdbZ96QuflthJLAhWh1t1o6XSopd+9rOmpwLQ==
X-Google-Smtp-Source: AA6agR5y9mYON0VH9tIa0uR00Niww9mJ9oECkXszD9F0TKsNPtMpuc94sysc6LX5J4EecJeWJL8GCmpGIEYAwxMmbYc=
X-Received: by 2002:a17:906:ef8b:b0:730:e14f:d762 with SMTP id
 ze11-20020a170906ef8b00b00730e14fd762mr2697801ejb.519.1660309793770; Fri, 12
 Aug 2022 06:09:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:a219:b0:730:8814:715 with HTTP; Fri, 12 Aug 2022
 06:09:53 -0700 (PDT)
Reply-To: paulmichael7787@gmail.com
From:   paul michael <edrichard113@gmail.com>
Date:   Fri, 12 Aug 2022 14:09:53 +0100
Message-ID: <CAK5-vuV=aDbsG+UW42LOQE-A1QAAB9c334p=-9M7vqsXY3ADPw@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:636 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5040]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edrichard113[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edrichard113[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [paulmichael7787[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
