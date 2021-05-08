Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D0377112
	for <lists+keyrings@lfdr.de>; Sat,  8 May 2021 11:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhEHJwb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 8 May 2021 05:52:31 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:33359 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229583AbhEHJw2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 8 May 2021 05:52:28 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UY8pXIE_1620467482;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UY8pXIE_1620467482)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 08 May 2021 17:51:24 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     dhowells@redhat.com
Cc:     jarkko@kernel.org, jmorris@namei.org, serge@hallyn.com,
        nathan@kernel.org, ndesaulniers@google.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] Keys: Remove redundant initialization of cred
Date:   Sat,  8 May 2021 17:51:21 +0800
Message-Id: <1620467481-110575-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Pointer cred is being initialized however this value is never
read as cred is assigned an updated value from the returned
call to get_current_cred(). Remove the redundant initialization.

Cleans up clang warning:

security/keys/request_key.c:119:21: warning: Value stored to 'cred'
during its initialization is never read
[clang-analyzer-deadcode.DeadStores]

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 'commit bb952bb98a7e ("CRED: Separate per-task-group keyrings from signal_struct")'
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 security/keys/request_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 2da4404..873c31f 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -116,7 +116,7 @@ static int call_sbin_request_key(struct key *authkey, void *aux)
 {
 	static char const request_key[] = "/sbin/request-key";
 	struct request_key_auth *rka = get_request_key_auth(authkey);
-	const struct cred *cred = current_cred();
+	const struct cred *cred;
 	key_serial_t prkey, sskey;
 	struct key *key = rka->target_key, *keyring, *session, *user_session;
 	char *argv[9], *envp[3], uid_str[12], gid_str[12];
-- 
1.8.3.1

