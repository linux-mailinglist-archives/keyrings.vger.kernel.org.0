Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128C6637AEC
	for <lists+keyrings@lfdr.de>; Thu, 24 Nov 2022 15:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiKXOBV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 24 Nov 2022 09:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiKXOAl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 24 Nov 2022 09:00:41 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF9F14E6FF
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:38 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bs21so2603120wrb.4
        for <keyrings@vger.kernel.org>; Thu, 24 Nov 2022 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK2HhZFuYKBw9Q1i1G+ZYdrg12Uwlkokjhvoi/Q+HPY=;
        b=D38n3pCWpXzjlzIFepFNOLyjuVk4JHdwHucQrpGgyIhDtSuhyieBCotwNYGLKhcsLH
         WxDDyNkTx2URYWVCTOtt4E1mJGwMhjgeBkw6SpOjbmPg6AN5/NLb2LFYBM47AnH6o6ED
         30mkG80aQOc2DLEBNgXILz/pS5ZcIa8CS5Pvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eK2HhZFuYKBw9Q1i1G+ZYdrg12Uwlkokjhvoi/Q+HPY=;
        b=sy5Zri8OqtXd8YCxegxfmJp50gAw7juw9ksPdbTVlT3vOjB57JtKCt6824puQNxeb7
         58sVK2a2UU/tg+adMnTReSR6kRfmju4ebylgwsupx15eow3xMvlovOH/K+ZJ7qi8z7m4
         /k4P5GpUQUHMuQanY5undxxyhQdIWIcrh9BHTWNTctwM4n8aXZ3zQe3qrpdZz7eIbI22
         Jx6c90vjcwGrZMgslTLEVY9hf+hYePmYjwMCy01DA9rDxaxIeWbdCfUW0Ohm3sAGUsGT
         r2F8EfuyeKnozz0En31wSrIwXUZWE1T3SLpd8WCR2TyODaDLoy6DgwVTqwLP69H0Dr08
         kdzg==
X-Gm-Message-State: ANoB5pnlR7WbOgbvHmFGwGzZ63Eqev/+APzuxMd8NZnOY5hA/vIDv44N
        XL5J9m+MiMeWTm/Yi42/xojTbA==
X-Google-Smtp-Source: AA0mqf5sc5D8WHrub5ZtPIWUF7UHcLatkb1hu6n9mgvJRIQQ9In22C2OQPul1kbFM8wIG+G3AZNcNA==
X-Received: by 2002:adf:e5c4:0:b0:236:9701:97d2 with SMTP id a4-20020adfe5c4000000b00236970197d2mr13893227wrn.185.1669298316053;
        Thu, 24 Nov 2022 05:58:36 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac1:28c0:140::15:1b6])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d660e000000b00241bee11825sm1371440wru.103.2022.11.24.05.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Nov 2022 05:58:35 -0800 (PST)
From:   Ignat Korchagin <ignat@cloudflare.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        keyrings@vger.kernel.org
Cc:     kernel-team@cloudflare.com, lei he <helei.sig11@bytedance.com>
Subject: [RESEND PATCH v2 4/4] crypto: remove unused field in pkcs8_parse_context
Date:   Thu, 24 Nov 2022 13:58:12 +0000
Message-Id: <20221124135812.26999-5-ignat@cloudflare.com>
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

remove unused field 'algo_oid' in pkcs8_parse_context

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/asymmetric_keys/pkcs8_parser.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/asymmetric_keys/pkcs8_parser.c b/crypto/asymmetric_keys/pkcs8_parser.c
index e507c635ead5..f81317234331 100644
--- a/crypto/asymmetric_keys/pkcs8_parser.c
+++ b/crypto/asymmetric_keys/pkcs8_parser.c
@@ -21,7 +21,6 @@ struct pkcs8_parse_context {
 	struct public_key *pub;
 	unsigned long	data;			/* Start of data */
 	enum OID	last_oid;		/* Last OID encountered */
-	enum OID	algo_oid;		/* Algorithm OID */
 	u32		key_size;
 	const void	*key;
 	const void	*algo_param;
-- 
2.30.2

