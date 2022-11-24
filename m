Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA30637AEA
	for <lists+keyrings@lfdr.de>; Thu, 24 Nov 2022 15:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiKXOBA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 24 Nov 2022 09:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbiKXOAj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 24 Nov 2022 09:00:39 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4231448DD
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so1328853wms.0
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOV0/JHYEg81m6+HxEgpndLefaJ+Ca9O4oLBIpfzJQg=;
        b=GLYA1v5eNATQO1vvCsTT7oynkA2oTGIWJuo/nJ3SRsduvSWWv1gi2qbfBprG4o33Sw
         pu/YCPsZ531MyXFGwDXmAqU3aIUuyXibH+njYOHGDEDztc/3xMCcGEdFRKb4ut3KKXAx
         PkmPtnjn4r5dE7R+FXG0ngW2YTigncjLXWcfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOV0/JHYEg81m6+HxEgpndLefaJ+Ca9O4oLBIpfzJQg=;
        b=q1Y61ug5pF5QK+F9MkvY751t/62wqww+6mNQzbvnDM6R8EAlk8q6qegZdHHqh1D3VF
         jiyoBJPLFSCblVSTQqVIRUb1U/ZBpKpML5xY49MS4o8KDSn6BeTogryY0nNPWP9rmbxp
         3NET+CagmRLD5lE8kWrzazUvJkXTpk59Qpi2dfGgy09SQXxKaEi9/q5lQ0LMF8eSKogK
         Owo8H6E7OGnlz/i7xKSjzQIqHrBvoLywn0QM3qThkMHc+ghNPmBGvXE6e5TjVDGuMWMl
         v2wHaYs1H2VoZQ6kKz2/0I2W9F/yHZE9YNACI6jg5JANReZV1Shn0Q7dIdzUf+2Z/eyq
         GmyQ==
X-Gm-Message-State: ANoB5pngPueKWJGZGe1VuS2jW9lqatJuxQm4/ogkMq0srk3Vb7Lle/s0
        stBD1G73sbjSxT4kfQc/EAmxeA==
X-Google-Smtp-Source: AA0mqf6yuhIqzkcaBsLjdvn8dN0YTQXYBrCWAHXnfZsbLp3dN5z5ny5VpIH1qO2r8e0Ds8cZ3PstSQ==
X-Received: by 2002:a05:600c:3542:b0:3cf:6c2f:950c with SMTP id i2-20020a05600c354200b003cf6c2f950cmr16568410wmq.146.1669298315035;
        Thu, 24 Nov 2022 05:58:35 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac1:28c0:140::15:1b6])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d660e000000b00241bee11825sm1371440wru.103.2022.11.24.05.58.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Nov 2022 05:58:34 -0800 (PST)
From:   Ignat Korchagin <ignat@cloudflare.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        keyrings@vger.kernel.org
Cc:     kernel-team@cloudflare.com, lei he <helei.sig11@bytedance.com>,
        Ignat Korchagin <ignat@cloudflare.com>
Subject: [RESEND PATCH v2 3/4] crypto: pkcs8 parser support ECDSA private keys
Date:   Thu, 24 Nov 2022 13:58:11 +0000
Message-Id: <20221124135812.26999-4-ignat@cloudflare.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221124135812.26999-1-ignat@cloudflare.com>
References: <20221124135812.26999-1-ignat@cloudflare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: lei he <helei.sig11@bytedance.com>

Make pkcs8_private_key_parser can identify ECDSA private keys.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
---
 crypto/asymmetric_keys/pkcs8.asn1     |  2 +-
 crypto/asymmetric_keys/pkcs8_parser.c | 45 +++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs8.asn1 b/crypto/asymmetric_keys/pkcs8.asn1
index 702c41a3c713..1791ddf4168a 100644
--- a/crypto/asymmetric_keys/pkcs8.asn1
+++ b/crypto/asymmetric_keys/pkcs8.asn1
@@ -20,5 +20,5 @@ Attribute ::= ANY
 
 AlgorithmIdentifier ::= SEQUENCE {
 	algorithm   OBJECT IDENTIFIER ({ pkcs8_note_OID }),
-	parameters  ANY OPTIONAL
+	parameters  ANY OPTIONAL ({ pkcs8_note_algo_parameter })
 }
diff --git a/crypto/asymmetric_keys/pkcs8_parser.c b/crypto/asymmetric_keys/pkcs8_parser.c
index 105dcce27f71..e507c635ead5 100644
--- a/crypto/asymmetric_keys/pkcs8_parser.c
+++ b/crypto/asymmetric_keys/pkcs8_parser.c
@@ -24,6 +24,8 @@ struct pkcs8_parse_context {
 	enum OID	algo_oid;		/* Algorithm OID */
 	u32		key_size;
 	const void	*key;
+	const void	*algo_param;
+	u32		algo_param_len;
 };
 
 /*
@@ -47,6 +49,17 @@ int pkcs8_note_OID(void *context, size_t hdrlen,
 	return 0;
 }
 
+int pkcs8_note_algo_parameter(void *context, size_t hdrlen,
+			      unsigned char tag,
+			      const void *value, size_t vlen)
+{
+	struct pkcs8_parse_context *ctx = context;
+
+	ctx->algo_param = value;
+	ctx->algo_param_len = vlen;
+	return 0;
+}
+
 /*
  * Note the version number of the ASN.1 blob.
  */
@@ -69,11 +82,37 @@ int pkcs8_note_algo(void *context, size_t hdrlen,
 		    const void *value, size_t vlen)
 {
 	struct pkcs8_parse_context *ctx = context;
-
-	if (ctx->last_oid != OID_rsaEncryption)
+	enum OID curve_id;
+
+	switch (ctx->last_oid) {
+	case OID_id_ecPublicKey:
+		if (!ctx->algo_param || ctx->algo_param_len == 0)
+			return -EBADMSG;
+		curve_id = look_up_OID(ctx->algo_param, ctx->algo_param_len);
+
+		switch (curve_id) {
+		case OID_id_prime192v1:
+			ctx->pub->pkey_algo = "ecdsa-nist-p192";
+			break;
+		case OID_id_prime256v1:
+			ctx->pub->pkey_algo = "ecdsa-nist-p256";
+			break;
+		case OID_id_ansip384r1:
+			ctx->pub->pkey_algo = "ecdsa-nist-p384";
+			break;
+		default:
+			return -ENOPKG;
+		}
+		break;
+
+	case OID_rsaEncryption:
+		ctx->pub->pkey_algo = "rsa";
+		break;
+
+	default:
 		return -ENOPKG;
+	}
 
-	ctx->pub->pkey_algo = "rsa";
 	return 0;
 }
 
-- 
2.30.2

