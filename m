Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA00F36E5F5
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 09:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239639AbhD2Haf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 03:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhD2Hac (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 03:30:32 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C3EC06138B;
        Thu, 29 Apr 2021 00:29:08 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m12so5781258pgr.9;
        Thu, 29 Apr 2021 00:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lZMvbMppjpPZmuxlkLQ5Yw5wPz86LXmS4L9P6/MEvlk=;
        b=hgcZnthuzmqZq5NREAgPhsiKiJBmDRL2JkZKWCUOvKbqLBQWpCSYLhwja+iiHUgCU1
         J8nKfSqKjS0jmXBNMPpoeX0M4UoZLJkY97a7rqiZ+ASX6253sgD5dzfdkjSRPGPtVUDZ
         UtYW6CZSAKmpS6N2TDIbsoDMszZ8zrfIlXMRt3tbCA/WATM3sp4xSPI344xwxrq98/Xd
         eiRUkzaScYG+KomgAkweesU17OCMAXcfW6RNhCvJlh+YYvlLnBC7bwvjLjES5vPGVeiW
         BhR+Eh4M31hX7cf0s5sD586nhP/4twOMtJuoVV+xkWIg5kv7U6BAOzfdqbTZx6kJBmKF
         1a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lZMvbMppjpPZmuxlkLQ5Yw5wPz86LXmS4L9P6/MEvlk=;
        b=mknvJLcAJBmcTvm6ROCKp2NSh6gQ7/27fQqVrRbKB2psOAyuhpczAbwARiPOkft+PJ
         ynzn16TTYpL69FcLEOelkOCrmZCllPYfOoqegG7N1Y2MhUzUFmkJA/HNijb0HHnzlN2V
         9AVA21pSp1nm0owXipIe2tiHvlY3NJH7zYqU92hDjbMkSjJdHINHGJnFk2CzUUklrxY2
         oCsDGzjDHSOpUdrKvO1nZPyMSy5gQzznDq7kDEKpPueKHcO40A3pxJGW8Ek7ZYKFV0zC
         QukczsTqlYnF8Sv1ZB47ox+uEGcYCgCF9NC28QFiGYwHJJN2TZ0UopgqmfLixdOAYmHa
         EmVA==
X-Gm-Message-State: AOAM531vK0zT1Im2ZvxtGnRad4c8/1i0M5Vr2Bok+QLHXrNCuh6N2zmm
        bdbn8yyMY0He3R82w1MW/yA=
X-Google-Smtp-Source: ABdhPJyXBZu43sKug8SqQTf/zxeF8hKBVbti8QunGDCHFiZ16mANPrKR0hHzlHtxZ07GrjLESvrXiA==
X-Received: by 2002:a63:31cb:: with SMTP id x194mr7306534pgx.290.1619681348525;
        Thu, 29 Apr 2021 00:29:08 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z29sm1632085pga.52.2021.04.29.00.29.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 00:29:07 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v6 0/4] Check codeSigning extended key usage extension
Date:   Thu, 29 Apr 2021 15:28:47 +0800
Message-Id: <20210429072851.24057-1-jlee@suse.com>
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

v6:
- Add more length checking when parsing extKeyUsage and EKU's OID blob.
- Add 'usage' parameter to the comment of pkcs7_validate_trust function.

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

