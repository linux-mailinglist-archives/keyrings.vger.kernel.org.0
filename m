Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E5938C39C
	for <lists+keyrings@lfdr.de>; Fri, 21 May 2021 11:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236973AbhEUJoc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 May 2021 05:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237002AbhEUJoY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 May 2021 05:44:24 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DD7C061574;
        Fri, 21 May 2021 02:43:00 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 27so12490498pgy.3;
        Fri, 21 May 2021 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KZgfiEzIPvsgTFxoIStVxbrN1vw78Fru0mAoJ7v9Q38=;
        b=KJkka3pOqaaPrpeHGbn/5qJgNS7ejHBSZ04McsUUJTogdMBAjzZHGA2mimzEl9RzEL
         xqnqMNAS7mSXVPF3onxn48E8Br7a89j5cGo2+Z/K06LBcsvMc7gZcKJ2DCiH3FtWhXEL
         YIlDr29Jeis0iwcbQEhBpcnm0HwgqeScX3zW502DJHCRJcGtEIf3oEmB1tEop1KyKG4d
         CkWMTjCb5d+gZQZdmvggnKYnDyd9/L++XGKi7khuNSqEu7dkMvshuanwLvCHhFoqgf+l
         R2Tl975qVDswKyTSKaWOoRzvu2dRmAMGl0qhVAdQ8fR1X14gH096OayPYAxJof80cqN8
         gLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KZgfiEzIPvsgTFxoIStVxbrN1vw78Fru0mAoJ7v9Q38=;
        b=eSwX3DZHRRvm+p87MG62hU20GrGJK63Wcyoe0FlX/9DcdGd9pksWArDBMtnGT7tYAd
         lLR07uYx1XcVRt5X9TwXhYh9BI4VuvvbQ8F2K7W23MMmr9BonhGv2G0QASj907RtZ7f2
         sMvOfVHg1+IEOKr+SK7yedxfFWHoMaZOwBBpHvmdvNqxDfsY8MFIWlRN+amoMma7B83X
         w+XCf1dhM5PWeqLEp+htPf0vneSXMakKkO7hSgVG7QGnge6gr4D8Y3MmU8BGiI4bTdOt
         svzk8vlqKh5HOMsfEva4ZKSyI9GutOEUUL/MYgoZKEGXLLDIqMlOwsf72gwAu0bQWG4i
         /ygw==
X-Gm-Message-State: AOAM530xVPkso/ieeRgM/7KI8jmlfLtGFP8SVXSV3sV9jOuTfLZ2H5zD
        I4ZgG7rLsJqXjsTo7PNE1M0=
X-Google-Smtp-Source: ABdhPJwP2eDcCNOHj+jbX58H/KMkHnEV1mkrlpdFs13/Y4d0vhEg0tcECDTbxxEeUxCr2wSLODYBfg==
X-Received: by 2002:a62:d447:0:b029:291:19f7:ddcd with SMTP id u7-20020a62d4470000b029029119f7ddcdmr9437698pfl.54.1621590180094;
        Fri, 21 May 2021 02:43:00 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id g202sm4091931pfb.54.2021.05.21.02.42.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 02:42:59 -0700 (PDT)
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
Subject: [PATCH v7 0/4] Check codeSigning extended key usage extension
Date:   Fri, 21 May 2021 17:42:16 +0800
Message-Id: <20210521094220.1238-1-jlee@suse.com>
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

v7:
- Fixed the broken function call in is_key_on_revocation_list().
  (be found by kernel test robot)
- Use a general name check_eku_by_usage() instead of check_codesign_eku().

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

 Documentation/admin-guide/module-signing.rst |  6 ++++
 certs/Makefile                               |  1 +
 certs/blacklist.c                            |  6 ++--
 certs/system_keyring.c                       |  4 +--
 crypto/asymmetric_keys/Kconfig               |  9 ++++++
 crypto/asymmetric_keys/pkcs7_trust.c         | 43 ++++++++++++++++++++++++++--
 crypto/asymmetric_keys/x509_cert_parser.c    | 25 ++++++++++++++++
 include/crypto/pkcs7.h                       |  4 ++-
 include/crypto/public_key.h                  |  1 +
 include/keys/system_keyring.h                |  7 +++--
 include/linux/oid_registry.h                 |  5 ++++
 11 files changed, 101 insertions(+), 10 deletions(-)

-- 
2.16.4

