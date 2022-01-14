Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A1E48E18A
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 01:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238425AbiANAay (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 19:30:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40060 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238430AbiANAax (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 19:30:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68FCA61D56;
        Fri, 14 Jan 2022 00:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA86C36AF3;
        Fri, 14 Jan 2022 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642120252;
        bh=fOz/UM0VhzggK9q9eIMuqedBHgMOdwdEDBvF2lLwyd8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DECvSpMap06//4eXqbugj949vUuuY1w+Rcs+FGzvl0ZwQkfU9MLIfTLCxgT6nOmyY
         t7lIXL8Slbweetz28iX4w1jMKPo/aCSo1c2XzBBxFOTuZ5/raAjSGG2BpKyZj1feIX
         aAnzqQyWWHAqaYLnV7j61CIav0+A+/CK/dpvpPPSs/XQ9bZc00L7OLAvHSgOTGj891
         mDAhdVLATc7YBWc7SzV3O3qdrO2XXaZX4vpbx9IwgKt1w5NoBq8pJ1Dl1Tkrdedars
         M6OvBu5T1497XQWeXK1J2FDRnUDatwa4Fp5qlpod0jHEozsgqUOW3wP5oaTKko9NBo
         dP2RSkmvBOfQw==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH 4/4] KEYS: x509: remove dead code that set ->unsupported_sig
Date:   Thu, 13 Jan 2022 16:29:20 -0800
Message-Id: <20220114002920.103858-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114002920.103858-1-ebiggers@kernel.org>
References: <20220114002920.103858-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

The X.509 parser always sets cert->sig->pkey_algo and
cert->sig->hash_algo on success, since x509_note_sig_algo() is a
mandatory action in the X.509 ASN.1 grammar, and it returns an error if
the signature's algorithm is unknown.  Thus, remove the dead code which
handled these fields being NULL.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/x509_public_key.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index b03d04d78eb9..8c77a297a82d 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -33,15 +33,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	sig->data = cert->tbs;
 	sig->data_size = cert->tbs_size;
 
-	if (!sig->pkey_algo)
-		cert->unsupported_sig = true;
-
-	/* We check the hash if we can - even if we can't then verify it */
-	if (!sig->hash_algo) {
-		cert->unsupported_sig = true;
-		return 0;
-	}
-
 	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
 	if (!sig->s)
 		return -ENOMEM;
-- 
2.34.1

