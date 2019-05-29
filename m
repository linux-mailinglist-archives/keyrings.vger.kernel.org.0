Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAFD82E6F1
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 23:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfE2VBr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 17:01:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfE2VBr (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 17:01:47 -0400
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74E89241C7;
        Wed, 29 May 2019 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559163706;
        bh=ZJCNQAI1B7QCvNAh8LPolfc4ndi4pmUPUhOo5q+4OOk=;
        h=From:To:Subject:Date:From;
        b=C2tfTyqXMdYWA2oBj05iMq4Y3ocHHpNItTSFXQuZldtYDb78Ha2FbYWn6JCeaB5X4
         lrcWJXTBSfMaWwTTutIw/7F/jFnU95BMSyB5nGbZVhAbmtBQp/sddkUTSPI5MSPAFU
         uhbJMem/Sv6Fo3bR4i7vkQnhyew9tTmb7Ras7bY8=
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if akcipher_request_alloc() fails
Date:   Wed, 29 May 2019 14:01:32 -0700
Message-Id: <20190529210132.120114-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

No error code was being set on this error path.

Fixes: ad4b1eb5fb33 ("KEYS: asym_tpm: Implement encryption operation [ver #2]")
Fixes: c08fed737126 ("KEYS: Implement encrypt, decrypt and sign for software asymmetric key [ver #2]")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/asym_tpm.c   | 1 +
 crypto/asymmetric_keys/public_key.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 76d2ce3a1b5b1..5154e280ada22 100644
--- a/crypto/asymmetric_keys/asym_tpm.c
+++ b/crypto/asymmetric_keys/asym_tpm.c
@@ -486,6 +486,7 @@ static int tpm_key_encrypt(struct tpm_key *tk,
 	if (ret < 0)
 		goto error_free_tfm;
 
+	ret = -ENOMEM;
 	req = akcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req)
 		goto error_free_tfm;
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 364b9df9d631f..d7f43d4ea925a 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -184,6 +184,7 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
+	ret = -ENOMEM;
 	req = akcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req)
 		goto error_free_tfm;
-- 
2.22.0.rc1.257.g3120a18244-goog

