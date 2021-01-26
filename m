Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91157305077
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhA0EKR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:10:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1118 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2395232AbhAZTMT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 14:12:19 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ36RA096544;
        Tue, 26 Jan 2021 14:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xzyfgi/cBXVpF08KJAKTX6KCXvZ0vSUhKgaTHWdLH5c=;
 b=kWSREPO/3DLWQJT7eVakFEAFA9OBm3+p4pXkylbGuuPYqZLc38AyyZGOZ9n+e2n0fBsf
 FpvSg/qWItGpxeyzQoJy8w3ar3Su7SDafnWoPW2Z7ei1zcoNgSVJPUJEE+jk0ikK2jdV
 9Re+SaLwaxuSjht0Bg/q7YnFnBWJm8+J+fkLaheZtHSQLPdFOKY+veOqJljNdpEZ38jH
 QlelbeKpAuGneA666SCo8Oa1syY2Uu7bRlHiHOEWFdLp7dlMRsv0ybbmUEB/YHFGpEWK
 +us2z72uQDN6M4K5GSgAY8fdU/4Z0ARfuK48uKQIixnZRPPBksltYpULqGKAkL2fIZGv cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36aqrrt6jx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:26 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QJ5AFh106351;
        Tue, 26 Jan 2021 14:11:26 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36aqrrt6jn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:26 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ2djL019940;
        Tue, 26 Jan 2021 19:11:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma02dal.us.ibm.com with ESMTP id 36a4mbrngh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 19:11:25 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QJBNFr25100590
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 19:11:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BEC9B136059;
        Tue, 26 Jan 2021 19:11:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1B703136055;
        Tue, 26 Jan 2021 19:11:23 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 19:11:22 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 2/3] x509: Add support for parsing x509 certs with NIST p256 keys
Date:   Tue, 26 Jan 2021 14:11:14 -0500
Message-Id: <20210126191115.434842-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
References: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_10:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101260096
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

This patch adds support for parsing of x509 certificates that contain
NIST P256 keys that have been signed by a CA using any of the current SHA
hash algorithms. Since self-signed certificates are verified, the ecc math
for signature verification is also added.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/Makefile                           |   9 +-
 crypto/asymmetric_keys/public_key.c       |  16 ++
 crypto/asymmetric_keys/x509_cert_parser.c |  31 ++-
 crypto/ecc.c                              | 283 ++++++++++++++++++++++
 crypto/ecc.h                              |   2 +
 crypto/ecc_curve_defs.h                   |   4 +
 crypto/eccsignature.asn1                  |   4 +
 include/linux/oid_registry.h              |   5 +
 8 files changed, 352 insertions(+), 2 deletions(-)
 create mode 100644 crypto/eccsignature.asn1

diff --git a/crypto/Makefile b/crypto/Makefile
index b279483fba50..09ae06235274 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -50,6 +50,14 @@ sm2_generic-y += sm2.o
 
 obj-$(CONFIG_CRYPTO_SM2) += sm2_generic.o
 
+$(obj)/eccsignature.asn1.o: $(obj)/eccsignature.asn1.c $(obj)/eccsignature.asn1.h
+$(obj)/ecc.o: $(obj)/sm2signature.asn1.h
+
+ecc_generic-y += eccsignature.asn1.o
+ecc_generic-y += ecc.o
+
+obj-$(CONFIG_CRYPTO_ECC) += ecc_generic.o
+
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
 obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
@@ -172,7 +180,6 @@ obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 obj-$(CONFIG_CRYPTO_OFB) += ofb.o
-obj-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 obj-$(CONFIG_CRYPTO_CURVE25519) += curve25519-generic.o
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 8892908ad58c..0fcbaec0ded0 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -90,6 +90,22 @@ int software_key_determine_akcipher(const char *encoding,
 		return 0;
 	}
 
