Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1329982C
	for <lists+keyrings@lfdr.de>; Thu, 22 Aug 2019 17:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731863AbfHVP3y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Aug 2019 11:29:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731844AbfHVP3y (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 22 Aug 2019 11:29:54 -0400
Received: from zzz.localdomain (ip-173-136-158-138.anahca.spcsdns.net [173.136.158.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF25F233FD;
        Thu, 22 Aug 2019 15:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566487793;
        bh=rBY7SySAeGa1jwSHKnvEe+dOrZFrIVjTnoyBGZhewQU=;
        h=From:To:Subject:Date:From;
        b=F9YGvjLu5DXuX/QeOV9vhwFn6pg6meYFLDWaMECX8krcoGYqqrObI2LTXvR6xggmP
         xXrZT0FrduUbhi1f8116WbNo5O5KLsrnyWGn6c/sDUBMrjzogzL23vBS6H9Y7Oacuw
         /oHRg+Ezr1xM6/6hn6vvp/pid6Yx4vu8J4Qrpops=
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH] keys: ensure that ->match_free() is called in request_key_and_link()
Date:   Thu, 22 Aug 2019 08:29:01 -0700
Message-Id: <20190822152901.8229-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

If check_cached_key() returns a non-NULL value, we still need to call
key_type::match_free() to undo key_type::match_preparse().

Fixes: 7743c48e54ee ("keys: Cache result of request_key*() temporarily in task_struct")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/keys/request_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 46c5187ce03f..6d628a5a8d10 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -589,7 +589,7 @@ struct key *request_key_and_link(struct key_type *type,
 
 	key = check_cached_key(&ctx);
 	if (key)
-		return key;
+		goto error_free;
 
 	/* search all the process keyrings for a key */
 	rcu_read_lock();
-- 
2.22.1

