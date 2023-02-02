Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E692687B78
	for <lists+keyrings@lfdr.de>; Thu,  2 Feb 2023 12:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjBBLGX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Feb 2023 06:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjBBLGI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Feb 2023 06:06:08 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9F3EB54
        for <keyrings@vger.kernel.org>; Thu,  2 Feb 2023 03:05:26 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id j21so1102283oie.4
        for <keyrings@vger.kernel.org>; Thu, 02 Feb 2023 03:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeUz7W5STdevGt5G9BBQgnVLYpQy3pLUPLWMeOjLAJg=;
        b=LYMJKMfBGI8+1A8pGQvicn8JEshkz0nX1wSaXsQXCx7l7CxyI2OXkXGjiTnk5qhZof
         ItbXP72iYO/2pQg0WRaJmzdx+Atjjypxp2nHEytQa1lEzvKj2LTkUfgWTV4D73w9iY37
         VUKF7LjrHonFlwWBXZUek8P1i0YjGZGCYkaq9Zd+VhSD5QMQ53qve4aOx+y6IR+DUkR/
         rzm0bVmQwqp+7sVGYYmIpD043TZXg+UoA+O15j+rIj+9dAuwU5MQJFyEH5mSPrbJF8YI
         l09JWf3SLC7bvS9jlLW2XJD2lm4InFydQfECCVPxstNrd5MBNyhdsyjMye3JHEOAdxDS
         YeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeUz7W5STdevGt5G9BBQgnVLYpQy3pLUPLWMeOjLAJg=;
        b=tU9kht8jxVI/w4X+h1EaQdMZFUCKyj9XhHPohZsVGzb29FF3p8oBJEJ0tAJ15SE7jk
         2nHudFUSLheDz+GJhJWQytvFoYdnLSWfn5ea1WcrI4AxisP3LEi4yfP51xOEu44CF1iT
         3hiSRb2YuB1kP2iV5sElscpk+6yW6hOrd7+NxgPOzeu9sDZsSceEdGucdQ5Or7rXeNxJ
         HNKhlvUBg3yasgY/WsrKu+GVpWcFJe2WhTxs/hmj+JasiOiYzhL9DhB0VVEH5CH1Owib
         FKQQ/QhU+AP3aM9mZhc7sfL47NGksEbJ5FUQVCP1P+sbZBXNd6fDklSE/f7g4ibgyXEo
         h1rA==
X-Gm-Message-State: AO0yUKU5FezAgB/Rxz6ED45xJxsON/HqYKH37TTvmLfEEiZSh7HQVyRp
        IE2ikkkn/1JojAvirgaDLaYFmxRS+cgksqHuPu8=
X-Google-Smtp-Source: AK7set9jLCNU5rP/nA/Kgkt9EDBCRKtAgn/ZuzUrO5hLovgCHB161K17tyuZOhU5QARGMhEkb2RN2BCeCCZVsV4JU7E=
X-Received: by 2002:a05:6808:1cd:b0:378:7b79:5625 with SMTP id
 x13-20020a05680801cd00b003787b795625mr115570oic.257.1675335923813; Thu, 02
 Feb 2023 03:05:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:531f:b0:ef:8f0c:eb3e with HTTP; Thu, 2 Feb 2023
 03:05:23 -0800 (PST)
Reply-To: cynthiaaa199@gmail.com
From:   Cynthia Lop <uwalakaonyebuchi9@gmail.com>
Date:   Thu, 2 Feb 2023 11:05:23 +0000
Message-ID: <CAHECHEGF621C6W6SiJk+whOkZqEo1T+sDEGUXNvySqV_FhSYdA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:22a listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.9441]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cynthiaaa199[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [uwalakaonyebuchi9[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [uwalakaonyebuchi9[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

How are you doing today?

My name is Cynthia Lopez, I am 37 years old and single . My country is
United States . Now i live in Kiltseva Street Kyiv, 1013.Ukraine . I
work as bank auditor here in Ukraine .

I have something important to tell you because i contacted you for
something good important , Please introduce yourself so that i will
know more whom you are ,
