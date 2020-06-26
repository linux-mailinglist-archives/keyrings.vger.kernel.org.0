Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265F620AC5F
	for <lists+keyrings@lfdr.de>; Fri, 26 Jun 2020 08:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgFZGad (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 26 Jun 2020 02:30:33 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:51990 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbgFZGac (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 26 Jun 2020 02:30:32 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1johrw-0004mR-T7; Fri, 26 Jun 2020 16:29:50 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 26 Jun 2020 16:29:48 +1000
Date:   Fri, 26 Jun 2020 16:29:48 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        LTP List <ltp@lists.linux.it>,
        open list <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-crypto@vger.kernel.org,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] crypto: af_alg - Fix regression on empty requests
Message-ID: <20200626062948.GA25285@gondor.apana.org.au>
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com>
 <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au>
 <20200623170217.GB150582@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623170217.GB150582@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jun 23, 2020 at 10:02:17AM -0700, Eric Biggers wrote:
>
> The source code for the two failing AF_ALG tests is here:
> 
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c
> 
> They use read() and write(), not send() and recv().
> 
> af_alg02 uses read() to read from a "salsa20" request socket without writing
> anything to it.  It is expected that this returns 0, i.e. that behaves like
> encrypting an empty message.
> 
> af_alg05 uses write() to write 15 bytes to a "cbc(aes-generic)" request socket,
> then read() to read 15 bytes.  It is expected that this fails with EINVAL, since
> the length is not aligned to the AES block size (16 bytes).

This patch should fix the regression:

---8<---
Some user-space programs rely on crypto requests that have no
control metadata.  This broke when a check was added to require
the presence of control metadata with the ctx->init flag.

This patch fixes the regression by removing the ctx->init flag.

This means that we do not distinguish the case of no metadata
as opposed to an empty request.  IOW it is always assumed that
if you call recv(2) before sending metadata that you are working
with an empty request.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Fixes: f3c802a1f300 ("crypto: algif_aead - Only wake up when...")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/af_alg.c b/crypto/af_alg.c
index 9fcb91ea10c4..2d391117c020 100644
--- a/crypto/af_alg.c
+++ b/crypto/af_alg.c
@@ -635,7 +635,6 @@ void af_alg_pull_tsgl(struct sock *sk, size_t used, struct scatterlist *dst,
 
 	if (!ctx->used)
 		ctx->merge = 0;
-	ctx->init = ctx->more;
 }
 EXPORT_SYMBOL_GPL(af_alg_pull_tsgl);
 
@@ -757,8 +756,7 @@ int af_alg_wait_for_data(struct sock *sk, unsigned flags, unsigned min)
 			break;
 		timeout = MAX_SCHEDULE_TIMEOUT;
 		if (sk_wait_event(sk, &timeout,
-				  ctx->init && (!ctx->more ||
-						(min && ctx->used >= min)),
+				  !ctx->more || (min && ctx->used >= min),
 				  &wait)) {
 			err = 0;
 			break;
@@ -847,7 +845,7 @@ int af_alg_sendmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	}
 
 	lock_sock(sk);
-	if (ctx->init && (init || !ctx->more)) {
+	if (!ctx->more && ctx->used) {
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -858,7 +856,6 @@ int af_alg_sendmsg(struct socket *sock, struct msghdr *msg, size_t size,
 			memcpy(ctx->iv, con.iv->iv, ivsize);
 
 		ctx->aead_assoclen = con.aead_assoclen;
-		ctx->init = true;
 	}
 
 	while (size) {
diff --git a/crypto/algif_aead.c b/crypto/algif_aead.c
index d48d2156e621..749fe42315be 100644
--- a/crypto/algif_aead.c
+++ b/crypto/algif_aead.c
@@ -106,7 +106,7 @@ static int _aead_recvmsg(struct socket *sock, struct msghdr *msg,
 	size_t usedpages = 0;		/* [in]  RX bufs to be used from user */
 	size_t processed = 0;		/* [in]  TX bufs to be consumed */
 
-	if (!ctx->init || ctx->more) {
+	if (ctx->more) {
 		err = af_alg_wait_for_data(sk, flags, 0);
 		if (err)
 			return err;
diff --git a/crypto/algif_skcipher.c b/crypto/algif_skcipher.c
index a51ba22fef58..5b6fa5e8c00d 100644
--- a/crypto/algif_skcipher.c
+++ b/crypto/algif_skcipher.c
@@ -61,7 +61,7 @@ static int _skcipher_recvmsg(struct socket *sock, struct msghdr *msg,
 	int err = 0;
 	size_t len = 0;
 
-	if (!ctx->init || (ctx->more && ctx->used < bs)) {
+	if (ctx->more && ctx->used < bs) {
 		err = af_alg_wait_for_data(sk, flags, bs);
 		if (err)
 			return err;
diff --git a/include/crypto/if_alg.h b/include/crypto/if_alg.h
index ee6412314f8f..08c087cc89d6 100644
--- a/include/crypto/if_alg.h
+++ b/include/crypto/if_alg.h
@@ -135,7 +135,6 @@ struct af_alg_async_req {
  *			SG?
  * @enc:		Cryptographic operation to be performed when
  *			recvmsg is invoked.
- * @init:		True if metadata has been sent.
  * @len:		Length of memory allocated for this data structure.
  */
 struct af_alg_ctx {
@@ -152,7 +151,6 @@ struct af_alg_ctx {
 	bool more;
 	bool merge;
 	bool enc;
-	bool init;
 
 	unsigned int len;
 };
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
