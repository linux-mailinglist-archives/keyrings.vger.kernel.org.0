Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CB72C3A0E
	for <lists+keyrings@lfdr.de>; Wed, 25 Nov 2020 08:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYH1J (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 25 Nov 2020 02:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKYH1I (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 25 Nov 2020 02:27:08 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16FEC0613D4;
        Tue, 24 Nov 2020 23:27:08 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id bj5so684355plb.4;
        Tue, 24 Nov 2020 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dE8a5WlGPDxWc2nopfLth4ca5yh3gzs/QZ1YaMzoCcg=;
        b=JVTjCVNKIef82UXKWf0/tQJeETUdDE0HDCq4b2tt1MBvndGO8HI54SCQUN+hES57k7
         Xp+bJUqF5W0s8QjVBiDKEFU8YPJ9aJHbmk3lnBGfM4iffNuIEvqwj30E8M8cil89PmTN
         lYSuL2gyuFytg5uM5jgY3llpWirvDAOvzDQuEnFNH8Yr3eH76Sxn1oOqDjlM2/LzBKFk
         Nw4B6AoMXScf6B+CYCkqvPo88hkJmnPZPkw3KMtCs6aRerN6pCpl7+Lna6ECzSjUA2aa
         CpWcn981ACJPTQFGQbtxG8HWepHw/T+89YhkFbVjlKgwhyYb+JnK38pFB9+SonQ+cyU4
         qdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dE8a5WlGPDxWc2nopfLth4ca5yh3gzs/QZ1YaMzoCcg=;
        b=kErpUoyhy4eJonrJl4KCWBMcXUmuleXb0gRlqVDrTq0BajM5ZzSCiC7wBOIkLCHlyQ
         wGVY/D9//Q2xNpivJN5NK9taWwPoerM8koLf5wunWonEzj2RG1e6EpZDelLcZEU1JqU0
         LrVy2V6VFANYTC6QR7+FeJZaxjuLiuLnUpWaTpmkLI232ewrC9s+Mu0hiA0zuAq9r7g+
         cQdG8ICcnDOjU6ybwDMobQL87zYbU7I9s5QXf7UVKf3BQvsgk+hQsUteNRtHYSmbfcHp
         s5towGBIMBkjK4RrE+jjHV9wqZVz2zAZmChdBRgOdagaYceq/P0GxQgdT4QYEOY5Ar/1
         Bj8A==
X-Gm-Message-State: AOAM5312PEr21od7pNNO82ve0iZy3rH8ygDMlga06jF1/TedjXF8p+ee
        zorM7Pjb9HVWuYv1O8Oh+4I=
X-Google-Smtp-Source: ABdhPJzyK94324FGJdnuQQ8Th1gFIVXL9yGsRpw5lIrVTHJ4dqFIVuo81nVLEdEwM8Hliaa9p1Yp3A==
X-Received: by 2002:a17:902:bf0b:b029:d8:f677:30f2 with SMTP id bi11-20020a170902bf0bb02900d8f67730f2mr1424461plb.25.1606289228251;
        Tue, 24 Nov 2020 23:27:08 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id q7sm1006055pfh.91.2020.11.24.23.27.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 23:27:07 -0800 (PST)
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
Subject: [PATCH 0/4] Check codeSigning extended key usage extension
Date:   Wed, 25 Nov 2020 15:26:49 +0800
Message-Id: <20201125072653.15657-1-jlee@suse.com>
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

