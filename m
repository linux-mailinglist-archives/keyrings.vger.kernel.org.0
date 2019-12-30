Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BD012CBF0
	for <lists+keyrings@lfdr.de>; Mon, 30 Dec 2019 03:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfL3Ca0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 29 Dec 2019 21:30:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8644 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726726AbfL3Ca0 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sun, 29 Dec 2019 21:30:26 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A1B6D2CA8BB94C1402C9;
        Mon, 30 Dec 2019 10:30:23 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Mon, 30 Dec 2019
 10:30:14 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dhowells@redhat.com>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>
CC:     <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] PKCS#7: Use match_string() helper to simplify the code
Date:   Mon, 30 Dec 2019 10:28:42 +0800
Message-ID: <20191230022842.22940-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 crypto/asymmetric_keys/pkcs7_verify.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index ce49820..0b4d07a 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -141,11 +141,10 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	*buf = sinfo->sig->digest;
 	*len = sinfo->sig->digest_size;
 
-	for (i = 0; i < HASH_ALGO__LAST; i++)
-		if (!strcmp(hash_algo_name[i], sinfo->sig->hash_algo)) {
-			*hash_algo = i;
-			break;
-		}
+	i = match_string(hash_algo_name, HASH_ALGO__LAST,
+			 sinfo->sig->hash_algo);
+	if (i >= 0)
+		*hash_algo = i;
 
 	return 0;
 }
-- 
2.7.4


