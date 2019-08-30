Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7FCA3B03
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 17:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfH3Pw2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 11:52:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43012 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfH3Pw2 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 30 Aug 2019 11:52:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8D9A8307D985;
        Fri, 30 Aug 2019 15:52:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC145EE1D;
        Fri, 30 Aug 2019 15:52:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: ensure that ->match_free() is called in
 request_key_and_link()
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
Cc:     Eric Biggers <ebiggers@google.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 30 Aug 2019 16:52:26 +0100
Message-ID: <156718034654.6899.18350327020509594564.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 15:52:28 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

If check_cached_key() returns a non-NULL value, we still need to call
key_type::match_free() to undo key_type::match_preparse().

Fixes: 7743c48e54ee ("keys: Cache result of request_key*() temporarily in task_struct")
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/request_key.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 7325f382dbf4..957b9e3e1492 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -595,7 +595,7 @@ struct key *request_key_and_link(struct key_type *type,
 
 	key = check_cached_key(&ctx);
 	if (key)
-		return key;
+		goto error_free;
 
 	/* search all the process keyrings for a key */
 	rcu_read_lock();

