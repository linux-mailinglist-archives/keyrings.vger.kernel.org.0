Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E727B2FCD2D
	for <lists+keyrings@lfdr.de>; Wed, 20 Jan 2021 10:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbhATJKa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 04:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbhATJGh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jan 2021 04:06:37 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001E6C061575;
        Wed, 20 Jan 2021 01:05:50 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id p15so1790480pjv.3;
        Wed, 20 Jan 2021 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8+hbDvQcQCM/KIbXRfTLR9tvWpT5dA5ahHEuu/uLRYw=;
        b=baSPg0A27VbrtTre7HyDOcDiWhbS4pTRFCYs1iz7u2pPARZMkSsEUho0ahvUtLrDWy
         Jq8FY2SInZfJ/63lAjVoXLtFJQZqYRRwVpTC9p20OLioAUswLFkiNQgtZf79KG3tx6AU
         lMGc6sDC9XhbresIBJHodXyW+PTYm5plK1ZB5gB3PN/JddmIqWHbP7JPe2qTEzDKeJ+6
         yrkeJfIj2UBiUod9HV8shT4WU9QUUfSvhLOtXYBpk0ydPAa4gpFkQLy62aei8cuf9rfh
         +Foaf7mN3IvAxn9Pntk3MiN63wHMbjCnHyrim1xWSqgTO57aJVMATwAAwxmRCe61eB5f
         Ur2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8+hbDvQcQCM/KIbXRfTLR9tvWpT5dA5ahHEuu/uLRYw=;
        b=qqLaCxyzvttlaZJ0yBLqK8orep1MtDUjSbyWpUz5BLQUXTOc3yVZWJ4TNPhzowcvQr
         BeWvX58vULiG6opNGDxfXnZYOv0VY8SJBhrAhvSDOgiWMYvHoBDkJYYhRlZ7bPJD8KMn
         9GaocIF5Jzz05SDBVM2/aKqmWUSoKHht/sRs0OS4p/vYjQ9tBiCcuKYCGNkkC6zu39vB
         /6Fk4SVnqNhKKQHWLIwucG8k4ghlYel8h9OQ5Bf63DHFUFS1lLTyH3Wd9G/sWFLrN6Ey
         qK3r6jWJL151+PcvS5vz8jSPIb+ytXG/U1W3KO9WpAkvmiCQi45UYkUdirWAk3RzGnZ+
         0q9g==
X-Gm-Message-State: AOAM532S8zUgdaKECPNGhw+Cxrfx512cSF/9KOHKe/XB/3WQ2rfxRW3E
        KRhUDF9zvjgLRYxwn7MxoEv6LFw1vsk=
X-Google-Smtp-Source: ABdhPJwah8SgBw1IxtMB1DaZIgBo67jZI9AKRyppUZAwCcFKs3QrgVeVoduO5/wIGkLY551Z6RmeJw==
X-Received: by 2002:a17:902:6bca:b029:dc:34e1:26b1 with SMTP id m10-20020a1709026bcab02900dc34e126b1mr9072654plt.52.1611133550522;
        Wed, 20 Jan 2021 01:05:50 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z2sm1585226pgl.49.2021.01.20.01.05.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 01:05:49 -0800 (PST)
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
Subject: [PATCH v4 0/4] Check codeSigning extended key usage extension
Date:   Wed, 20 Jan 2021 17:05:13 +0800
Message-Id: <20210120090517.23851-1-jlee@suse.com>
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

