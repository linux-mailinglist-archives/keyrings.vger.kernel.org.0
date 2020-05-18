Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD621D8020
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgERR1b (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgERR1a (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:30 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D53C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:30 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r22so5134342pga.12
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mbcNhwZGtp7M2ujUPrtGuXEmg3QICxFoR1Qaw0sW7AU=;
        b=ttv5JcA740SpkyqqF9/RO6aJeSu2vvav3KHh0ognttIBDOQh7hVEl4ihVyVqbgclfg
         JFm7Sc+bnkOAb4UHC40NGn4mi8YqzOuuXWpYs0ZWUjufSYIlDXLVVEUvynDF2K1vhc0X
         zIbK4V2rM7ng82aLN9FwIfu0OHkz4CM579g56s+gq78DoyMmfB2W7yXhKfQHNIsK3paM
         DLr9Xr9FwOm7QmCrGBxTx7Lu0PoHb1xyQ2oAkxq2EJYisLxZCUlL7UN4XzMZgP9cVQaJ
         yD3OptgqviS/348YdcU+x1h0+mXswgeUImtAIzak5Dp37TNQN/EEP6nJCtO6DoVzkzsQ
         eU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mbcNhwZGtp7M2ujUPrtGuXEmg3QICxFoR1Qaw0sW7AU=;
        b=d58CXGHgdqqf9p0vyHrUKLmo0H7ttztyMUtuctw89hWCHUc5YljxdE6z9B9KstdvuS
         C3zkYEWWWk3Qvh8slH58icf1WliZyFKMPnpj60uG72Hh8LXwTscl9uuqssxCzGBxhRTJ
         8t2yu99R8f7QXqvLDJ1LxnRmxwuidGGsm8nZO4LBFXnuUE/Ug4VHVnobxusZSYkS1SfS
         1aDH3AuOqLx2nivEk1okx9en0T+2vHzx9pL/LmqnhX4LiDHnYJ851epNohLi4SAbpZDm
         gQhu15DFKRDplLlA07D4e/uTn9Q4FQ2oTTtoghkxCAYIz3/pYsIZ1iB2YOd2f+7F/k6c
         RNtA==
X-Gm-Message-State: AOAM533a4E79MFgldqxXnOr8Qb35CL0DPZ71BCeTY/zhphATc3IbYMDF
        0mZ1Gf675nWSrHn1u7xzdoby9lH94lc=
X-Google-Smtp-Source: ABdhPJyNv7M+p/7uvyrwQnrCbaiVYhPj+wbWFLsNsYp+z94tj1Zq4eg3ydWHzzuLsjGEfgPaLUOEuQ==
X-Received: by 2002:a62:760e:: with SMTP id r14mr17638113pfc.92.1589822849583;
        Mon, 18 May 2020 10:27:29 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:29 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 17/17] asymmetric_keys: add tpm2 key parser/type
Date:   Mon, 18 May 2020 10:27:04 -0700
Message-Id: <20200518172704.29608-18-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This adds support for RSA key operations using a TPM2 wrapped
private key. Encryption and verify are done in software as these
are operations using only the public key which is not hidden
behind the TPM. Decryption and sign use tpm2_rsa_decrypt() for
most of the leg work.

The key parser uses the ASN.1 definition for TPM2 keys. This
parses out the private and public portion of the keys. From here
a bit more parsing is done in order to find the portions of these
keys which can be handed directly to the TPM for decryption/sign.

Signed-off-by: James Prestwood <prestwoj@gmail.com>
---
 crypto/asymmetric_keys/Kconfig       |  20 +
 crypto/asymmetric_keys/Makefile      |  12 +
 crypto/asymmetric_keys/asym_tpm2.c   | 653 +++++++++++++++++++++++++++
 crypto/asymmetric_keys/tpm2_parser.c | 155 +++++++
 4 files changed, 840 insertions(+)
 create mode 100644 crypto/asymmetric_keys/asym_tpm2.c
 create mode 100644 crypto/asymmetric_keys/tpm2_parser.c

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 1f1f004dc757..f3f7afffa9b0 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -34,6 +34,17 @@ config ASYMMETRIC_TPM_KEY_SUBTYPE
 	  Operations such as sign, verify, encrypt, decrypt are performed by
 	  the TPM after the private key is loaded.
 
+config ASYMMETRIC_TPM2_KEY_SUBTYPE
+	tristate "Asymmetric TPM2 backed private key subtype"
+	depends on TCG_TPM
+	select CRYPTO_RSA
+	select CRYPTO_SHA256
+	select CRYPTO_HASH_INFO
+	help
+	  This option provides support for TPM2 backed private key type
+	  handling. Operations such as sign, verify, encrypt, decrypt are
+	  performed by the TPM2 after the private key is loaded.
+
 config X509_CERTIFICATE_PARSER
 	tristate "X.509 certificate parser"
 	depends on ASYMMETRIC_PUBLIC_KEY_SUBTYPE
@@ -63,6 +74,15 @@ config TPM_KEY_PARSER
 	  private key data and provides the ability to instantiate a crypto key
 	  from that data.
 
+config TPM2_KEY_PARSER
+	tristate "TPM2 private key parser"
+	depends on ASYMMETRIC_TPM2_KEY_SUBTYPE
+	select ASN1
+	help
+	  This option provides support for parsing TPM2 format blobs for
+	  private key data and provides the ability to instantiate a crypto key
+	  from that data.
+
 config PKCS7_MESSAGE_PARSER
 	tristate "PKCS#7 message parser"
 	depends on X509_CERTIFICATE_PARSER
diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 28b91adba2ae..7ce121366395 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -12,6 +12,7 @@ asymmetric_keys-y := \
 
 obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 obj-$(CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE) += asym_tpm.o
+obj-$(CONFIG_ASYMMETRIC_TPM2_KEY_SUBTYPE) += asym_tpm2.o
 
 #
 # X.509 Certificate handling
@@ -86,3 +87,14 @@ tpm_key_parser-y := \
 
 $(obj)/tpm_parser.o: $(obj)/tpm.asn1.h
 $(obj)/tpm.asn1.o: $(obj)/tpm.asn1.c $(obj)/tpm.asn1.h
+
+#
+# TPM2 private key parsing
+#
+obj-$(CONFIG_TPM2_KEY_PARSER) += tpm2_key_parser.o
+tpm2_key_parser-y := \
+	tpm2key.asn1.o \
+	tpm2_parser.o
+
+$(obj)/tpm2_parser.o: $(obj)/tpm2key.asn1.h
+$(obj)/tpm2key.asn1.o: $(obj)/tpm2key.asn1.c $(obj)/tpm2key.asn1.h
diff --git a/crypto/asymmetric_keys/asym_tpm2.c b/crypto/asymmetric_keys/asym_tpm2.c
new file mode 100644
index 000000000000..1a5a32a691b9
--- /dev/null
+++ b/crypto/asymmetric_keys/asym_tpm2.c
@@ -0,0 +1,653 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#define pr_fmt(fmt) "ASYM-TPM2: "fmt
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/tpm.h>
+#include <crypto/akcipher.h>
+#include <crypto/asym_tpm2_subtype.h>
+#include <crypto/public_key.h>
+#include <asm/unaligned.h>
+#include <keys/asymmetric-subtype.h>
+#include "tpm2key.asn1.h"
+
+/* Room to fit two u32 zeros for algo id and parameters length. */
+#define SETKEY_PARAMS_SIZE (sizeof(u32) * 2)
+
+/*
+ * Maximum buffer size for the BER/DER encoded public key.  The public key
+ * is of the form SEQUENCE { INTEGER n, INTEGER e } where n is a maximum 2048
+ * bit key and e is usually 65537
+ * The encoding overhead is:
+ * - max 4 bytes for SEQUENCE
+ *   - max 4 bytes for INTEGER n type/length
+ *     - 257 bytes of n
+ *   - max 2 bytes for INTEGER e type/length
+ *     - 3 bytes of e
+ * - 4+4 of zeros for set_pub_key parameters (SETKEY_PARAMS_SIZE)
+ */
+#define PUB_KEY_BUF_SIZE (4 + 4 + 257 + 2 + 3 + SETKEY_PARAMS_SIZE)
+
+/* How many bytes will it take to encode the length */
+static inline u32 definite_length(u32 len)
+{
+	if (len <= 127)
+		return 1;
+	if (len <= 255)
+		return 2;
+	return 3;
+}
+
+static inline u8 *encode_tag_length(u8 *buf, u8 tag, u32 len)
+{
+	*buf++ = tag;
+
+	if (len <= 127) {
+		buf[0] = len;
+		return buf + 1;
+	}
+
+	if (len <= 255) {
+		buf[0] = 0x81;
+		buf[1] = len;
+		return buf + 2;
+	}
+
+	buf[0] = 0x82;
+	put_unaligned_be16(len, buf + 1);
+	return buf + 3;
+}
+
+static u32 derive_pub_key(const void *pub_key, u32 len, u8 *buf)
+{
+	u8 *cur = buf;
+	u32 n_len = definite_length(len) + 1 + len + 1;
+	u32 e_len = definite_length(3) + 1 + 3;
+	u8 e[3] = { 0x01, 0x00, 0x01 };
+
+	/* SEQUENCE */
+	cur = encode_tag_length(cur, 0x30, n_len + e_len);
+	/* INTEGER n */
+	cur = encode_tag_length(cur, 0x02, len + 1);
+	cur[0] = 0x00;
+	memcpy(cur + 1, pub_key, len);
+	cur += len + 1;
+	cur = encode_tag_length(cur, 0x02, sizeof(e));
+	memcpy(cur, e, sizeof(e));
+	cur += sizeof(e);
+	/* Zero parameters to satisfy set_pub_key ABI. */
+	memset(cur, 0, SETKEY_PARAMS_SIZE);
+
+	return cur - buf;
+}
+
+static void asym_tpm2_describe(const struct key *asymmetric_key,
+			       struct seq_file *m)
+{
+	struct tpm2_key *tk = asymmetric_key->payload.data[asym_crypto];
+
+	if (!tk)
+		return;
+
+	seq_puts(m, "TPM2.0/Blob");
+}
+
+static void asym_tpm2_destroy(void *payload0, void *payload3)
+{
+	struct tpm2_key *tk = payload0;
+
+	if (!tk)
+		return;
+
+	kfree(tk->blob);
+	kfree(tk);
+}
+
+/*
+ * Determine the crypto algorithm name.
+ */
+static int determine_akcipher(const char *encoding, const char *hash_algo,
+			      char alg_name[CRYPTO_MAX_ALG_NAME])
+{
+	if (strcmp(encoding, "pkcs1") == 0) {
+		if (!hash_algo) {
+			strcpy(alg_name, "pkcs1pad(rsa)");
+			return 0;
+		}
+
+		if (snprintf(alg_name, CRYPTO_MAX_ALG_NAME, "pkcs1pad(rsa,%s)",
+			     hash_algo) >= CRYPTO_MAX_ALG_NAME)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	if (strcmp(encoding, "raw") == 0) {
+		strcpy(alg_name, "rsa");
+		return 0;
+	}
+
+	return -ENOPKG;
+}
+
+/*
+ * Encryption operation is performed with the public key.  Hence it is done
+ * in software
+ */
+static int tpm2_key_encrypt(struct tpm2_key *tk,
+			    struct kernel_pkey_params *params,
+			    const void *in, void *out)
+{
+	char alg_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_akcipher *tfm;
+	struct akcipher_request *req;
+	struct crypto_wait cwait;
+	struct scatterlist in_sg, out_sg;
+	u8 der_pub_key[PUB_KEY_BUF_SIZE];
+	u32 der_pub_key_len;
+	int rc;
+
+	pr_devel("==>%s()\n", __func__);
+
+	rc = determine_akcipher(params->encoding, params->hash_algo, alg_name);
+	if (rc < 0)
+		return rc;
+
+	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	der_pub_key_len = derive_pub_key(tk->pub, tk->pub_len, der_pub_key);
+
+	rc = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
+	if (rc < 0)
+		goto error_free_tfm;
+
+	rc = -ENOMEM;
+	req = akcipher_request_alloc(tfm, GFP_KERNEL);
+	if (!req)
+		goto error_free_tfm;
+
+	sg_init_one(&in_sg, in, params->in_len);
+	sg_init_one(&out_sg, out, params->out_len);
+	akcipher_request_set_crypt(req, &in_sg, &out_sg, params->in_len,
+				   params->out_len);
+
+	crypto_init_wait(&cwait);
+	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
+				      CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &cwait);
+
+	rc = crypto_akcipher_encrypt(req);
+	rc = crypto_wait_req(rc, &cwait);
+
+	if (rc == 0)
+		rc = req->dst_len;
+
+	akcipher_request_free(req);
+error_free_tfm:
+	crypto_free_akcipher(tfm);
+	pr_devel("<==%s() = %d\n", __func__, rc);
+	return rc;
+}
+
+/*
+ * PKCS1 padding (type 1)
+ */
+static int pad_pkcs1(const u8 *m, unsigned int mlen, u8 *em,
+		     unsigned int em_len)
+{
+	unsigned int ps_len = em_len - mlen - 3;
+
+	if (mlen > em_len - 11)
+		return -EBADMSG;
+
+	em[0] = 0;
+	em[1] = 1;
+
+	memset(em + 2, 0xff, ps_len);
+
+	em[2 + ps_len] = 0;
+	memcpy(em + 2 + ps_len + 1, m, mlen);
+
+	return 0;
+}
+
+/*
+ * RFC 3447 - Section 7.2.2
+ */
+static const u8 *unpad_pkcs1(const u8 *data, unsigned int len,
+			     unsigned int *out_len)
+{
+	unsigned int i;
+
+	/*
+	 * size of input data should be checked against public key size by
+	 * caller
+	 */
+	if (data[0] != 0 || data[1] != 2)
+		return NULL;
+
+	i = 2;
+
+	while (data[i] != 0 && i < len)
+		i++;
+
+	if (i == len)
+		return NULL;
+
+	*out_len = len - i - 1;
+
+	return data + i + 1;
+}
+
+/*
+ * Decryption operation is performed with the private key in the TPM.
+ */
+static int tpm2_key_decrypt(struct tpm2_key *tk,
+			   struct kernel_pkey_params *params,
+			   const void *in, void *out)
+{
+
+	int rc;
+	const u8 *unpadded;
+	unsigned int unpadded_len;
+	u8 *decrypted;
+
+	decrypted = kmalloc(tk->pub_len, GFP_KERNEL);
+
+	rc = tpm2_rsa_decrypt(tk->chip, tk->parent, tk->blob,
+				tk->bloblen, in, params->in_len, decrypted);
+	if (rc < 0)
+		return rc;
+
+	unpadded = unpad_pkcs1(decrypted, rc, &unpadded_len);
+	if (!unpadded)
+		return -EINVAL;
+
+	memcpy(out, unpadded, unpadded_len);
+	return unpadded_len;
+}
+
+/*
+ * Hash algorithm OIDs plus ASN.1 DER wrappings [RFC4880 sec 5.2.2].
+ */
+static const u8 digest_info_md5[] = {
+	0x30, 0x20, 0x30, 0x0c, 0x06, 0x08,
+	0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x02, 0x05, /* OID */
+	0x05, 0x00, 0x04, 0x10
+};
+
+static const u8 digest_info_sha1[] = {
+	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
+	0x2b, 0x0e, 0x03, 0x02, 0x1a,
+	0x05, 0x00, 0x04, 0x14
+};
+
+static const u8 digest_info_rmd160[] = {
+	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
+	0x2b, 0x24, 0x03, 0x02, 0x01,
+	0x05, 0x00, 0x04, 0x14
+};
+
+static const u8 digest_info_sha224[] = {
+	0x30, 0x2d, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x04,
+	0x05, 0x00, 0x04, 0x1c
+};
+
+static const u8 digest_info_sha256[] = {
+	0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
+	0x05, 0x00, 0x04, 0x20
+};
+
+static const u8 digest_info_sha384[] = {
+	0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02,
+	0x05, 0x00, 0x04, 0x30
+};
+
+static const u8 digest_info_sha512[] = {
+	0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03,
+	0x05, 0x00, 0x04, 0x40
+};
+
+static const struct asn1_template {
+	const char	*name;
+	const u8	*data;
+	size_t		size;
+} asn1_templates[] = {
+#define _(X) { #X, digest_info_##X, sizeof(digest_info_##X) }
+	_(md5),
+	_(sha1),
+	_(rmd160),
+	_(sha256),
+	_(sha384),
+	_(sha512),
+	_(sha224),
+	{ NULL }
+#undef _
+};
+
+static const struct asn1_template *lookup_asn1(const char *name)
+{
+	const struct asn1_template *p;
+
+	for (p = asn1_templates; p->name; p++)
+		if (strcmp(name, p->name) == 0)
+			return p;
+	return NULL;
+}
+
+/*
+ * Sign operation is really just an encryption using the TPM's private key.
+ * With RSA the only difference between encrypt/decrypt is where the padding
+ * goes. Since we can apply our own padding the TPM2 RSA_Decrypt call can be
+ * repurposed to do encryption.
+ */
+static int tpm2_key_sign(struct tpm2_key *tk,
+			struct kernel_pkey_params *params,
+			const void *in, void *out)
+{
+	int rc;
+	u8 *padded;
+	void *asn1_wrapped = NULL;
+	u32 in_len = params->in_len;
+
+	pr_devel("==>%s()\n", __func__);
+
+	if (strcmp(params->encoding, "pkcs1")) {
+		rc = -ENOPKG;
+		goto done;
+	}
+
+	if (params->hash_algo) {
+		const struct asn1_template *asn1 =
+						lookup_asn1(params->hash_algo);
+
+		if (!asn1) {
+			rc = -ENOPKG;
+			goto done;
+		}
+
+		/* request enough space for the ASN.1 template + input hash */
+		asn1_wrapped = kzalloc(in_len + asn1->size, GFP_KERNEL);
+		if (!asn1_wrapped) {
+			rc = -ENOMEM;
+			goto done;
+		}
+
+		/* Copy ASN.1 template, then the input */
+		memcpy(asn1_wrapped, asn1->data, asn1->size);
+		memcpy(asn1_wrapped + asn1->size, in, in_len);
+
+		in = asn1_wrapped;
+		in_len += asn1->size;
+	}
+
+	/* We are using the TPM's decrypt call to sign (aka encrypt). This
+	 * requires pre-padding the data with PKCS1.
+	 */
+	padded = kmalloc(tk->pub_len, GFP_KERNEL);
+	pad_pkcs1(in, in_len, padded, tk->pub_len);
+
+	rc = tpm2_rsa_decrypt(tk->chip, tk->parent, tk->blob, tk->bloblen,
+			      padded, tk->pub_len, out);
+
+	kfree(padded);
+done:
+	kfree(asn1_wrapped);
+	pr_devel("<==%s() = %d\n", __func__, rc);
+	return rc;
+}
+
+/*
+ * Do encryption, decryption and signing ops.
+ */
+static int tpm2_key_eds_op(struct kernel_pkey_params *params,
+			  const void *in, void *out)
+{
+	struct tpm2_key *tk = params->key->payload.data[asym_crypto];
+	int rc = -EOPNOTSUPP;
+
+	/* Perform the encryption calculation. */
+	switch (params->op) {
+	case kernel_pkey_encrypt:
+		rc = tpm2_key_encrypt(tk, params, in, out);
+		break;
+	case kernel_pkey_decrypt:
+		rc = tpm2_key_decrypt(tk, params, in, out);
+		break;
+	case kernel_pkey_sign:
+		rc = tpm2_key_sign(tk, params, in, out);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return rc;
+}
+
+/*
+ * Verify a signature using a public key.
+ */
+static int tpm2_key_verify_signature(const struct key *key,
+				    const struct public_key_signature *sig)
+{
+	const struct tpm2_key *tk = key->payload.data[asym_crypto];
+	struct crypto_wait cwait;
+	struct crypto_akcipher *tfm;
+	struct akcipher_request *req;
+	struct scatterlist src_sg[2];
+	char alg_name[CRYPTO_MAX_ALG_NAME];
+	u8 der_pub_key[PUB_KEY_BUF_SIZE];
+	u32 der_pub_key_len;
+	int rc;
+
+	pr_devel("==>%s()\n", __func__);
+
+	if (WARN_ON(!tk || !sig || !sig->s))
+		return -EINVAL;
+
+	if (!sig->digest)
+		return -ENOPKG;
+
+	rc = determine_akcipher(sig->encoding, sig->hash_algo, alg_name);
+	if (rc < 0)
+		return rc;
+
+	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	der_pub_key_len = derive_pub_key(tk->pub, tk->pub_len,
+					 der_pub_key);
+
+	rc = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
+	if (rc < 0)
+		goto error_free_tfm;
+
+	rc = -ENOMEM;
+	req = akcipher_request_alloc(tfm, GFP_KERNEL);
+	if (!req)
+		goto error_free_tfm;
+
+	sg_init_table(src_sg, 2);
+	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
+	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
+	akcipher_request_set_crypt(req, src_sg, NULL, sig->s_size,
+				   sig->digest_size);
+	crypto_init_wait(&cwait);
+	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
+				      CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &cwait);
+	rc = crypto_wait_req(crypto_akcipher_verify(req), &cwait);
+
+	akcipher_request_free(req);
+error_free_tfm:
+	crypto_free_akcipher(tfm);
+	pr_devel("<==%s() = %d\n", __func__, rc);
+	if (WARN_ON_ONCE(rc > 0))
+		rc = -EINVAL;
+	return rc;
+}
+
+/*
+ * Query information about a key.
+ */
+static int tpm2_key_query(const struct kernel_pkey_params *params,
+			  struct kernel_pkey_query *info)
+{
+	int r;
+	u8 der_pub_key[PUB_KEY_BUF_SIZE];
+	u32 der_pub_key_len = 0;
+	struct tpm2_key *tk = params->key->payload.data[asym_crypto];
+	char alg_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_akcipher *tfm;
+	unsigned int len;
+
+	r = determine_akcipher(params->encoding, params->hash_algo, alg_name);
+	if (r < 0)
+		return r;
+
+	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	der_pub_key_len = derive_pub_key(tk->pub, tk->pub_len,
+					 der_pub_key);
+
+	r = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
+	if (r < 0)
+		goto error_free_tfm;
+
+	len = crypto_akcipher_maxsize(tfm);
+
+	info->key_size = tk->pub_len * 8;
+	info->max_data_size = tk->pub_len;
+	info->max_sig_size = len;
+	info->max_enc_size = len;
+	info->max_dec_size = tk->pub_len;
+
+	info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT |
+			      KEYCTL_SUPPORTS_DECRYPT |
+			      KEYCTL_SUPPORTS_VERIFY |
+			      KEYCTL_SUPPORTS_SIGN;
+
+	r = 0;
+error_free_tfm:
+	crypto_free_akcipher(tfm);
+	return r;
+}
+
+static int extract_key_parameters(struct tpm2_parse_context *ctx,
+				  struct tpm2_key *tk)
+{
+	const u8 *cur = ctx->pub;
+	int total;
+	u16 policy_len;
+	u16 len;
+
+	total = get_unaligned_be16(cur);
+
+	if (total != ctx->pub_len - 2)
+		return -EMSGSIZE;
+	cur += 2;
+
+	/* type: TPMI_ALG_PUBLIC: TPM2_ALG_RSA */
+	if (get_unaligned_be16(cur) != 0x0001)
+		return -EINVAL;
+	cur += 2;
+
+	/* nameAlg: TPMI_ALG_HASH: */
+	cur += 2;
+
+	/* skip past TPMA_OBJECT */
+	cur += 4;
+
+	policy_len = get_unaligned_be16(cur);
+	cur += 2;
+	cur += policy_len;
+
+	/* ALG_NULL */
+	if (get_unaligned_be16(cur) != 0x0010)
+		return -EINVAL;
+	cur += 2;
+
+	if (get_unaligned_be16(cur) != 0x0010)
+		return -EINVAL;
+	cur += 2;
+
+	/* key bits */
+	cur += 2;
+
+	if (get_unaligned_be32(cur) != 0x00000000)
+		return -EINVAL;
+	cur += 4;
+
+	len = get_unaligned_be16(cur);
+	cur += 2;
+
+	/*
+	 * Copy both private/public parts into the blob. This buffer can be
+	 * given directly to the TPM as-is
+	 */
+	tk->blob = kmalloc(ctx->priv_len + ctx->pub_len, GFP_KERNEL);
+	tk->bloblen = ctx->priv_len + ctx->pub_len;
+	memcpy(tk->blob, ctx->priv, ctx->priv_len);
+	memcpy(tk->blob + ctx->priv_len, ctx->pub, ctx->pub_len);
+
+	/* set offset to public key, for encrypt/verify */
+	tk->pub = (tk->blob + ctx->priv_len) + (cur - ctx->pub);
+	tk->pub_len = len;
+
+	tk->parent = ctx->parent;
+
+	return 0;
+}
+
+/* Given the blob, parse it and load it into the TPM */
+struct tpm2_key *tpm2_key_create(struct tpm2_parse_context *ctx)
+{
+	int r;
+	struct tpm2_key *tk;
+
+	r = -ENOMEM;
+	tk = kzalloc(sizeof(struct tpm2_key), GFP_KERNEL);
+	if (!tk)
+		goto error;
+
+	r = extract_key_parameters(ctx, tk);
+	if (r < 0) {
+		pr_devel("Failed to extract key parameters (%d)\n", r);
+		goto error;
+	}
+
+	tk->chip = tpm_default_chip();
+
+	return tk;
+
+error:
+	return ERR_PTR(r);
+}
+EXPORT_SYMBOL_GPL(tpm2_key_create);
+
+/*
+ * TPM-based asymmetric key subtype
+ */
+struct asymmetric_key_subtype asym_tpm2_subtype = {
+	.owner			= THIS_MODULE,
+	.name			= "asym_tpm2",
+	.name_len		= sizeof("asym_tpm2") - 1,
+	.describe		= asym_tpm2_describe,
+	.destroy		= asym_tpm2_destroy,
+	.query			= tpm2_key_query,
+	.eds_op			= tpm2_key_eds_op,
+	.verify_signature	= tpm2_key_verify_signature,
+};
+EXPORT_SYMBOL_GPL(asym_tpm2_subtype);
+
+MODULE_DESCRIPTION("TPM2 based asymmetric key subtype");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL v2");
diff --git a/crypto/asymmetric_keys/tpm2_parser.c b/crypto/asymmetric_keys/tpm2_parser.c
new file mode 100644
index 000000000000..4e80cd6cdd2c
--- /dev/null
+++ b/crypto/asymmetric_keys/tpm2_parser.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) "TPM-PARSER: "fmt
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <keys/asymmetric-subtype.h>
+#include <keys/asymmetric-parser.h>
+#include <crypto/asym_tpm2_subtype.h>
+#include <linux/oid_registry.h>
+#include "tpm2key.asn1.h"
+
+int tpmkey_parent(void *context, size_t hdrlen,
+		  unsigned char tag,
+		  const void *value, size_t vlen)
+{
+	struct tpm2_parse_context *ctx = context;
+	const u8 *v = value;
+	int i;
+
+	ctx->parent = 0;
+	for (i = 0; i < vlen; i++) {
+		ctx->parent <<= 8;
+		ctx->parent |= v[i];
+	}
+	return 0;
+}
+
+int tpmkey_type(void *context, size_t hdrlen,
+		unsigned char tag,
+		const void *value, size_t vlen)
+{
+	enum OID oid = look_up_OID(value, vlen);
+
+	if (oid != OID_TPMLoadableKey) {
+		char buffer[50];
+
+		sprint_oid(value, vlen, buffer, sizeof(buffer));
+		pr_debug("OID is \"%s\" which is not TPMLoadableKey\n",
+			 buffer);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+int tpmkey_pub(void *context, size_t hdrlen,
+	       unsigned char tag,
+	       const void *value, size_t vlen)
+{
+	struct tpm2_parse_context *ctx = context;
+
+	ctx->pub = value;
+	ctx->pub_len = vlen;
+	return 0;
+}
+
+int tpmkey_priv(void *context, size_t hdrlen,
+		unsigned char tag,
+		const void *value, size_t vlen)
+{
+	struct tpm2_parse_context *ctx = context;
+
+	ctx->priv = value;
+	ctx->priv_len = vlen;
+	return 0;
+}
+
+int tpmkey_code(void *context, size_t hdrlen,
+		unsigned char tag,
+		const void *value, size_t vlen)
+{
+	return 0;
+}
+
+int tpmkey_policy(void *context, size_t hdrlen,
+		  unsigned char tag,
+		  const void *value, size_t vlen)
+{
+	return 0;
+}
+
+/*
+ * Parse a TPM2-encrypted private key blob.
+ */
+static struct tpm2_key *tpm2_parse(const void *data, size_t datalen)
+{
+	struct tpm2_parse_context ctx;
+	long ret;
+
+	memset(&ctx, 0, sizeof(ctx));
+
+	/* Attempt to decode the private key */
+	ret = asn1_ber_decoder(&tpm2key_decoder, &ctx, data, datalen);
+	if (ret < 0) {
+		pr_devel("asn1_ber_decorder failed %ld\n", ret);
+		goto error;
+	}
+
+	return tpm2_key_create(&ctx);
+
+error:
+	return ERR_PTR(ret);
+}
+
+/*
+ * Attempt to parse a data blob for a key as a TPM private key blob.
+ */
+static int tpm2_key_preparse(struct key_preparsed_payload *prep)
+{
+	struct tpm2_key *tk;
+
+	/*
+	 * TPM 2.0 RSA keys are recommended to be 2048 bits long, so assume the
+	 * blob is no more than 4x that
+	 */
+	if (prep->datalen > 256 * 4)
+		return -EMSGSIZE;
+
+	tk = tpm2_parse(prep->data, prep->datalen);
+
+	if (IS_ERR(tk))
+		return PTR_ERR(tk);
+
+	/* We're pinning the module by being linked against it */
+	__module_get(asym_tpm2_subtype.owner);
+	prep->payload.data[asym_subtype] = &asym_tpm2_subtype;
+	prep->payload.data[asym_key_ids] = NULL;
+	prep->payload.data[asym_crypto] = tk;
+	prep->payload.data[asym_auth] = NULL;
+	prep->quotalen = 100;
+	return 0;
+}
+
+static struct asymmetric_key_parser tpm2_key_parser = {
+	.owner	= THIS_MODULE,
+	.name	= "tpm2_parser",
+	.parse	= tpm2_key_preparse,
+};
+
+static int __init tpm2_key_init(void)
+{
+	return register_asymmetric_key_parser(&tpm2_key_parser);
+}
+
+static void __exit tpm2_key_exit(void)
+{
+	unregister_asymmetric_key_parser(&tpm2_key_parser);
+}
+
+module_init(tpm2_key_init);
+module_exit(tpm2_key_exit);
+
+MODULE_DESCRIPTION("TPM2 private key-blob parser");
+MODULE_LICENSE("GPL v2");
-- 
2.21.1

