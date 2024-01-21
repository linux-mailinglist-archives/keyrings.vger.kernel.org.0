Return-Path: <keyrings+bounces-489-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DB835727
	for <lists+keyrings@lfdr.de>; Sun, 21 Jan 2024 18:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B1E1C20A19
	for <lists+keyrings@lfdr.de>; Sun, 21 Jan 2024 17:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCC4381CB;
	Sun, 21 Jan 2024 17:50:53 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD4381B2;
	Sun, 21 Jan 2024 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705859453; cv=none; b=pD/rmmT6wGxECgZNdJSfQtQupASGRsPBo4+wAxwEIpaBmuhTZDU9EjzXsjRyAg4P6lxQ9REoEqY4S2SN8edf3BX4AyjFCtRErsg7Hb2Cp+VYNFnVTXGfu7XyRWeRb0KFHAWtavx4Y1tsy+Auu9hS/PGFXkFwgL02TpIzvTFrCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705859453; c=relaxed/simple;
	bh=eHDq0ZLRZIdD55BRN9hALO8SRsLCnZIWS+ajT5ovEOI=;
	h=Message-Id:From:Date:Subject:To:Cc; b=HrtJ+QDFS7XS98ISBy7Ltd5IJcqII94nDbSt4GzZkBdS88+qITwFSfeAmgNSKJt9PKnWV+ntwr+GcBsNYeyUttQ5WBhRdRjvzpaaHSWpPuthAIGMGyL/tg6zJxUon/NbUrONa0vAPBSfaKug3Inqm0fS73MWh+r7U/YX+KuSQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 2F8582800B3C6;
	Sun, 21 Jan 2024 18:50:40 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0DB9E2C4F3A; Sun, 21 Jan 2024 18:50:40 +0100 (CET)
Message-Id: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 21 Jan 2024 18:50:39 +0100
Subject: [PATCH] X.509: Introduce scope-based x509_certificate allocation
To: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Ard Biesheuvel <ardb@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Jonathan suggests adding cleanup.h support for x509_certificate structs:
https://lore.kernel.org/all/20231003153937.000034ca@Huawei.com/

Introduce a DEFINE_FREE() macro and use it in x509_cert_parse() and
x509_key_preparse().  These are the only functions where scope-based
x509_certificate allocation currently makes sense.  Another user will
be introduced with the upcoming SPDM library (Security Protocol and
Data Model) for PCI device authentication.

Unlike most other DEFINE_FREE() macros, this one not only has to check
for NULL, but also for ERR_PTR() before calling x509_free_certificate()
at end of scope.  That's because the "constructor" of x509_certificate
structs, x509_cert_parse(), may return an ERR_PTR().

I've compared the Assembler output before/after and while I couldn't
spot a functional difference, I did notice an annoying superfluous check
being added to each function:

* x509_key_preparse() now checks that "cert" is not NULL before calling
  x509_free_certificate() at end of scope.  It knows whether "cert" is
  an ERR_PTR() because of the explicit "if (IS_ERR(cert))" check at the
  top of the function, but it doesn't know whether it's NULL.  In fact
  it can *never* be NULL because x509_cert_parse() only returns either
  a valid pointer or an ERR_PTR().

  I've tried adding __attribute__((returns_nonnull)) to x509_cert_parse()
  but the compiler ignores it due to commit a3ca86aea507
  ("Add '-fno-delete-null-pointer-checks' to gcc CFLAGS").

* x509_cert_parse() now checks that "cert" is not an ERR_PTR() before
  calling x509_free_certificate() at end of scope.  The compiler doesn't
  know that kzalloc() never returns an ERR_PTR().

  I've tried telling the compiler that by amending kmalloc() with
  "if (IS_ERR(ptr)) __builtin_unreachable();", but the result was
  disappointing:  While it succeeded in eliminating the superfluous
  ERR_PTR() check, total vmlinux size increased by 448 bytes.

  I could add such a clause locally to x509_cert_parse() instead of
  kmalloc(), but it would require additions to compiler-*.h.
  (clang uses a different syntax for these annotations.)

Despite the annoying extra checks, I think the gain in readability
justifies the conversion.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 42 +++++++++++--------------------
 crypto/asymmetric_keys/x509_parser.h      |  3 +++
 crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++----------------
 3 files changed, 27 insertions(+), 49 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 487204d..e597ac6 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -60,24 +60,23 @@ void x509_free_certificate(struct x509_certificate *cert)
  */
 struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 {
-	struct x509_certificate *cert;
-	struct x509_parse_context *ctx;
+	struct x509_certificate *cert __free(x509_free_certificate);
+	struct x509_parse_context *ctx __free(kfree) = NULL;
 	struct asymmetric_key_id *kid;
 	long ret;
 
-	ret = -ENOMEM;
 	cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
 	if (!cert)
-		goto error_no_cert;
+		return ERR_PTR(-ENOMEM);
 	cert->pub = kzalloc(sizeof(struct public_key), GFP_KERNEL);
 	if (!cert->pub)
-		goto error_no_ctx;
+		return ERR_PTR(-ENOMEM);
 	cert->sig = kzalloc(sizeof(struct public_key_signature), GFP_KERNEL);
 	if (!cert->sig)
-		goto error_no_ctx;
+		return ERR_PTR(-ENOMEM);
 	ctx = kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
 	if (!ctx)
-		goto error_no_ctx;
+		return ERR_PTR(-ENOMEM);
 
 	ctx->cert = cert;
 	ctx->data = (unsigned long)data;
@@ -85,7 +84,7 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 	/* Attempt to decode the certificate */
 	ret = asn1_ber_decoder(&x509_decoder, ctx, data, datalen);
 	if (ret < 0)
-		goto error_decode;
+		return ERR_PTR(ret);
 
 	/* Decode the AuthorityKeyIdentifier */
 	if (ctx->raw_akid) {
@@ -95,20 +94,19 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 				       ctx->raw_akid, ctx->raw_akid_size);
 		if (ret < 0) {
 			pr_warn("Couldn't decode AuthKeyIdentifier\n");
-			goto error_decode;
+			return ERR_PTR(ret);
 		}
 	}
 
