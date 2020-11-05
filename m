Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048212A7657
	for <lists+keyrings@lfdr.de>; Thu,  5 Nov 2020 05:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730946AbgKEEYa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Nov 2020 23:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgKEEYa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Nov 2020 23:24:30 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250A6C0613CF;
        Wed,  4 Nov 2020 20:24:30 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id g7so74038pfc.2;
        Wed, 04 Nov 2020 20:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mf2mQtl5Jrm98A+7graXanfNE3UgwsoUiK1x4tqEZfo=;
        b=E16ZNRL2p3UqVWctbIlbFovHG943cFUyARwZPuf0UKQwfK1XyOkqpE07ubMnC+cOQ1
         KsqmvkHuUyUhgjtrhDtz8GW9/kMhlKeRrrmRIiiLtzLIddyo9/4Z/Q6Fdb/9Uwpo6sKB
         BvmKCmFF5hcdHFs6ALsyQ0il4eKsYiT5w25+AqffSmb3jyVGEiqfFX6jKjRrPzw6u8Nr
         bYuKSpevA1FOrRkPe8rM/LywqrkJm6IKvkzas/hTfLobYxJqBStZd1EdtjW61EHCE0kL
         hhfQFgIs+qAi44uRUkrMrpvTuTOLVa+LONCtUBI1aTa/MNysEbSj7z9i0dTzMHNkUTxa
         i+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mf2mQtl5Jrm98A+7graXanfNE3UgwsoUiK1x4tqEZfo=;
        b=Oq1jdSO75u7pRotXy3Ue2iedrZKBWy4EXv8F/dyIePrPjVakQIChBJPopgW6UT3eIj
         EZw72GrXOgWhCofUHnQOVnOH5qoJec0UxeFeR4Dl1DEkvDyNWiRz8gunZIih1+EgGE0O
         HnuZlzN45sVABYiO7YJDn1LYxpUMXl3yex5221cP7sPX1sUVQYe3zuEJJhUPmfEzNI2M
         IezOe94ScjLOpl+d10Q6joL22thCKmE8aDgi73Ordc/jf9xxCm2QPC9vaDRA2Xuamb1c
         y6WqRwa1DMWKvfZYapKVOBikILH9ThGrA0F6ZgEEKHD9kmL1FMjC9DVKWVYVnA9nKeR9
         tVyA==
X-Gm-Message-State: AOAM533tDZmuou3KfTyZ16k5fvyH5CaWTCDa77HOXj4DTLLVR31bhRGN
        R82B2lvtw9b19vc7DpPXegHWNkJYShw=
X-Google-Smtp-Source: ABdhPJxTzQGBfB3x2gNsgtCXI3YFBqX/Dl/pGM/hzJHdyCo12Jp4Zeq7xSl2qYmJw9yUCO9EP0cuhQ==
X-Received: by 2002:a17:90a:2fc5:: with SMTP id n5mr556889pjm.174.1604550269774;
        Wed, 04 Nov 2020 20:24:29 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm472782pfa.220.2020.11.04.20.24.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 20:24:27 -0800 (PST)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v2 0/2] Check codeSigning extended key usage extension
Date:   Thu,  5 Nov 2020 12:24:04 +0800
Message-Id: <20201105042406.5783-1-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

NIAP PP_OS certification requests that the OS shall validate the
CodeSigning extended key usage extension field for integrity
verifiction of exectable code:

    https://www.niap-ccevs.org/MMO/PP/-442-/
        FIA_X509_EXT.1.1

This patchset adds the logic for parsing the codeSigning EKU extension
field in X.509. And checking the CodeSigning EKU when verifying
signature of kernel module or kexec PE binary in PKCS#7.

v2:
Changed the help wording in the Kconfig.

Lee, Chun-Yi (2):
  X.509: Add CodeSigning extended key usage parsing
  PKCS#7: Check codeSigning EKU for kernel module and kexec pe
    verification

 certs/system_keyring.c                    |  2 +-
 crypto/asymmetric_keys/Kconfig            |  9 ++++++++
 crypto/asymmetric_keys/pkcs7_trust.c      | 37 ++++++++++++++++++++++++++++---
 crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++
 include/crypto/pkcs7.h                    |  3 ++-
 include/crypto/public_key.h               |  1 +
 include/linux/oid_registry.h              |  5 +++++
 7 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.16.4

