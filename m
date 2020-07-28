Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC85231093
	for <lists+keyrings@lfdr.de>; Tue, 28 Jul 2020 19:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgG1RKf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Jul 2020 13:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731070AbgG1RKf (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 Jul 2020 13:10:35 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAE9720786;
        Tue, 28 Jul 2020 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595956234;
        bh=mARbbccibp0w+1VVZDf+WZpyqmdv+vpiA7azcsNO8a8=;
        h=From:To:Cc:Subject:Date:From;
        b=fI3JZFQU/DE0fiQGD5XtPP7NbgOcOz4Pbe0pd7kESFcTknNCtEKsN4v7TSW7fI4Al
         EhJHUGBwWYr4Yyp6Vh9Ts7oT7mVdGxNUBlgJkQpacyzv+lCQ/GNWlWAmLyoHij5znj
         iak0V6ZhN+/6TAWVfMJ0/EaM0XOQUKsG1iMEMvwI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] KEYS: asymmetric: Fix kerneldoc
Date:   Tue, 28 Jul 2020 19:10:29 +0200
Message-Id: <20200728171029.28525-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
    crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 crypto/asymmetric_keys/asymmetric_type.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 33e77d846caa..ad8af3d70ac0 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -152,7 +152,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_generate_id);
 
 /**
  * asymmetric_key_id_same - Return true if two asymmetric keys IDs are the same.
- * @kid_1, @kid_2: The key IDs to compare
+ * @kid1: The key ID to compare
+ * @kid2: The key ID to compare
  */
 bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
 			    const struct asymmetric_key_id *kid2)
@@ -168,7 +169,8 @@ EXPORT_SYMBOL_GPL(asymmetric_key_id_same);
 /**
  * asymmetric_key_id_partial - Return true if two asymmetric keys IDs
  * partially match
- * @kid_1, @kid_2: The key IDs to compare
+ * @kid1: The key ID to compare
+ * @kid2: The key ID to compare
  */
 bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
 			       const struct asymmetric_key_id *kid2)
-- 
2.17.1

