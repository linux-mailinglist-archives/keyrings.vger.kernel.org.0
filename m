Return-Path: <keyrings+bounces-3426-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A9C7F894
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B663F4E4C69
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD5F2F5A2E;
	Mon, 24 Nov 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnJSi7ti"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9802F5316
	for <keyrings@vger.kernel.org>; Mon, 24 Nov 2025 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975592; cv=none; b=uoe/NVraU47LplS1elSQJJzlnu6OvwwBvsXdRqO1VYK9bai/nGpp73CwNU3RwV1sSnLvCtRerUOOdEDcSFPp9+Vx3S0xN8SXErvjiYlyYJUVqNp33/FpS2nOP/bFz1ykAG0Rv70QRxNuR0sAq3sj/MD50QVW4DL5iQypjUBG668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975592; c=relaxed/simple;
	bh=mMnVLuCXftagdG0NTHkbuuBvgharmyAiq+/MBIApwPE=;
	h=From:In-Reply-To:References:Cc:Subject:MIME-Version:Content-Type:
	 Date:Message-ID; b=g+5aEmxdQAGDD3lcm7Qx6IVWvSBMXuu/xmZoBotTdP3Yqe1jJLx5NAlFFMfDwhObLmZZDq2+eC5MqKJhZToS3MknVu8kUS4K/CyG9gMb1FvJc0h11lFK0GFBylUyX8JUaljpGLKsBctj21ToKeBKJoAxwPRG7/i+6FNOk/pfQM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TnJSi7ti; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763975589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Grgderz4QxceWjw2z3CGqb7mO57qe11aGdbiTyRAyNQ=;
	b=TnJSi7tiAAeJCmtcFXqDEp36REA8nPLpjwzUbzD9B7A6HtTYJ+S2ZHJNEdMbiIEt/9omHt
	Jkuq3pibrIg8AI5LUj+XKY/Q39rfhM3I4WoWIE3ECO+RS3m2RkqOML4EgoORjRpem2you+
	mR/+2esMS0XM98IP9Cavm1OxhB4dYek=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-aRXj-SCIMEeL_QC0KHZA-A-1; Mon,
 24 Nov 2025 04:13:05 -0500
X-MC-Unique: aRXj-SCIMEeL_QC0KHZA-A-1
X-Mimecast-MFC-AGG-ID: aRXj-SCIMEeL_QC0KHZA-A_1763975583
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21403180048E;
	Mon, 24 Nov 2025 09:13:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF4A41800576;
	Mon, 24 Nov 2025 09:12:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251120104439.2620205-6-dhowells@redhat.com>
References: <20251120104439.2620205-6-dhowells@redhat.com> <20251120104439.2620205-1-dhowells@redhat.com>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3374840.1763975577.1@warthog.procyon.org.uk>
Date: Mon, 24 Nov 2025 09:12:57 +0000
Message-ID: <3374841.1763975577@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Meh.  I forgot to git add crypto/mldsa.c.

David
---
diff --git a/crypto/Kconfig b/crypto/Kconfig
index bf8b8a60a0c0..45e376af02dc 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -344,6 +344,16 @@ config CRYPTO_ECRDSA
 	  One of the Russian cryptographic standard algorithms (called GOST
 	  algorithms). Only signature verification is implemented.
 
+config CRYPTO_MLDSA
+	tristate "ML-DSA (Module-Lattice-Based Digital Signature Algorithm)"
+	select CRYPTO_SIG
+	select CRYPTO_LIB_MLDSA
+	select CRYPTO_LIB_SHA3
+	help
+	  ML-DSA (Module-Lattice-Based Digital Signature Algorithm) (FIPS-204).
+
+	  Only signature verification is implemented.
+
 endmenu
 
 menu "Block ciphers"
diff --git a/crypto/Makefile b/crypto/Makefile
index 093c56a45d3f..b181f8a54099 100644
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
index 000000000000..2146c774b5ca
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
+	u8 key_set;
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


