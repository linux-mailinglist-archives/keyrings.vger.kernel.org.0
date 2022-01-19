Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D784493211
	for <lists+keyrings@lfdr.de>; Wed, 19 Jan 2022 01:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350566AbiASAzU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jan 2022 19:55:20 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58106 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350533AbiASAzP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jan 2022 19:55:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9C5BB8188E;
        Wed, 19 Jan 2022 00:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52697C340EB;
        Wed, 19 Jan 2022 00:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642553711;
        bh=/lG1k0t1nnY6vmFri6DFzw8Kop4+mL70knGtnCacG9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M1cdhU5mlFEk5rOn/70BjBdy6ebQjLLM+yJ1cRBZ6rTDGHu2fxK/0X1mWBbheniDQ
         YhToZEr+u9SVX4l36OFxJdsSeykmLGvUFInX5hQenqPCBF3TCJrOuCPaCl3eaSfHwT
         HHD/WHjw//vFR09jTK12ubjsEsgEbM7HSvJVF2iE07qQoGNbP7wvC9FtvrbVx6K9iU
         yoZE8l8AJGEPdjgVqMgpH186DLkPji017iE7hZpc3S0vI51JDAjDTwn1YretCxKxzb
         mOl5zQkgwujHMy5CohQLdRPonY6Bb4q/wyF7QeLrcBM6jEkRdfnSntAmwKwwMk3JZy
         ZjNU3ykJ6Sv8g==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH v2 4/4] KEYS: x509: remove dead code that set ->unsupported_sig
Date:   Tue, 18 Jan 2022 16:54:36 -0800
Message-Id: <20220119005436.119072-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119005436.119072-1-ebiggers@kernel.org>
References: <20220119005436.119072-1-ebiggers@kernel.org>
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

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/x509_public_key.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index b03d04d78eb9d..8c77a297a82d4 100644
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

