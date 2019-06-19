Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35CC94B9AD
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfFSNUI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:20:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29487 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbfFSNUI (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:20:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 80BF230860A9;
        Wed, 19 Jun 2019 13:20:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 168C460477;
        Wed, 19 Jun 2019 13:20:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 09/10] keys: Reuse keyring_index_key::desc_len in
 lookup_user_key() [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     Eric Biggers <ebiggers@google.com>,
        James Morris <jamorris@linux.microsoft.com>,
        dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:59 +0100
Message-ID: <156095039896.9363.4535558628030573762.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 19 Jun 2019 13:20:08 +0000 (UTC)
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
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
---

 security/keys/process_keys.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index ba5d3172cafe..39aaa21462bf 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -688,9 +688,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 		key_ref = make_key_ref(key, 0);
 
 		/* check to see if we possess the key */
-		ctx.index_key.type		= key->type;
-		ctx.index_key.description	= key->description;
-		ctx.index_key.desc_len		= strlen(key->description);
+		ctx.index_key			= key->index_key;
 		ctx.match_data.raw_data		= key;
 		kdebug("check possessed");
 		skey_ref = search_process_keyrings(&ctx);

