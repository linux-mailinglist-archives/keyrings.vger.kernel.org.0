Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6899E99850
	for <lists+keyrings@lfdr.de>; Thu, 22 Aug 2019 17:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732900AbfHVPf5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Aug 2019 11:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732536AbfHVPf5 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 22 Aug 2019 11:35:57 -0400
Received: from zzz.localdomain (ip-173-136-158-138.anahca.spcsdns.net [173.136.158.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6763421743;
        Thu, 22 Aug 2019 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566488156;
        bh=giWe0cvmTvOWzl08FfAQyDcj0bp4043LS9VHURdeGKQ=;
        h=From:To:Cc:Subject:Date:From;
        b=T4GRZzkm4pQ/yuhV8MZ2FMSii6QPEMSojVLGko002cEYKMfp5fc9pQZEXoLeagNj/
         7VbVb3TjIaw/u6Rb3lAip1BVS17m8UsMkIxbRGFSrNxr715beP7Z3kxK+0lC+uyEdK
         0bafdyCsRTP9+O2/AwT3CtH6TYFvOuTXsvM5/Bhg=
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     James Morris <jamorris@linux.microsoft.com>
Subject: [PATCH RESEND] KEYS: asymmetric: return ENOMEM if akcipher_request_alloc() fails
Date:   Thu, 22 Aug 2019 08:35:50 -0700
Message-Id: <20190822153550.9777-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.1
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
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/asym_tpm.c   | 1 +
 crypto/asymmetric_keys/public_key.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 76d2ce3a1b5b..5154e280ada2 100644
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
index 364b9df9d631..d7f43d4ea925 100644
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
2.22.1

