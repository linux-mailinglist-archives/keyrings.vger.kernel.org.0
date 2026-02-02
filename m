Return-Path: <keyrings+bounces-4009-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFJAA7vagGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4009-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:11:23 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3442CF697
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37AA030BF61B
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AE0385EF7;
	Mon,  2 Feb 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdDNDlkY"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EE3859FF
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051790; cv=none; b=bW4QLh/tuqzJSTUzJw7heBVHN0SjBEOC0i4jd5279iQ0+xSi6zq+A49jxktuFPAph9guxz8WiYBvnC3ZXdHrzl6u2IQyg99d8Th0pMKoOKuU3ekTUjyDhkZp5F8hAChhYon7W+DJS7hEV0NuA+epTElv6vOVQLeN92+cL0JNlvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051790; c=relaxed/simple;
	bh=22QpEe0m1d4A8/kHwEET7/o4krivzjZb1E1O6ay542A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aekV88S+gKaQuIuo/8uviABIMg21AHwzTmIjtQMQXOOWem1hS6LWTDDH/wfmTsNzmsHZHySK/nJ2QsqRMqfgnzAJb3HjDToLyecbsehpGSzwvqd06xteOO0Yjj/vDHFSLjVGbVvVTBpS9enG8hl6R2t5B3Qxy6iYplH16vw4zlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdDNDlkY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770051787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86iPYRvmd0kdvm6OjipFXdpuUXol/11UO8BtsiEYjHs=;
	b=BdDNDlkY0923JaX260lEjK/Cbo3CN+vSI4OLeOiaVmA+VIBigzOUv1cy8DGO1z11b/QEaA
	hkcxsvgQETuOCsRrBvwIHVOxnqHqE25/Fc3vPlGchZAFUA5O4hZElFPUTmqNT9GIYnEWrw
	O2cbH5Ckd9rXK8rB2y7hOB2H6zIZAbs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-HCzsIauDO3eAYvdrnwHYvw-1; Mon,
 02 Feb 2026 12:03:01 -0500
X-MC-Unique: HCzsIauDO3eAYvdrnwHYvw-1
X-Mimecast-MFC-AGG-ID: HCzsIauDO3eAYvdrnwHYvw_1770051779
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B5F3180035C;
	Mon,  2 Feb 2026 17:02:59 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C63B18007D2;
	Mon,  2 Feb 2026 17:02:54 +0000 (UTC)
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
Subject: [PATCH v16 5/7] pkcs7, x509: Add ML-DSA support
Date: Mon,  2 Feb 2026 17:02:10 +0000
Message-ID: <20260202170216.2467036-6-dhowells@redhat.com>
In-Reply-To: <20260202170216.2467036-1-dhowells@redhat.com>
References: <20260202170216.2467036-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4009-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,wunner.de:email,apana.org.au:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3442CF697
X-Rspamd-Action: no action

Add support for ML-DSA keys and signatures to the CMS/PKCS#7 and X.509
implementations.  ML-DSA-44, -65 and -87 are all supported.  For X.509
certificates, the TBSCertificate is required to be signed directly; for
CMS, direct signing of the data is preferred, though use of SHA512 (and
only that) as an intermediate hash of the content is permitted with
signedAttrs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/pkcs7_parser.c     | 24 +++++++++++++++++++-
 crypto/asymmetric_keys/public_key.c       | 10 +++++++++
 crypto/asymmetric_keys/x509_cert_parser.c | 27 ++++++++++++++++++++++-
 include/linux/oid_registry.h              |  5 +++++
 4 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 3cdbab3b9f50..594a8f1d9dfb 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -95,11 +95,18 @@ static int pkcs7_check_authattrs(struct pkcs7_message *msg)
 	if (sinfo->authattrs) {
 		want = true;
 		msg->have_authattrs = true;
+	} else if (sinfo->sig->algo_takes_data) {
+		sinfo->sig->hash_algo = "none";
 	}
 
-	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next)
+	for (sinfo = sinfo->next; sinfo; sinfo = sinfo->next) {
 		if (!!sinfo->authattrs != want)
 			goto inconsistent;
+
+		if (!sinfo->authattrs &&
+		    sinfo->sig->algo_takes_data)
+			sinfo->sig->hash_algo = "none";
+	}
 	return 0;
 
 inconsistent:
@@ -297,6 +304,21 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->sinfo->sig->pkey_algo = "ecrdsa";
 		ctx->sinfo->sig->encoding = "raw";
 		break;
