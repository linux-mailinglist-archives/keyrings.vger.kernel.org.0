Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA9A38DF1D
	for <lists+keyrings@lfdr.de>; Mon, 24 May 2021 04:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhEXCRr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 23 May 2021 22:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhEXCRr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 23 May 2021 22:17:47 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E868BC061574;
        Sun, 23 May 2021 19:16:19 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t193so18984847pgb.4;
        Sun, 23 May 2021 19:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=REpFUlwG9YyO4uUcvzf9xd7mKCJ1K3fsaXFmDtloqeU=;
        b=EAqPI2htLPLB05N5AW8/lIAtfkVMsUi2eQ4x2423BT6z5z+mpYn4DiMzpeZxrP3UFW
         m58RqJfD6XE/dgsB/+tkaL+5uBL94jpbMmElA/aUaFmy6gihjh8CEPzugJlTpbDzVev7
         42Dwh8yFJezBd8QH05KOPnUJYGHGNoRdebqKxpYPxvi9b9J3ULEk1xCHy7fXf+ZkN0wE
         R+lbllDQ5BLWthUF5MMxInlV7Z1lxYGOACCrqRvU3oFmcXADkCMSeIpqmU0fQtHkPYq4
         +yizZ6IfUEE95O9GL4BOHpDrMczqB1AdIzTP5EoiPJwcpI2yzo21QudgMYN4JW91ii5v
         4NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=REpFUlwG9YyO4uUcvzf9xd7mKCJ1K3fsaXFmDtloqeU=;
        b=DcywDF62c2mmpXyo0Mz1KqTC7LTH6WRIeEYPCD+z9YUJsIdWFe7FjvGkscGofz5sJa
         EzXnfrw9w4UsHE9H1YOmh3f2SCa0Vn/IvRbxk48thdBNnIs/znTReCLpRsYbYwEJL1Q2
         YeRBOGD36ZYu5nql++aq4L+HVTcJCWeo2g2HLQ0MUdKPT3/DGRIY0O/f4p9KXhpCmhD8
         DcCJYr9j0IRyOuybBjdzFSwK+Vk9ZT+A4/Xb+1F/EgWBEk/ryGlQQGB3sSI2dW0XStwo
         GAJkCUtDd+9oCIl6jNMX8aiEl2kwwfupdmSfmFOiuCSU/ZlPeYOQXNg6oM4HakdAOepA
         tBCA==
X-Gm-Message-State: AOAM5300xoNuEMwLrmzAkaG1GQ29VOut67leuJ7po8a9v/Loe1vYmSDg
        bWY2A36BK1m8Ed3VQ9WQM7Q=
X-Google-Smtp-Source: ABdhPJzhuNImg6uhg4chPxDmo1i2mCfi/irL8NnoGd7Ba6/yD0EosWRSgOKoTcGmTO9pa1OUCkG6jg==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr11039211pgh.255.1621822579282;
        Sun, 23 May 2021 19:16:19 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id h1sm9474960pfh.72.2021.05.23.19.16.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 May 2021 19:16:18 -0700 (PDT)
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
Subject: [PATCH v8 0/4] Check codeSigning extended key usage extension
Date:   Mon, 24 May 2021 10:15:36 +0800
Message-Id: <20210524021540.18736-1-jlee@suse.com>
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

v8:
- Fixed the bug of is_key_on_revocation_list() when
  CONFIG_SYSTEM_REVOCATION_LIST is not set. 

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

