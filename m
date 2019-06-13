Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5988943C1C
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfFMPeH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:34:07 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:45497 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfFMKcx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 06:32:53 -0400
Received: by mail-pf1-f174.google.com with SMTP id r1so14091pfq.12
        for <keyrings@vger.kernel.org>; Thu, 13 Jun 2019 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c8B2WpV2ao/GiAyoXZe0rgTXimW81Zj9eba5b1nq+eE=;
        b=h8V7naw5ZXcy9hmK/khUBCeii6w8istWHF8EhmWYofLp5tS8e7g/0p6wZ6C0USi+Dh
         mrRUluvbHlgWF/K0yOocTUP2YlkLwNpFUDSsXVVnXSqzMxRZWRa8AlpSQUB4RrPs6IWp
         Un0SbBuDDP+12ShPcNz/XCABHYeLuj6PS9IayrYHiA8AwtHPQ4tPtuphrFBF90Vs17i1
         vsXkMoAETxkRSg8jeio5rfDxL0JIBqmfMMx1icRj4Xq3iUPOW52qUByywGCwTiXh8DFu
         1ObjgH9WASPPsW9zF4CAFudb6rqRmc7X2kjWgK4X/RZCxjra/QjT4/pkl2l4+HA8RP9h
         ch5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c8B2WpV2ao/GiAyoXZe0rgTXimW81Zj9eba5b1nq+eE=;
        b=HrQMNEHXax7l1ARE8uOSkkw1xCR0rqjsKWpzgd0EM7h+n8TsoZOhIF+UyD5hxBbI30
         GPDFXxAQC2KrmKDP2J5Urm8V5S6fjgLppCblngzIbLTBpRLKDstzoHyClOB8VsZFWtZx
         OdqG8MLlBZcC/bIUU7OqT5X4KptI557ePJ4MAtXDQlyamVu4xpZArqUOyevAhp1MyVoL
         CvBamQzRzUJbxIk6G9/Fml83cyHI/AhYRp3Cw3UxLzaKh6Lcf82vhdIcbhX8UYoiKdeh
         o3bEvc4MjqRicR+CkrlsSyOe8Jc1Q17QhMfQ7ifEEm+6EKGJUfPnOSXnKsm5TnWe/RYv
         5cbg==
X-Gm-Message-State: APjAAAUaU8tFvs5ftv+VJG8ypxNr4WvY0dZJhyMd7Fq8aBdcq7gMPkJr
        PNNHk1+gOgzMq4QaasO60c7OAgzvBJE=
X-Google-Smtp-Source: APXvYqzzZ7YxoNMF8oKGpZA1V8rzQ5wmso5pRZlZbpTxImoytKeurGrlcgP5yFfHuYycERwMARH53w==
X-Received: by 2002:a17:90a:8c06:: with SMTP id a6mr963486pjo.45.1560421971996;
        Thu, 13 Jun 2019 03:32:51 -0700 (PDT)
Received: from localhost.localdomain ([117.196.234.139])
        by smtp.gmail.com with ESMTPSA id a12sm2265078pgq.0.2019.06.13.03.32.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2019 03:32:51 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC 7/7] MAINTAINERS: Add entry for TEE based Trusted Keys
Date:   Thu, 13 Jun 2019 16:00:33 +0530
Message-Id: <1560421833-27414-8-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
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
index 57f496c..db84fc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8728,6 +8728,15 @@ F:	include/keys/trusted-type.h
 F:	security/keys/trusted.c
 F:	security/keys/trusted.h
 
+KEYS-TEE-TRUSTED
+M:	Sumit Garg <sumit.garg@linaro.org>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	Documentation/security/keys/tee-trusted.rst
+F:	include/keys/tee_trusted.h
+F:	security/keys/tee_trusted.c
+
 KEYS/KEYRINGS:
 M:	David Howells <dhowells@redhat.com>
 L:	keyrings@vger.kernel.org
-- 
2.7.4