+	if (strcmp(encoding, "x962") == 0) {
+		enum OID oid;
+
+		if (pkey->paramlen < 2)
+			return -EINVAL;
+
+		oid = look_up_OID(pkey->params + 2, pkey->paramlen - 2);
+		switch (oid) {
+		case OID_id_prime256v1:
+			strcpy(alg_name, "nist_p256");
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
 	return -ENOPKG;
 }
 
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 4643fe5ed69a..50f6ecc70d8b 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -227,6 +227,26 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->cert->sig->hash_algo = "sha224";
 		goto rsa_pkcs1;
 
+	case OID_id_ecdsa_with_sha1:
+		ctx->cert->sig->hash_algo = "sha1";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha224:
+		ctx->cert->sig->hash_algo = "sha224";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha256:
+		ctx->cert->sig->hash_algo = "sha256";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha384:
+		ctx->cert->sig->hash_algo = "sha384";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha512:
+		ctx->cert->sig->hash_algo = "sha512";
+		goto ecdsa;
+
 	case OID_gost2012Signature256:
 		ctx->cert->sig->hash_algo = "streebog256";
 		goto ecrdsa;
@@ -255,6 +275,11 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	ctx->cert->sig->encoding = "raw";
 	ctx->algo_oid = ctx->last_oid;
 	return 0;
+ecdsa:
+	ctx->cert->sig->pkey_algo = "ecdsa";
+	ctx->cert->sig->encoding = "x962";
+	ctx->algo_oid = ctx->last_oid;
+	return 0;
 }
 
 /*
@@ -276,7 +301,8 @@ int x509_note_signature(void *context, size_t hdrlen,
 
 	if (strcmp(ctx->cert->sig->pkey_algo, "rsa") == 0 ||
 	    strcmp(ctx->cert->sig->pkey_algo, "ecrdsa") == 0 ||
-	    strcmp(ctx->cert->sig->pkey_algo, "sm2") == 0) {
+	    strcmp(ctx->cert->sig->pkey_algo, "sm2") == 0 ||
+	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0) {
 		/* Discard the BIT STRING metadata */
 		if (vlen < 1 || *(const u8 *)value != 0)
 			return -EBADMSG;
@@ -479,6 +505,9 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		case OID_sm2:
 			ctx->cert->pub->pkey_algo = "sm2";
 			break;
+		case OID_id_prime256v1:
+			ctx->cert->pub->pkey_algo = "ecdsa";
+			break;
 		default:
 			return -ENOPKG;
 		}
diff --git a/crypto/ecc.c b/crypto/ecc.c
index c80aa25994a0..3b5494794bce 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -29,13 +29,17 @@
 #include <linux/slab.h>
 #include <linux/swab.h>
 #include <linux/fips.h>
+#include <crypto/internal/akcipher.h>
+#include <crypto/akcipher.h>
 #include <crypto/ecdh.h>
 #include <crypto/rng.h>
 #include <asm/unaligned.h>
 #include <linux/ratelimit.h>
+#include <linux/asn1_decoder.h>
 
 #include "ecc.h"
 #include "ecc_curve_defs.h"
+#include "eccsignature.asn1.h"
 
 typedef struct {
 	u64 m_low;
@@ -1542,4 +1546,283 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 }
 EXPORT_SYMBOL(crypto_ecdh_shared_secret);
 
