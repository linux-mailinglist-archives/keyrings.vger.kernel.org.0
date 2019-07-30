Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8127A829
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2019 14:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfG3MY1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 30 Jul 2019 08:24:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38233 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfG3MY1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 30 Jul 2019 08:24:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so29771378pfn.5
        for <keyrings@vger.kernel.org>; Tue, 30 Jul 2019 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6ZePv7NXstL+Sqt4m1uBMWD7mL3/ZMzlrVfaZ2NvhzM=;
        b=lB6yIwwCNSDjrWVykyeL4K++VnFNec4YxgddVvaRS4/R/0oHWt7LQVpKqdjpAASjgc
         0iPKuYv15NgUSHfKLcA6CR1Nt0rx5zAGcXi/FyaiI3Xda53pvauMaNAfx/1m2rxCwa0Z
         crzWacGPYYLLS5WXzVHnAOSrRG2imu9I/H7H4MXZIRTWu2zC2Zr5jM99w2uIL74nv9o2
         i3GLJevzUkxAKOe8KmddtnXsoghJmrXz7PF7/cL5Ph7z9nx8OAyBwxbwRwYd+OQInO1o
         tw9DWp8rvkv2AIt4K5pjZmJc0yRBKpJaeeStReenRYdnj1+Iiz60kQljwoVnlels7CqU
         z9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6ZePv7NXstL+Sqt4m1uBMWD7mL3/ZMzlrVfaZ2NvhzM=;
        b=J5ha6HyUqhFdaLy2Wb05aIjjRmB3roUgIiUgtblnuNtjOD5eork5CFdnSLAbEQkFis
         rmBhf4bFcIzsv5vElJs6HVkeZrpbrQTFv42p0djM2ISItp/gzQsICUOfIgeoxg+AJrt+
         H/90j2ai+3Hgn7kH2IjA3ISE3ZEELyiVYcmpb/VPDSw37cHBJW63QX7x0CF5yWnAcKM3
         HBekXBw2klf/20hJsLvWoIg6r7gD02E5j9r2VmqVxJzw5ZcYEnMNYApWz/ImLxsF4Hr6
         ucmJ7QIOCkmvQ+zHr5cJBz2jaygBps+rzS7nGvd4NyMvttSpAWOpj/gXuF65wr0gwU9Z
         YQ6w==
X-Gm-Message-State: APjAAAU0u0Orr7nDXFwyfAEdBHQ4hoQDDQynWo/no4MJonu27Y/4Vm9i
        VFmkehU4iXETd2QfhEiLawqD1AgLRqU=
X-Google-Smtp-Source: APXvYqzz0ouwcr+qO6OuAcn5WOt/R6U7643Qf7Q0IRtZgQR9bhTL3t8PR7Ke8ewd4iiIWjlDBn2OnQ==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr117801760pjt.107.1564489465898;
        Tue, 30 Jul 2019 05:24:25 -0700 (PDT)
Received: from localhost.localdomain ([45.114.72.197])
        by smtp.gmail.com with ESMTPSA id v8sm54895462pgs.82.2019.07.30.05.24.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 05:24:25 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        casey@schaufler-ca.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC v2 0/6] Introduce TEE based Trusted Keys support
Date:   Tue, 30 Jul 2019 17:53:34 +0530
Message-Id: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add support for TEE based trusted keys where TEE provides the functionality
to seal and unseal trusted keys using hardware unique key. Also, this is
an alternative in case platform doesn't possess a TPM device.

This series also adds some TEE features like:

Patch #1, #2 enables support for registered kernel shared memory with TEE.

Patch #3 enables support for private kernel login method required for
cases like trusted keys where we don't wan't user-space to directly access
TEE service to retrieve trusted key contents.

Rest of the patches from #4 to #6 adds support for TEE based trusted keys.

This patch-set has been tested with OP-TEE based pseudo TA which can be
found here [1].

Also, this patch-set is dependent on generic Trusted Keys framework
patch-set [2].

[1] https://github.com/OP-TEE/optee_os/pull/3082
[2] https://lkml.org/lkml/2019/7/18/284

Changes in v2:
1. Add reviewed-by tags for patch #1 and #2.
2. Incorporate comments from Jens for patch #3.
3. Switch to use generic trusted keys framework.

Sumit Garg (6):
  tee: optee: allow kernel pages to register as shm
  tee: enable support to register kernel memory
  tee: add private login method for kernel clients
  KEYS: trusted: Introduce TEE based Trusted Keys
  doc: keys: Document usage of TEE based Trusted Keys
  MAINTAINERS: Add entry for TEE based Trusted Keys

 Documentation/security/keys/index.rst       |   1 +
 Documentation/security/keys/tee-trusted.rst |  93 +++++++++
 MAINTAINERS                                 |   9 +
 drivers/tee/optee/call.c                    |   7 +
 drivers/tee/tee_core.c                      |   6 +
 drivers/tee/tee_shm.c                       |  16 +-
 include/keys/trusted-type.h                 |   3 +
 include/keys/trusted_tee.h                  |  66 +++++++
 include/linux/tee_drv.h                     |   1 +
 include/uapi/linux/tee.h                    |   8 +
 security/keys/Kconfig                       |   3 +
 security/keys/trusted-keys/Makefile         |   3 +-
 security/keys/trusted-keys/trusted-tee.c    | 282 ++++++++++++++++++++++++++++
 security/keys/trusted-keys/trusted.c        |   3 +
 14 files changed, 498 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/security/keys/tee-trusted.rst
 create mode 100644 include/keys/trusted_tee.h
 create mode 100644 security/keys/trusted-keys/trusted-tee.c

-- 
2.7.4

