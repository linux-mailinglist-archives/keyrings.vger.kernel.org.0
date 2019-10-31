Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9CD4EB1F5
	for <lists+keyrings@lfdr.de>; Thu, 31 Oct 2019 15:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfJaOAc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 31 Oct 2019 10:00:32 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:44694 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbfJaOAc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 31 Oct 2019 10:00:32 -0400
Received: by mail-pl1-f172.google.com with SMTP id q16so2743548pll.11
        for <keyrings@vger.kernel.org>; Thu, 31 Oct 2019 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vwkM+SzsoiF7YKIoK9DIXcbGL7DR7Z0spQKLzLaNHZQ=;
        b=lwu1b6fl86TKE/CMp25S7IhlXjiw3/P2BxSE+VrP/HwDLSRhME76dbmwTxC8BpTHT/
         KlbWpTvNZ8LGCVHZxHYfeVb4PzGeDIRDSQUUNVT1cYlyd90gf/aDu7vQzFlm37hEcFxc
         KPvQpjyuaoCttslC+3jrhjI35gwN4wAyqx8axXPj3wJRQiyABZJvWFci2ShCan+zXbN6
         zPYtL7Np1pNM3HzRTzv6xjj+EHoeRQVR8NLL/jBkKjtl1pqhL2OOqXYI2ujSL1Or0oV2
         CRt4RrD958u8atB+0vrOw3fWVyDb6Z1aeIY4m9ANwue1KimAXpvJ6WG+RN5eP5GQdHY/
         2jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vwkM+SzsoiF7YKIoK9DIXcbGL7DR7Z0spQKLzLaNHZQ=;
        b=F6JouNGGDVazkuJWgBBGGnTgKWtrVhUHu09ebNqvQ85nuojJl4O7eTltXPUva5bBIy
         eI+BDh+MxWoEol516ZR2wUg20D2jqfD5Xvb62F2uUnY5NUoJnn+WzFafyapOvSlVmqGq
         ipKOwIWwWsSycHBxprzhVLP7PXHW05tDs9wC00fMtubJSS8fx1ZHwRReYrGksUATc4yf
         +P4Zg9iDdWjK7tK5oJ8H9LR0ocafHpTCamB2oUSr3GliBNgzXPgllr5QRA/lKyIR4Qxl
         Gc+P9VYCfmm3OQWNoEVGGDIcDKPbz4N83JA0fhLwNDX1w6ER6ugvmpYL+PhQ7ZVimHn6
         1M8A==
X-Gm-Message-State: APjAAAWrSZNDe1l/yvfA4Xdyg/99mAPYdIp30vXAqaNDn8KQWaavuW3h
        tRQZF7h54yMyG/D5WSUDqMYS+g==
X-Google-Smtp-Source: APXvYqw09qKkn7Bgw5qiGynPfr7slN+fXXwxh/UBQthSfTfEmpqgT8eYadae9P4L6lIIRwbq16G6sg==
X-Received: by 2002:a17:902:a5c2:: with SMTP id t2mr6758983plq.258.1572530431038;
        Thu, 31 Oct 2019 07:00:31 -0700 (PDT)
Received: from localhost.localdomain ([117.252.69.143])
        by smtp.gmail.com with ESMTPSA id i16sm3522441pfa.184.2019.10.31.07.00.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 07:00:30 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jens.wiklander@linaro.org, jarkko.sakkinen@linux.intel.com,
        dhowells@redhat.com
Cc:     corbet@lwn.net, jejb@linux.ibm.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        stuart.yoder@arm.com, janne.karhunen@gmail.com,
        keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [Patch v3 7/7] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Thu, 31 Oct 2019 19:28:43 +0530
Message-Id: <1572530323-14802-8-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572530323-14802-1-git-send-email-sumit.garg@linaro.org>
References: <1572530323-14802-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add MAINTAINERS entry for TEE based Trusted Keys framework.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6c34d0..08d0282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9059,6 +9059,15 @@ F:	include/keys/trusted-type.h
 F:	security/keys/trusted.c
 F:	include/keys/trusted.h
 
+KEYS-TEE-TRUSTED
+M:	Sumit Garg <sumit.garg@linaro.org>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	Documentation/security/keys/tee-trusted.rst
+F:	include/keys/trusted_tee.h
+F:	security/keys/trusted-keys/trusted_tee.c
+
 KEYS/KEYRINGS:
 M:	David Howells <dhowells@redhat.com>
 M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
-- 
2.7.4

