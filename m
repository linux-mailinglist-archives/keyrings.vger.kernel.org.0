Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8080E456A8B
	for <lists+keyrings@lfdr.de>; Fri, 19 Nov 2021 07:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhKSHC0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Nov 2021 02:02:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12406 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbhKSHC0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 19 Nov 2021 02:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637305163;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=O/YcdRCsAW4PWbVTFX7FFzo3cfU7U3Y7Cmf6XywN7qA=;
    b=fOjift2vSfiZ3UFSL4YV5f8UjiD4U2Edc8x1ceM5nv/q0tx1WLekCaKjpWm2LcPueZ
    YXDOSvTONB82jRPGFjJgopheE2yYkA69u2Hy1kZ1xOiP/1184x+zQeHiHvD3/HRsmm/n
    hiMpQpFbUf4tfI2F8lwiEcUQPvsKueln8ueoYtpkU3x8HLj62cJGHFCFsuwM/ZJDOcrr
    7ClJ3vyt6ZWlk1/u4B6qBCmHzhcJVI2jnk/HCBbg1GAa5GEmxNb7ASAtRQhBNbWSpN3k
    O25xACKG0afwIgucxrVHIjHhsl8hupVoKdoKnt2wVgS8B+b/Jjrrso6cG+oiCh0gSFnQ
    3KvQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZJ/SWpaI="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAJ6xMu3y
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 07:59:22 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     herbert@gondor.apana.org.au
Cc:     ebiggers@kernel.org, jarkko@kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        dhowells@redhat.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        simo@redhat.com
Subject: [PATCH v4 3/4] security: DH - remove dead code for zero padding
Date:   Fri, 19 Nov 2021 07:58:44 +0100
Message-ID: <20729897.4csPzL39Zc@positron.chronox.de>
In-Reply-To: <4642773.OV4Wx5bFTl@positron.chronox.de>
References: <4642773.OV4Wx5bFTl@positron.chronox.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Remove the specific code that adds a zero padding that was intended
to be invoked when the DH operation result was smaller than the
modulus. However, this cannot occur any more these days because the
function mpi_write_to_sgl is used in the code path that calculates the
shared secret in dh_compute_value. This MPI service function guarantees
that leading zeros are introduced as needed to ensure the resulting data
is exactly as long as the modulus. This implies that the specific code
to add zero padding is dead code which can be safely removed.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
Acked-by: Mat Martineau <mathew.j.martineau@linux.intel.com>
---
 security/keys/dh.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/security/keys/dh.c b/security/keys/dh.c
index 1abfa70ed6e1..56e12dae4534 100644
--- a/security/keys/dh.c
+++ b/security/keys/dh.c
@@ -141,7 +141,7 @@ static void kdf_dealloc(struct kdf_sdesc *sdesc)
  * 'dlen' must be a multiple of the digest size.
  */
 static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
-		   u8 *dst, unsigned int dlen, unsigned int zlen)
+		   u8 *dst, unsigned int dlen)
 {
 	struct shash_desc *desc = &sdesc->shash;
 	unsigned int h = crypto_shash_digestsize(desc->tfm);
@@ -158,22 +158,6 @@ static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
 		if (err)
 			goto err;
 
-		if (zlen && h) {
-			u8 tmpbuffer[32];
-			size_t chunk = min_t(size_t, zlen, sizeof(tmpbuffer));
-			memset(tmpbuffer, 0, chunk);
-
-			do {
-				err = crypto_shash_update(desc, tmpbuffer,
-							  chunk);
-				if (err)
-					goto err;
-
-				zlen -= chunk;
-				chunk = min_t(size_t, zlen, sizeof(tmpbuffer));
-			} while (zlen);
-		}
-
 		if (src && slen) {
 			err = crypto_shash_update(desc, src, slen);
 			if (err)
@@ -198,7 +182,7 @@ static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
 
 static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
 				 char __user *buffer, size_t buflen,
-				 uint8_t *kbuf, size_t kbuflen, size_t lzero)
+				 uint8_t *kbuf, size_t kbuflen)
 {
 	uint8_t *outbuf = NULL;
 	int ret;
@@ -211,7 +195,7 @@ static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
 		goto err;
 	}
 
-	ret = kdf_ctr(sdesc, kbuf, kbuflen, outbuf, outbuf_len, lzero);
+	ret = kdf_ctr(sdesc, kbuf, kbuflen, outbuf, outbuf_len);
 	if (ret)
 		goto err;
 
@@ -384,8 +368,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
 		}
 
 		ret = keyctl_dh_compute_kdf(sdesc, buffer, buflen, outbuf,
-					    req->dst_len + kdfcopy->otherinfolen,
-					    outlen - req->dst_len);
+					    req->dst_len + kdfcopy->otherinfolen);
 	} else if (copy_to_user(buffer, outbuf, req->dst_len) == 0) {
 		ret = req->dst_len;
 	} else {
-- 
2.33.1




