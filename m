Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE5912727F
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2019 00:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbfEVWqM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 May 2019 18:46:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34244 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbfEVWqM (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 May 2019 18:46:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E8C0486673;
        Wed, 22 May 2019 22:46:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 023CF62660;
        Wed, 22 May 2019 22:46:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/6] keys: Fix request_key() lack of Link perm check on
 found key
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-afs@lists.infradead.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 22 May 2019 23:46:10 +0100
Message-ID: <155856517025.11737.11943384989202404333.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
References: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 22 May 2019 22:46:12 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The request_key() syscall allows a process to gain access to the 'possessor'
permits of any key that grants it Search permission by virtue of request_key()
not checking whether a key it finds grants Link permission to the caller.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/request_key.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index e3653c6f85c6..d204d7c0152e 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -559,6 +559,16 @@ struct key *request_key_and_link(struct key_type *type,
 	key_ref = search_process_keyrings(&ctx);
 
 	if (!IS_ERR(key_ref)) {
+		if (dest_keyring) {
+			ret = key_task_permission(key_ref, current_cred(),
+						  KEY_NEED_LINK);
+			if (ret < 0) {
+				key_ref_put(key_ref);
+				key = ERR_PTR(ret);
+				goto error_free;
+			}
+		}
+
 		key = key_ref_to_ptr(key_ref);
 		if (dest_keyring) {
 			ret = key_link(dest_keyring, key);

