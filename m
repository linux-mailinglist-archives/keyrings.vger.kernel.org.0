Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563D3283873
	for <lists+keyrings@lfdr.de>; Mon,  5 Oct 2020 16:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJEOrJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Oct 2020 10:47:09 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:58057 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726860AbgJEOqf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Oct 2020 10:46:35 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UB3G6jf_1601909189;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UB3G6jf_1601909189)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 05 Oct 2020 22:46:29 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [PATCH] X.509: fix error return value on the failed path
Date:   Mon,  5 Oct 2020 22:46:28 +0800
Message-Id: <20201005144628.83875-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When memory allocation fails, an appropriate return value
should be set.

Fixes: 215525639631 ("X.509: support OSCCA SM2-with-SM3 certificate verification")
Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 crypto/asymmetric_keys/public_key_sm2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/public_key_sm2.c b/crypto/asymmetric_keys/public_key_sm2.c
index 7325cf21dbb4..66b614e1eccd 100644
--- a/crypto/asymmetric_keys/public_key_sm2.c
+++ b/crypto/asymmetric_keys/public_key_sm2.c
@@ -36,8 +36,10 @@ int cert_sig_digest_update(const struct public_key_signature *sig,
 
 	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
 	desc = kzalloc(desc_size, GFP_KERNEL);
-	if (!desc)
+	if (!desc) {
+		ret = -ENOMEM;
 		goto error_free_tfm;
+	}
 
 	desc->tfm = tfm;
 
-- 
2.24.3 (Apple Git-128)

