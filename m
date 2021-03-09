Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193903321A7
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 10:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhCIJLV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 04:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhCIJLU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 04:11:20 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9CBC06174A;
        Tue,  9 Mar 2021 01:11:19 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id x29so8346152pgk.6;
        Tue, 09 Mar 2021 01:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=KhGsELbeaVZ6fva0mXjyYAtemsZGD5reVs23Ve6MCIp49iOr9f/Z8lsUe9PzyN4AiN
         ahCfPk4zBSGIceUjwb+XTczDg+nl1Ghpp4KG69cgItLu6iUpx2+w6tjgmPtd1yKHZ9o/
         0n3EVCwaKUO9cF3G5NFK0/hENzH4tX4ecvB/NkMIFRRfnTFjptPK7HteEBjVRUh0t89T
         3yu10uBdV+7u75xJym5RIIrTMn5/foqi5+JXHXwD4vQZg6VGqbfDB2p0XFPuyeETEoaf
         43OOW+39Ubp6f9vcxDCobgRculalzTl1FXuEQhJIYUzNATifBuuhPjJl38ei6BYDS28m
         3QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/CvRWYjORCw8flby47H5HqIvyfw8yrJSz4E5Q321rKY=;
        b=ebrdna47zz1/fhm3YwYrjvOULG2zEGQWFHbM3Y4s9AWWHsJcw170CiEhqpGhIfPP9a
         tLLwDY0hJxnIg7urBNk2WpWE3ACyrOlWglfMcUcDyMkH413sYcugK9MulyGOc1kZdfz8
         6YopXTGxU86OPIOfhgLCvg63SZPCS5NCWB1SZOCljkTdvq6BtiBH2/zzReWVg9M75OlL
         00Ft65q6mlcwOA8rVqIr+k0otAaehuvJmHiVDTZ7ZMrD1oKIxZz94YrA1BOtWeFygp3K
         d3Iaha8sbxfeQUrWRX9UYTqJydfjnbvpxOmjMXTnnaqNtVxD8UPlEBh7SEait7a04VUV
         5aig==
X-Gm-Message-State: AOAM532AFGOhcicePyGVo0NGnQxY17N+slFlGfkvfwx86RTjl6OKuCg/
        N1fxuEnldY+xApnaqyIzyK8=
X-Google-Smtp-Source: ABdhPJxamEBcduvWmfcWf0H1uPFhPcgfg3x1QwED2/BSxm/iKPknJszw4cmj9AGseSWhD21+HGXi+g==
X-Received: by 2002:a63:ab05:: with SMTP id p5mr8228421pgf.149.1615281078913;
        Tue, 09 Mar 2021 01:11:18 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id js16sm2094860pjb.21.2021.03.09.01.11.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:11:18 -0800 (PST)
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
Date:   Tue,  9 Mar 2021 17:10:40 +0800
Message-Id: <20210309091044.2298-1-jlee@suse.com>
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

