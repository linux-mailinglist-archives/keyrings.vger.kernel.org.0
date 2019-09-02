Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4E7A5651
	for <lists+keyrings@lfdr.de>; Mon,  2 Sep 2019 14:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbfIBMhc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Sep 2019 08:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60618 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729623AbfIBMhc (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 2 Sep 2019 08:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 047733086268;
        Mon,  2 Sep 2019 12:37:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78C965D9CC;
        Mon,  2 Sep 2019 12:37:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: Fix missing null pointer check in
 request_key_auth_describe()
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Hillf Danton <hdanton@sina.com>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 02 Sep 2019 13:37:29 +0100
Message-ID: <156742784963.20310.17991758398365196262.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 02 Sep 2019 12:37:32 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hillf Danton <hdanton@sina.com>

If a request_key authentication token key gets revoked, there's a window in
which request_key_auth_describe() can see it with a NULL payload - but it
makes no check for this and something like the following oops may occur:

	BUG: Kernel NULL pointer dereference at 0x00000038
	Faulting instruction address: 0xc0000000004ddf30
	Oops: Kernel access of bad area, sig: 11 [#1]
	...
	NIP [...] request_key_auth_describe+0x90/0xd0
	LR [...] request_key_auth_describe+0x54/0xd0
	Call Trace:
	[...] request_key_auth_describe+0x54/0xd0 (unreliable)
	[...] proc_keys_show+0x308/0x4c0
	[...] seq_read+0x3d0/0x540
	[...] proc_reg_read+0x90/0x110
	[...] __vfs_read+0x3c/0x70
	[...] vfs_read+0xb4/0x1b0
	[...] ksys_read+0x7c/0x130
	[...] system_call+0x5c/0x70

Fix this by checking for a NULL pointer when describing such a key.

Also make the read routine check for a NULL pointer to be on the safe side.

[DH: Modified to not take already-held rcu lock and modified to also check
 in the read routine]

Fixes: 04c567d9313e ("[PATCH] Keys: Fix race between two instantiators of a key")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
---

 security/keys/request_key_auth.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index e73ec040e250..ecba39c93fd9 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -66,6 +66,9 @@ static void request_key_auth_describe(const struct key *key,
 {
 	struct request_key_auth *rka = dereference_key_rcu(key);
 
+	if (!rka)
+		return;
+
 	seq_puts(m, "key:");
 	seq_puts(m, key->description);
 	if (key_is_positive(key))
@@ -83,6 +86,9 @@ static long request_key_auth_read(const struct key *key,
 	size_t datalen;
 	long ret;
 
+	if (!rka)
+		return -EKEYREVOKED;
+
 	datalen = rka->callout_len;
 	ret = datalen;
 

