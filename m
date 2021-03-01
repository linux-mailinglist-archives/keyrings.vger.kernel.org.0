Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D08327F39
	for <lists+keyrings@lfdr.de>; Mon,  1 Mar 2021 14:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbhCANPC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 1 Mar 2021 08:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbhCANOL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 1 Mar 2021 08:14:11 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE684C061225
        for <keyrings@vger.kernel.org>; Mon,  1 Mar 2021 05:12:32 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id jx13so7664798pjb.1
        for <keyrings@vger.kernel.org>; Mon, 01 Mar 2021 05:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWiPMXwn3gmi5tE/BsLZ0fTWfjt2JeF5/8qMYxmhPG0=;
        b=lkEMe34NOXAXHVDobc7XIS6o44WJss7bx3/LR/HdJ9E4ubW95Bm3fS9X3rbFjN5eiP
         WTP9oub5Ors7LVqzkCQXvH1isxqS/HAaReHUYaFHnzyNkQ+UN7QvgYSDtniE1OODcnFW
         Lktu+b4b5HHkZUE1tXNKPPbvP4qJ9iYAvcJL9xz1PqIuxkLxN9uaSz73UEsM7IZLB1dm
         9TI7j+4MKVs7i7FIlUUG8gXqDHZD+Zv2UQbcbOG7h78U0MySGXU3hfaOeYtc13TSuOJL
         Zeq3jJkggdaT4XPySllOfq1zBVaxhQMu7r9AmgalYhXxcGyBB1Mgd1RWpWhvSL1EAzPM
         DlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWiPMXwn3gmi5tE/BsLZ0fTWfjt2JeF5/8qMYxmhPG0=;
        b=RqJEKowGuf6JJzXoFuF4EA0UnY7cddo2pDm+Juz5OhuuNwim+lXX9zSIMBXzS+8XQm
         cvr7IbdtS6BfIFXCUYyacTucN9E0zeG5R0b9QuZW+8NIKhdMPIO5MfFN6GmdQ05pO8GR
         m07eHf3mvkGG88WOH7bm5SabVrVQEkhKalNMAGIoPSpa4a+udg/X+DAb71rJzoEBdNSa
         vTgC5sJWXoUABJbhWC2w9XF2wU6jeHaqgPaivxP3LZLjNdu3smFWADs+m8qZ/3+D5VSV
         o0hsIUp+WfgYZjZNgjr+O0WT7SzxqyS5bV0KnvnQf1HJhaxvHbJHF4nbfaayEZXToqsI
         YVVg==
X-Gm-Message-State: AOAM532Iu9b88hEQ+L8Ks4fciv4d+01OcFMh7IHaPTBkA+TRncBFT9n5
        IWZVk0I2ii27JjV22E9C3PgQsQ==
X-Google-Smtp-Source: ABdhPJwUh+78uxw2zFdmilmZHl/2nxyQOYa0iiKeGmBw+QuVa9K1P80A9CmJ4bH/2re6N0wXyIHU5g==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr8145342pjg.164.1614604352338;
        Mon, 01 Mar 2021 05:12:32 -0800 (PST)
Received: from localhost.localdomain ([110.226.35.200])
        by smtp.gmail.com with ESMTPSA id b3sm13964523pjg.41.2021.03.01.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 05:12:31 -0800 (PST)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jejb@linux.ibm.com
Cc:     dhowells@redhat.com, jens.wiklander@linaro.org, corbet@lwn.net,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        janne.karhunen@gmail.com, daniel.thompson@linaro.org,
        Markus.Wamser@mixed-mode.de, lhinds@redhat.com,
        erpalmer@us.ibm.com, a.fatoum@pengutronix.de,
        keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v9 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Mon,  1 Mar 2021 18:41:27 +0530
Message-Id: <20210301131127.793707-5-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301131127.793707-1-sumit.garg@linaro.org>
References: <20210301131127.793707-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add MAINTAINERS entry for TEE based Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d75afad615f..eb1ac9c90f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9830,6 +9830,14 @@ F:	include/keys/trusted-type.h
 F:	include/keys/trusted_tpm.h
 F:	security/keys/trusted-keys/
 
+KEYS-TRUSTED-TEE
+M:	Sumit Garg <sumit.garg@linaro.org>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_tee.h
+F:	security/keys/trusted-keys/trusted_tee.c
+
 KEYS/KEYRINGS
 M:	David Howells <dhowells@redhat.com>
 M:	Jarkko Sakkinen <jarkko@kernel.org>
-- 
2.25.1

