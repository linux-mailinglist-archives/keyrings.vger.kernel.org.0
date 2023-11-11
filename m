Return-Path: <keyrings+bounces-74-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626C7E895C
	for <lists+keyrings@lfdr.de>; Sat, 11 Nov 2023 06:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE90BB20AA1
	for <lists+keyrings@lfdr.de>; Sat, 11 Nov 2023 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13C16FB2;
	Sat, 11 Nov 2023 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A0C6FAD;
	Sat, 11 Nov 2023 05:56:07 +0000 (UTC)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CBB4204;
	Fri, 10 Nov 2023 21:56:04 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yilin.li@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vw6WwWY_1699682161;
Received: from localhost(mailfrom:YiLin.Li@linux.alibaba.com fp:SMTPD_---0Vw6WwWY_1699682161)
          by smtp.aliyun-inc.com;
          Sat, 11 Nov 2023 13:56:02 +0800
From: "YiLin.Li" <YiLin.Li@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: YiLin.Li@linux.alibaba.com,
	tianjia.zhang@linux.alibaba.com
Subject: [PATCH] crypto: asymmetric_keys/pkcs7.asn1 - remove the duplicated contentType pkcs7_note_OID processing logic
Date: Sat, 11 Nov 2023 05:55:53 +0000
Message-Id: <20231111055553.103757-1-YiLin.Li@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OID of contentType has been recorded in
`ContentType ::= OBJECT IDENTIFIER ({ pkcs7_note_OID })`,
so there is no need to re-extract the OID of contentType in
`contentType ContentType ({ pkcs7_note_OID })`.
Therefore, we need to remove the duplicated contentType
pkcs7_note_OID processing logic.

Signed-off-by: YiLin.Li <YiLin.Li@linux.alibaba.com>
---
 crypto/asymmetric_keys/pkcs7.asn1 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/pkcs7.asn1 b/crypto/asymmetric_keys/pkcs7.asn1
index 28e1f4a41c14..3f7adec38245 100644
--- a/crypto/asymmetric_keys/pkcs7.asn1
+++ b/crypto/asymmetric_keys/pkcs7.asn1
@@ -28,7 +28,7 @@ SignedData ::= SEQUENCE {
 }
 
 ContentInfo ::= SEQUENCE {
-	contentType	ContentType ({ pkcs7_note_OID }),
+	contentType	ContentType,
 	content		[0] EXPLICIT Data OPTIONAL
 }
 
-- 
2.31.1


