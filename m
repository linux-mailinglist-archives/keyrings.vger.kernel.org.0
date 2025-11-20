Return-Path: <keyrings+bounces-3399-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B2C7385D
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 11:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADAC94E672E
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646F832ED36;
	Thu, 20 Nov 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hELNX7gA"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87732E6B7
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635523; cv=none; b=sXaOEzrp/ta9IjcKsmrCStrN0wA824t149Hk2PbvLBZSKepdvB9oMp+WivVDxVa/jd7/TSvekvk9ryfigPfDgxjcYWfVB+WDOaqqXCPyTJiUmDN3NoSIjwgoWV/Jbh16VEi/IOogNj37/FnAm/ujruvDiz+701eaQ2jYWxhfcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635523; c=relaxed/simple;
	bh=YSuo8ZIpX+/vikOD945PRtO7zdcX3R4mj0XpS51lOo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLKmacmOxCL6JATWBffurW51kx7SYFrvROXC7Fcu+PRoGb64pmTWrSLMaDeAwYeJ4Y7JcrrnPq6dgFXHQ+wjc+IbP/yKUbaaQXcuTJWciCc6776k565Bsswn/zq3q+RqOk/Fy/qpSS94Ts7u9XCZHEyjRElkQJ68+VAE4bQx770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hELNX7gA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763635519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkgSZ60cW/M2Nn+CQQ1e2LUMfs3yx9bYyQ92Ar0JMBg=;
	b=hELNX7gAKF1uNv+dFPd/vvz0dSlZ3Di573UPZ6iDBOwkoOuXsTpacchQc34jUBAxIWoiM8
	bLqSiemEqR2NSHXjNkhMo87+V8KEfbKiO7CGS3v/SMq2qpzfCVPqmnuqYiRZrRuFeD/ScU
	juRuVDEj2/LEoCXssAFfrI31EQUvLaQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-EgKK7jtJMROEEQHzuG8Afg-1; Thu,
 20 Nov 2025 05:45:17 -0500
X-MC-Unique: EgKK7jtJMROEEQHzuG8Afg-1
X-Mimecast-MFC-AGG-ID: EgKK7jtJMROEEQHzuG8Afg_1763635515
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 645FE19560BE;
	Thu, 20 Nov 2025 10:45:15 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C48761940E85;
	Thu, 20 Nov 2025 10:45:11 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Date: Thu, 20 Nov 2025 10:44:32 +0000
Message-ID: <20251120104439.2620205-6-dhowells@redhat.com>
In-Reply-To: <20251120104439.2620205-1-dhowells@redhat.com>
References: <20251120104439.2620205-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

---
 crypto/Kconfig  | 10 ++++++++++
 crypto/Makefile |  2 ++
 2 files changed, 12 insertions(+)

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


