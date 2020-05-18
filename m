Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AEC1D801E
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgERR12 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgERR12 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCE0C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q9so137130pjm.2
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wkkc1Rm+rMed2ZqbMkUHJzTFUh3hfaL1duU5QQp9Nww=;
        b=Xp9NomrpUKfmkwAKZZsTMOzYc1oy7uJWH2wxodWXW4OUALZclQ+RK8PC/q1hcv79lW
         K7rjhsu+FjR5o9oefUjp+owVIFm8NOwXVgcqynbUVhX4vLznk7r7yD+YgOjMI3ZqL+cX
         V6LshKpz+YeIsK6Ny4ml3sdGDdjGS4mqvp6C4rS8YZjm5oZUNZjWa//ZUa/bd1JIkMNf
         8gsXQQWYL+DZqS6o03skzncLB3CeX5huZ95JtMRrIvar+uyydjI/PTIpW/N38QpkE5d/
         oUpFulJJD3wagltaML+8663rWxHxU/6zDGUvsJsGrXadu45+wlF5d6cdNy36T027/0cD
         9BdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wkkc1Rm+rMed2ZqbMkUHJzTFUh3hfaL1duU5QQp9Nww=;
        b=iDpAImGYH9VqYk2vAr2T4RpvaVLJ5Qn/cL8Sga3+emJA3neoVjM8g06HzPQcJVAsSO
         TsjTeGFK5v251qLvTlZ4CfAJS3PRAteE+V+7higHaCCLfqInDZ3F15clzO5VwlSM/2cp
         ehuuVDaKy74XjQhQjR5yRS0SeO1+C+YnM0GCoH+qXUoKj3V1kznHY8FU4FNWyO7Lf6Fz
         mxIZxa5TWnCdpeS00Q9ihz3nEX4CEAcBq3Buand0Dt3sHKKYHZJiNKYBlQiAGIeNttpX
         jIfMHzwxAWSe2ftFDTC8AsktLEQPVMgQQCYUmPojTleN3qwsZwTs65frmG58VgrkjY97
         7zIQ==
X-Gm-Message-State: AOAM530Ta8/JuR8GDi+NhXVRXDhF7N0bdWPDncZWPQsqcs9hntenR8MS
        IAgRTyBxysTHf3VNnZ+0gN3L89+USqM=
X-Google-Smtp-Source: ABdhPJxkG1n/bG47Eu5bO71pGtFGBPeTrE6kdJy5Bk4e8t1a/KBNaC9D2MMTLir9BjTmj+4ngklLQg==
X-Received: by 2002:a17:902:bd07:: with SMTP id p7mr16584940pls.293.1589822847404;
        Mon, 18 May 2020 10:27:27 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:26 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 15/17] include: crypto: add asym_tpm2_subtype definition
Date:   Mon, 18 May 2020 10:27:02 -0700
Message-Id: <20200518172704.29608-16-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This defines the structure of a TPM2 key in the kernel.

Signed-off-by: James Prestwood <prestwoj@gmail.com>
---
 include/crypto/asym_tpm2_subtype.h | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/crypto/asym_tpm2_subtype.h

diff --git a/include/crypto/asym_tpm2_subtype.h b/include/crypto/asym_tpm2_subtype.h
new file mode 100644
index 000000000000..dea80b2e6e66
--- /dev/null
+++ b/include/crypto/asym_tpm2_subtype.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_ASYM_TPM2_SUBTYPE_H
+#define _LINUX_ASYM_TPM2_SUBTYPE_H
+
+#include <linux/keyctl.h>
+
+struct tpm2_parse_context {
+	u32 parent;
+	const u8 *pub;
+	u32 pub_len;
+	const u8 *priv;
+	u32 priv_len;
+};
+
+struct tpm2_key {
+	struct tpm_chip *chip;
+	u32 parent;
+
+	u8 *blob;
+	u32 bloblen;
+
+	/* pointer into 'blob' where public key begins */
+	const u8 *pub;
+	u32 pub_len;
+
+};
+
+struct tpm2_key *tpm2_key_create(struct tpm2_parse_context *ctx);
+
+extern struct asymmetric_key_subtype asym_tpm2_subtype;
+
+#endif /* _LINUX_ASYM_TPM2_SUBTYPE_H */
-- 
2.21.1

