Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2528FA2A
	for <lists+keyrings@lfdr.de>; Thu, 15 Oct 2020 22:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392329AbgJOUf4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Oct 2020 16:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392305AbgJOUfq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Oct 2020 16:35:46 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7A8C061755
        for <keyrings@vger.kernel.org>; Thu, 15 Oct 2020 13:35:46 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id e6so293092qtw.10
        for <keyrings@vger.kernel.org>; Thu, 15 Oct 2020 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=qmIDBE0l1uIx8zfcHwL4cnvNZRp+t/rVRco+sGxV9eI=;
        b=fmdgsW3yQQ5zlvNKXuRtVfOGo3o7KRfjidOTlF5fgIX/aarYDb0Ax6E/ClrKhbtNlB
         OH9HmvuXvzbFyujfgtMNdZTnq/zyDs0meDeQB/BFsj6OCB/mGtq0l7GdLiVzKjRgdm3W
         yZFu7uEgpYtwLa3IDf7BJSdc3Fqfk2YFNRjvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=qmIDBE0l1uIx8zfcHwL4cnvNZRp+t/rVRco+sGxV9eI=;
        b=lamsgbis2E27z6gMNVCVQLVhamoT0DJqdj6Ldwyrr6GWw7q1p7Sa4kEFip4BbvnLw7
         3TiDjeHZO0Pg41jJBXMKHWo3I2sL7VdpkVPE2FRfQN5qmtHoTE8s3e7NY1PrtJmWqBQw
         gZbcVAF6saEjQcoiAfozIhc24Epcu7Pk0MW8FF+0svLubAFXv5C2lVMcaIzSxE0e2a3I
         L/iKdn+GXcJyR+hO2FA8BrqlyAdXk/AUFnag3lrodTmIMHBmY7uCYAp5dEpWWWatf8eX
         Opz2iAGoTfQt6IXW1ByONyHoZL0udFVmntfVxhSfi1+znb784QUompmThHaINkxjvZpW
         sCCw==
X-Gm-Message-State: AOAM532pxWhN9dg763Kju7hYTF3nm8d9mUG9mTSNWD610mdUIasWyy7C
        hUTS3SEKyEtkhq5OmtN+QfjvIlCy8QbFKREg
X-Google-Smtp-Source: ABdhPJx7DRAXMr7nWU/096KG1OGVeRp6n+Z73zgCAO6CtbXgaY/ayMCeyM7gCs6ItlSHzXVWWRuY0A==
X-Received: by 2002:ac8:6a02:: with SMTP id t2mr131004qtr.103.1602794144842;
        Thu, 15 Oct 2020 13:35:44 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id g3sm28628qki.84.2020.10.15.13.35.43
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 13:35:43 -0700 (PDT)
Date:   Thu, 15 Oct 2020 16:35:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     keyrings@vger.kernel.org
Subject: Keyrings list archives for lore.kernel.org
Message-ID: <20201015203541.npofidmgdl3aioe2@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi, all:

We're in the process of adding this list to lore.kernel.org, but we need 
a good source of prior archives. Unfortunately, we cannot use the 
archives on spinics.net, as they are too mangled.

If you're one of those email hoarders with full archives of this list, 
please let me know -- we can use your (sanitized) mbox export to get 
things going.

Regards,
-K
