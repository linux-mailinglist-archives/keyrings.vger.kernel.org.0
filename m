Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C33E6F44A7
	for <lists+keyrings@lfdr.de>; Tue,  2 May 2023 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjEBNGs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 May 2023 09:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbjEBNE7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 2 May 2023 09:04:59 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2B572A1
        for <keyrings@vger.kernel.org>; Tue,  2 May 2023 06:04:03 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9a824c3a95so5465648276.1
        for <keyrings@vger.kernel.org>; Tue, 02 May 2023 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683032632; x=1685624632;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9q4OXbjahQmyMnDguTGgjDoyQnUNKJbrdCpM2cc4TC4=;
        b=r9ceUL7quI95SyGfr5TaDgCmNKehO4SEbJG/l/u2qzHJFgBU5zov9FGNS8FA8o0Gcj
         HZ2xCrpz8IRB9zatEN7jOoLhjMoAxhc6hlOtqpsbM+8tq1yElPHEzmf1EfIfENOoUXVr
         A4CjzuGDaYsMZEJbIp//skJUsvDqkl1r/9ZxzdVTjXfo+7Vsjsbc8RScsQot1Rz3EsvX
         TDCLyHiQRJn/NSzYIQD5cViAY7XTqPh8JTVyNAKhqo2FzaJANVgOWnpSf2FsHC4n12xb
         R96GKFJ5fViezQXB9ST4jL/1f1LyGszGSNMLy/qQBqj3hPP6OPgEdW7o4eCMYu+aOXdi
         2kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683032632; x=1685624632;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9q4OXbjahQmyMnDguTGgjDoyQnUNKJbrdCpM2cc4TC4=;
        b=NUm0MLtsXpL5le6LS1WWUeWUrdKalzBfGO5awelTY23RjrXNOXP/R/wMRW/ddlcL8V
         B/3ZgxH4PsL5SgAbhecO5ylJwVLgUIZGuwfqDksGWsoawdm+sWvWE00plS3ik2zjxMlw
         ejHpUwKs9ePpRwLYThO+AtJwuTz+71O83hDIPRBq1+p88sajtZSSDKQEyH2v900qLDWp
         kb02ENfPOtcDKTcSCrxRgD3TAbmwPKywQulXGfYd+K9BECQ5DJ/ronlzP0RuJYFz1z2D
         8vDkn+OijBgcBMMZsvSABs1doYyD6QksQHaQ8CZTWTEU2iCpqYRri6tFyZtaYS98gAdn
         dMmQ==
X-Gm-Message-State: AC+VfDxzNtEkIRCs2OLXxuNpyI/lw46SKK/8UmEysPsx6YcjDAft5mYu
        jg+cx/+ydP7FAli3+bmv/MYqNePqgnjara9uZWc=
X-Google-Smtp-Source: ACHHUZ4n4O40ugQZQOjPm65Bcof78xHYl6D+DYIO5BFEhVGU6147hWTgNBaj5mRyJc/FoljVEfNx477nXOfSHpve390=
X-Received: by 2002:a25:3a86:0:b0:b9a:6cca:7881 with SMTP id
 h128-20020a253a86000000b00b9a6cca7881mr16753091yba.35.1683032632012; Tue, 02
 May 2023 06:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6918:b221:b0:176:2e9f:526c with HTTP; Tue, 2 May 2023
 06:03:51 -0700 (PDT)
Reply-To: infogeorgekingsley@gmail.com
From:   stanlydavis60 <stanlydavis60@gmail.com>
Date:   Tue, 2 May 2023 13:03:51 +0000
Message-ID: <CA+T47fpMOn3qmwt5_PUSqenfiVPHbh-roREfbY+vf=ESC-bBbg@mail.gmail.com>
Subject: For a Good Heart
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Beloved,

This letter may come to you as a surprise but I really prayed to God to hel=
p me
choose you that will be my true God sent, as a person who has a fear
of God that cannot betray my remaining family my only adopted son
David he is 13 years old living with my personal lawyer.

please contact my lawyer as well for more information on how you are
going to assist us conclude this transaction. I will wait for your
response through my email and
below is David=E2=80=99s and my lawyer=E2=80=99s private emails. Please fee=
l free to
contact them and introduce yourself and attach a copy of this mail to
my lawyer.

Thank You
