Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CB7927CD
	for <lists+keyrings@lfdr.de>; Mon, 19 Aug 2019 17:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfHSPCH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Aug 2019 11:02:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35339 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726168AbfHSPCH (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 19 Aug 2019 11:02:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E22D08D5BB0;
        Mon, 19 Aug 2019 15:02:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com [10.10.120.255])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFD6871FB;
        Mon, 19 Aug 2019 15:02:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: Fix description size
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
Cc:     kernel test robot <rong.a.chen@intel.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 19 Aug 2019 16:02:01 +0100
Message-ID: <156622692131.21558.12335114959426121841.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Mon, 19 Aug 2019 15:02:07 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The maximum key description size is 4095.  Commit f771fde82051
inadvertantly reduced that to 255 and made sizes between 256 and 4095 work
weirdly, and any size whereby size & 255 == 0 would cause an assertion in
__key_link_begin() at the following line:

	BUG_ON(index_key->desc_len == 0);

This can be fixed by simply increasing the size of desc_len in struct
keyring_index_key to a u16.

Note the argument length test in keyutils only checked empty descriptions
and descriptions with a size around the limit (ie. 4095) and not for all
the values in between, so it missed this.  This has been addressed and

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/commit/?id=066bf56807c26cd3045a25f355b34c1d8a20a5aa

now exhaustively tests all possible lengths of type, description and
payload and then some.

The assertion failure looks something like:

 kernel BUG at security/keys/keyring.c:1245!
 ...
 RIP: 0010:__key_link_begin+0x88/0xa0
 ...
 Call Trace:
  key_create_or_update+0x211/0x4b0
  __x64_sys_add_key+0x101/0x200
  do_syscall_64+0x5b/0x1e0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

It can be triggered by:

	keyctl add user "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" a @s

Fixes: f771fde82051 ("keys: Simplify key description management")
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>
---

 include/linux/key.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index 91f391cd272e..50028338a4cc 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -94,11 +94,11 @@ struct keyring_index_key {
 	union {
 		struct {
 #ifdef __LITTLE_ENDIAN /* Put desc_len at the LSB of x */
-			u8	desc_len;
-			char	desc[sizeof(long) - 1];	/* First few chars of description */
+			u16	desc_len;
+			char	desc[sizeof(long) - 2];	/* First few chars of description */
 #else
-			char	desc[sizeof(long) - 1];	/* First few chars of description */
-			u8	desc_len;
+			char	desc[sizeof(long) - 2];	/* First few chars of description */
+			u16	desc_len;
 #endif
 		};
 		unsigned long x;

