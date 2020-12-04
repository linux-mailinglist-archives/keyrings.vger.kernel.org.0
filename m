Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D46F2CE921
	for <lists+keyrings@lfdr.de>; Fri,  4 Dec 2020 09:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgLDIBM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Dec 2020 03:01:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:58900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbgLDIBM (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 4 Dec 2020 03:01:12 -0500
Date:   Fri, 4 Dec 2020 09:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607068832;
        bh=KbgMLWqu/q/WfIjx7vih5Bs5YLK0QKMwGERH9O/ubkE=;
        h=From:To:Cc:Subject:From;
        b=VzU1lt65LOCZwL6xXpN/k9rdNdUmEb5is/1GPcR1Q0O51OtSQgt7jyUn6eSonrejc
         i2clp31L7xVq1iFzeqiv4420SaaXW5GyzGrsIQWG8D2bvtr1K0M6im9bBL6vjteXqY
         8NS46T/TpJhjnYUUsZWRfpQLviGe3GDIJyqNci4g=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ilil Blum Shem-Tov <ilil.blum.shem-tov@intel.com>
Subject: [PATCH] crypto: asym_tpm: correct zero out potential secrets
Message-ID: <X8ns4AfwjKudpyfe@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The function derive_pub_key() should be calling memzero_explicit()
instead of memset() in case the complier decides to optimize away the
call to memset() because it "knows" no one is going to touch the memory
anymore.

Reported-by: Ilil Blum Shem-Tov <ilil.blum.shem-tov@intel.com>
Tested-by: Ilil Blum Shem-Tov <ilil.blum.shem-tov@intel.com>
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 crypto/asymmetric_keys/asym_tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 378b18b9bc34..84a5d6af9609 100644
--- a/crypto/asymmetric_keys/asym_tpm.c
+++ b/crypto/asymmetric_keys/asym_tpm.c
@@ -354,7 +354,7 @@ static uint32_t derive_pub_key(const void *pub_key, uint32_t len, uint8_t *buf)
 	memcpy(cur, e, sizeof(e));
 	cur += sizeof(e);
 	/* Zero parameters to satisfy set_pub_key ABI. */
-	memset(cur, 0, SETKEY_PARAMS_SIZE);
+	memzero_explicit(cur, SETKEY_PARAMS_SIZE);
 
 	return cur - buf;
 }
-- 
2.29.2

