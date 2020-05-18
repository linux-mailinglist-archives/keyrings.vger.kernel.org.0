Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BD11D801B
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgERR1Z (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgERR1Z (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EA0C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:24 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so145720pjh.2
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7ZJo5GSYlG/1HLhJKX4JMXUb05bkA+s5cA697P0kfc=;
        b=lDDEPXofAI0DhxBwvMHfceNp0e3LgPzaI5PNatAUC0HNJ6e07Fm4K4b6yMz1eGiDBj
         NHM/YHrOqNZGq2U3+mO3+gsiOkPK4K9MRcPTAU4B3ngRi3qavrjMzSs0bwdFdZNkB9jM
         fRRQcZTbqA7DUFJFX6kQtHdf/hVtwdMS3G5OQeJZPFpiY/Yi8w10y5clVmabjQlEW2I3
         WIIUZD6ghQkTf0L+XyPknGJWa4ZHv1oivr5ypOEpFi3wdRdHq26ebo/D0VGqq53zmdz9
         g/g7UjphiQhiLgeQ8pUJnukfctYgr0lhpC2fJiFRCJn8DhN0HPlfQxwHYADBVvxG6GoU
         1w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7ZJo5GSYlG/1HLhJKX4JMXUb05bkA+s5cA697P0kfc=;
        b=SYn0hy1EGxHE/EyjOgmJnTe89oKWVql3E2nh6PAi3oS10nmql90QG6vHbKmEo2OjAH
         RepsiJeK6qbxkrit74L6s5LCf5bGfk0rjb8pzTwII7oUCLi/I9J+fPebdgqJhL11PmU9
         yvj4khfPvfhoJKpKxbDu+d2ZEFUrgc4PiAKqEdtNOA6L1LLypcu75lcv4oprVv5w0aIG
         nilM8UwHyc8PAKVEEic0qiHhkjY2Fm07tpZbnZRhdFRPe2teYZYuP8AukWWRrvFbxUEk
         jqMKAc4Eg13Tj/POS4TwYEFjz6X3i0zQVquc7gD57V1q3IEI3qE3IkokK7SYWZK0fVzh
         nJMw==
X-Gm-Message-State: AOAM530mUWFFd9eiCotD0qm5KQPQZK6s1rcyEdTr5ZNch3C59WAA3d5l
        ZOBde6e/mj/SIysycyUqKwsfQ+iRjWU=
X-Google-Smtp-Source: ABdhPJyBuGwWoWzKq9ndBBLOUFRK9mEb8+qsmf7NhscGcnNcuv+bncqV7bQPRFYAW5SHgJ4aVEn82g==
X-Received: by 2002:a17:90a:ea98:: with SMTP id h24mr444534pjz.195.1589822844178;
        Mon, 18 May 2020 10:27:24 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:23 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH 12/17] oid_registry: Add TCG defined OIDS for TPM keys
Date:   Mon, 18 May 2020 10:26:59 -0700
Message-Id: <20200518172704.29608-13-prestwoj@gmail.com>
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

The TCG has defined an OID prefix "2.23.133.10.1" for the various TPM
key uses.  We've defined three of the available numbers:

2.23.133.10.1.3 TPM Loadable key.  This is an asymmetric key (Usually
		RSA2048 or Elliptic Curve) which can be imported by a
		TPM2_Load() operation.

2.23.133.10.1.4 TPM Importable Key.  This is an asymmetric key (Usually
		RSA2048 or Elliptic Curve) which can be imported by a
		TPM2_Import() operation.

Both loadable and importable keys are specific to a given TPM, the
difference is that a loadable key is wrapped with the symmetric
secret, so must have been created by the TPM itself.  An importable
key is wrapped with a DH shared secret, and may be created without
access to the TPM provided you know the public part of the parent key.

2.23.133.10.1.5 TPM Sealed Data.  This is a set of data (up to 128
		bytes) which is sealed by the TPM.  It usually
		represents a symmetric key and must be unsealed before
		use.

The ASN.1 binary key form starts of with this OID as the first element
of a sequence, giving the binary form a unique recognizable identity
marker regardless of encoding.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 include/linux/oid_registry.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 657d6bf2c064..f6e2276e5f30 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -107,6 +107,11 @@ enum OID {
 	OID_gostTC26Sign512B,		/* 1.2.643.7.1.2.1.2.2 */
 	OID_gostTC26Sign512C,		/* 1.2.643.7.1.2.1.2.3 */
 
+	/* TCG defined OIDS for TPM based keys */
+	OID_TPMLoadableKey,		/* 2.23.133.10.1.3 */
+	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
+	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
+
 	OID__NR
 };
 
-- 
2.21.1

