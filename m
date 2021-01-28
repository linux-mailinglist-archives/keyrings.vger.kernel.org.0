Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9855830687C
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 01:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhA1APz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 19:15:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14172 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231132AbhA1APT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 19:15:19 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10RNXjlE068715;
        Wed, 27 Jan 2021 19:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=f8l1OS8MIPpB1SXV7cJD0BErSfvofm+rcezPXa5kSms=;
 b=jwM+oPp5nZOcX5rQ9ZRD0bfSFAw2EBWAHqGmr4dZZKWgNu5dX3ORlft+ftA8zfIl5+to
 xTZgEYeYh+mmvAwhzgtABdcMl3w5XIYBw458iHkxjTrdLEWhwBfEw6Bti0GhAqj8xAjd
 1KEWvRUSkE6hEDJUedfaIn0jzEHhxXSnGGLnEF64ErHI3G+odEkCb4jfrmoYd+TMxipd
 5TAcN5yt4E5Y8UWLLGnJrGTFH0CwRCTIwZWG5nipRn4EBob8/KL6lzGgqbvqDWwM2OUx
 ZZ1DGwqk9g+dfFr6uN7L4lZRv2L8tTZ8eW9VsHZ2jql+dr8lNj4dsEAJIaWwKwCcUdch +g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5t4kt5k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 19:14:18 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10S07kfq029389;
        Thu, 28 Jan 2021 00:14:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma02wdc.us.ibm.com with ESMTP id 36acj9dkwc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 00:14:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10S0EHpP29622646
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 00:14:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7B761AE064;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 69F0EAE063;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, patrick@puiterwijk.org,
        Stefan Berger <stefanb@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v4 1/3] crypto: Add support for ECDSA signature verification
Date:   Wed, 27 Jan 2021 19:14:10 -0500
Message-Id: <20210128001412.822048-2-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
References: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_10:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270116
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

Add support for parsing the parameters of a NIST P256 or NIST P192 key.
Enable signature verification using these keys.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
---
 crypto/Makefile            |   9 +-
 crypto/ecc.c               | 279 +++++++++++++++++++++++++++++++++++++
 crypto/ecc.h               |   2 +
 crypto/ecdsasignature.asn1 |   4 +
 4 files changed, 293 insertions(+), 1 deletion(-)
 create mode 100644 crypto/ecdsasignature.asn1

diff --git a/crypto/Makefile b/crypto/Makefile
index b279483fba50..767f6b71aa20 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -50,6 +50,14 @@ sm2_generic-y += sm2.o
 
 obj-$(CONFIG_CRYPTO_SM2) += sm2_generic.o
 
+$(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
+$(obj)/ecc.o: $(obj)/ecdsasignature.asn1.h
+
+ecc_generic-y += ecdsasignature.asn1.o
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
 
diff --git a/crypto/ecc.c b/crypto/ecc.c
index c80aa25994a0..3636f9d17eaf 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -29,13 +29,18 @@
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
+#include <linux/scatterlist.h>
 
 #include "ecc.h"
 #include "ecc_curve_defs.h"
+#include "ecdsasignature.asn1.h"
 
 typedef struct {
 	u64 m_low;
@@ -1542,4 +1547,278 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 }
 EXPORT_SYMBOL(crypto_ecdh_shared_secret);
 
+struct ecc_ctx {
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
+static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
+				  const void *value, size_t vlen,
+				  unsigned int ndigits)
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
+int ecdsa_get_signature_r(void *context, size_t hdrlen, unsigned char tag,
+			const void *value, size_t vlen)
+{
+	struct ecdsa_signature_ctx *sig = context;
+
+	return ecdsa_get_signature_rs(sig->r, hdrlen, tag, value, vlen,
+				      sig->curve->g.ndigits);
+}
+
+int ecdsa_get_signature_s(void *context, size_t hdrlen, unsigned char tag,
+			  const void *value, size_t vlen)
+{
+	struct ecdsa_signature_ctx *sig = context;
+
+	return ecdsa_get_signature_rs(sig->s, hdrlen, tag, value, vlen,
+				      sig->curve->g.ndigits);
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
+	ret = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx,
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
+static void ecdsa_ec_ctx_deinit(struct ecc_ctx *ctx)
+{
+	ecc_free_point(ctx->pub_key);
+	ctx->pub_key = NULL;
+}
+
+static int ecdsa_ec_ctx_reset(struct ecc_ctx *ctx)
+{
+	ecdsa_ec_ctx_deinit(ctx);
+	return 0;
+}
+
+/*
+ * Set the public key given the raw uncompressed key data from an X509
+ * certificate. The key data contain the concatenated X and Y coordinates of
+ * the public key.
+ */
+static int ecdsa_set_pub_key(struct crypto_akcipher *tfm,
+			     const void *key, unsigned int keylen)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+	const unsigned char *d = key;
+	const u64 *digits = (const u64 *)&d[1];
+	unsigned int ndigits;
+	int ret;
+
+	ret = ecdsa_ec_ctx_reset(ctx);
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
+	switch (ndigits) {
+	case 3:
+		ctx->curve = ecc_get_curve(ECC_CURVE_NIST_P192);
+		break;
+	case 4:
+		ctx->curve = ecc_get_curve(ECC_CURVE_NIST_P256);
+		break;
+	}
+	if (!ctx->curve)
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
+static void ecdsa_exit_tfm(struct crypto_akcipher *tfm)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	ecdsa_ec_ctx_deinit(ctx);
+}
+
+static unsigned int ecdsa_max_size(struct crypto_akcipher *tfm)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return ctx->pub_key->ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
+}
+
+static int ecdsa_init_tfm(struct crypto_akcipher *tfm)
+{
+	return 0;
+}
+
+static struct akcipher_alg ecdsa = {
+	.verify = ecdsa_verify,
+	.set_pub_key = ecdsa_set_pub_key,
+	.max_size = ecdsa_max_size,
+	.init = ecdsa_init_tfm,
+	.exit = ecdsa_exit_tfm,
+	.base = {
+		.cra_name = "ecdsa",
+		.cra_driver_name = "ecdsa-generic",
+		.cra_priority = 100,
+		.cra_module = THIS_MODULE,
+		.cra_ctxsize = sizeof(struct ecc_ctx),
+	},
+};
+
+static int ecdsa_init(void)
+{
+	return crypto_register_akcipher(&ecdsa);
+}
+
+static void ecdsa_exit(void)
+{
+	crypto_unregister_akcipher(&ecdsa);
+}
+
+subsys_initcall(ecdsa_init);
+module_exit(ecdsa_exit);
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
diff --git a/crypto/ecdsasignature.asn1 b/crypto/ecdsasignature.asn1
new file mode 100644
index 000000000000..621ab754fb9f
--- /dev/null
+++ b/crypto/ecdsasignature.asn1
@@ -0,0 +1,4 @@
+ECDSASignature ::= SEQUENCE {
+	r	INTEGER ({ ecdsa_get_signature_r }),
+	s	INTEGER ({ ecdsa_get_signature_s })
+}
-- 
2.26.2

