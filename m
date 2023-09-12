Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A7779CF8F
	for <lists+keyrings@lfdr.de>; Tue, 12 Sep 2023 13:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbjILLMd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Sep 2023 07:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbjILLLs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 Sep 2023 07:11:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6992E1718
        for <keyrings@vger.kernel.org>; Tue, 12 Sep 2023 04:11:42 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so727350866b.3
        for <keyrings@vger.kernel.org>; Tue, 12 Sep 2023 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1694517101; x=1695121901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMxyxYMtu219LMB4VQwtAfAzEA7xWrv4p6+B3IeeMCg=;
        b=RB9Md7NlopPy6qhyoTLIEklGGL7AteMsFTzJ2pObAafH1jAv3ApAAoF98dEr+Z8inr
         ZGB7RqZB1AL9mlKGNDnB4Zivw/+qBj4ENDjiR5ZEo+P2t3SzOKv8uJrVruwcz6BIWz3p
         +Li9EQB958qRO1g4km5Esobef25kpP13b1aemfcY2bqDbjGG4NIGK3kQuFqvcU/iUu0H
         1FIf6sesuYNfMHKgn6pxFasSCPdeCR7/1TtVqOwgTfGcfAdku1QdjWNUBVLochlfwGlw
         6ssTQRfLmCf1f1+nBJvXw2ZoFRQ3AhF3hbu3/tGGe87CM4dx3trmP9uEQC0pFxDpMUd6
         TZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694517101; x=1695121901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMxyxYMtu219LMB4VQwtAfAzEA7xWrv4p6+B3IeeMCg=;
        b=ovgWsxMTXx9z/1iehJrLl9qd4xD6I4ih6R5LsMtj7Foub1oPOus+F4DdRitSEf8SRP
         5r0FHjIsT5mruxBWU1UiYQNFpZzvpnAoi58Ca37XczXfDUf99Hp3xJ9jxxPvPryAdtpU
         V3+5UYxHoEcSdr/Jdv0fSVwGosTy5ytW5cWm6WWxRFkaF96R9iJ59GnNccbi8oh95Dc1
         qUzaCFNw6hHIYay4ybSehxme8pBzgWaqJ+f4GHg60JfXUm2JoBpazBRPFOYnPbncSI9t
         AJ5VhvLnNclwyBPlEBrWU2254whGB3pfklJwqniCjyDvsfPv7Mn/6wq9Y5epOb2HsWVs
         w8QA==
X-Gm-Message-State: AOJu0YwRuvX5hMZPUdHrWzg3KVksf7HJiGd8cOp+oLEpuvLqclhl8/f5
        VaeYDWzT+aDlc/2315hCPnzf0A==
X-Google-Smtp-Source: AGHT+IGVIXpipGIV3RcKzH1lIoBGyC+f3uy72Hr8eeCBPxmUGKKb6/6xig/ZZuHGDB1u6QZuTruK9g==
X-Received: by 2002:a17:906:2895:b0:9a1:b967:aca9 with SMTP id o21-20020a170906289500b009a1b967aca9mr9945956ejd.63.1694517100748;
        Tue, 12 Sep 2023 04:11:40 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id rp6-20020a170907888600b009a9fbeb15f2sm6393915ejc.62.2023.09.12.04.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 04:11:40 -0700 (PDT)
From:   David Gstir <david@sigma-star.at>
To:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     David Gstir <david@sigma-star.at>, Shawn Guo <shawnguo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        sigma star Kernel Team <upstream+dcp@sigma-star.at>,
        David Howells <dhowells@redhat.com>,
        Li Yang <leoyang.li@nxp.com>, Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Tejun Heo <tj@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-security-module@vger.kernel.org
Subject: [PATCH v2 0/3] DCP as trusted keys backend
Date:   Tue, 12 Sep 2023 13:11:11 +0200
Message-ID: <20230912111115.24274-1-david@sigma-star.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is a revival of the previous patch set submitted by Richard Weinberger:
https://lore.kernel.org/linux-integrity/20210614201620.30451-1-richard@nod.at/

v1 -> v2:
- Revive and rebase to latest version
- Include review comments from Ahmad Fatoum

The Data CoProcessor (DCP) is an IP core built into many NXP SoCs such
as i.mx6ull.

Similar to the CAAM engine used in more powerful SoCs, DCP can AES-
encrypt/decrypt user data using a unique, never-disclosed,
device-specific key. Unlike CAAM though, it cannot directly wrap and
unwrap blobs in hardware. As DCP offers only the bare minimum feature
set and a blob mechanism needs aid from software. A blob in this case
is a piece of sensitive data (e.g. a key) that is encrypted and
authenticated using the device-specific key so that unwrapping can only
be done on the hardware where the blob was wrapped.

This patch series adds a DCP based, trusted-key backend and is similar
in spirit to the one by Ahmad Fatoum [0] that does the same for CAAM.
It is of interest for similar use cases as the CAAM patch set, but for
lower end devices, where CAAM is not available.

Because constructing and parsing the blob has to happen in software,
we needed to decide on a blob format and chose the following:

struct dcp_blob_fmt {
	__u8 fmt_version;
	__u8 blob_key[AES_KEYSIZE_128];
	__u8 nonce[AES_KEYSIZE_128];
	__le32 payload_len;
	__u8 payload[];
} __packed;

The `fmt_version` is currently 1.

The encrypted key is stored in the payload area. It is AES-128-GCM
encrypted using `blob_key` and `nonce`, GCM auth tag is attached at
the end of the payload (`payload_len` does not include the size of
the auth tag).

The `blob_key` itself is encrypted in AES-128-ECB mode by DCP using
the OTP or UNIQUE device key. A new `blob_key` and `nonce` are generated
randomly, when sealing/exporting the DCP blob.

This patchset was tested with dm-crypt on an i.MX6ULL board.

[0] https://lore.kernel.org/keyrings/20220513145705.2080323-1-a.fatoum@pengutronix.de/

David Gstir (3):
  crypto: mxs-dcp: Add support for hardware provided keys
  KEYS: trusted: Introduce support for NXP DCP-based trusted keys
  doc: trusted-encrypted: add DCP as new trust source

 .../admin-guide/kernel-parameters.txt         |  13 +
 .../security/keys/trusted-encrypted.rst       |  85 +++++
 MAINTAINERS                                   |   9 +
 drivers/crypto/mxs-dcp.c                      | 107 +++++-
 include/keys/trusted_dcp.h                    |  13 +
 include/soc/fsl/dcp.h                         |  19 ++
 security/keys/trusted-keys/Kconfig            |   9 +-
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_dcp.c      | 313 ++++++++++++++++++
 10 files changed, 563 insertions(+), 13 deletions(-)
 create mode 100644 include/keys/trusted_dcp.h
 create mode 100644 include/soc/fsl/dcp.h
 create mode 100644 security/keys/trusted-keys/trusted_dcp.c

-- 
2.35.3

