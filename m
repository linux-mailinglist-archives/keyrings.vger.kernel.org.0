Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478C96C3FEF
	for <lists+keyrings@lfdr.de>; Wed, 22 Mar 2023 02:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjCVBms (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Mar 2023 21:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCVBmr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 Mar 2023 21:42:47 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E70C584A2
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 18:42:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id p34so5589248wms.3
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679449365;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7upYASidmeqEEydII3qqc7RD6bnaXjO6ELYE2uwAgE=;
        b=BAEsHPlIGftzvPC50mZoDp4x9cRphp0xuQTWSEjOfBQQ+b/A5f/E/FoKC2JPsVMvsL
         iZbfg23pqC7W+Gc4JDs/0hflwdk9n6nKEREBHy7pge6LuXsP/X51ODbpwh53p7uTsnZ4
         k7960eGD1SQw/Zbty1zcqL/1D4ccQ/x7fQQ3t229HTNJKgleIy2wUdYpN+4+VYlOJx/Y
         tz//SV8yUKPXWNdmIFA0eHiCNZ+eU3q6y8qSrhEfRsfpgqmZhG1LNdw4T8lWt8CfoM7V
         VtuiIuAO11RpMRcf5ZgqrMD25CYRUYFgCGTv+mwEvs9oL2/6KsFVRAuP+opYAxSQuOlu
         Hhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679449365;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7upYASidmeqEEydII3qqc7RD6bnaXjO6ELYE2uwAgE=;
        b=i/f62NFvAHH5lx7yujohZCpngOdd+QmguC5p3g+ruwwuPLJSmGeeakeFicHtKefybk
         afFQzWfTYNHwMVJhJFsp4i3jFo3vTtmGOPePXi2XkOawSQtZcBmy7wRSK3vkLRMiEVoU
         xeTZu4L8zbiwdGMHfLMb1y/wIKEiuVACYXrpuXzvZAiaAEBfQLlKoW4tPu608SnBi7r0
         Dcggiq34i3Yebr2id/xaaJz2IUOdz+AkGt+jqHgXfXPg9JqJFmVOlPQkFj483blw0oLv
         oGCEKiU0NGxMqVV8ELDtvbfESSQh1Motjsfjyu+CYHJxICE4X4V4iYmoYLaCSGVbB2p+
         mdSA==
X-Gm-Message-State: AO0yUKV9yGUAfFJzVid4vZyzR6yvZb/yrCyc7XjWjEm55RCaEy27N4D+
        x3nb0aNQ7HtjWgfvRmfaE3FFAbbRQghIhUn79ng=
X-Google-Smtp-Source: AK7set+agYM+W7iFM+5cega7HaW1OTCSowxCh0xJNf1qIuwnarHdgQbvaCXidrB5Kefap0o1hmwlEGkQlV/ngGB75DI=
X-Received: by 2002:a7b:cc9a:0:b0:3ed:f966:b278 with SMTP id
 p26-20020a7bcc9a000000b003edf966b278mr123006wma.0.1679449364967; Tue, 21 Mar
 2023 18:42:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:5229:0:b0:2bf:cbee:1860 with HTTP; Tue, 21 Mar 2023
 18:42:44 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <contact.mariamkouame4@gmail.com>
Date:   Tue, 21 Mar 2023 18:42:44 -0700
Message-ID: <CAHkNMZymf19_FRngUbyRqkOTGV3zqJZPWCBs8EYyTxCPiWkqUg@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouame
