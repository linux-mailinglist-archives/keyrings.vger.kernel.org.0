Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3845B652C
	for <lists+keyrings@lfdr.de>; Tue, 13 Sep 2022 03:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiIMBqT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Sep 2022 21:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiIMBqS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Sep 2022 21:46:18 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D8E4F65F;
        Mon, 12 Sep 2022 18:46:16 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRR5b4k2wzNmFL;
        Tue, 13 Sep 2022 09:41:39 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 09:46:13 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <dhowells@redhat.com>, <jarkko@kernel.org>, <paul@paul-moore.com>,
        <jmorris@namei.org>, <serge@hallyn.com>,
        <akpm@linux-foundation.org>, <alan@redhat.com>,
        <cuigaosheng1@huawei.com>
CC:     <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>
Subject: [PATCH v2] KEYS: Remove orphan declarations from security/keys/internal.h
Date:   Tue, 13 Sep 2022 09:46:13 +0800
Message-ID: <20220913014613.524253-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Remove the following orphan declarations from security/keys/internal.h:
1. request_key_conswq has been removed since
commit 76181c134f87 ("KEYS: Make request_key() and co fundamentally
asynchronous").

2. keyring_search_instkey() has been removed since
commit b5f545c880a2 ("[PATCH] keys: Permit running process to
instantiate keys").

Fixes: 76181c134f87 ("KEYS: Make request_key() and co fundamentally asynchronous").
Fixes: b5f545c880a2 ("[PATCH] keys: Permit running process to instantiate keys").
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v2:
- Format the commit messages for the patchk, thanks!
 security/keys/internal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/security/keys/internal.h b/security/keys/internal.h
index 9b9cf3b6fcbb..6a2fb45c22f8 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -86,7 +86,6 @@ extern struct kmem_cache *key_jar;
 extern struct rb_root key_serial_tree;
 extern spinlock_t key_serial_lock;
 extern struct mutex key_construction_mutex;
-extern wait_queue_head_t request_key_conswq;
 
 extern void key_set_index_key(struct keyring_index_key *index_key);
 extern struct key_type *key_type_lookup(const char *type);
@@ -109,9 +108,6 @@ extern void __key_link_end(struct key *keyring,
 extern key_ref_t find_key_to_update(key_ref_t keyring_ref,
 				    const struct keyring_index_key *index_key);
 
-extern struct key *keyring_search_instkey(struct key *keyring,
-					  key_serial_t target_id);
-
 extern int iterate_over_keyring(const struct key *keyring,
 				int (*func)(const struct key *key, void *data),
 				void *data);
-- 
2.25.1

