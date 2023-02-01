Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4850685C1C
	for <lists+keyrings@lfdr.de>; Wed,  1 Feb 2023 01:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjBAAVe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 Jan 2023 19:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjBAAVe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 Jan 2023 19:21:34 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814494C36
        for <keyrings@vger.kernel.org>; Tue, 31 Jan 2023 16:21:33 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id m13so4916347plx.13
        for <keyrings@vger.kernel.org>; Tue, 31 Jan 2023 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5f7Vo+JFAerdiMoOwREJwZlbAlqNzBMzi2DNbGEP4U=;
        b=UgLduSbOkaScAj+yKN2TmSiUv0jeFsonFDiLmexIpMQl3IVdqbupj7qaHkOKJ3mi3k
         oun+lNORQYH9+gzKSPBgtt0vBcc7BjAky/1lW6RXNZuew226pjbyuM6W18ORuHy1Ln2A
         ZOFVKrLj2N9+nNlB0H/4jcKFSOOQfJlIsp0BOJFCEHFeTuWVJr9HMwO7AxOjp/ryj4Hs
         eprmr9UnS95W6pjO90HhqsMlJKlXypBU/PP5Bl3FlAEYJku/9tQySGFnJpA//D8qDe9O
         IoNw/q14OOVa29/VLx8U/yLRB0LmVMWoPVoV/djbRONLXLhm+40b7Lz2NCKFPn7qjXpM
         hCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5f7Vo+JFAerdiMoOwREJwZlbAlqNzBMzi2DNbGEP4U=;
        b=Cm0oA7AGiftTvLfOE/agReUFaulDT1J5dNFXd4S6D4NMspgisQJEHullOUrvMz/ewb
         ci4ZNJgRsO/7uEywJHjbKXYkh817NxNEkbHZPMb89S1M0i06B8BrlGFfDca9pB/POkqj
         AcXbaBDQkOOx8OyN2VlfBZ3zDzYSzIi5m1mcL7fBHIvhY8irwZIacxduPv2xQ6WYsYS7
         o57rNlgJPS9e36bNZwIw/L5AiWHb2CTTIdihCHmn8sm9hpbgEOzEe8sp36SuPPcSuZR2
         CQkT+fWnuKTj8etldMkTN2/PWST3PkJJGuJsvd3S/Amu+iLcWvQooBh1N9uYb735GkbS
         nSHA==
X-Gm-Message-State: AO0yUKWupzaMHvIdyp19AYiJ72R0wohE5jqpZuh6UCW7omIDgwlkXCFa
        fzuSzkEjwdjX9OkxZgYbgQs+1SnMLBO9AxDQo+k=
X-Google-Smtp-Source: AK7set8gajEaS727wz12ZfCp0Xw/L1sJewpcrIq6V8UXfL8dCdIscsifTBrQFd5puZqo33VdX66+dkSaKUOs0Dmr/Uk=
X-Received: by 2002:a17:90a:4a84:b0:22b:e5e0:1229 with SMTP id
 f4-20020a17090a4a8400b0022be5e01229mr22680pjh.13.1675210892938; Tue, 31 Jan
 2023 16:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7022:120:b0:5d:6cc7:156 with HTTP; Tue, 31 Jan 2023
 16:21:32 -0800 (PST)
Reply-To: cynthiaaa199@gmail.com
From:   Cynthia Lop <maxwell1973david@gmail.com>
Date:   Wed, 1 Feb 2023 00:21:32 +0000
Message-ID: <CAD6kYWECDSxxC09c590630kRwfF+YkKcpczLhKM0n5wLZeS1pw@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Gooday , I saw your email from facebook.com,

I am Miss. Cynthia from United States ,I work in Ukraine Bank , I
contacted you because i have something important to tell you , Please
contact me back  for more information,
