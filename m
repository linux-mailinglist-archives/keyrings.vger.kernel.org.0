Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6322148E189
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 01:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238433AbiANAay (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 19:30:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40044 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238425AbiANAax (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 19:30:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC11061D57;
        Fri, 14 Jan 2022 00:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26835C36AF4;
        Fri, 14 Jan 2022 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642120252;
        bh=wWrqhjxF6/B5Te+0tmxllxZ8AJQKWi0XAvwb1fMf444=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V/lhSbr1iH8v2v7Wgav8LD3/gM69xIMI6FiHub4AVcRIsVatoCQbw3/Fa52EEWiLL
         FyCRzofayUzhefJTfBvUaq9hNT1aVbIibCyzbPq9x+aACFmroILAgYmsiKGgXtwK3L
         5hreRfdizj2zrDRRjoCr7Yzq9bsijNbOkpyVKx3BRaqE+2cKdZNnwXGybQg1k/WNZq
         ShjeoD/i1hw7qgkN1BhCURvFq141oeol8qMm/lac6JgEIae74NWd2akKdPv1Fdi+dd
         Uy5X9CpZhxUx2pZxOLS2tgH1QxzNaoHYzS5rYlnRaQEaUemY1OjaHW7TZcU9CXxDm4
         8Q9VOutQH17Mg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH 3/4] KEYS: x509: remove never-set ->unsupported_key flag
Date:   Thu, 13 Jan 2022 16:29:19 -0800
Message-Id: <20220114002920.103858-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114002920.103858-1-ebiggers@kernel.org>
References: <20220114002920.103858-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

The X.509 parser always sets cert->pub->pkey_algo on success, since
x509_extract_key_data() is a mandatory action in the X.509 ASN.1
grammar, and it returns an error if the algorithm is unknown.  Thus,
remove the dead code which handled this field being NULL.  This results
in the ->unsupported_key flag never being set, so remove that too.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/pkcs7_verify.c    | 3 ---
 crypto/asymmetric_keys/x509_parser.h     | 1 -
 crypto/asymmetric_keys/x509_public_key.c | 9 ---------
 3 files changed, 13 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 0b4d07aa8811..4ba81be3cd77 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -226,9 +226,6 @@ static int pkcs7_verify_sig_chain(struct pkcs7_message *pkcs7,
 			return 0;
 		}
 
-		if (x509->unsupported_key)
-			goto unsupported_crypto_in_x509;
-
 		pr_debug("- issuer %s\n", x509->issuer);
 		sig = x509->sig;
 		if (sig->auth_ids[0])
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index c233f136fb35..da854c94f111 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -36,7 +36,6 @@ struct x509_certificate {
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
 	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
-	bool		unsupported_key;	/* T if key uses unsupported crypto */
 	bool		unsupported_sig;	/* T if signature uses unsupported crypto */
 	bool		blacklisted;
 };
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index fe14cae115b5..b03d04d78eb9 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -33,9 +33,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	sig->data = cert->tbs;
 	sig->data_size = cert->tbs_size;
 
-	if (!cert->pub->pkey_algo)
-		cert->unsupported_key = true;
-
 	if (!sig->pkey_algo)
 		cert->unsupported_sig = true;
 
@@ -173,12 +170,6 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 
 	pr_devel("Cert Issuer: %s\n", cert->issuer);
 	pr_devel("Cert Subject: %s\n", cert->subject);
-
-	if (cert->unsupported_key) {
-		ret = -ENOPKG;
-		goto error_free_cert;
-	}
-
 	pr_devel("Cert Key Algo: %s\n", cert->pub->pkey_algo);
 	pr_devel("Cert Valid period: %lld-%lld\n", cert->valid_from, cert->valid_to);
 
-- 
2.34.1