-	ret = -ENOMEM;
 	cert->pub->key = kmemdup(ctx->key, ctx->key_size, GFP_KERNEL);
 	if (!cert->pub->key)
-		goto error_decode;
+		return ERR_PTR(-ENOMEM);
 
 	cert->pub->keylen = ctx->key_size;
 
 	cert->pub->params = kmemdup(ctx->params, ctx->params_size, GFP_KERNEL);
 	if (!cert->pub->params)
-		goto error_decode;
+		return ERR_PTR(-ENOMEM);
 
 	cert->pub->paramlen = ctx->params_size;
 	cert->pub->algo = ctx->key_algo;
@@ -116,33 +114,23 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 	/* Grab the signature bits */
 	ret = x509_get_sig_params(cert);
 	if (ret < 0)
-		goto error_decode;
+		return ERR_PTR(ret);
 
 	/* Generate cert issuer + serial number key ID */
 	kid = asymmetric_key_generate_id(cert->raw_serial,
 					 cert->raw_serial_size,
 					 cert->raw_issuer,
 					 cert->raw_issuer_size);
-	if (IS_ERR(kid)) {
-		ret = PTR_ERR(kid);
-		goto error_decode;
-	}
+	if (IS_ERR(kid))
+		return ERR_CAST(kid);
 	cert->id = kid;
 
 	/* Detect self-signed certificates */
 	ret = x509_check_for_self_signed(cert);
 	if (ret < 0)
-		goto error_decode;
-
-	kfree(ctx);
-	return cert;
+		return ERR_PTR(ret);
 
-error_decode:
-	kfree(ctx);
-error_no_ctx:
-	x509_free_certificate(cert);
-error_no_cert:
-	return ERR_PTR(ret);
+	return_ptr(cert);
 }
 EXPORT_SYMBOL_GPL(x509_cert_parse);
 
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index 97a886c..d2dfe50 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,6 +5,7 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <linux/cleanup.h>
 #include <linux/time.h>
 #include <crypto/public_key.h>
 #include <keys/asymmetric-type.h>
@@ -44,6 +45,8 @@ struct x509_certificate {
  * x509_cert_parser.c
  */
 extern void x509_free_certificate(struct x509_certificate *cert);
+DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
+	    if (!IS_ERR_OR_NULL(_T)) x509_free_certificate(_T))
 extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
 extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
 			    unsigned char tag,
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 6a4f00b..00ac715 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -161,12 +161,11 @@ int x509_check_for_self_signed(struct x509_certificate *cert)
  */
 static int x509_key_preparse(struct key_preparsed_payload *prep)
 {
-	struct asymmetric_key_ids *kids;
-	struct x509_certificate *cert;
+	struct x509_certificate *cert __free(x509_free_certificate);
+	struct asymmetric_key_ids *kids __free(kfree) = NULL;
+	char *p, *desc __free(kfree) = NULL;
 	const char *q;
 	size_t srlen, sulen;
-	char *desc = NULL, *p;
-	int ret;
 
 	cert = x509_cert_parse(prep->data, prep->datalen);
 	if (IS_ERR(cert))
@@ -188,9 +187,8 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 	}
 
 	/* Don't permit addition of blacklisted keys */
-	ret = -EKEYREJECTED;
 	if (cert->blacklisted)
-		goto error_free_cert;
+		return -EKEYREJECTED;
 
 	/* Propose a description */
 	sulen = strlen(cert->subject);
@@ -202,10 +200,9 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 		q = cert->raw_serial;
 	}
 
-	ret = -ENOMEM;
 	desc = kmalloc(sulen + 2 + srlen * 2 + 1, GFP_KERNEL);
 	if (!desc)
-		goto error_free_cert;
+		return -ENOMEM;
 	p = memcpy(desc, cert->subject, sulen);
 	p += sulen;
 	*p++ = ':';
@@ -215,16 +212,14 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 
 	kids = kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
 	if (!kids)
-		goto error_free_desc;
+		return -ENOMEM;
 	kids->id[0] = cert->id;
 	kids->id[1] = cert->skid;
 	kids->id[2] = asymmetric_key_generate_id(cert->raw_subject,
 						 cert->raw_subject_size,
 						 "", 0);
-	if (IS_ERR(kids->id[2])) {
-		ret = PTR_ERR(kids->id[2]);
-		goto error_free_kids;
-	}
+	if (IS_ERR(kids->id[2]))
+		return PTR_ERR(kids->id[2]);
 
 	/* We're pinning the module by being linked against it */
 	__module_get(public_key_subtype.owner);
@@ -242,15 +237,7 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 	cert->sig = NULL;
 	desc = NULL;
 	kids = NULL;
-	ret = 0;
-
-error_free_kids:
-	kfree(kids);
-error_free_desc:
-	kfree(desc);
-error_free_cert:
-	x509_free_certificate(cert);
-	return ret;
+	return 0;
 }
 
 static struct asymmetric_key_parser x509_key_parser = {
-- 
2.40.1


