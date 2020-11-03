Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662442A4AAB
	for <lists+keyrings@lfdr.de>; Tue,  3 Nov 2020 17:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgKCQDM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 3 Nov 2020 11:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbgKCQDM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 3 Nov 2020 11:03:12 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FC8C0613D1
        for <keyrings@vger.kernel.org>; Tue,  3 Nov 2020 08:03:11 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id x23so8772286plr.6
        for <keyrings@vger.kernel.org>; Tue, 03 Nov 2020 08:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zDggAsDI739UznsdJGV123TENJ6R94pJsrrMJ096A5w=;
        b=Yogn/KZ7ijrqJ0T2z6E6jJ/rsJS/CsbY+bDuFIpVxXfqjMcWW2r08cwmXmAnkPO8Zk
         c7p/xjaHTOXmoh8uNv5PKN9wLS4o5WIjsMHsU1kQq5RaEOxjg0bxrN7YquTnw/jETLzN
         6O2kQyddalRqkFMq+FMzq6T1IBEUisid1qQEJQGyA09dLUaAvuP+4K8B6p04KoC/t/yB
         dY4VycxSHAP9qayaKCSYcfYI4XUqe8Z6W/dVieZiJG51iCGiehSC/g42n2M4ylVHfJhE
         gz+Q5wKalOZ/rS17Pyx2kfsZINr2mm7Q13P09PN8q5rP4/huSmsGxOCUU2wKZv1EorO5
         8GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zDggAsDI739UznsdJGV123TENJ6R94pJsrrMJ096A5w=;
        b=dOOiXAuu5G2Q/t1pDnPWUvthTnWevXNKgX1BrHILtgNX7VD6B83vthDKgIVSXd/iRW
         S7yobBYvXJRHTg1iJryDC75A7dmufKJtj2r6/ykuzMRxzbD3GvoSV+BXjY9zlC/hdWBY
         S2xUsU1uLrDq4924XK+78Pyn1AWAHqWyIX/8asOAEQLcHawK9GZKVnZwieESMqhQj0iQ
         3qtlsVuzXbvYI4AJm6O8xltKd18iyGrRPtT9KW9grlx7C+3T5W2Dm9ZY7lHVjEOSFCm3
         81WreadeQhKlVNxDBWO5MNOfNyCDbCufuRZJPUdAmwBhceOSaIGG4R4xT0/Am1QjY449
         XQxQ==
X-Gm-Message-State: AOAM5313wYj5YLjA1tlXkIUa+1PyiFQ4WUD+ukF9CZbZ9pdX0budmQaX
        tRf9tOTysvLzn3nmh9wG6Tniww==
X-Google-Smtp-Source: ABdhPJzq35Qf86wUQrahPKwseE7thoRB6fMPDxpfeiSBGzmY3jo07CAGFTuARsNI+6+8+yZsb+pOVQ==
X-Received: by 2002:a17:902:6942:b029:d6:18b0:8a with SMTP id k2-20020a1709026942b02900d618b0008amr25452573plt.23.1604419391553;
        Tue, 03 Nov 2020 08:03:11 -0800 (PST)
Received: from localhost.localdomain ([122.173.169.225])
        by smtp.gmail.com with ESMTPSA id j140sm8471006pfd.216.2020.11.03.08.03.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2020 08:03:10 -0800 (PST)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jejb@linux.ibm.com
Cc:     dhowells@redhat.com, jens.wiklander@linaro.org, corbet@lwn.net,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        janne.karhunen@gmail.com, daniel.thompson@linaro.org,
        Markus.Wamser@mixed-mode.de, lhinds@redhat.com,
        keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v8 4/4] MAINTAINERS: Add myself as Trusted Keys co-maintainer
Date:   Tue,  3 Nov 2020 21:31:46 +0530
Message-Id: <1604419306-26105-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604419306-26105-1-git-send-email-sumit.garg@linaro.org>
References: <1604419306-26105-1-git-send-email-sumit.garg@linaro.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add a Trusted Keys co-maintainer entry in order to support TEE based
Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b..52687bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9732,11 +9732,13 @@ KEYS-TRUSTED
 M:	James Bottomley <jejb@linux.ibm.com>
 M:	Jarkko Sakkinen <jarkko@kernel.org>
 M:	Mimi Zohar <zohar@linux.ibm.com>
+M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
 L:	keyrings@vger.kernel.org
 S:	Supported
 F:	Documentation/security/keys/trusted-encrypted.rst
 F:	include/keys/trusted-type.h
+F:	include/keys/trusted_tee.h
 F:	include/keys/trusted_tpm.h
 F:	security/keys/trusted-keys/
 
-- 
2.7.4

