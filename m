Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD572842AD
	for <lists+keyrings@lfdr.de>; Tue,  6 Oct 2020 00:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgJEWxD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Oct 2020 18:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJEWxD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Oct 2020 18:53:03 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A16C0613CE
        for <keyrings@vger.kernel.org>; Mon,  5 Oct 2020 15:53:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e10so7320947pfj.1
        for <keyrings@vger.kernel.org>; Mon, 05 Oct 2020 15:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ebta9KUEFUCVG4IDteiwZtPW01AUoULeXuk/3sE0SM=;
        b=IbITGH5IaPlR4cqiPeTPy3DcuqZuMnoG1ZQ9TompjvVlAmp18y7WEQE2fSaQa7DS9h
         uO7T0HaH0sGIBFW7FY3lPXlkSnpzurlzH9Anfw4SQzMQ865S+a8ZlENzXqeU4VSV5Wlb
         JSdobUIoSDVwB5CiMYSdBnBrZY3KlfkO20tftmb6E2gJU9icRHiU31DkoGaJARy7CUPg
         x/T5Rgg+acpRPeTTMl4kzG7GVITQb58Vgq0WTd0cX9lSrcpvJqrYU19QRcEZc3aM3sw9
         B4xKs5Vne4JgNWj4ftXY7NmLxc9QJctEq6NQhRZrrJctWQbsITbUeqMZBjRklCHObCyv
         f8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ebta9KUEFUCVG4IDteiwZtPW01AUoULeXuk/3sE0SM=;
        b=PHraq0gusrkXlnczVboU9m8K5Nt5WDAaB0i9SzH/MKlH9g52RPGn6y5m5UCPKFV8l9
         6sSQA8QK2BXxHwgWgRH/LEbomfqsoXzpvGbVfJBWaSQoh17rLgKUx7yZeqnG9TmuXP3d
         jA4zL/AgJm7k3rLQRyWKdFit95Z1WcQHltgY/n985JWxB+zD9FcrS+OHVTgzFPcf/9GB
         KNekC9yypeLzmSyRB9MUavkIEJCXTt9h8qFuV0x0lhjc2Ch8ViqQAj92F+i8MHXgNm5o
         0tfHmeBzeAdD9B/tLqlbgtGPLKOPesDZNBxGKV7q5pWKRb0mEMy+8wXhwtBEZI3D6Mdw
         bAGQ==
X-Gm-Message-State: AOAM530TvDau7ZlL/Sp39tNqdXEtYE1swAhauTon/YpVRnID0WQkpr03
        OLwJ8uyqRYT0C2piRn2dCQz/yZ7Hl1E=
X-Google-Smtp-Source: ABdhPJzVwocVh1CQArYeDbDlr2Z5+rBpteDwIMDkmhB2mi6qtZa49wJN85AvtaCy4UGQFu9zvCSwDA==
X-Received: by 2002:aa7:9823:0:b029:150:a96f:c8b7 with SMTP id q3-20020aa798230000b0290150a96fc8b7mr1761504pfl.34.1601938382303;
        Mon, 05 Oct 2020 15:53:02 -0700 (PDT)
Received: from wolf.lan ([8.25.194.5])
        by smtp.gmail.com with ESMTPSA id e27sm1008931pfj.62.2020.10.05.15.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:53:01 -0700 (PDT)
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     zohar@linux.ibm.com, Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: [PATCH v2] encrypted-keys: Print more useful debug info if encryption algo is not available
Date:   Mon,  5 Oct 2020 15:52:58 -0700
Message-Id: <20201005225258.200181-1-anatol.pomozov@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

It helps to improve a cryptic message "encrypted_key failed to alloc_cipher (-2)".
Adding algo name makes it easier to understand what cipher has failed.

Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
---
 security/keys/encrypted-keys/encrypted.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index 192e531c146f..c09d48f53682 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -84,8 +84,8 @@ static int aes_get_sizes(void)
 
 	tfm = crypto_alloc_skcipher(blkcipher_alg, 0, CRYPTO_ALG_ASYNC);
 	if (IS_ERR(tfm)) {
-		pr_err("encrypted_key: failed to alloc_cipher (%ld)\n",
-		       PTR_ERR(tfm));
+		pr_err("encrypted_key: failed to alloc_cipher for %s (%ld)\n",
+		       blkcipher_alg, PTR_ERR(tfm));
 		return PTR_ERR(tfm);
 	}
 	ivsize = crypto_skcipher_ivsize(tfm);
-- 
2.28.0

