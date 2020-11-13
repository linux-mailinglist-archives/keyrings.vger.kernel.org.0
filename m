Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7783A2B17A6
	for <lists+keyrings@lfdr.de>; Fri, 13 Nov 2020 09:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKMI6p (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 13 Nov 2020 03:58:45 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:40886 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726348AbgKMI6n (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 13 Nov 2020 03:58:43 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UFAepvk_1605257910;
Received: from aliy80.localdomain(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UFAepvk_1605257910)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 13 Nov 2020 16:58:39 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
Cc:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] PKCS#7: drop function from kernel-doc pkcs7_validate_trust_one
Date:   Fri, 13 Nov 2020 16:58:15 +0800
Message-Id: <1605257895-5536-6-git-send-email-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605257895-5536-1-git-send-email-alex.shi@linux.alibaba.com>
References: <1605257895-5536-1-git-send-email-alex.shi@linux.alibaba.com>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The function is a static function, so no needs add into kernel-doc. and
we could avoid warning:
crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or
member 'pkcs7' not described in 'pkcs7_validate_trust_one'
crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or
member 'sinfo' not described in 'pkcs7_validate_trust_one'
crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or
member 'trust_keyring' not described in 'pkcs7_validate_trust_one'

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: David Howells <dhowells@redhat.com> 
Cc: Herbert Xu <herbert@gondor.apana.org.au> 
Cc: "David S. Miller" <davem@davemloft.net> 
Cc: keyrings@vger.kernel.org 
Cc: linux-crypto@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org 
---
 crypto/asymmetric_keys/pkcs7_trust.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
index 61af3c4d82cc..b531df2013c4 100644
--- a/crypto/asymmetric_keys/pkcs7_trust.c
+++ b/crypto/asymmetric_keys/pkcs7_trust.c
@@ -16,7 +16,7 @@
 #include <crypto/public_key.h>
 #include "pkcs7_parser.h"
 
-/**
+/*
  * Check the trust on one PKCS#7 SignedInfo block.
  */
 static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
-- 
2.29.GIT

