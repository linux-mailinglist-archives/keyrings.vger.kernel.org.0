Return-Path: <keyrings+bounces-3240-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E916BE94B2
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39051422843
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AF32F12A1;
	Fri, 17 Oct 2025 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IsR8yT1G"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D339335094
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712298; cv=none; b=tPV1shhJ7YM6EOmuSBoV3zTEeg6kqNZ9aSud7wwtQELiSf2+5H2QNy7dOfJHQyAntzsHae6EEP9X90GCKNPCZLrgTTHGsipDej5lA0TQsf+OZ9I/Ua54bh8Nih7D/KaY3jMmdINtVxKauysP/yAnYHfsvkMmo6qliWPWvxxaWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712298; c=relaxed/simple;
	bh=RvusHb8iCMBSU7BMwlq1o6N1lbxg25PBi5W0BeXHl0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcwbnB+r7jU9Dw7/znbAHtfpJYjSRR3WP24ia9lhw309mJo6g+k9Ba23Kh/8WjrBWn9xo54yWzv0DqTsgYhq8lcPetCIbqWYGvttWsWzo0u4CufU1nQ1SDFOqTre5FNkoWekyn8mgBEPU9CpoDhe8D5du6K4aben5YtcaAlbTUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IsR8yT1G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwXTvBD4Yvz8oojCSyImVAOTuEGuJkeQWe5NSzvpamE=;
	b=IsR8yT1GON/X5QUmgDL8OGk/oWMKssKHbn5ZsA/p06GG6Z0eMo+aRsHqFCZU1m/m+rmllZ
	uvMsvraA+32w3EGvKxHO7idKjHosO3v603FrDD3k5nD9wWXIOEKJPN2Nv+J+UxoDfldbLn
	HNvobR48YYgPzilb/AX4oms/I11qwRg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-nqmhOHySPIa0xp8IupHunQ-1; Fri,
 17 Oct 2025 10:44:51 -0400
X-MC-Unique: nqmhOHySPIa0xp8IupHunQ-1
X-Mimecast-MFC-AGG-ID: nqmhOHySPIa0xp8IupHunQ_1760712288
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F4001800673;
	Fri, 17 Oct 2025 14:44:48 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF2041800452;
	Fri, 17 Oct 2025 14:44:44 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/17] pkcs7, x509: Add ML-DSA support
Date: Fri, 17 Oct 2025 15:43:00 +0100
Message-ID: <20251017144311.817771-17-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support for ML-DSA keys and signatures to the PKCS#7 and X.509
implementations.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/pkcs7_parser.c     | 15 ++++++++++++++
 crypto/asymmetric_keys/public_key.c       |  7 +++++++
 crypto/asymmetric_keys/x509_cert_parser.c | 24 +++++++++++++++++++++++
 include/linux/oid_registry.h              |  5 +++++
 4 files changed, 51 insertions(+)

diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 3cdbab3b9f50..d7c88b90a4fd 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -297,6 +297,21 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->sinfo->sig->pkey_algo = "ecrdsa";
 		ctx->sinfo->sig->encoding = "raw";
 		break;
+	case OID_id_ml_dsa_44:
+		ctx->sinfo->sig->pkey_algo = "ml-dsa44";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_does_hash = true;
+		break;
+	case OID_id_ml_dsa_65:
+		ctx->sinfo->sig->pkey_algo = "ml-dsa65";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_does_hash = true;
+		break;
+	case OID_id_ml_dsa_87:
+		ctx->sinfo->sig->pkey_algo = "ml-dsa87";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_does_hash = true;
+		break;
 	default:
 		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e5b177c8e842..96e084668d1b 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -142,6 +142,13 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		if (strcmp(hash_algo, "streebog256") != 0 &&
 		    strcmp(hash_algo, "streebog512") != 0)
 			return -EINVAL;
+	} else if (strcmp(pkey->pkey_algo, "ml-dsa44") == 0 ||
+		   strcmp(pkey->pkey_algo, "ml-dsa65") == 0 ||
+		   strcmp(pkey->pkey_algo, "ml-dsa87") == 0) {
+		if (strcmp(encoding, "raw") != 0)
+			return -EINVAL;
+		if (!hash_algo)
+			return -EINVAL;
 	} else {
 		/* Unknown public key algorithm */
 		return -ENOPKG;
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 8df3fa60a44f..6a2a77a647a5 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -257,6 +257,15 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 	case OID_gost2012Signature512:
 		ctx->cert->sig->hash_algo = "streebog512";
 		goto ecrdsa;
+	case OID_id_ml_dsa_44:
+		ctx->cert->sig->pkey_algo = "ml-dsa44";
+		goto ml_dsa;
+	case OID_id_ml_dsa_65:
+		ctx->cert->sig->pkey_algo = "ml-dsa65";
+		goto ml_dsa;
+	case OID_id_ml_dsa_87:
+		ctx->cert->sig->pkey_algo = "ml-dsa87";
+		goto ml_dsa;
 	}
 
 rsa_pkcs1:
@@ -274,6 +283,12 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 	ctx->cert->sig->encoding = "x962";
 	ctx->sig_algo = ctx->last_oid;
 	return 0;
+ml_dsa:
+	ctx->cert->sig->algo_does_hash = true;
+	ctx->cert->sig->hash_algo = ctx->cert->sig->pkey_algo;
+	ctx->cert->sig->encoding = "raw";
+	ctx->sig_algo = ctx->last_oid;
+	return 0;
 }
 
 /*
@@ -524,6 +539,15 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			return -ENOPKG;
 		}
 		break;
+	case OID_id_ml_dsa_44:
+		ctx->cert->pub->pkey_algo = "ml-dsa44";
+		break;
+	case OID_id_ml_dsa_65:
+		ctx->cert->pub->pkey_algo = "ml-dsa65";
+		break;
+	case OID_id_ml_dsa_87:
+		ctx->cert->pub->pkey_algo = "ml-dsa87";
+		break;
 	default:
 		return -ENOPKG;
 	}
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 6de479ebbe5d..30821a6a4f72 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -145,6 +145,11 @@ enum OID {
 	OID_id_rsassa_pkcs1_v1_5_with_sha3_384, /* 2.16.840.1.101.3.4.3.15 */
 	OID_id_rsassa_pkcs1_v1_5_with_sha3_512, /* 2.16.840.1.101.3.4.3.16 */
 
+	/* NIST FIPS-204 ML-DSA (Dilithium) */
+	OID_id_ml_dsa_44,			/* 2.16.840.1.101.3.4.3.17 */
+	OID_id_ml_dsa_65,			/* 2.16.840.1.101.3.4.3.18 */
+	OID_id_ml_dsa_87,			/* 2.16.840.1.101.3.4.3.19 */
+
 	OID__NR
 };
 


