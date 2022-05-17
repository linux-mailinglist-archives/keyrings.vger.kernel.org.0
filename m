Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE714529BC4
	for <lists+keyrings@lfdr.de>; Tue, 17 May 2022 10:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241839AbiEQIHO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 17 May 2022 04:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242347AbiEQIHO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 17 May 2022 04:07:14 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08953B549;
        Tue, 17 May 2022 01:07:12 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L2TFq0jT7zbbxh;
        Tue, 17 May 2022 16:05:51 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 16:07:11 +0800
From:   GUO Zihua <guozihua@huawei.com>
To:     <keyrings@vger.kernel.org>
CC:     <linux-crypto@vger.kernel.org>, <davem@davemloft.net>,
        <dhowells@redhat.com>, <herbert@gondor.apana.org.au>,
        <gustavoars@kernel.org>, <linux-hardening@vger.kernel.org>
Subject: [PATCH] crypto: Use struct_size() helper in kmalloc()
Date:   Tue, 17 May 2022 16:05:32 +0800
Message-ID: <20220517080532.31015-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Make use of struct_size() heler for structures containing flexible array
member instead of sizeof() which prevents potential issues as well as
addressing the following sparse warning:

crypto/asymmetric_keys/asymmetric_type.c:155:23: warning: using sizeof
on a flexible structure
crypto/asymmetric_keys/asymmetric_type.c:247:28: warning: using sizeof
on a flexible structure

Reference: https://github.com/KSPP/linux/issues/174

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 crypto/asymmetric_keys/asymmetric_type.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 41a2f0eb4ce4..96a99a91bf17 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -152,7 +152,7 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
 {
 	struct asymmetric_key_id *kid;
 
-	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
+	kid = kmalloc(struct_size(kid, data, len_1 + len_2),
 		      GFP_KERNEL);
 	if (!kid)
 		return ERR_PTR(-ENOMEM);
@@ -244,7 +244,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 	if (asciihexlen & 1)
 		return ERR_PTR(-EINVAL);
 
-	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
+	match_id = kmalloc(struct_size(match_id, data, asciihexlen / 2),
 			   GFP_KERNEL);
 	if (!match_id)
 		return ERR_PTR(-ENOMEM);
-- 
2.36.0

