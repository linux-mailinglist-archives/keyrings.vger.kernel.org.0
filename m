Return-Path: <keyrings+bounces-3882-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIyUCCRVcWkNEwAAu9opvQ
	(envelope-from <keyrings+bounces-3882-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:37:24 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E565EE88
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D0FB5885D7
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 22:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B864244B699;
	Wed, 21 Jan 2026 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jbu7pldI"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924744BC91
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034992; cv=none; b=Rkwb/C8VST+WYPEvWX73uOWHvJQR8VbpLCyzE2BZbg2VUclKlUiESf0412bTKkb6x42V2/JkAC6kjc9bLrtm9ZVtO6i0huSm9LzLgXhoK0aeYYnjGuD3QbLl/ULFyUt93lBZ1QBOACIGI7Gp2sPf362rnnq3IZQRqqCEMi3lfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034992; c=relaxed/simple;
	bh=yxuz1XGwka25nwbP3TQtMQjnCd1A9XYnkw4fpQ+1zI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI1Ss1EBBQr/BuFhP6spHb1bjLlZItgPLvV0nd4bH5Scc7CRAPCM6DRl1Wwyo6dhXhazq5/oOdPZQ9+UpBeBZCTwCWh6ispUqBU9098tOpKCbBKXvSyZJqWdbJJ+UOts4M+vwGUymF6hDiGqp6Kni/DzCtgf0+3PIYJwq4+47VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jbu7pldI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769034989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PrapPTZIg/B6PDqm9XjQ/SresbhuKzegBZp9ZIwUVT0=;
	b=Jbu7pldIxU6l5rHecUBc6sPNYkzdOHuOu7oeXhTWEIfn7RDhutfuTxqrQn78bfJfCc8LpY
	1FEXUdlLgF1vF752R13ceU2AA6v8A4b2070ANyV1RU3WU0x2bLYsCW0ikAz5LzsPWnMrLt
	R/9GErfQcGoY5iwBw7Oo64j2PvMfmfs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-dYnw1CgzOrq1_sn54fzVwg-1; Wed,
 21 Jan 2026 17:36:24 -0500
X-MC-Unique: dYnw1CgzOrq1_sn54fzVwg-1
X-Mimecast-MFC-AGG-ID: dYnw1CgzOrq1_sn54fzVwg_1769034982
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1AA6180034D;
	Wed, 21 Jan 2026 22:36:21 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B939918004D8;
	Wed, 21 Jan 2026 22:36:17 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/5] crypto: Add ML-DSA crypto_sig support
Date: Wed, 21 Jan 2026 22:36:03 +0000
Message-ID: <20260121223609.1650735-2-dhowells@redhat.com>
In-Reply-To: <20260121223609.1650735-1-dhowells@redhat.com>
References: <20260121223609.1650735-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3882-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,wunner.de:email]
X-Rspamd-Queue-Id: F2E565EE88
X-Rspamd-Action: no action

Add verify-only public key crypto support for ML-DSA so that the
X.509/PKCS#7 signature verification code, as used by module signing,
amongst other things, can make use of it through the common crypto_sig API.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/Kconfig  |   9 +++
 crypto/Makefile |   2 +
 crypto/mldsa.c  | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 crypto/mldsa.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 12a87f7cf150..a210575fa5e0 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -344,6 +344,15 @@ config CRYPTO_ECRDSA
 	  One of the Russian cryptographic standard algorithms (called GOST
 	  algorithms). Only signature verification is implemented.
 
+config CRYPTO_MLDSA
+	tristate "ML-DSA (Module-Lattice-Based Digital Signature Algorithm)"
+	select CRYPTO_SIG
+	select CRYPTO_LIB_MLDSA
+	help
+	  ML-DSA (Module-Lattice-Based Digital Signature Algorithm) (FIPS-204).
+
+	  Only signature verification is implemented.
+
 endmenu
 
 menu "Block ciphers"
diff --git a/crypto/Makefile b/crypto/Makefile
index 23d3db7be425..267d5403045b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -60,6 +60,8 @@ ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
 obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
+obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
+
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
 obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
