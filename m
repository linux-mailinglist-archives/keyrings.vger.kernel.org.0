Return-Path: <keyrings+bounces-588-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6F851251
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 12:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C147B24E5E
	for <lists+keyrings@lfdr.de>; Mon, 12 Feb 2024 11:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E24638FB9;
	Mon, 12 Feb 2024 11:32:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261C38DE3;
	Mon, 12 Feb 2024 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737578; cv=none; b=BwLaxd79I8p0XpcHJcpfm/agh5LNAL3uf8u6wf/kBLnKiGcGnmTNsuCc+F1ZCYSbHKzazaldKMLZhK4t1Hl/fPgKeb49e2E9hLVYjUgwRFeovJMMrW3/Dz2GaXZAdZAYRdW3x9OJl3IgNLL1+d/TRVgieC0ObHzLIOb0lvzBras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737578; c=relaxed/simple;
	bh=GQPweGU8dfabx4if6F1d1IYZn8ycoLME/P0WWt/N/V0=;
	h=Message-Id:From:Date:Subject:To:Cc; b=GkIM7nUmu4j3d0Evcw8gD/Hjd67WkPX8G3jKOEiK/Wfbfvt//BRPczoMLNRjRbsWsk4qf+R7nvngVBQ8/zbriK/ZVnYtm6vSQUOyXwYSaQBeWbdB1c+Tct1C1+JRq3zP5Tv4IHfg+UYf+d5xUqBgH0A328h9rgKlssIPgPvDSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 5E256100DA1AC;
	Mon, 12 Feb 2024 12:24:42 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2D7D45A4B2; Mon, 12 Feb 2024 12:24:42 +0100 (CET)
Message-Id: <4143b15418c4ecf87ddeceb36813943c3ede17aa.1707734526.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 12 Feb 2024 12:24:39 +0100
Subject: [PATCH v2] X.509: Introduce scope-based x509_certificate allocation
To: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Jonathan suggests adding cleanup.h support for x509_certificate structs.
cleanup.h is a newly introduced way to automatically free allocations at
end of scope:  https://lwn.net/Articles/934679/

So add a DEFINE_FREE() clause for x509_certificate structs and use it in
x509_cert_parse() and x509_key_preparse().  These are the only functions
where scope-based x509_certificate allocation currently makes sense.
A third user will be introduced with the forthcoming SPDM library
(Security Protocol and Data Model) for PCI device authentication.

Unlike most other DEFINE_FREE() clauses, this one checks for IS_ERR()
instead of NULL before calling x509_free_certificate() at end of scope.
That's because the "constructor" of x509_certificate structs,
x509_cert_parse(), returns a valid pointer or an ERR_PTR(), but never
NULL.

I've compared the Assembler output before/after and they are identical,
save for the fact that gcc-12 always generates two return paths when
__cleanup() is used, one for the success case and one for the error case.

In x509_cert_parse(), add a hint for the compiler that kzalloc() never
returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
check on return.  Introduce a handy assume() macro for this which can be
re-used elsewhere in the kernel to provide hints for the compiler.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Link: https://lore.kernel.org/all/7721bfa3b4f8a99a111f7808ad8890c3c13df56d.1695921657.git.lukas@wunner.de/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Changes v1 -> v2:
 * Only check for !IS_ERR and not for NULL in DEFINE_FREE() clause (Herbert).
   This avoids gratuitous NULL pointer checks at end of scope.
   It's still safe to set a struct x509_certificate pointer to
   NULL because x509_free_certificate() is a no-op in that case.
 * Rephrase commit message (Jarkko):
   Add Link tag, explain what cleanup.h is for, refer to DEFINE_FREE()
   "clause" instead of "macro".
 * Add assume() macro to <linux/compiler.h> and use it in x509_cert_parse()
   to tell the compiler that kzalloc() never returns an ERR_PTR().
   This avoids gratuitous IS_ERR() checks at end of scope.

Link to v1:
 https://lore.kernel.org/all/70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de/

 crypto/asymmetric_keys/x509_cert_parser.c | 43 ++++++++++++-------------------
 crypto/asymmetric_keys/x509_parser.h      |  3 +++
 crypto/asymmetric_keys/x509_public_key.c  | 31 +++++++---------------
 include/linux/compiler.h                  |  2 ++
 4 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 487204d..aeffbf6 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -60,24 +60,24 @@ void x509_free_certificate(struct x509_certificate *cert)
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
+	assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */
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
@@ -85,7 +85,7 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 	/* Attempt to decode the certificate */
 	ret = asn1_ber_decoder(&x509_decoder, ctx, data, datalen);
 	if (ret < 0)
-		goto error_decode;
+		return ERR_PTR(ret);
 
 	/* Decode the AuthorityKeyIdentifier */
 	if (ctx->raw_akid) {
@@ -95,20 +95,19 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
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
@@ -116,33 +115,23 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
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
index 97a886c..0688c22 100644
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
+	    if (!IS_ERR(_T)) x509_free_certificate(_T))
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
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index bb1339c..384803e 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -139,6 +139,8 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 } while (0)
 #endif
 
+#define assume(cond) do if(!(cond)) __builtin_unreachable(); while(0)
+
 /*
  * KENTRY - kernel entry point
  * This can be used to annotate symbols (functions or data) that are used
-- 
2.43.0


