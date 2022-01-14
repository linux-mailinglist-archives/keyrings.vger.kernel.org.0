Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6C448E186
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 01:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbiANAax (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 19:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbiANAax (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 19:30:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0060EC061574;
        Thu, 13 Jan 2022 16:30:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91CDC61D56;
        Fri, 14 Jan 2022 00:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D464CC36AF2;
        Fri, 14 Jan 2022 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642120252;
        bh=rwCDnubWfEx4pJC1wzdIQEzshROf9zYzr5NaTwIbkWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tdlYQMswFl8WIpzLwtZMYXyVGhOr0vlozFp6DmxftWg4YT+H2rvRu4QA2Pw59HxQR
         6XxosGER0cBSMqpG2erWmjoHg4E2EjYqJP5WUKYiIfLSONUepnNwNh5DiyDKAum7h/
         TUF5Blmm6mbPWI/v1Mx8pBPj8GxTPZ+sJTOm5htQol1ShWz/Q1A6bRt86K/js4WrKJ
         Wpj+iKACcpYpWaJ96DDjZNNs1V/liv1WnxilSXd+afy+YdRl14UNFYLxUeLjg7Emib
         9Xex/nAkgj9Ps3OFiy0pwqPSNMvY9SbWZvVo02k3puZTQw9A1FKJu8kU2Fp/qqDf7K
         CDpPWAIAK3ZhA==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     linux-crypto@vger.kernel.org
Subject: [PATCH 2/4] KEYS: x509: remove unused fields
Date:   Thu, 13 Jan 2022 16:29:18 -0800
Message-Id: <20220114002920.103858-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114002920.103858-1-ebiggers@kernel.org>
References: <20220114002920.103858-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Remove unused fields from struct x509_parse_context.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index aec2396a7f7e..2899ed80bb18 100644
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

