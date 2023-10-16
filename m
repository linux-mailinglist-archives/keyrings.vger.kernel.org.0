Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B237CA1B6
	for <lists+keyrings@lfdr.de>; Mon, 16 Oct 2023 10:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjJPIfv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Oct 2023 04:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjJPIfu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Oct 2023 04:35:50 -0400
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C669A1;
        Mon, 16 Oct 2023 01:35:47 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qsJ4V-007Sey-0T; Mon, 16 Oct 2023 16:35:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Oct 2023 16:35:36 +0800
Date:   Mon, 16 Oct 2023 16:35:36 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Denis Kenzior <denkenz@gmail.com>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Prestwood <prestwoj@gmail.com>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] KEYS: asymmetric: Fix sign/verify on pkcs1pad without a hash
Message-ID: <ZSz12KHsfJmZGjKz@gondor.apana.org.au>
References: <ab4d8025-a4cc-48c6-a6f0-1139e942e1db@gmail.com>
 <ZSc/9nUuF/d24iO6@gondor.apana.org.au>
 <ZSda3l7asdCr06kA@gondor.apana.org.au>
 <be96d2e7-592e-467e-9ad2-3f69a69cf844@gmail.com>
 <ZSdn29PDrs6hzjV9@gondor.apana.org.au>
 <1d22cd18-bc2a-4273-8087-e74030fbf373@gmail.com>
 <ZSgChGwi1r9CILPI@gondor.apana.org.au>
 <c917020d-0cb0-4289-a2e3-d9a0fa28151a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c917020d-0cb0-4289-a2e3-d9a0fa28151a@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Oct 12, 2023 at 10:08:46AM -0500, Denis Kenzior wrote:
>
> Looks like something took out the ability to run sign/verify without a hash
> on asymmetric keys.

Indeed this is what it was.  Please try this patch.  Thanks!

---8<---
The new sign/verify code broke the case of pkcs1pad without a
hash algorithm.  Fix it by setting issig correctly for this case.

Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without scatterlists")
Cc: stable@vger.kernel.org # v6.5
Reported-by: Denis Kenzior <denkenz@gmail.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index abeecb8329b3..2f9181c4cd59 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -81,14 +81,13 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		 * RSA signatures usually use EMSA-PKCS1-1_5 [RFC3447 sec 8.2].
 		 */
 		if (strcmp(encoding, "pkcs1") == 0) {
+			*sig = op == kernel_pkey_sign ||
+			       op == kernel_pkey_verify;
 			if (!hash_algo) {
-				*sig = false;
 				n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
 					     "pkcs1pad(%s)",
 					     pkey->pkey_algo);
 			} else {
-				*sig = op == kernel_pkey_sign ||
-				       op == kernel_pkey_verify;
 				n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
 					     "pkcs1pad(%s,%s)",
 					     pkey->pkey_algo, hash_algo);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
