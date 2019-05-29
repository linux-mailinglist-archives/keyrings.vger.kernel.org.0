Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0622E6F2
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 23:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE2VCG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 17:02:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfE2VCG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 17:02:06 -0400
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4513241CA;
        Wed, 29 May 2019 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559163725;
        bh=cuJjFq7EcUvFK6pYTNx/z6SDYikjtcJgC768mZQl/bQ=;
        h=From:To:Subject:Date:From;
        b=Yon+CBeXieqnUHgl9BzLk0Ex3iw7O1w41Xdxp4rw+RYGlRciRS1CY5fNzQGu+d6pU
         hMvVdhUwaWkiXUjEsCn2GyfII7lwmlmGIdUoJ5TvkGR7PN1rWSQ9QP8mD3XwDSUUdj
         c9BmTAeow+vFrlCD3DnBrk7k0QrPoGiNNzEggVcg=
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: [PATCH RESEND] KEYS: reuse keyring_index_key::desc_len in lookup_user_key()
Date:   Wed, 29 May 2019 14:01:52 -0700
Message-Id: <20190529210152.120249-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

When lookup_user_key() checks whether the key is possessed, it should
use the key's existing index_key including the 'desc_len' field, rather
than recomputing the 'desc_len'.  This doesn't change the behavior; this
way is just simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/keys/process_keys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index f05f7125a7d5d..5492677c20b73 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -690,9 +690,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 		key_ref = make_key_ref(key, 0);
 
 		/* check to see if we possess the key */
-		ctx.index_key.type		= key->type;
-		ctx.index_key.description	= key->description;
-		ctx.index_key.desc_len		= strlen(key->description);
+		ctx.index_key			= key->index_key;
 		ctx.match_data.raw_data		= key;
 		kdebug("check possessed");
 		skey_ref = search_process_keyrings(&ctx);
-- 
2.22.0.rc1.257.g3120a18244-goog

