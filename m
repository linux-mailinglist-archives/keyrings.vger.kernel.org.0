Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13EF32B7DA2
	for <lists+keyrings@lfdr.de>; Wed, 18 Nov 2020 13:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgKRMai (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Nov 2020 07:30:38 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:35879 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725747AbgKRMai (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Nov 2020 07:30:38 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UFoCyub_1605702631;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UFoCyub_1605702631)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 18 Nov 2020 20:30:31 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [PATCH] crypto: public_key: Remove redundant header file from public_key.h
Date:   Wed, 18 Nov 2020 20:30:31 +0800
Message-Id: <20201118123031.551-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The akcipher.h header file was originally introduced in SM2, and
then the definition of SM2 was moved to the existing code. This
header file is left and should be removed.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 include/crypto/public_key.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 948c5203ca9c..47accec68cb0 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -12,7 +12,6 @@
 
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
-#include <crypto/akcipher.h>
 
 /*
  * Cryptographic data for the public-key subtype of the asymmetric key type.
-- 
2.19.1.3.ge56e4f7