+struct ecc_ctx {
+	unsigned int curve_id;
+	const struct ecc_curve *curve;
+	struct ecc_point *pub_key;
+};
+
+struct ecdsa_signature_ctx {
+	const struct ecc_curve *curve;
+	u64 r[ECC_MAX_DIGITS];
+	u64 s[ECC_MAX_DIGITS];
+};
+
+/*
+ * Get the r and s components of a signature from the X509 certificate.
+ */
+static int ecc_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
+				const void *value, size_t vlen,
+				unsigned int ndigits)
+{
+	size_t keylen = ndigits * sizeof(u64);
+	ssize_t diff = vlen - keylen;
+	const char *d = value;
+	u8 rs[ECC_MAX_BYTES];
+
+	if (!value || !vlen)
+		return -EINVAL;
+
+	/* diff = 0: 'value' has exacly the right size
+	 * diff > 0: 'value' has too many bytes; one leading zero is allowed that
+	 *           makes the value a positive integer; error on more
+	 * diff < 0: 'value' is missing leading zeros, which we add
+	 */
+	if (diff > 0) {
+		/* skip over leading zeros that make 'value' a positive int */
+		if (*d == 0) {
+			vlen -= 1;
+			diff--;
+			d++;
+		}
+		if (diff)
+			return -EINVAL;
+	}
+	if (-diff >= keylen)
+		return -EINVAL;
+
+	if (diff) {
+		/* leading zeros not given in 'value' */
+		memset(rs, 0, -diff);
+	}
+
+	memcpy(&rs[-diff], d, vlen);
+
+	ecc_swap_digits((u64 *)rs, dest, ndigits);
+
+	return 0;
+}
+
+int ecc_get_signature_r(void *context, size_t hdrlen, unsigned char tag,
+			const void *value, size_t vlen)
+{
+	struct ecdsa_signature_ctx *sig = context;
+
+	return ecc_get_signature_rs(sig->r, hdrlen, tag, value, vlen,
+				    sig->curve->g.ndigits);
+}
+
+int ecc_get_signature_s(void *context, size_t hdrlen, unsigned char tag,
+			const void *value, size_t vlen)
+{
+	struct ecdsa_signature_ctx *sig = context;
+
+	return ecc_get_signature_rs(sig->s, hdrlen, tag, value, vlen,
+				    sig->curve->g.ndigits);
+}
+
+static int _ecdsa_verify(struct ecc_ctx *ctx, const u64 *hash,
+			 const u64 *r, const u64 *s)
+{
+	const struct ecc_curve *curve = ctx->curve;
+	unsigned int ndigits = curve->g.ndigits;
+	u64 s1[ECC_MAX_DIGITS];
+	u64 u1[ECC_MAX_DIGITS];
+	u64 u2[ECC_MAX_DIGITS];
+	u64 x1[ECC_MAX_DIGITS];
+	u64 y1[ECC_MAX_DIGITS];
+	struct ecc_point res = ECC_POINT_INIT(x1, y1, ndigits);
+
+	/* 0 < r < n  and 0 < s < n */
+	if (vli_is_zero(r, ndigits) || vli_cmp(r, curve->n, ndigits) >= 0 ||
+	    vli_is_zero(s, ndigits) || vli_cmp(s, curve->n, ndigits) >= 0)
+		return -EBADMSG;
+
+	/* hash is given */
+	pr_devel("hash : %016llx %016llx ... %016llx\n",
+		 hash[ndigits - 1], hash[ndigits - 2], hash[0]);
+
+	/* s1 = (s^-1) mod n */
+	vli_mod_inv(s1, s, curve->n, ndigits);
+	/* u1 = (hash * s1) mod n */
+	vli_mod_mult_slow(u1, hash, s1, curve->n, ndigits);
+	/* u2 = (r * s1) mod n */
+	vli_mod_mult_slow(u2, r, s1, curve->n, ndigits);
+	/* res = u1*G + u2 * pub_key */
+	ecc_point_mult_shamir(&res, u1, &curve->g, u2, ctx->pub_key, curve);
+
+	/* res.x = res.x mod n (if res.x > order) */
+	if (unlikely(vli_cmp(res.x, curve->n, ndigits) == 1))
+		/* faster alternative for NIST p256 & p192 */
+		vli_sub(res.x, res.x, curve->n, ndigits);
+
+	if (!vli_cmp(res.x, r, ndigits))
+		return 0;
+
+	return -EKEYREJECTED;
+}
+
+/*
+ * Verify an ECDSA signature.
+ */
+static int ecdsa_verify(struct akcipher_request *req)
+{
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+	size_t keylen = ctx->curve->g.ndigits * sizeof(u64);
+	struct ecdsa_signature_ctx sig_ctx = {
+		.curve = ctx->curve,
+	};
+	u8 rawhash[ECC_MAX_BYTES];
+	u64 hash[ECC_MAX_DIGITS];
+	unsigned char *buffer;
+	ssize_t diff;
+	int ret;
+
+	if (unlikely(!ctx->pub_key))
+		return -EINVAL;
+
+	buffer = kmalloc(req->src_len + req->dst_len, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	sg_pcopy_to_buffer(req->src,
+		sg_nents_for_len(req->src, req->src_len + req->dst_len),
+		buffer, req->src_len + req->dst_len, 0);
+
+	ret = asn1_ber_decoder(&eccsignature_decoder, &sig_ctx,
+			       buffer, req->src_len);
+	if (ret < 0)
+		goto error;
+
+	/* if the hash is shorter then we will add leading zeros to fit to ndigits */
+	diff = keylen - req->dst_len;
+	if (diff >= 0) {
+		if (diff)
+			memset(rawhash, 0, diff);
+		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
+	} else if (diff < 0) {
+		/* given hash is longer, we take the left-most bytes */
+		memcpy(&rawhash, buffer + req->src_len, keylen);
+	}
+
+	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
+
+	ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
+
+error:
+	kfree(buffer);
+
+	return ret;
+}
+
+static int ecc_ec_ctx_init(struct ecc_ctx *ctx, unsigned int curve_id)
+{
+	ctx->curve_id = curve_id;
+	ctx->curve = ecc_get_curve(curve_id);
+	if (!ctx->curve)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void ecc_ec_ctx_deinit(struct ecc_ctx *ctx)
+{
+	ecc_free_point(ctx->pub_key);
+	ctx->pub_key = NULL;
+}
+
+static int ecc_ec_ctx_reset(struct ecc_ctx *ctx)
+{
+	unsigned int curve_id = ctx->curve_id;
+
+	ecc_ec_ctx_deinit(ctx);
+	return ecc_ec_ctx_init(ctx, curve_id);
+}
+
+/*
+ * Set the public key given the raw uncompressed key data from an X509
+ * certificate. The key data contain the concatenated X and Y coordinates of
+ * the public key.
+ */
+static int ecc_set_pub_key(struct crypto_akcipher *tfm,
+			   const void *key, unsigned int keylen)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+	const unsigned char *d = key;
+	const u64 *digits = (const u64 *)&d[1];
+	unsigned int ndigits;
+	int ret;
+
+	ret = ecc_ec_ctx_reset(ctx);
+	if (ret < 0)
+		return ret;
+
+	if (keylen < 1 || (((keylen - 1) >> 1) % sizeof(u64)) != 0)
+		return -EINVAL;
+	/* we only accept uncompressed format */
+	if (d[0] != 4)
+		return -EINVAL;
+
+	keylen--;
+	ndigits = (keylen >> 1) / sizeof(u64);
+	if (ndigits != ctx->curve->g.ndigits)
+		return -EINVAL;
+
+	ctx->pub_key = ecc_alloc_point(ndigits);
+	if (!ctx->pub_key)
+		return -ENOMEM;
+
+	ecc_swap_digits(digits, ctx->pub_key->x, ndigits);
+	ecc_swap_digits(&digits[ndigits], ctx->pub_key->y, ndigits);
+	return ecc_is_pubkey_valid_full(ctx->curve, ctx->pub_key);
+}
+
+static void ecc_exit_tfm(struct crypto_akcipher *tfm)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	ecc_ec_ctx_deinit(ctx);
+}
+
+static unsigned int ecc_nist_p256_max_size(struct crypto_akcipher *tfm)
+{
+	return NIST_P256_KEY_SIZE;
+}
+
+static int ecc_nist_p256_init_tfm(struct crypto_akcipher *tfm)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return ecc_ec_ctx_init(ctx, ECC_CURVE_NIST_P256);
+}
+
+static struct akcipher_alg ecc_nist_p256 = {
+	.verify = ecdsa_verify,
+	.set_pub_key = ecc_set_pub_key,
+	.max_size = ecc_nist_p256_max_size,
+	.init = ecc_nist_p256_init_tfm,
+	.exit = ecc_exit_tfm,
+	.base = {
+		.cra_name = "nist_p256",
+		.cra_driver_name = "ecc-nist-p256",
+		.cra_priority = 100,
+		.cra_module = THIS_MODULE,
+		.cra_ctxsize = sizeof(struct ecc_ctx),
+	},
+};
+
+static int ecc_init(void)
+{
+	return crypto_register_akcipher(&ecc_nist_p256);
+}
+
+static void ecc_exit(void)
+{
+	crypto_unregister_akcipher(&ecc_nist_p256);
+}
+
+subsys_initcall(ecc_init);
+module_exit(ecc_exit);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/crypto/ecc.h b/crypto/ecc.h
index d4e546b9ad79..26d7c83908bc 100644
--- a/crypto/ecc.h
+++ b/crypto/ecc.h
@@ -33,6 +33,8 @@
 
 #define ECC_DIGITS_TO_BYTES_SHIFT 3
 
