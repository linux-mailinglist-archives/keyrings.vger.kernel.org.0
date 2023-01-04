Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3051E65D302
	for <lists+keyrings@lfdr.de>; Wed,  4 Jan 2023 13:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjADMtf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Jan 2023 07:49:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjADMte (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Jan 2023 07:49:34 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293231704B
        for <keyrings@vger.kernel.org>; Wed,  4 Jan 2023 04:49:33 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c17so48318444edj.13
        for <keyrings@vger.kernel.org>; Wed, 04 Jan 2023 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=PpbUdbofVmBQQZZTp2RUm+CbaCmQdtyUzeVJiE+zR6LZbd09h1S9oit+7lCIpj+dpH
         jhXtmnKrl42+WkYxEVhs7BR8aBz6cY48JO5FseRLbnHSnWy8NgRk/fzsRQzb3vaNqTA7
         Xvar3iD5+rjWX7tW5Sp8GloNfrVt1fIpM4JFOw/PAMRhF2j6f4IiPq6iMkbjfooAwaFr
         CV0x4KK4lhYD6vSr9JAz54QgLX10F8b0bIZtpCEaNx3riD0ZiAhFytugq255QEBxc+/d
         dQ4c23NPooO4WT2AsHZYQQSObw9hYkmqSXoyt5sAthKj1gpqQGaRF6r2FeGDuDug5E8l
         AdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=GiNznYCpGGLalxN0XU8U3VSdMGf3RXwvs79kq8f5VNZJe0Qq1SwsxmXsGftFCZfCCJ
         XsJoZ2tdLGQTEpih+PQDXcGmJvy4Y+OnIIgN7P3//iQ5JHct+OpLN7vRVUyO0hY4MXyA
         I0Ln3CG/XJ2JhZF7SQwaPe3tWBJ3qN2QDepsfqAAe6zvMeUAe2BbKrbPLrLLG+kn7yXA
         yNmXTWoFTeznxhfHUlm2opH9ZqJQZqxX5WKiKu6wkfwnMmcnG0G4yoB2eb430xHxlZ8A
         xOpYQZNbsPP7YNBkoYAYCgwP2GMfTLG/VppvUdtseGeDtWWvibMpNyrp5NN32rHHF53J
         loDA==
X-Gm-Message-State: AFqh2kpKbVsMaR5q4dw64UYEvbVZgXaPFlnqhaS8LxlkUqY4mu3qe3T2
        voZ7bq6oMmGCemqs2rS49AaivBZee5onneV5gGQ=
X-Google-Smtp-Source: AMrXdXtZPhutZ2IIPTEZJ1H9aEU2iOidTGDIxTptzHabvnD16TXoM46QU1NxlOi+SoqRP1RsXy1tMps7RgKQYzTwAbs=
X-Received: by 2002:aa7:d489:0:b0:46c:5109:66fa with SMTP id
 b9-20020aa7d489000000b0046c510966famr5791792edr.309.1672836571446; Wed, 04
 Jan 2023 04:49:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:1b0c:b0:7c0:fa7f:6f2f with HTTP; Wed, 4 Jan 2023
 04:49:29 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <ffgrdenzl41@gmail.com>
Date:   Wed, 4 Jan 2023 12:49:29 +0000
Message-ID: <CANJpBKD0hkPOwcqPHd1McW1j3mAXdvvcmruRwR4J7r2HY738fQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:531 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5005]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ffgrdenzl41[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gregdenzell9[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ffgrdenzl41[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
