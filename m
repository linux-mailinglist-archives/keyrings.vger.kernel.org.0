Return-Path: <keyrings+bounces-4011-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNcNBNPagGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4011-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:11:47 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E75CF6A5
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D6993068388
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EAE385508;
	Mon,  2 Feb 2026 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxeZ0rMG"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6143816F0
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051806; cv=none; b=hoR8l6rYRjPJKIraQNWcM6MJf1tDKxAubrZjUiR0Y2gaISCsBj/SUnA1dSVlMFqdJZvA04O/amoz38TW4RvuRh0UMfY5P0WPFfWB/W+8UKUI15PG+aTce+E4TplN+NSyZI705En5P+3DcsjGvsmcDTp+1pet6JBdcLCkRmIggKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051806; c=relaxed/simple;
	bh=YmYddHPvZEgOqKJmE8MugDptUWnHZHtuSGeVaqPbG3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ashntL5ivIZD66R3A9mq8Q1cm3cPJLoWuduJ1hk3moQ5CySEOq63jYBl1Yctg6K0DzYSepAuEmyB7uRZq63AzenKiaPNNha8296Nn2pGJQGHFf065oZaq6gG9DZtlgnWi3znS6PYxVM3wCxHDanX4V2OWi5eswrIVHkVg6v15jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxeZ0rMG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770051802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUvLtsQUIbuT8aNyKAbRO6AgrSzDL4SrRGZc9+zngls=;
	b=ZxeZ0rMGzolNku3XM3eV6SOOq6cAaPgxqVK0L8oluf26nrvUH3aJ/r8oAN4wi/LGCA17UK
	KL7WLJQUfK1aWptJDCuhvO7lSu1fz4DbfukcjD7CAVRu6ylklPlMtV6o46T6Sm3b6ucYnM
	wtJAapVmg2F1MU4+BXeJjwjtQgB4BoI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-29xKMmUAPLqP311Mu4AQHw-1; Mon,
 02 Feb 2026 12:03:16 -0500
X-MC-Unique: 29xKMmUAPLqP311Mu4AQHw-1
X-Mimecast-MFC-AGG-ID: 29xKMmUAPLqP311Mu4AQHw_1770051792
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8CF5119560A1;
	Mon,  2 Feb 2026 17:03:12 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C6C6B19560B2;
	Mon,  2 Feb 2026 17:03:07 +0000 (UTC)
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
Subject: [PATCH v16 7/7] pkcs7: Allow authenticatedAttributes for ML-DSA
Date: Mon,  2 Feb 2026 17:02:12 +0000
Message-ID: <20260202170216.2467036-8-dhowells@redhat.com>
In-Reply-To: <20260202170216.2467036-1-dhowells@redhat.com>
References: <20260202170216.2467036-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
	TAGGED_FROM(0.00)[bounces-4011-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,wunner.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apana.org.au:email,cloudflare.com:email]
X-Rspamd-Queue-Id: 75E75CF6A5
X-Rspamd-Action: no action

Allow the rejection of authenticatedAttributes in PKCS#7 (signedAttrs in
CMS) to be waived in the kernel config for ML-DSA when used for module
signing.  This reflects the issue that openssl < 4.0 cannot do this and
openssl-4 has not yet been released.

This does not permit RSA, ECDSA or ECRDSA to be so waived (behaviour
unchanged).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/Kconfig        | 11 +++++++++++
 crypto/asymmetric_keys/pkcs7_parser.c |  8 ++++++++
 crypto/asymmetric_keys/pkcs7_parser.h |  3 +++
 crypto/asymmetric_keys/pkcs7_verify.c |  6 ++++++
 4 files changed, 28 insertions(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index e1345b8f39f1..1dae2232fe9a 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -53,6 +53,17 @@ config PKCS7_MESSAGE_PARSER
 	  This option provides support for parsing PKCS#7 format messages for
 	  signature data and provides the ability to verify the signature.
 
+config PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
+	bool "Waive rejection of authenticatedAttributes for ML-DSA"
+	depends on PKCS7_MESSAGE_PARSER
+	depends on CRYPTO_MLDSA
+	help
+	  Due to use of CMS_NOATTR with ML-DSA not being supported in
+	  OpenSSL < 4.0 (and thus any released version), enabling this
+	  allows authenticatedAttributes to be used with ML-DSA for
+	  module signing.  Use of authenticatedAttributes in this
+	  context is normally rejected.
+
 config PKCS7_TEST_KEY
 	tristate "PKCS#7 testing key type"
 	depends on SYSTEM_DATA_VERIFICATION
diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 594a8f1d9dfb..db1c90ca6fc1 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -92,9 +92,17 @@ static int pkcs7_check_authattrs(struct pkcs7_message *msg)
 	if (!sinfo)
 		goto inconsistent;
 
+#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
+	msg->authattrs_rej_waivable = true;
+#endif
+
 	if (sinfo->authattrs) {
 		want = true;
 		msg->have_authattrs = true;
+#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
+		if (strncmp(sinfo->sig->pkey_algo, "mldsa", 5) != 0)
+			msg->authattrs_rej_waivable = false;
+#endif
 	} else if (sinfo->sig->algo_takes_data) {
 		sinfo->sig->hash_algo = "none";
 	}
diff --git a/crypto/asymmetric_keys/pkcs7_parser.h b/crypto/asymmetric_keys/pkcs7_parser.h
index e17f7ce4fb43..6ef9f335bb17 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.h
+++ b/crypto/asymmetric_keys/pkcs7_parser.h
@@ -55,6 +55,9 @@ struct pkcs7_message {
 	struct pkcs7_signed_info *signed_infos;
 	u8		version;	/* Version of cert (1 -> PKCS#7 or CMS; 3 -> CMS) */
 	bool		have_authattrs;	/* T if have authattrs */
+#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
+	bool		authattrs_rej_waivable; /* T if authatts rejection can be waived */
+#endif
 
 	/* Content Data (or NULL) */
 	enum OID	data_type;	/* Type of Data */
diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 06abb9838f95..519eecfe6778 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -425,6 +425,12 @@ int pkcs7_verify(struct pkcs7_message *pkcs7,
 			return -EKEYREJECTED;
 		}
 		if (pkcs7->have_authattrs) {
+#ifdef CONFIG_PKCS7_WAIVE_AUTHATTRS_REJECTION_FOR_MLDSA
+			if (pkcs7->authattrs_rej_waivable) {
+				pr_warn("Waived invalid module sig (has authattrs)\n");
+				break;
+			}
+#endif
 			pr_warn("Invalid module sig (has authattrs)\n");
 			return -EKEYREJECTED;
 		}


