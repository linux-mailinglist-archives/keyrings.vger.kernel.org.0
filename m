Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0D21D801F
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgERR1a (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgERR1a (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F24CC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:29 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u22so4486470plq.12
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DOoC6RMfZHUYe1siAwmYdu5ypSLhE4eC+mZXq5SbvM=;
        b=Ll9F8NFlU1tpDY768EM2RpsA1a/A0D2rE4NUCyxhvGvSRIc80M9oJldUMGcpy140/J
         6gDaSHULILCFMzaTNkj/9WC0Nz2NtNJUTU1haisZ/uSnszcSpcn8QWAjEZYYEg6Zp63e
         tu6D6NbmZ5pIG3kNhPKqAneAMFsT6eywzgq/WfJ4MqTX/V0LQy/oOAU/kotagGzzMf2n
         XVw4dF4f9Aumc4pJdz5SXwn7sb+gpuQ9amJNz579qj+1tNmhx7pdvOTbn8FE2h1lP8CC
         eZa82H5TcYil3ot5gJb6MNWx016+UdIHof+fCgB/yjqHnuxczxdY1+QRi4pL7AVKxvlQ
         iljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DOoC6RMfZHUYe1siAwmYdu5ypSLhE4eC+mZXq5SbvM=;
        b=YQGZb4Ou+HS8L0qVpsreHEo65opYvIjvFmi2bDb0Dx6m7LAla4ewGPY5TEKD+IIL0K
         4ppTQ6XrmEFPBoweDQxAZ97MEJRtuNVj5Z19C5TSlMw+YCdb1jaqowvQVzTXq2/CvHRH
         /nhxry2I442Qs3WsxLj0VBoC+CJERL27H4IKmhvCTBKcVQwPnS30/wJ8LKcxCJlrU2JJ
         XkYt1Q/xQGFNYbMAAlBPZYsOcHVD9yVjO9j+LPumlXptNjl2Q/5XlttYc5Q3nekgZNv9
         sooNCQhMH7dlAwMeF9eEgJAM16e6OlKt10wSa4kYsOrb1L9nP3mVUY6leAFFNnaXNivk
         V5Bw==
X-Gm-Message-State: AOAM530cb8rN9LnIsRNrLI0vL5k1mPrOps13TvHddIKpXfuQZAT5PRR9
        krPDkE5YdAoGyezbtpsxTkKCgTcHRLc=
X-Google-Smtp-Source: ABdhPJxXO+Iijo8QoiBM2gZjrWlDZdKXpOt4S34pUpXvBFKYLT8nCqTZF3zz0jaEfik7vq7WiiHNZA==
X-Received: by 2002:a17:902:c254:: with SMTP id 20mr3994883plg.287.1589822848667;
        Mon, 18 May 2020 10:27:28 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:28 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 16/17] asymmetric_keys: add TPM2 ASN1 definition
Date:   Mon, 18 May 2020 10:27:03 -0700
Message-Id: <20200518172704.29608-17-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Copied the TPM2 ASN1 definition from trusted-keys

Signed-off-by: James Prestwood <prestwoj@gmail.com>
---
 crypto/asymmetric_keys/tpm2key.asn1 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 crypto/asymmetric_keys/tpm2key.asn1

diff --git a/crypto/asymmetric_keys/tpm2key.asn1 b/crypto/asymmetric_keys/tpm2key.asn1
new file mode 100644
index 000000000000..f930fd812db3
--- /dev/null
+++ b/crypto/asymmetric_keys/tpm2key.asn1
@@ -0,0 +1,23 @@
+---
+--- Note: This isn't quite the definition in the standard
+---       However, the Linux asn.1 parser doesn't understand
+---       [2] EXPLICIT SEQUENCE OF OPTIONAL
+---       So there's an extra intermediate TPMPolicySequence
+---       definition to work around this
+
+TPMKey ::= SEQUENCE {
+	type		OBJECT IDENTIFIER ({tpmkey_type}),
+	emptyAuth	[0] EXPLICIT BOOLEAN OPTIONAL,
+	policy		[1] EXPLICIT TPMPolicySequence OPTIONAL,
+	secret		[2] EXPLICIT OCTET STRING OPTIONAL,
+	parent		INTEGER ({tpmkey_parent}),
+	pubkey		OCTET STRING ({tpmkey_pub}),
+	privkey		OCTET STRING ({tpmkey_priv})
+	}
+
+TPMPolicySequence ::= SEQUENCE OF TPMPolicy
+
+TPMPolicy ::= SEQUENCE {
+	commandCode		[0] EXPLICIT INTEGER ({tpmkey_code}),
+	commandPolicy		[1] EXPLICIT OCTET STRING ({tpmkey_policy})
+	}
-- 
2.21.1