+#define ECC_MAX_BYTES (ECC_MAX_DIGITS << ECC_DIGITS_TO_BYTES_SHIFT)
+
 /**
  * struct ecc_point - elliptic curve point in affine coordinates
  *
diff --git a/crypto/ecc_curve_defs.h b/crypto/ecc_curve_defs.h
index 69be6c7d228f..562651f28ef5 100644
--- a/crypto/ecc_curve_defs.h
+++ b/crypto/ecc_curve_defs.h
@@ -28,6 +28,8 @@ static struct ecc_curve nist_p192 = {
 	.b = nist_p192_b
 };
 
+#define NIST_P192_KEY_SIZE 24
+
 /* NIST P-256: a = p - 3 */
 static u64 nist_p256_g_x[] = { 0xF4A13945D898C296ull, 0x77037D812DEB33A0ull,
 				0xF8BCE6E563A440F2ull, 0x6B17D1F2E12C4247ull };
@@ -54,4 +56,6 @@ static struct ecc_curve nist_p256 = {
 	.b = nist_p256_b
 };
 
+#define NIST_P256_KEY_SIZE 32
+
 #endif
diff --git a/crypto/eccsignature.asn1 b/crypto/eccsignature.asn1
new file mode 100644
index 000000000000..e6c82381f19d
--- /dev/null
+++ b/crypto/eccsignature.asn1
@@ -0,0 +1,4 @@
+ECDSASignature ::= SEQUENCE {
+	r	INTEGER ({ ecc_get_signature_r }),
+	s	INTEGER ({ ecc_get_signature_s })
+}
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4462ed2c18cd..9060f19c80eb 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -21,6 +21,11 @@ enum OID {
 	OID_id_dsa,			/* 1.2.840.10040.4.1 */
 	OID_id_ecdsa_with_sha1,		/* 1.2.840.10045.4.1 */
 	OID_id_ecPublicKey,		/* 1.2.840.10045.2.1 */
+	OID_id_prime256v1,		/* 1.2.840.10045.3.1.7 */
+	OID_id_ecdsa_with_sha224,	/* 1.2.840.10045.4.3.1 */
+	OID_id_ecdsa_with_sha256,	/* 1.2.840.10045.4.3.2 */
+	OID_id_ecdsa_with_sha384,	/* 1.2.840.10045.4.3.3 */
+	OID_id_ecdsa_with_sha512,	/* 1.2.840.10045.4.3.4 */
 
 	/* PKCS#1 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-1(1)} */
 	OID_rsaEncryption,		/* 1.2.840.113549.1.1.1 */
-- 
2.25.4