+	case OID_id_ml_dsa_44:
+		ctx->sinfo->sig->pkey_algo = "mldsa44";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_takes_data = true;
+		break;
+	case OID_id_ml_dsa_65:
+		ctx->sinfo->sig->pkey_algo = "mldsa65";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_takes_data = true;
+		break;
+	case OID_id_ml_dsa_87:
+		ctx->sinfo->sig->pkey_algo = "mldsa87";
+		ctx->sinfo->sig->encoding = "raw";
+		ctx->sinfo->sig->algo_takes_data = true;
+		break;
 	default:
 		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index a46356e0c08b..09a0b83d5d77 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -142,6 +142,16 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		if (strcmp(hash_algo, "streebog256") != 0 &&
 		    strcmp(hash_algo, "streebog512") != 0)
 			return -EINVAL;
+	} else if (strcmp(pkey->pkey_algo, "mldsa44") == 0 ||
+		   strcmp(pkey->pkey_algo, "mldsa65") == 0 ||
+		   strcmp(pkey->pkey_algo, "mldsa87") == 0) {
+		if (strcmp(encoding, "raw") != 0)
+			return -EINVAL;
+		if (!hash_algo)
+			return -EINVAL;
+		if (strcmp(hash_algo, "none") != 0 &&
+		    strcmp(hash_algo, "sha512") != 0)
+			return -EINVAL;
 	} else {
 		/* Unknown public key algorithm */
 		return -ENOPKG;
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index b37cae914987..2fe094f5caf3 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -257,6 +257,15 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 	case OID_gost2012Signature512:
 		ctx->cert->sig->hash_algo = "streebog512";
 		goto ecrdsa;
+	case OID_id_ml_dsa_44:
+		ctx->cert->sig->pkey_algo = "mldsa44";
+		goto ml_dsa;
+	case OID_id_ml_dsa_65:
+		ctx->cert->sig->pkey_algo = "mldsa65";
+		goto ml_dsa;
+	case OID_id_ml_dsa_87:
+		ctx->cert->sig->pkey_algo = "mldsa87";
+		goto ml_dsa;
 	}
 
 rsa_pkcs1:
@@ -274,6 +283,12 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 	ctx->cert->sig->encoding = "x962";
 	ctx->sig_algo = ctx->last_oid;
 	return 0;
+ml_dsa:
+	ctx->cert->sig->algo_takes_data = true;
+	ctx->cert->sig->hash_algo = "none";
+	ctx->cert->sig->encoding = "raw";
+	ctx->sig_algo = ctx->last_oid;
+	return 0;
 }
 
 /*
@@ -300,7 +315,8 @@ int x509_note_signature(void *context, size_t hdrlen,
 
 	if (strcmp(ctx->cert->sig->pkey_algo, "rsa") == 0 ||
 	    strcmp(ctx->cert->sig->pkey_algo, "ecrdsa") == 0 ||
-	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0) {
+	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0 ||
+	    strncmp(ctx->cert->sig->pkey_algo, "mldsa", 5) == 0) {
 		/* Discard the BIT STRING metadata */
 		if (vlen < 1 || *(const u8 *)value != 0)
 			return -EBADMSG;
@@ -524,6 +540,15 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			return -ENOPKG;
 		}
 		break;
+	case OID_id_ml_dsa_44:
+		ctx->cert->pub->pkey_algo = "mldsa44";
+		break;
+	case OID_id_ml_dsa_65:
+		ctx->cert->pub->pkey_algo = "mldsa65";
+		break;
+	case OID_id_ml_dsa_87:
+		ctx->cert->pub->pkey_algo = "mldsa87";
+		break;
 	default:
 		return -ENOPKG;
 	}
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 6de479ebbe5d..ebce402854de 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -145,6 +145,11 @@ enum OID {
 	OID_id_rsassa_pkcs1_v1_5_with_sha3_384, /* 2.16.840.1.101.3.4.3.15 */
 	OID_id_rsassa_pkcs1_v1_5_with_sha3_512, /* 2.16.840.1.101.3.4.3.16 */
 
+	/* NIST FIPS-204 ML-DSA */
+	OID_id_ml_dsa_44,			/* 2.16.840.1.101.3.4.3.17 */
+	OID_id_ml_dsa_65,			/* 2.16.840.1.101.3.4.3.18 */
+	OID_id_ml_dsa_87,			/* 2.16.840.1.101.3.4.3.19 */
+
 	OID__NR
 };
 


