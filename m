Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517CB51B38B
	for <lists+keyrings@lfdr.de>; Thu,  5 May 2022 01:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiEDXhq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 May 2022 19:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383888AbiEDXZQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 May 2022 19:25:16 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812CB4ECCE
        for <keyrings@vger.kernel.org>; Wed,  4 May 2022 16:21:39 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso2567938pjj.2
        for <keyrings@vger.kernel.org>; Wed, 04 May 2022 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NCPgvpZcA0uAt4aHPP7BYpOEKu3u65fsur79lcM7RCY=;
        b=Zs2UVopnaRBcMqzeWwdu3RMSHFGCRemyVLw1Wiq1qURH8sHjtfDVQfZbSeFcEHO3yo
         3A1MC5oNYk09WmKFCtVeexkI58hzjqDiFLj3wo1aQ2A7txkNgN7GmMK0k3LRqjZKN7OW
         Ejffr5D3JC4siZtEiGZt/YgD+39nWwRmq2VxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NCPgvpZcA0uAt4aHPP7BYpOEKu3u65fsur79lcM7RCY=;
        b=Uf/7GAVXZK5oDsPZ/OcnuWTJItlZkSyIArpHeUsJZ3zSnMOkOcCTnF2zbBJqt4IwKS
         NMJ4oQ/DsZfeuxpgAr6ls0j5lEN3ud9DsEnJu6MKyc1tAsL2NvLPhWuZ06wvOtwvrtWb
         iGPj37VgFYPpghpNp4naicneSBoEwKC1HkxbzS7tq5aI2tU4iNxOVQsQO1qtbBy18rpB
         DMFXR615WM/Mmw0+KKy+FMMR8xrYpCWrYRL94xiKrV3FNaVXbgcuRiJotZZ5oqCSaHZd
         gD2e22WA0vgAXR2gSsOyptMtaXCDV3dL6dh7dQJs5bBwShDm16aUrVcEaeVorZqDuYL6
         GPmw==
X-Gm-Message-State: AOAM531HJiLFgReiRxcZ9u8lESTfgKQp7DthMoG1hFMZq8gB81N1oGRd
        ZGISCkL1y5ewJQjdpv8dSQatWg==
X-Google-Smtp-Source: ABdhPJx2TPK/nouqDF1yYzVVWJk+thRPtu2hPJrJDWbQ1tzdLDmA68Nrl8oQvHeptfCEiB4Lsu9xWQ==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id s16-20020a17090302d000b0014d8a8d0cb1mr24121633plk.50.1651706499061;
        Wed, 04 May 2022 16:21:39 -0700 (PDT)
Received: from evgreen-glaptop.lan ([98.47.98.87])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902f78c00b0015e8d4eb2d6sm1901pln.288.2022.05.04.16.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 16:21:38 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Matthew Garrett <mgarrett@aurora.tech>, dlunev@google.com,
        zohar@linux.ibm.com, jejb@linux.ibm.com,
        linux-integrity@vger.kernel.org, corbet@lwn.net, rjw@rjwysocki.net,
        gwendal@chromium.org, jarkko@kernel.org, linux-pm@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH 05/10] security: keys: trusted: Verify creation data
Date:   Wed,  4 May 2022 16:20:57 -0700
Message-Id: <20220504161439.5.I6cdb522cb5ea28fcd1e35b4cd92cbd067f99269a@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220504232102.469959-1-evgreen@chromium.org>
References: <20220504232102.469959-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

If a loaded key contains creation data, ask the TPM to verify that
creation data. This allows users like encrypted hibernate to know that
the loaded and parsed creation data has not been tampered with.

Partially-sourced-from: Matthew Garrett <mjg59@google.com>
Signed-off-by: Evan Green <evgreen@chromium.org>

---
Source material for this change is at:
https://patchwork.kernel.org/project/linux-pm/patch/20210220013255.1083202-9-matthewgarrett@google.com/

 include/linux/tpm.h                       |  1 +
 security/keys/trusted-keys/trusted_tpm2.c | 72 ++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 8320cbac6f4009..438f8bc0a50582 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -224,6 +224,7 @@ enum tpm2_command_codes {
 	TPM2_CC_SELF_TEST	        = 0x0143,
 	TPM2_CC_STARTUP		        = 0x0144,
 	TPM2_CC_SHUTDOWN	        = 0x0145,
+	TPM2_CC_CERTIFYCREATION	        = 0x014A,
 	TPM2_CC_NV_READ                 = 0x014E,
 	TPM2_CC_CREATE		        = 0x0153,
 	TPM2_CC_LOAD		        = 0x0157,
diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index b7ddb78e644d17..6db30a5fc320c0 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -600,6 +600,69 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 	return rc;
 }
 
+/**
+ * tpm2_certify_creation() - execute a TPM2_CertifyCreation command
+ *
+ * @chip: TPM chip to use
+ * @payload: the key data in clear and encrypted form
+ * @blob_handle: the loaded TPM handle of the key
+ *
+ * Return: 0 on success
+ *         -EINVAL on tpm error status
+ *         < 0 error from tpm_send or tpm_buf_init
+ */
+static int tpm2_certify_creation(struct tpm_chip *chip,
+				 struct trusted_key_payload *payload,
+				 u32 blob_handle)
+{
+	struct tpm_header *head;
+	struct tpm_buf buf;
+	int rc;
+
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CERTIFYCREATION);
+	if (rc)
+		return rc;
+
+	/* Use TPM_RH_NULL for signHandle */
+	tpm_buf_append_u32(&buf, 0x40000007);
+
+	/* Object handle */
+	tpm_buf_append_u32(&buf, blob_handle);
+
+	/* Auth */
+	tpm_buf_append_u32(&buf, 9);
+	tpm_buf_append_u32(&buf, TPM2_RS_PW);
+	tpm_buf_append_u16(&buf, 0);
+	tpm_buf_append_u8(&buf, 0);
+	tpm_buf_append_u16(&buf, 0);
+
+	/* Qualifying data */
+	tpm_buf_append_u16(&buf, 0);
+
+	/* Creation data hash */
+	tpm_buf_append_u16(&buf, payload->creation_hash_len);
+	tpm_buf_append(&buf, payload->creation_hash,
+		       payload->creation_hash_len);
+
+	/* signature scheme */
+	tpm_buf_append_u16(&buf, TPM_ALG_NULL);
+
+	/* creation ticket */
+	tpm_buf_append(&buf, payload->tk, payload->tk_len);
+
+	rc = tpm_transmit_cmd(chip, &buf, 6, "certifying creation data");
+	if (rc)
+		goto out;
+
+	head = (struct tpm_header *)buf.data;
+
+	if (head->return_code != 0)
+		rc = -EINVAL;
+out:
+	tpm_buf_destroy(&buf);
+	return rc;
+}
+
 /**
  * tpm2_unseal_trusted() - unseal the payload of a trusted key
  *
@@ -625,8 +688,15 @@ int tpm2_unseal_trusted(struct tpm_chip *chip,
 		goto out;
 
 	rc = tpm2_unseal_cmd(chip, payload, options, blob_handle);
-	tpm2_flush_context(chip, blob_handle);
+	if (rc)
+		goto flush;
+
+	if (payload->creation_len)
+		rc = tpm2_certify_creation(chip, payload, blob_handle);
 
+
+flush:
+	tpm2_flush_context(chip, blob_handle);
 out:
 	tpm_put_ops(chip);
 
-- 
2.31.0

