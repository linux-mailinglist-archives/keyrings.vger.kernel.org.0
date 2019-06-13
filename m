Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D9443C26
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbfFMPeT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:34:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35918 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbfFMKc1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 06:32:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id f21so4699843pgi.3
        for <keyrings@vger.kernel.org>; Thu, 13 Jun 2019 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zAP35FMwIaJoHRTsWTgqlS+4eqrXf3lXTLZsbBgKALU=;
        b=I8WZqaHuq/yhoMfw5I5pMLLVxm8cNFa61hNwQ8JLEMlCB8EUyJDcawmklBfvxhPYCl
         5QfsPIYKqAlH9CKbXYD8qGVKPqgYgYNL5qFGx11M2gg4jknzMJ2je5vQxiIEo2GWD5G/
         RxhSDlH9Q9RQ/EG0N/XQAWCefLd9GHdFP0Ho9vndyKfvJW/F0y6GH3rSRSR/oA8ric1P
         KaJ5iam2I3ar+sVxc5p9E9Bfv94xReZjTfPJhJnUezS8g8jb+A8kp0qWVI4luHG7wWWh
         PrG1F5qZGOs5QlF8Jcng3xBuK+0z2rvPRMRUkxRXs3sbtmIRmZNB6mWw8sVkKHcVmOb8
         uK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zAP35FMwIaJoHRTsWTgqlS+4eqrXf3lXTLZsbBgKALU=;
        b=oBbRHv5o2IdbAgzfODOlcAgWBtOsn/nHq8JlDBhnOOGYsWnCeF/3zW1uQWtDU1pXKe
         4po3FJ/ThD4Jk33OVOEAWs7pCifvqBzo2jTxN4XeITh73b5fKX4b+fmDvG5bClMXpyi3
         FvBHufNDMQHZqp0VEuTe5DuFptYipFQd3mL0Icu0I6JL2RPU0WnXOsAhHTt4S6SIFchO
         P07WpmHqru9Ibby822txN7zCHoiB6X0IdYdLqVFb04TI5VBzTuhQo9nn6+MmqkKByzMi
         qgE72AcIDoTf2pG1ub+IzJlyV2ZvpaHOfUPWzPSNL7G80focX/yYk2S9m19YB25kTHwY
         Qpyw==
X-Gm-Message-State: APjAAAWP3zzuXy9GwhRwUUGRkQzS03/c8ad8AgiD14MMt7Rqwc8YT0jG
        TcQCVBgAXrMADk5+P4G7GJJDOHWWHH0=
X-Google-Smtp-Source: APXvYqy9ZWJWVG2HSV4XCNQ97i8SPNUISZ00sFzqKzjXi5CJzuVmgDH7W765D0LXzkPhO24L9HPVDA==
X-Received: by 2002:a17:90a:2525:: with SMTP id j34mr383810pje.11.1560421945985;
        Thu, 13 Jun 2019 03:32:25 -0700 (PDT)
Received: from localhost.localdomain ([117.196.234.139])
        by smtp.gmail.com with ESMTPSA id a12sm2265078pgq.0.2019.06.13.03.32.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2019 03:32:25 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC 5/7] KEYS: encrypted: Allow TEE based trusted master keys
Date:   Thu, 13 Jun 2019 16:00:31 +0530
Message-Id: <1560421833-27414-6-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Allow search for TEE based trusted keys to act as master keys in case
TPM device is not present.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 security/keys/encrypted-keys/masterkey_trusted.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/security/keys/encrypted-keys/masterkey_trusted.c b/security/keys/encrypted-keys/masterkey_trusted.c
index c68528a..cfac27f 100644
--- a/security/keys/encrypted-keys/masterkey_trusted.c
+++ b/security/keys/encrypted-keys/masterkey_trusted.c
@@ -23,6 +23,9 @@
  * Trusted keys are sealed to PCRs and other metadata. Although userspace
  * manages both trusted/encrypted key-types, like the encrypted key type
  * data, trusted key type data is not visible decrypted from userspace.
+ *
+ * Also, check for alternate trusted keys provided via TEE in case there
+ * is no TPM available.
  */
 struct key *request_trusted_key(const char *trusted_desc,
 				const u8 **master_key, size_t *master_keylen)
@@ -31,8 +34,11 @@ struct key *request_trusted_key(const char *trusted_desc,
 	struct key *tkey;
 
 	tkey = request_key(&key_type_trusted, trusted_desc, NULL);
-	if (IS_ERR(tkey))
-		goto error;
+	if (IS_ERR(tkey)) {
+		tkey = request_key(&key_type_tee_trusted, trusted_desc, NULL);
+		if (IS_ERR(tkey))
+			goto error;
+	}
 
 	down_read(&tkey->sem);
 	tpayload = tkey->payload.data[0];
-- 
2.7.4

