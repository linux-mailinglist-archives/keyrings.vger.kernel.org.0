Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D1A1D8017
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgERR1W (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgERR1W (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6943C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:21 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so5248198pfn.11
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tyOHQ4QTzZNgyLVChX0rG8Pdp219VIFQClOVAmrMGzQ=;
        b=ibwOaFIMcIkoOHC8NFGHwpkHSP2Wj2u3erdpMctg1Fu6lqWIsHDy6aa0r9FNY70N/u
         KckJtKd5uQ1Daoe6ASdvQKVsJkTkGyJhlCkfQuI0q+EkkPqugqQGa0mk7vuiyIQoeDKm
         NnlGzU/H+gahpnTsyJRtQRfSc8WFlkBL08xfpp6GINXab58e39QcVjiKwC7WhjaOxR7u
         RmLblwLn53JZuMG70mkW8Rcp4giKNU2g1GljvvaiTD75RyzgZNLmPYUj+lZrOiGAeUzA
         cPRr2gcP5Vt65t8BVD83fJpGYEjlfLbgiVPHkj9toOIILkclkvrST1l2wIs2xT99o8mA
         s5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tyOHQ4QTzZNgyLVChX0rG8Pdp219VIFQClOVAmrMGzQ=;
        b=WlgyoE3UrD9XQX1RsPFaTVC3Eb3QzDhYhOdj5lCvZyJlFXVem2thjQR2I89tS3kOVB
         p85dyzPJwVrMr1ruA6H3+Az2BGmAX+z3PEmOH85qyjm6dfg3VXV1gNyDjVhGxyqMr1qi
         YqgakcJXXtgS7f140Yt1NWoJ7StSRlRGxroRY3Z9dS0w5glM7cCJoiTTpi6yxXf/0JWO
         D4BDkSjXPmnLyTuoWckEMv54Xj61icTBGm40a5XWI6SYKRIt/oXqyOvhkOWL/DeDEfkU
         RBfLChH0FmNa0zpOQf19X9Osbig+uKjPEMtkZZ1AWpjl+f1wOtOKwBd7bwM/FvBzZtOB
         29PQ==
X-Gm-Message-State: AOAM533353BB0Ef/00vUSbB5pLkQ+mbn3tS/ZO75jp3m18UTENi9CzAZ
        0bnEMjbEoJ4BC1bSBYGTmbdC18xwoks=
X-Google-Smtp-Source: ABdhPJwk4rOsiPw2f6KQEoLHOfUHuQnZjmjvLR4MVYZzCWvpX66elaUfD2AR8CbM/NhWTLnNVa1VKQ==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr6571302pgf.140.1589822841116;
        Mon, 18 May 2020 10:27:21 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:20 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 09/17] trusted keys: Add session encryption protection to the seal/unseal path
Date:   Mon, 18 May 2020 10:26:56 -0700
Message-Id: <20200518172704.29608-10-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

If some entity is snooping the TPM bus, the can see the data going in
to be sealed and the data coming out as it is unsealed.  Add parameter
and response encryption to these cases to ensure that no secrets are
leaked even if the bus is snooped.

As part of doing this conversion it was discovered that policy
sessions can't work with HMAC protected authority because of missing
pieces (the tpm Nonce).  I've added code to work the same way as
before, which will result in potential authority exposure (while still
adding security for the command and the returned blob), and a fixme to
redo the API to get rid of this security hole.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm2-cmd.c | 124 ++++++++++++++++++++++++------------
 1 file changed, 85 insertions(+), 39 deletions(-)

diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index 92e381bfd7c8..f11906f95252 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -418,7 +418,9 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 {
 	unsigned int blob_len;
 	struct tpm_buf buf;
+	struct tpm_buf t2b;
 	u32 hash;
+	struct tpm2_auth *auth;
 	int i;
 	int rc;
 
@@ -432,45 +434,56 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 	if (i == ARRAY_SIZE(tpm2_hash_map))
 		return -EINVAL;
 
-	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
+	rc = tpm2_start_auth_session(chip, &auth);
 	if (rc)
 		return rc;
 
-	tpm_buf_append_u32(&buf, options->keyhandle);
-	tpm2_buf_append_auth(&buf, TPM2_RS_PW,
-			     NULL /* nonce */, 0,
-			     0 /* session_attributes */,
-			     options->keyauth /* hmac */,
-			     TPM_DIGEST_SIZE);
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
+	if (rc) {
+		tpm2_end_auth_session(auth);
+		return rc;
+	}
+
+	rc = tpm_buf_init_2b(&t2b);
+	if (rc) {
+		tpm_buf_destroy(&buf);
+		tpm2_end_auth_session(auth);
+		return rc;
+	}
 
+	tpm_buf_append_name(&buf, auth, options->keyhandle, NULL);
+	tpm_buf_append_hmac_session(&buf, auth, TPM2_SA_DECRYPT,
+				    options->keyauth, TPM_DIGEST_SIZE);
 	/* sensitive */
-	tpm_buf_append_u16(&buf, 4 + TPM_DIGEST_SIZE + payload->key_len + 1);
+	tpm_buf_append_u16(&t2b, TPM_DIGEST_SIZE);
+	tpm_buf_append(&t2b, options->blobauth, TPM_DIGEST_SIZE);
+	tpm_buf_append_u16(&t2b, payload->key_len + 1);
+	tpm_buf_append(&t2b, payload->key, payload->key_len);
+	tpm_buf_append_u8(&t2b, payload->migratable);
 
-	tpm_buf_append_u16(&buf, TPM_DIGEST_SIZE);
-	tpm_buf_append(&buf, options->blobauth, TPM_DIGEST_SIZE);
-	tpm_buf_append_u16(&buf, payload->key_len + 1);
-	tpm_buf_append(&buf, payload->key, payload->key_len);
-	tpm_buf_append_u8(&buf, payload->migratable);
+	tpm_buf_append_2b(&buf, &t2b);
 
 	/* public */
-	tpm_buf_append_u16(&buf, 14 + options->policydigest_len);
-	tpm_buf_append_u16(&buf, TPM_ALG_KEYEDHASH);
-	tpm_buf_append_u16(&buf, hash);
+	tpm_buf_append_u16(&t2b, TPM_ALG_KEYEDHASH);
+	tpm_buf_append_u16(&t2b, hash);
 
 	/* policy */
 	if (options->policydigest_len) {
-		tpm_buf_append_u32(&buf, 0);
-		tpm_buf_append_u16(&buf, options->policydigest_len);
-		tpm_buf_append(&buf, options->policydigest,
+		tpm_buf_append_u32(&t2b, 0);
+		tpm_buf_append_u16(&t2b, options->policydigest_len);
+		tpm_buf_append(&t2b, options->policydigest,
 			       options->policydigest_len);
 	} else {
-		tpm_buf_append_u32(&buf, TPM2_OA_USER_WITH_AUTH);
-		tpm_buf_append_u16(&buf, 0);
+		tpm_buf_append_u32(&t2b, TPM2_OA_USER_WITH_AUTH);
+		tpm_buf_append_u16(&t2b, 0);
 	}
 
 	/* public parameters */
-	tpm_buf_append_u16(&buf, TPM_ALG_NULL);
-	tpm_buf_append_u16(&buf, 0);
+	tpm_buf_append_u16(&t2b, TPM_ALG_NULL);
+	/* unique (zero) */
+	tpm_buf_append_u16(&t2b, 0);
+
+	tpm_buf_append_2b(&buf, &t2b);
 
 	/* outside info */
 	tpm_buf_append_u16(&buf, 0);
@@ -483,7 +496,9 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 		goto out;
 	}
 
+	tpm_buf_fill_hmac_session(&buf, auth);
 	rc = tpm_transmit_cmd(chip, &buf, 4, "sealing data");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
 	if (rc)
 		goto out;
 
@@ -501,6 +516,7 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 	payload->blob_len = blob_len;
 
 out:
+	tpm_buf_destroy(&t2b);
 	tpm_buf_destroy(&buf);
 
 	if (rc > 0) {
@@ -532,6 +548,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 			 u32 *blob_handle)
 {
 	struct tpm_buf buf;
+	struct tpm2_auth *auth;
 	unsigned int private_len;
 	unsigned int public_len;
 	unsigned int blob_len;
@@ -546,17 +563,18 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 	if (blob_len > payload->blob_len)
 		return -E2BIG;
 
-	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
+	rc = tpm2_start_auth_session(chip, &auth);
 	if (rc)
 		return rc;
 
-	tpm_buf_append_u32(&buf, options->keyhandle);
-	tpm2_buf_append_auth(&buf, TPM2_RS_PW,
-			     NULL /* nonce */, 0,
-			     0 /* session_attributes */,
-			     options->keyauth /* hmac */,
-			     TPM_DIGEST_SIZE);
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
+	if (rc) {
+		tpm2_end_auth_session(auth);
+		return rc;
+	}
 
+	tpm_buf_append_name(&buf, auth, options->keyhandle, NULL);
+	tpm_buf_append_hmac_session(&buf, auth, 0, options->keyauth, TPM_DIGEST_SIZE);
 	tpm_buf_append(&buf, payload->blob, blob_len);
 
 	if (buf.flags & TPM_BUF_OVERFLOW) {
@@ -564,7 +582,9 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 		goto out;
 	}
 
+	tpm_buf_fill_hmac_session(&buf, auth);
 	rc = tpm_transmit_cmd(chip, &buf, 4, "loading blob");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
 	if (!rc)
 		*blob_handle = be32_to_cpup(
 			(__be32 *) &buf.data[TPM_HEADER_SIZE]);
@@ -596,24 +616,50 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 			   u32 blob_handle)
 {
 	struct tpm_buf buf;
+	struct tpm2_auth *auth;
 	u16 data_len;
 	u8 *data;
 	int rc;
 
-	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_UNSEAL);
+	rc = tpm2_start_auth_session(chip, &auth);
 	if (rc)
 		return rc;
 
-	tpm_buf_append_u32(&buf, blob_handle);
-	tpm2_buf_append_auth(&buf,
-			     options->policyhandle ?
-			     options->policyhandle : TPM2_RS_PW,
-			     NULL /* nonce */, 0,
-			     TPM2_SA_CONTINUE_SESSION,
-			     options->blobauth /* hmac */,
-			     TPM_DIGEST_SIZE);
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_UNSEAL);
+	if (rc) {
+		tpm2_end_auth_session(auth);
+		return rc;
+	}
+
+	tpm_buf_append_name(&buf, auth, blob_handle, NULL);
+
+	if (!options->policyhandle) {
+		tpm_buf_append_hmac_session(&buf, auth, TPM2_SA_ENCRYPT,
+					    options->blobauth, TPM_DIGEST_SIZE);
+	} else {
+		/*
+		 * FIXME: the policy can't be used for HMAC protection
+		 * of the authorization because it must be generated
+		 * with the initial nonces which isn't passed in, so
+		 * append a second encryption session to at least HMAC
+		 * protect the command and encrypt the sealed blob on
+		 * return.
+		 *
+		 * Note: this also means the caller either has to use
+		 * an empty password or compute the password HMAC
+		 * based on the policy nonces and place it in blobauth
+		 */
+		tpm2_buf_append_auth(&buf, options->policyhandle,
+				     NULL /* nonce */, 0, 0,
+				     options->blobauth /* hmac */,
+				     TPM_DIGEST_SIZE);
+		tpm_buf_append_hmac_session_opt(&buf, auth, TPM2_SA_ENCRYPT,
+						NULL, 0);
+	}
 
+	tpm_buf_fill_hmac_session(&buf, auth);
 	rc = tpm_transmit_cmd(chip, &buf, 6, "unsealing");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
 	if (rc > 0)
 		rc = -EPERM;
 
-- 
2.21.1

