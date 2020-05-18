Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7B11D8016
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgERR1V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgERR1V (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:21 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE00C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j21so5135210pgb.7
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+Gs3wCV8z5Hp58qeN8HPrkHmrOrSWXxOkrLszNZdaU=;
        b=VDKJcCnX5bm1p6sc/y6MalJ8GIbzohkX5+C5JE3Ty51LGVgO/5d6X4inAm0dAXqS0N
         XldsqzskillnuUoM9WISomccMJAIcn+CJtcQpFxJFKcLQq5HWdnm4gr/JoS3vnUhl4pF
         i8/irQZrMEpAUHRnpjpyuJNDdSLskJnpkkHgcIbpPe6pSa2ZdAV+PMb1YWtx+syigPpT
         3h/oYBLAuDa5TPh5wLQtXjX/4eYLvt1w4rgmNF9bdhlX2mZe5rvh1+sTGcTmmcr7SRTS
         4QWL3aGJGVCqfYEHEh+fdIuSvG5n+4jFUEYc7UfC9nIl1mU4EpbZG+bYd6J7RxDxTrKR
         Wigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+Gs3wCV8z5Hp58qeN8HPrkHmrOrSWXxOkrLszNZdaU=;
        b=iXCjYN/17AZ+BpM1D+S1wmt2MdNf4yGKh1NT/bTtY6xQo0k6QVNSNfx/LOP8NhAwek
         M9TNyaK3tXwJ1XTlx0HtkUf9teXXjviFcoo0AaVgbtJcxkOr03HKHaG+peYsYRl+030S
         YzDKr6ehS7hKYcL04jyz9TXtbX74SuU3hhvhcpSs6a7vVZijzZZAbLkNFppDgxP9KZyU
         7193vErwgCKoIyOAjdiNF57nbLu9AZMOOYHaTW4VE67pgcRGWun6ytce1c2MOWCBRI+a
         f/Hy/wqGkEllHOZR+MHKDSlCdKG9hEhxecEPs327EQ7D66j63UaSTDvOXgBIqOdjMgpy
         1qqA==
X-Gm-Message-State: AOAM532E/47HojgVyUFLOGtLAq1WZM3+LyrL4gtyhyvkq36++pA/bIok
        3iv20NtvKwVZjxrcAS0yOzKA99wt1VA=
X-Google-Smtp-Source: ABdhPJzmYIICT+7IlNQamSAlG8aLp2PsRG0gmUQzl6CzfgIEhlbOkmuo8p/4+Nl37uFNWLXOvocC0g==
X-Received: by 2002:a63:cf03:: with SMTP id j3mr15610548pgg.24.1589822839915;
        Mon, 18 May 2020 10:27:19 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:19 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 08/17] tpm2: add session encryption protection to tpm2_get_random()
Date:   Mon, 18 May 2020 10:26:55 -0700
Message-Id: <20200518172704.29608-9-prestwoj@gmail.com>
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

If some entity is snooping the TPM bus, they can see the random
numbers we're extracting from the TPM and do prediction attacks
against their consumers.  Foil this attack by using response
encryption to prevent the attacker from seeing the random sequence.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm2-cmd.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index b29824ae237c..92e381bfd7c8 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -291,29 +291,40 @@ int tpm2_get_random(struct tpm_chip *chip, u8 *dest, size_t max)
 	int total = 0;
 	int retries = 5;
 	u8 *dest_ptr = dest;
+	struct tpm2_auth *auth;
 
 	if (!num_bytes || max > TPM_MAX_RNG_DATA)
 		return -EINVAL;
 
-	err = tpm_buf_init(&buf, 0, 0);
+	err = tpm2_start_auth_session(chip, &auth);
 	if (err)
 		return err;
 
+	err = tpm_buf_init(&buf, 0, 0);
+	if (err) {
+		tpm2_end_auth_session(auth);
+		return err;
+	}
+
 	do {
-		tpm_buf_reset(&buf, TPM2_ST_NO_SESSIONS, TPM2_CC_GET_RANDOM);
+		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_GET_RANDOM);
+		tpm_buf_append_hmac_session_opt(&buf, auth, TPM2_SA_ENCRYPT
+						| TPM2_SA_CONTINUE_SESSION,
+						NULL, 0);
 		tpm_buf_append_u16(&buf, num_bytes);
+		tpm_buf_fill_hmac_session(&buf, auth);
 		err = tpm_transmit_cmd(chip, &buf,
 				       offsetof(struct tpm2_get_random_out,
 						buffer),
 				       "attempting get random");
+		err = tpm_buf_check_hmac_response(&buf, auth, err);
 		if (err) {
 			if (err > 0)
 				err = -EIO;
 			goto out;
 		}
 
-		out = (struct tpm2_get_random_out *)
-			&buf.data[TPM_HEADER_SIZE];
+		out = (struct tpm2_get_random_out *)tpm_buf_parameters(&buf);
 		recd = min_t(u32, be16_to_cpu(out->size), num_bytes);
 		if (tpm_buf_length(&buf) <
 		    TPM_HEADER_SIZE +
@@ -330,6 +341,8 @@ int tpm2_get_random(struct tpm_chip *chip, u8 *dest, size_t max)
 	} while (retries-- && total < max);
 
 	tpm_buf_destroy(&buf);
+	tpm2_end_auth_session(auth);
+
 	return total ? total : -EIO;
 out:
 	tpm_buf_destroy(&buf);
-- 
2.21.1

