Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD8C48E148
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 00:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238280AbiAMX4d (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 18:56:33 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50064 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiAMX4c (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 18:56:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22BD861D0D;
        Thu, 13 Jan 2022 23:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF96C36AF2;
        Thu, 13 Jan 2022 23:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642118191;
        bh=oKepsBiUvipoUsRwWzzacVjvRjKomlWW+JhTo6LpOqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ir6qVvGMqy8tGaEwNG8lRfmidg8fOgoDFJv1HZ9COA+XCdjul4h5hupLpTZWqhhsY
         stlBZA0WEnB10iWf18x2J1Sp/Eh4GkBrl4dcd7GRpk+fuXU+d/aByYP8KaeKyCKW8D
         UNjwI8bT4v7ieWiXdq8sNZtD0z9VsKdDZppX6GY0YmFB79npAgheHhPck/ndau7KFy
         GoTbwultgCUAs9wlEK1r8/YVd1LIq6N0KsESPRU9PBecR5sJZbi/GZFEtlvATzs7XJ
         /P/5XHEZa+w4+LFAjNaZIfwXg+ZgPO67irBpW281MHDhbMOGhvQVZXJVcbP3TpmKvb
         np6Z2rIQeJdPw==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: [PATCH 2/3] KEYS: asym_tpm: fix incorrect comment
Date:   Thu, 13 Jan 2022 15:54:39 -0800
Message-Id: <20220113235440.90439-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113235440.90439-1-ebiggers@kernel.org>
References: <20220113235440.90439-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

tpm_key_create() doesn't actually load the key into the TPM.  Fix the
comment to describe what the function does.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/asym_tpm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 60d20d44c885..2e365a221fbe 100644
--- a/crypto/asymmetric_keys/asym_tpm.c
+++ b/crypto/asymmetric_keys/asym_tpm.c
@@ -900,7 +900,11 @@ static int extract_key_parameters(struct tpm_key *tk)
 	return 0;
 }
 
-/* Given the blob, parse it and load it into the TPM */
+/*
+ * Verify that a supported TPM is present, then parse the key blob.  We don't
+ * actually load the key into the TPM here; that happens only for the actual
+ * sign and decrypt operations.
+ */
 struct tpm_key *tpm_key_create(const void *blob, uint32_t blob_len)
 {
 	int r;
-- 
2.34.1

