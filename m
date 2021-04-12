Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0678D35B98C
	for <lists+keyrings@lfdr.de>; Mon, 12 Apr 2021 06:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhDLErl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Apr 2021 00:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhDLErl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Apr 2021 00:47:41 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900F2C061574;
        Sun, 11 Apr 2021 21:47:23 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id p67so3455953pfp.10;
        Sun, 11 Apr 2021 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=KOJoASlQcl/BKUS4nbQKocohT+zQtX7LC71aAXn2OPx/RTrfLWN7d2yNZBzmOrUdcQ
         mXS/NWUu/7SuUC+dwNNgwMagSx0DNNa291x+cCgWpQQazUATwjOwNan0ewVMO4K92SkT
         R1PWF1wVNnekd+caFqyL2zOAstpFAlXbE6ovXMNa3u5+J060yLNTDGZS2N3fZXa7owYo
         c9wIInp9EpWf7SAbCF/ERWIY/wMJjbfZh3gipc/QbE4lQk/WoToJadkGh+FUZInesHSq
         H+tbhyebXpWN66zKhpRhoRc/fo8dy++wmaTm4xTKb3onPfDn17bHuLOtX3m06tPfSsom
         3/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=mljSnXUMcRQW8KRUbIKxRhIEU7veXth4FzeqFLO8R+bE0u9VvFiQ8kSNlNjA6AgT2x
         +vIBUBz6jzi/lDl5VYOa8cJvCawly0gjYtUMQBGHVCjp2lrWXnnb+p44FhpN6ENGX8xe
         JZ29UqwHzyn3XhBLwfpGf9zPpKyy1uHZSi6QYataE0GqFb84DzYiSdsnE+YcFfuiQNiz
         ElyDCIoRMWjReOtgAtiK6UCulTWspwqx0fE9809vX45sOe0uJMFvDWMIzA/rFNMTh3xs
         GJnD70s5/h/u+QiqV+FjOvsNuOsw7S0jSxginzZ1P3iR2ha6UDvEobCC3MxP4RWp8f8l
         DQPw==
X-Gm-Message-State: AOAM533RE8o5n5rglcJ53AofW5YiYoR+NMxKpJKok9YwAFEZXzpyVe+U
        oN6fxI4Yn8tyjcueh5eyfF0=
X-Google-Smtp-Source: ABdhPJy6UuY6rkHp4kq+Zr1DIIR/iqxNIf2Qi5r5rtRfkcnvIEEw7K1lZLFu3WKTjREbpQZRya6Ieg==
X-Received: by 2002:aa7:8097:0:b029:229:83ec:cac0 with SMTP id v23-20020aa780970000b029022983eccac0mr23116294pff.67.1618202842611;
        Sun, 11 Apr 2021 21:47:22 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id w16sm8514851pfj.87.2021.04.11.21.47.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Apr 2021 21:47:21 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v5 0/4] Check codeSigning extended key usage extension
Date:   Mon, 12 Apr 2021 12:46:56 +0800
Message-Id: <20210412044700.31639-1-jlee@suse.com>
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

v5:
Fixed the wording in module-signing.rst.

v4:
Fixed the wording in patch description.

v3:
- Add codeSigning EKU to x509.genkey key generation config.
- Add openssl command option example for generating CodeSign EKU to
  module-signing.rst document. 

v2:
Changed the help wording in the Kconfig.

Lee, Chun-Yi (4):
  X.509: Add CodeSigning extended key usage parsing
  PKCS#7: Check codeSigning EKU for kernel module and kexec pe
    verification
  modsign: Add codeSigning EKU when generating X.509 key generation
    config
  Documentation/admin-guide/module-signing.rst: add openssl command
    option example for CodeSign EKU

 Documentation/admin-guide/module-signing.rst |  6 +++++
 certs/Makefile                               |  1 +
 certs/system_keyring.c                       |  2 +-
 crypto/asymmetric_keys/Kconfig               |  9 +++++++
 crypto/asymmetric_keys/pkcs7_trust.c         | 37 +++++++++++++++++++++++++---
 crypto/asymmetric_keys/x509_cert_parser.c    | 24 ++++++++++++++++++
 include/crypto/pkcs7.h                       |  3 ++-
 include/crypto/public_key.h                  |  1 +
 include/linux/oid_registry.h                 |  5 ++++
 9 files changed, 83 insertions(+), 5 deletions(-)

-- 
2.16.4

