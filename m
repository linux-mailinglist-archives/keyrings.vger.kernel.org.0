Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE69359223
	for <lists+keyrings@lfdr.de>; Fri,  9 Apr 2021 04:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhDICr2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 22:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbhDICr1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 22:47:27 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894C1C061760;
        Thu,  8 Apr 2021 19:47:14 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t7so2021338plg.9;
        Thu, 08 Apr 2021 19:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=nJQs3VUsyXZWOWc+dq0sUZwNjP4JG5FztjLtdfDDqG2Y73O4WVpdjufpB9wLY9jnVB
         AUkT9Qj6f1ASNZlpDMxqhswbk2j4vxT0U1WO2dstXYYfiedgMrAeqf/ZfElCq+GLGhJe
         rjrq8rF/H3V35PcmOAEZ2RIQfyLchndVWoHcB7/b29460SBWpV0GtNWtEkCzDNsQsjTg
         mHbPPWRTX8I0Zie+y0ZH5BDSBIarh3/D5bQOIjWFpJpMpuVDCFGCmQuTE0RICV5autib
         9dMBzqae008v0sr9zA7tL+plbbqc2ULocXjHFNkgpPJxDh7l6UZjaNBSlDyh0zAxUc/+
         JXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=YuXnlZL3rGcubHvwMrMme2G+6zLf/hPhn+nj1U986aakXeEtFfy4hFEJnWXK+CG71G
         1CBwV7Jkw2kwxfHLHM10FkA8qBGZE6nTC6VesGwH27hKUj1XyUIbCLztGtIB4U4pkZCW
         0KSSVfAWt8/eIV+cX/4Wld/hwYZ2sbMbhVzCjaqH1kn0gqHONljm5MC5UOP4d6Hhg4Vr
         z/xj++G5VqFLm9Whvcgkwk8W4RLNRG5TvXjzQcxgfUeTfpAOb+JBx9Zh/3otmmYqGG48
         OvCqp5b8cOvFbhUe2XNg63qiUeU+vNm1LzYpu2ssvO1LTU+c2S6jEXDrhhTGUsbwTD/P
         fRVA==
X-Gm-Message-State: AOAM533uR6mHk+9eFI+xgUgXLHojGbvv1JuO+aXdFQyP0k9iU8wHtGer
        jEhostBCXVAaNKelK6HECxqBVy9txYc=
X-Google-Smtp-Source: ABdhPJwp/lDI2Xcbvwun63Wndrd7Yh8trbP4ZdtEG+PvLXyNGXrQTI63YvJt4VBgRZIPapytCD0oiQ==
X-Received: by 2002:a17:90a:5907:: with SMTP id k7mr5591823pji.197.1617936433989;
        Thu, 08 Apr 2021 19:47:13 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id d26sm665525pfo.162.2021.04.08.19.47.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 19:47:12 -0700 (PDT)
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
Date:   Fri,  9 Apr 2021 10:46:52 +0800
Message-Id: <20210409024656.8083-1-jlee@suse.com>
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