diff --git a/crypto/mldsa.c b/crypto/mldsa.c
new file mode 100644
index 000000000000..d8de082cc67a
--- /dev/null
+++ b/crypto/mldsa.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * crypto_sig wrapper around ML-DSA library.
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <crypto/internal/sig.h>
+#include <crypto/mldsa.h>
+
+struct crypto_mldsa_ctx {
+	u8 pk[MAX(MAX(MLDSA44_PUBLIC_KEY_SIZE,
+		      MLDSA65_PUBLIC_KEY_SIZE),
+		  MLDSA87_PUBLIC_KEY_SIZE)];
+	unsigned int pk_len;
+	enum mldsa_alg strength;
+	bool key_set;
+};
+
+static int crypto_mldsa_sign(struct crypto_sig *tfm,
+			     const void *msg, unsigned int msg_len,
+			     void *sig, unsigned int sig_len)
+{
+	return -EOPNOTSUPP;
+}
+
+static int crypto_mldsa_verify(struct crypto_sig *tfm,
+			       const void *sig, unsigned int sig_len,
+			       const void *msg, unsigned int msg_len)
+{
+	const struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	if (unlikely(!ctx->key_set))
+		return -EINVAL;
+
+	return mldsa_verify(ctx->strength, sig, sig_len, msg, msg_len,
+			    ctx->pk, ctx->pk_len);
+}
+
+static unsigned int crypto_mldsa_key_size(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->strength) {
+	case MLDSA44:
+		return MLDSA44_PUBLIC_KEY_SIZE;
+	case MLDSA65:
+		return MLDSA65_PUBLIC_KEY_SIZE;
+	case MLDSA87:
+		return MLDSA87_PUBLIC_KEY_SIZE;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static int crypto_mldsa_set_pub_key(struct crypto_sig *tfm,
+				    const void *key, unsigned int keylen)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+	unsigned int expected_len = crypto_mldsa_key_size(tfm);
+
+	if (keylen != expected_len)
+		return -EINVAL;
+
+	ctx->pk_len = keylen;
+	memcpy(ctx->pk, key, keylen);
+	ctx->key_set = true;
+	return 0;
+}
+
+static int crypto_mldsa_set_priv_key(struct crypto_sig *tfm,
+				     const void *key, unsigned int keylen)
+{
+	return -EOPNOTSUPP;
+}
+
+static unsigned int crypto_mldsa_max_size(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->strength) {
+	case MLDSA44:
+		return MLDSA44_SIGNATURE_SIZE;
+	case MLDSA65:
+		return MLDSA65_SIGNATURE_SIZE;
+	case MLDSA87:
+		return MLDSA87_SIGNATURE_SIZE;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
+static int crypto_mldsa44_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA44;
+	ctx->key_set = false;
+	return 0;
+}
+
+static int crypto_mldsa65_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA65;
+	ctx->key_set = false;
+	return 0;
+}
+
+static int crypto_mldsa87_alg_init(struct crypto_sig *tfm)
+{
+	struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->strength = MLDSA87;
+	ctx->key_set = false;
+	return 0;
+}
+
+static void crypto_mldsa_alg_exit(struct crypto_sig *tfm)
+{
+}
+
+static struct sig_alg crypto_mldsa_algs[] = {
+	{
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa44_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa44",
+		.base.cra_driver_name	= "mldsa44-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	}, {
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa65_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa65",
+		.base.cra_driver_name	= "mldsa65-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	}, {
+		.sign			= crypto_mldsa_sign,
+		.verify			= crypto_mldsa_verify,
+		.set_pub_key		= crypto_mldsa_set_pub_key,
+		.set_priv_key		= crypto_mldsa_set_priv_key,
+		.key_size		= crypto_mldsa_key_size,
+		.max_size		= crypto_mldsa_max_size,
+		.init			= crypto_mldsa87_alg_init,
+		.exit			= crypto_mldsa_alg_exit,
+		.base.cra_name		= "mldsa87",
+		.base.cra_driver_name	= "mldsa87-lib",
+		.base.cra_ctxsize	= sizeof(struct crypto_mldsa_ctx),
+		.base.cra_module	= THIS_MODULE,
+		.base.cra_priority	= 5000,
+	},
+};
+
+static int __init mldsa_init(void)
+{
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++) {
+		ret = crypto_register_sig(&crypto_mldsa_algs[i]);
+		if (ret < 0)
+			goto error;
+	}
+	return 0;
+
+error:
+	pr_err("Failed to register (%d)\n", ret);
+	for (i--; i >= 0; i--)
+		crypto_unregister_sig(&crypto_mldsa_algs[i]);
+	return ret;
+}
+module_init(mldsa_init);
+
+static void mldsa_exit(void)
+{
+	for (int i = 0; i < ARRAY_SIZE(crypto_mldsa_algs); i++)
+		crypto_unregister_sig(&crypto_mldsa_algs[i]);
+}
+module_exit(mldsa_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Crypto API support for ML-DSA signature verification");
+MODULE_ALIAS_CRYPTO("mldsa44");
+MODULE_ALIAS_CRYPTO("mldsa65");
+MODULE_ALIAS_CRYPTO("mldsa87");


