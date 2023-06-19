Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDC2735877
	for <lists+keyrings@lfdr.de>; Mon, 19 Jun 2023 15:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjFSNYf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Jun 2023 09:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbjFSNYa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 19 Jun 2023 09:24:30 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A4EAA;
        Mon, 19 Jun 2023 06:24:28 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ql9Sy6RZtzTlY6;
        Mon, 19 Jun 2023 21:23:46 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 19 Jun 2023 21:24:25 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <dhowells@redhat.com>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <cuigaosheng1@huawei.com>
CC:     <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>
Subject: [PATCH -next] verify_pefile: fix kernel-doc warnings in verify_pefile
Date:   Mon, 19 Jun 2023 21:24:24 +0800
Message-ID: <20230619132424.80587-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix kernel-doc warnings in verify_pefile:

crypto/asymmetric_keys/verify_pefile.c:423: warning: Excess function
parameter 'trust_keys' description in 'verify_pefile_signature'

crypto/asymmetric_keys/verify_pefile.c:423: warning: Function parameter
or member 'trusted_keys' not described in 'verify_pefile_signature'

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 crypto/asymmetric_keys/verify_pefile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
index 22beaf2213a2..f440767bd727 100644
--- a/crypto/asymmetric_keys/verify_pefile.c
+++ b/crypto/asymmetric_keys/verify_pefile.c
@@ -391,7 +391,7 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
  * verify_pefile_signature - Verify the signature on a PE binary image
  * @pebuf: Buffer containing the PE binary image
  * @pelen: Length of the binary image
- * @trust_keys: Signing certificate(s) to use as starting points
+ * @trusted_keys: Signing certificate(s) to use as starting points
  * @usage: The use to which the key is being put.
  *
  * Validate that the certificate chain inside the PKCS#7 message inside the PE
-- 
2.25.1

