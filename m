Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2966D26DDB1
	for <lists+keyrings@lfdr.de>; Thu, 17 Sep 2020 16:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIQOMs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 17 Sep 2020 10:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbgIQN6l (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 17 Sep 2020 09:58:41 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB39C061A31
        for <keyrings@vger.kernel.org>; Thu, 17 Sep 2020 06:47:44 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f1so1135079plo.13
        for <keyrings@vger.kernel.org>; Thu, 17 Sep 2020 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+R0CfwNbMgOaTG4ScznT7OJX0b8ugIojVEfeSnnqNTc=;
        b=zfzwax3PpdhSOHwd1Dziyh/EVuvLFMJgWgUyuNomMMIfOy+ltMgttpjv2PkG0QUrMg
         VQ4tkC9yB0StxHOspic8lBEaytG89CvgXfNpG01BM65wRcafv1kgrlPLj2GCQY94wTgE
         zMNTKBDl6YPTGmySD1a74bYQ5eCzuSljS+Xze4jq2M4G23zm2MM6oTyfwCwJdDnwWzFS
         hSRNWA3rzc6ZJT5GuNLKkUue9ferEZlkW82DuXD+E8Su8oaJCTy5uj93w/vR2eM1e+LZ
         OdZsqPF0JYLGzk0yeFhD0uDG4zhhs/QSWomdvTcDXSvQQtWEbM9IysNVgavJZt0qoVNB
         SByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+R0CfwNbMgOaTG4ScznT7OJX0b8ugIojVEfeSnnqNTc=;
        b=Hz7rJeeNmVXqtxoP6fIJC2CPKocSldlyh6d7+JMI2hBVWM2gmb9xWv587txQ8eb8GI
         BdKjzsw/O0+SqQpjGoD7yhEwO+dhmQZRMMPsjVxSYe8Tmu/QiMV3jWRqe34IEBU91diz
         Euy+gTLKZ7hb7n7ni++Mnaiuz8Zu69xpIzTmApqj2vA3Jsihzs9xjfkuW57pcdJk8nJR
         iEKqeYJuZmINjBYITaIK+AJLnQl2rIObtjsxymNM7wkSUOqgn2q7UJr4qeVpB4wCpdH5
         7rTZltVCsQLi+xvgLsXy38Bfg3lfXQcZmiGlEr6rK4lQWt3920SuuN5NFpjJNQkYRzBa
         2t3w==
X-Gm-Message-State: AOAM532uqgqycMJMPVUyBVOegrGuBEv1F+1mr/3zIB4pqbdBttPAYbMV
        26Jhl6ljEpoHanyvQUlU+853bQ==
X-Google-Smtp-Source: ABdhPJyvy8jjWm23ZilkLS4jB5OQY9gVJSrgQpws0JzwxO3vK5veKrElGyPGUmVKb+AhTbMGL/UX9g==
X-Received: by 2002:a17:902:8305:b029:d1:cbfc:79b7 with SMTP id bd5-20020a1709028305b02900d1cbfc79b7mr17679996plb.33.1600350464395;
        Thu, 17 Sep 2020 06:47:44 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.163])
        by smtp.gmail.com with ESMTPSA id i73sm6821120pfe.67.2020.09.17.06.47.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2020 06:47:43 -0700 (PDT)
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
Subject: [PATCH v6 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Thu, 17 Sep 2020 19:16:38 +0530
Message-Id: <1600350398-4813-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600350398-4813-1-git-send-email-sumit.garg@linaro.org>
References: <1600350398-4813-1-git-send-email-sumit.garg@linaro.org>
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
index 0d0862b..0a913ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9668,6 +9668,14 @@ F:	include/keys/trusted-type.h
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
 M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
-- 
2.7.4

