Return-Path: <keyrings+bounces-3951-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F4sExt8d2n7ggEAu9opvQ
	(envelope-from <keyrings+bounces-3951-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:37:15 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3578995B
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C168E31AA046
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 14:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E36F24501B;
	Mon, 26 Jan 2026 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyKe6rGf"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641832773DE
	for <keyrings@vger.kernel.org>; Mon, 26 Jan 2026 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437836; cv=none; b=TpkBgziT6fuLYUN3hFXd5cjdRdf5otvVAiI+2QW3nvjyvdRVj7S5A7qZDzhHJo62unF6IubD7OHnKFtJiEeFcTnTaMTm5rWBXubPzUeevFZVi86Dy7oeuhhiH5BCl/dVBFlmusqmkrPLFsfg/0KYZJ/aXmVaswTY2qIqB996YHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437836; c=relaxed/simple;
	bh=YmYddHPvZEgOqKJmE8MugDptUWnHZHtuSGeVaqPbG3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3KYHraP+lekF0v53YRI1N6mmbg6Xm56ERXsn3bnDPrRK+2z8I3Qm/wMZhOGULBuFKsUBNvJnhASbQUuKjqXNq5R9PbMpmeNFSrIKQk6sOCSAAPIKSDTbnrrBXLdstRIK0Pb7qG5rggfGR3kjmw/Eqk5S0WdoNiivm84SA+VVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyKe6rGf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769437833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUvLtsQUIbuT8aNyKAbRO6AgrSzDL4SrRGZc9+zngls=;
	b=hyKe6rGfYpOIqgJ7pfvvhz12DTk29mDXbKWijYAaIIBg7QnA4ZWFgtahuVB3izBG98+DCh
	UdkEDxrNwrIM5IvSX6d13Hhyv6hrBxaegUAMB0R8126lWfbnY8S8ueW8JKva7FZYVT+ZQS
	6c6cncCfLR0wOIc0tCFRdCxWXdUzHts=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-604-MXrR1Hh7NU2KjnMXnBYR3g-1; Mon,
 26 Jan 2026 09:30:31 -0500
X-MC-Unique: MXrR1Hh7NU2KjnMXnBYR3g-1
X-Mimecast-MFC-AGG-ID: MXrR1Hh7NU2KjnMXnBYR3g_1769437828
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE9EE18002E9;
	Mon, 26 Jan 2026 14:30:28 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DD9F30001A7;
	Mon, 26 Jan 2026 14:30:23 +0000 (UTC)
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
Subject: [PATCH v15 7/7] pkcs7: Allow authenticatedAttributes for ML-DSA
Date: Mon, 26 Jan 2026 14:29:28 +0000
Message-ID: <20260126142931.1940586-8-dhowells@redhat.com>
In-Reply-To: <20260126142931.1940586-1-dhowells@redhat.com>
References: <20260126142931.1940586-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3951-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,apana.org.au:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wunner.de:email,chronox.de:email]
X-Rspamd-Queue-Id: AF3578995B
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


