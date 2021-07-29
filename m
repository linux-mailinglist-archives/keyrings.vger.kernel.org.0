Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0833DAAF0
	for <lists+keyrings@lfdr.de>; Thu, 29 Jul 2021 20:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhG2SeP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Jul 2021 14:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhG2SeP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Jul 2021 14:34:15 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A5CC0613D3
        for <keyrings@vger.kernel.org>; Thu, 29 Jul 2021 11:34:11 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m20-20020a05600c4f54b029024e75a15716so4684051wmq.2
        for <keyrings@vger.kernel.org>; Thu, 29 Jul 2021 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ndpw+PbnRaSxxnGPYwf+7x2VYYi7mMPrexiG91YMR7M=;
        b=MP/oa+Z4eaQicBo2B3IhtWp8wnc3+EOxvkxF+R8qoTCJevNJosYcsfol5GcHQ04mL6
         RL+oiSW9fq73iBFZiPsJuQoqVw/KwJPAbagjyY54WSFIskppPNokJggOEHkWcxt1P2Ll
         KWr079wVWc6G7rRAIck8FvKERX4kWLlFPoUx+6MomULySTp824WugLSBrGvlQ4rSOGs4
         F23bAJRUz7rR9+Ivt/amAywoGXdmYA9TyYUZ6/4b2UdunX91LBCEFQG+lQ/KQj/X8eM0
         SlcIz1+eV0TOXZbn7AjcmD6a4u0BYrUPJebQoZbMhqMCqKCtjN0Nz5Aq2G9+d/CjaORA
         hlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ndpw+PbnRaSxxnGPYwf+7x2VYYi7mMPrexiG91YMR7M=;
        b=SUy9N8fh69n54SvwLC2wcBCGLvx6hTFbwt+kI71XzeIyuCsTuATcmUB0w2cXUN2bVK
         XmmZtpZcX8FB/d/BL06GxukRj9McyIWR7+BvYYOjB3wW1pT67jD5t/cUvJscawgnBZuJ
         WAEEVYycwyLYQlS23oiAQF/+Ab0h7ilwZbQgP1BLtKpbJayqVcqB3xIk+UKWDqgL22/B
         ENR0ERf+a69cfKxg/iIiv+Vj1/cKS1oPDqSIqk/d8ijtsQ3mpO71IIiyAN+xkUQzARcM
         bztIt67ZJMM+INnnEDzz2lCIm/D3+91GJJcOPd34EsGwuvv8ZiglmcFsyupuKoI6n/iq
         NUUw==
X-Gm-Message-State: AOAM533LNgyionasz3koP2Z+49LkTjmcigtVxdiSRqmX9vIlAZyOfY5M
        uaUZpstWtD+QzqOfoFy5ytca+w==
X-Google-Smtp-Source: ABdhPJyw+C9zeJrNdLqT1RyupxaRB35i4i/1b+y3wzRoUuU54pQD8LDvOPZyQRjtVpP/QlsQa/QfjQ==
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr5952796wmq.105.1627583649738;
        Thu, 29 Jul 2021 11:34:09 -0700 (PDT)
Received: from localhost ([2a00:e67:5c9:a:6941:c1d7:e420:cc22])
        by smtp.gmail.com with ESMTPSA id y197sm10563444wmc.7.2021.07.29.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 11:34:08 -0700 (PDT)
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
Subject: [PATCH v2] KEYS: trusted: Fix trusted key backends when building as module
Date:   Thu, 29 Jul 2021 20:33:32 +0200
Message-Id: <20210729183333.1070629-1-andreas@rammhold.de>
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


v2:
* Fixed commit message
* Switched from IS_DEFINED() to IS_REACHABLE()


Fixes: 5d0682be3189 ("KEYS: trusted: Add generic trusted keys framework")
Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
---

Here is the version that was proposed by Ahmad [1] in response to the
feedback received in the "[PATCH v2] KEYS: trusted: fix use as module
when CONFIG_TCG_TPM=m" discussion [2].

I have tested both of the patches on v5.13 and they both fix the problem
I originally encountered.

[1] https://lore.kernel.org/keyrings/fe39a449-88df-766b-a13a-290f4847d43e@pengutronix.de/
[2] https://lore.kernel.org/keyrings/20210721160258.7024-1-a.fatoum@pengutronix.de/


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

