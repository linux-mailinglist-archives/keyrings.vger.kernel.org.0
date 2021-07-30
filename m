Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA4D3DB0A5
	for <lists+keyrings@lfdr.de>; Fri, 30 Jul 2021 03:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbhG3B3B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Jul 2021 21:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbhG3B3A (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Jul 2021 21:29:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E72C0613C1
        for <keyrings@vger.kernel.org>; Thu, 29 Jul 2021 18:28:55 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z4so9091857wrv.11
        for <keyrings@vger.kernel.org>; Thu, 29 Jul 2021 18:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6s2TSTlPwvNTpp6+kKrGqk3jPYCGOkNqfSKjIV/XnM=;
        b=uNoDr8WpoTnjj/sNmkYAFxLSlsiyomOrmpVbWgsoacpx/vxImmMdnAXf6BE8qaplr7
         W5Es1ChuRLsxy1l0Dc3Me/TELxfQYDsw5NiMmuCadFZe/pE5DpYc9S7TkhKSHqv9j1Fd
         Tec5G1zIl/doDQYKJJSkBPemoBOgm2cOyQfe9KBJc2vNcNAJFi/XKsM5+6UOWa7DBS9w
         tWXWPxpD7IOgqp0yRi/4ant5qGeMOkW+sRzlTHqrW3HpLjiX9EQmHbbiDn+RLDFj/BKI
         GVlpM7iZE276IEqs8t7nX0NiFLkjyLTGWlT1UGV2G1HyfqO28DBS2atO3Gadwuzf96vT
         nAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6s2TSTlPwvNTpp6+kKrGqk3jPYCGOkNqfSKjIV/XnM=;
        b=miHrwnxz+mKfp3hujC3xw6VNKARj+P1zwLPSAZYV1TcE87L3ZuDP2dqyB4g0alZ//B
         x9ZW2oWqZmYQszZd5pIBlSDtySYyAMI+RKq0gJ63P48TVH4/oCINSw9yU+FJaO9aJQb1
         G7Vb/zt4kibRyOdCCmpQqLi6LRgOdP2BC1aoGsEkl0mXvQ8tHycpan0VDdxu4iB7vztq
         sUp1t3Pq5Mn7zAxThGZyQCKVVdxVKgwdIG+nQWq3roda8mVOf1LvEo3KSttN1HMjRk+P
         ZtSX2wI+QieRypFsX+CptoY7QYjn9ueuRBkmyMZKHYrBXr/klTKY1vqB1QrlsTiVgmUC
         m3Yw==
X-Gm-Message-State: AOAM533ia+8OwGaRzb6ivzILuO0/GjiUTIE8OuUCyvHixL4HF1xWGXfr
        1TlBn/WIlxmg3247uq3tlRow4Q==
X-Google-Smtp-Source: ABdhPJyHnOoXfOPRb/4c+gAQ5nIYhqWSxF1mr4VIj5yHpm+99L2yYa49rFFUTmMvoEpInRDuFQcqNw==
X-Received: by 2002:a5d:5685:: with SMTP id f5mr221899wrv.369.1627608533781;
        Thu, 29 Jul 2021 18:28:53 -0700 (PDT)
Received: from localhost ([2a00:e67:5c9:a:6941:c1d7:e420:cc22])
        by smtp.gmail.com with ESMTPSA id m14sm5019325wrs.56.2021.07.29.18.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 18:28:53 -0700 (PDT)
From:   Andreas Rammhold <andreas@rammhold.de>
To:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Sumit Garg <sumit.garg@linaro.org>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andreas Rammhold <andreas@rammhold.de>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] KEYS: trusted: Fix trusted key backends when building as module
Date:   Fri, 30 Jul 2021 03:28:22 +0200
Message-Id: <20210730012822.3460913-1-andreas@rammhold.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Before this commit the kernel could end up with no trusted key sources
even though both of the currently supported backends (TPM and TEE) were
compiled as modules. This manifested in the trusted key type not being
registered at all.

When checking if a CONFIG_… preprocessor variable is defined we only
test for the builtin (=y) case and not the module (=m) case. By using
the IS_REACHABLE() macro we do test for both cases.

Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

---

v3:
* Fixed patch formatting

v2:
* Fixed commit message
* Switched from IS_DEFINED() to IS_REACHABLE()

 security/keys/trusted-keys/trusted_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
index d5c891d8d353..5b35f1b87644 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -27,10 +27,10 @@ module_param_named(source, trusted_key_source, charp, 0);
 MODULE_PARM_DESC(source, "Select trusted keys source (tpm or tee)");
 
 static const struct trusted_key_source trusted_key_sources[] = {
-#if defined(CONFIG_TCG_TPM)
+#if IS_REACHABLE(CONFIG_TCG_TPM)
 	{ "tpm", &trusted_key_tpm_ops },
 #endif
-#if defined(CONFIG_TEE)
+#if IS_REACHABLE(CONFIG_TEE)
 	{ "tee", &trusted_key_tee_ops },
 #endif
 };
-- 
2.32.0

