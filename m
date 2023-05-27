Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C726713440
	for <lists+keyrings@lfdr.de>; Sat, 27 May 2023 13:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjE0LVU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 27 May 2023 07:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjE0LVU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 27 May 2023 07:21:20 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57743EB
        for <keyrings@vger.kernel.org>; Sat, 27 May 2023 04:21:19 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 5614622812f47-394c7ba4cb5so549451b6e.1
        for <keyrings@vger.kernel.org>; Sat, 27 May 2023 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685186478; x=1687778478;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBYjhjPWDIeW/liWUe+wiuocZI9Tazf3Ctcc4Qyz83o=;
        b=XP/1w0B2Ts0bmALYrzJHgvK+hyDoRS64Zjcpqt/X11KFHGGTYQY+N/RoYxB8nrrJ8j
         bOG9ooauNdJYBloRvogUQuGdr+T6zSE1MM/y7h8pLhP66TPp4vtFw1G3Mc4K0mEVWHVH
         N8zKbK2z0+1ixGJdcstyR819bACBnb9uKYzsHR0HTU/X2befTV9VbXjPAqbmSV4IaBOV
         cGdVRLpmfLzbgmPPO+KV/wDkjEiwOrlyMqRIvhGULYOB5hzSA3SBap0Vmx+NmTnyiAuS
         8VlhAgr2ExJiXizdcd3HIBC69XrXYvVkOXK2X3lwj91rsNoOmyMiTQc7EZaC9hYyNKir
         uYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685186478; x=1687778478;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBYjhjPWDIeW/liWUe+wiuocZI9Tazf3Ctcc4Qyz83o=;
        b=QO/bqsIERVn0euEKq3q487z9Ygo9qReTuOOtBcOao9CPMtfaa4S/C6m81FHnzkPiqs
         Q6rIKZ/jLpzaRdsjjcdajK9lTlVvxtgwsDlHvKSO9+sYtrAdT/KzrV9Vq1Y7cL/hKgRw
         GWjbC5zTIr8QXcG+vzs6kM0fFFhH0CR+ohcj50Ch03Am2LyofV5Hltf40Ji0un45BQGa
         TGyx8ghK2lN9J9PXxtrAHB3fz8s/iy6TXT1KQ+oniHk38seG6vcKkaSrLkdJHQ7JGHIS
         z9z5BQOqVH8EbJ58jEpkyh/CHh4cCe+UG2QmyKTqQSN6URf3h7sWM87VpPrIybTEJSwc
         DrLw==
X-Gm-Message-State: AC+VfDwyse1PFnB3I9zwq7J0ZClWEqaWD9R4ae5jJ6rZZG3E1r6gXP6N
        ep9+zceKH0TUWf0I55bUvF4kySTCKiLFrhcFEBr1MHxvCL4fKbfAPko=
X-Google-Smtp-Source: ACHHUZ6FwOH4GQnDOl0Y0X3YO4lJ3ydqbnU+48NCvdQNkAGOudejNkPD+IGxakyJKcWzn5xx5pv/iSPrd++tEhHJBJw=
X-Received: by 2002:a54:4013:0:b0:398:4336:433b with SMTP id
 x19-20020a544013000000b003984336433bmr2474094oie.25.1685186478682; Sat, 27
 May 2023 04:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1112:0:b0:4d0:2fb8:5434 with HTTP; Sat, 27 May 2023
 04:21:17 -0700 (PDT)
Reply-To: cafod@mail.com
From:   CAFOD <johnmorgan2055@gmail.com>
Date:   Sat, 27 May 2023 11:21:17 +0000
Message-ID: <CAGuTkBhfrevH=JyOOEnTrdMSA+ZH_6zHciCQ1nOw5GEbWR+HwQ@mail.gmail.com>
Subject: CAFOD
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

CAFOD Christian Aid London
35 Lower Marsh
Waterloo
London
SE1 7RL
United Kingdom


The Christian Aid London is on annual forum program of selecting
individuals, groups and organizations in coordinating to reach the aim
of assisting the Less Provided, Widows, HIV Patients and Orphanages.

We have this ban to select irrespective of faith, as we work through
people of all faith and none. You are been chosen as one of our
coordinator in your area to reach the aforementioned under privileged
ones.

We have mapped out sum fund for this program which is to be giving to
you for the assistance of the people around you. We trust God that you
will work with us accordingly. Reply for your interest.

Thanks and God bless you.

Ms. Chine McDonald.
