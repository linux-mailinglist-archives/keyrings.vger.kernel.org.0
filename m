Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74155424401
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 19:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhJFRZp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 13:25:45 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60478
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229835AbhJFRZo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 13:25:44 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id CE11D3FFE4;
        Wed,  6 Oct 2021 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633541030;
        bh=MJeBRb5etdZcXTPQ8b0j2/km0oaalM1EtK76TFXxa+w=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=lp/3KZVs08cKssNF2KsDkim83QzobVTto7zJRqmjSopuQJMf35IzPuUrk0I/Tc7Nd
         8h0KtwSDdyDs2bvO5kIQuDZfciBX95YI7/6KgczSNTi+9VeD//rvJmDOhtQPXirFSc
         FNq0b2zmzwaxKDyWCHteFiqBWhVlHReLeXFOL3xWEJkFjGHG3ROgz1itrdGiC1afRt
         PT35LUZ/9DDo5y2zDhPpqXzJfzDHtpiPD/qqnLqktqYYGuFm1Ksg0vrWDnF51gfSjs
         6i6mnDAMMQXG6B2WTU++E9IG7IEU5h9f6qsoef7vUU05bBSch5POIP0aePxZGd8EAT
         WcSwe+xrug/Gw==
From:   Colin King <colin.king@canonical.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] crypto : asymmetric_keys: Fix function description to match prototype
Date:   Wed,  6 Oct 2021 18:23:50 +0100
Message-Id: <20211006172350.1025091-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function arguments in the description does not match the prototype.
Fix this by renaming trust_keys to trusted_keys.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 crypto/asymmetric_keys/verify_pefile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
index 7553ab18db89..148cad70fe79 100644
--- a/crypto/asymmetric_keys/verify_pefile.c
+++ b/crypto/asymmetric_keys/verify_pefile.c
@@ -387,7 +387,7 @@ static int pefile_digest_pe(const void *pebuf, unsigned int pelen,
  * verify_pefile_signature - Verify the signature on a PE binary image
  * @pebuf: Buffer containing the PE binary image
  * @pelen: Length of the binary image
- * @trust_keys: Signing certificate(s) to use as starting points
+ * @trusted_keys: Signing certificate(s) to use as starting points
  * @usage: The use to which the key is being put.
  *
  * Validate that the certificate chain inside the PKCS#7 message inside the PE
-- 
2.32.0

