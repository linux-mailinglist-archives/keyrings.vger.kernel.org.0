Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F30D49320B
	for <lists+keyrings@lfdr.de>; Wed, 19 Jan 2022 01:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350546AbiASAzQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jan 2022 19:55:16 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48998 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbiASAzL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jan 2022 19:55:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 759BF614E5;
        Wed, 19 Jan 2022 00:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B995FC340E8;
        Wed, 19 Jan 2022 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642553710;
        bh=Q3aJjH/E5Ajrhe5cHzf5q8Q185H2+XYtPfYn3TlUhao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rJiChSl2hY594sx4tqxqlxlZFtn7enUiXnwMhInGpHax5iILZO8wKMqehJIgtarUZ
         D9cTwSLU5T+gGMnEJKsV+iC/Zxl3psEYKNG/tlA0hTnWwDje/grU4b5AFbO07LXGFL
         ee+zO+ngocqNDn8Ra0Hrs0Xc3H1PwYTb0NHQMaDGCD4LFjVgm7lTC/L2Lj/OEE1t5z
         YURRrZzX6N8WTOj3bQZRTrLjHKOrHegCrqppbtKtgZ+GSW6FaRYk03IUoomK7YhOkq
         nJaCfDEEZdjoCrvzFQnWeJIHSqBYnYZsaEdF67SLCLmsxc/l4zn1DOVGYiQRDeMtJU
         M/SLX/FMjg/+Q==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH v2 2/4] KEYS: x509: remove unused fields
Date:   Tue, 18 Jan 2022 16:54:34 -0800
Message-Id: <20220119005436.119072-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119005436.119072-1-ebiggers@kernel.org>
References: <20220119005436.119072-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Remove unused fields from struct x509_parse_context.

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index aec2396a7f7e1..2899ed80bb18e 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -19,7 +19,6 @@
 struct x509_parse_context {
 	struct x509_certificate	*cert;		/* Certificate being constructed */
 	unsigned long	data;			/* Start of data */
-	const void	*cert_start;		/* Start of cert content */
 	const void	*key;			/* Key data */
 	size_t		key_size;		/* Size of key data */
 	const void	*params;		/* Key parameters */
@@ -27,7 +26,6 @@ struct x509_parse_context {
 	enum OID	key_algo;		/* Algorithm used by the cert's key */
 	enum OID	last_oid;		/* Last OID encountered */
 	enum OID	sig_algo;		/* Algorithm used to sign the cert */
-	unsigned char	nr_mpi;			/* Number of MPIs stored */
 	u8		o_size;			/* Size of organizationName (O) */
 	u8		cn_size;		/* Size of commonName (CN) */
 	u8		email_size;		/* Size of emailAddress */
-- 
2.34.1

