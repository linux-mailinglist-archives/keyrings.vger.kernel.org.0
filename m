Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDFD1C6D32
	for <lists+keyrings@lfdr.de>; Wed,  6 May 2020 11:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbgEFJk4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 May 2020 05:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729139AbgEFJk4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 May 2020 05:40:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED5EC061A0F
        for <keyrings@vger.kernel.org>; Wed,  6 May 2020 02:40:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so689162pfw.13
        for <keyrings@vger.kernel.org>; Wed, 06 May 2020 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vD1UqfrD+8G67ZG0pk7nKVe25aWfDdDdLHrnvf7jzfU=;
        b=KvJRJi6qOtrX/rBOoQsTZLUkSfBvQdu9h/4+EdVDDs/J5byw2E0mzoUXp1eC8Orvze
         q6hqPkGcts5lTQBw0D4S/Cz+jaHQk2n1hN66o+ukcLOY5WugjSP3Gz71wnJLxfwJorMs
         /c0teWN45OseabH/vQt+QAymLDwGbjghnKAd49dd6OJMvACLLa4ZYGSYuXrDhUFAp5OL
         +sAF3mfRpF3rYSErIO3gvJ29sKlVxhnDWgxaUyoGfiIE7i/dIT+wLTUMyg3PMFvH4eRJ
         VwWLQvxVbPKruzO51E/y07VAGO+uEFEe/igxqcdakVkJigWCn4vZDWQsLejTBLdYx2Dy
         E6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vD1UqfrD+8G67ZG0pk7nKVe25aWfDdDdLHrnvf7jzfU=;
        b=rz/Xrk9ZS6ZvDzK8KfpY+kP9ZVH5iF5mUXPqU8lKP/aYDIENG/mGe87F5I4BsNM4zJ
         Dy0sJe3ZfUlpR6Z5P88N4SId9jxggA/hyGtJH3tDHj7H5D4gZ5E/bdJ0h8PvBK8b6y52
         U/Xa/0pTrMaJ1aKRgUtYTNs9ByqeGgK0ACZ/3p1X0WLGVOY9lrIZ65xh2Ufj+aX+HaPV
         8ZffLEECvR/PjWQPyNZHc9eVdme4NWfNUchSQP5ii/ili0xr7htmeiNTP/kbUCSdYEHt
         jjyN7/BkquvNF/8uCoS+1DDH+y21BaprMvmc1qJuQFmcZiwzvXIFHcZEMpFnCw6dkcI2
         nxOQ==
X-Gm-Message-State: AGi0PubfXcIdgmuBGJ/NDYncmzFBDaIqLJgbYXr/xP6bQhvCFz1HnUAT
        pErQk/Fv497ucxBXj3bJH96YrQ==
X-Google-Smtp-Source: APiQypIrk3bnOWjBbptmchGrzTVPv9yWszHBj3wqvJUotuBAP7f8mseJIJrPRksgRfu5mw3a49jKrA==
X-Received: by 2002:a62:68c1:: with SMTP id d184mr7216402pfc.138.1588758054382;
        Wed, 06 May 2020 02:40:54 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.141])
        by smtp.gmail.com with ESMTPSA id a2sm1337360pfg.106.2020.05.06.02.40.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 02:40:53 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jejb@linux.ibm.com
Cc:     dhowells@redhat.com, jens.wiklander@linaro.org, corbet@lwn.net,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        janne.karhunen@gmail.com, daniel.thompson@linaro.org,
        Markus.Wamser@mixed-mode.de, keyrings@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, tee-dev@lists.linaro.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v4 0/4] Introduce TEE based Trusted Keys support
Date:   Wed,  6 May 2020 15:10:13 +0530
Message-Id: <1588758017-30426-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add support for TEE based trusted keys where TEE provides the functionality
to seal and unseal trusted keys using hardware unique key. Also, this is
an alternative in case platform doesn't possess a TPM device.

This patch-set has been tested with OP-TEE based early TA which can be
found here [1].

[1] https://github.com/OP-TEE/optee_os/pull/3838

Changes in v4:
1. Pushed independent TEE features separately:
  - Part of recent TEE PR: https://lkml.org/lkml/2020/5/4/1062
2. Updated trusted-encrypted doc with TEE as a new trust source.
3. Rebased onto latest tpmdd/master.

Changes in v3:
1. Update patch #2 to support registration of multiple kernel pages.
2. Incoporate dependency patch #4 in this patch-set:
   https://patchwork.kernel.org/patch/11091435/

Changes in v2:
1. Add reviewed-by tags for patch #1 and #2.
2. Incorporate comments from Jens for patch #3.
3. Switch to use generic trusted keys framework.

Sumit Garg (4):
  KEYS: trusted: Add generic trusted keys framework
  KEYS: trusted: Introduce TEE based Trusted Keys
  doc: trusted-encrypted: updates with TEE as a new trust source
  MAINTAINERS: Add entry for TEE based Trusted Keys

 Documentation/security/keys/trusted-encrypted.rst | 203 ++++++++++---
 MAINTAINERS                                       |   8 +
 include/keys/trusted-type.h                       |  48 ++++
 include/keys/trusted_tee.h                        |  66 +++++
 include/keys/trusted_tpm.h                        |  15 -
 security/keys/Kconfig                             |   3 +
 security/keys/trusted-keys/Makefile               |   2 +
 security/keys/trusted-keys/trusted_common.c       | 336 ++++++++++++++++++++++
 security/keys/trusted-keys/trusted_tee.c          | 282 ++++++++++++++++++
 security/keys/trusted-keys/trusted_tpm1.c         | 335 ++++-----------------
 10 files changed, 974 insertions(+), 324 deletions(-)
 create mode 100644 include/keys/trusted_tee.h
 create mode 100644 security/keys/trusted-keys/trusted_common.c
 create mode 100644 security/keys/trusted-keys/trusted_tee.c

-- 
2.7.4

