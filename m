Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78C1F43EC3
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2019 17:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbfFMPwq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jun 2019 11:52:46 -0400
Received: from hmm.wantstofly.org ([138.201.34.84]:45234 "EHLO
        mail.wantstofly.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733128AbfFMPwn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jun 2019 11:52:43 -0400
Received: by mail.wantstofly.org (Postfix, from userid 1000)
        id 999D28052A; Thu, 13 Jun 2019 18:46:08 +0300 (EEST)
Date:   Thu, 13 Jun 2019 18:46:08 +0300
From:   Lennert Buytenhek <buytenh@wantstofly.org>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH 2/3] Fix syscall signature for KEYCTL_PKEY_QUERY
Message-ID: <20190613154608.GE9017@wantstofly.org>
References: <20190613154516.GC9017@wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613154516.GC9017@wantstofly.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Currently, running 'keyctl pkey_query' (or pkey_{encrypt,decrypt,sign},
due to those using pkey_query internally) will always return:

	keyctl_pkey_query: Invalid argument

This is because we invoke KEYCTL_PKEY_QUERY as:

	return keyctl(KEYCTL_PKEY_QUERY, key_id, info, result);

While the kernel code (security/keys/keyctl.c) does this:

	[...]
	case KEYCTL_PKEY_QUERY:
		if (arg3 != 0)
			return -EINVAL;
		return keyctl_pkey_query((key_serial_t)arg2,
					 (const char __user *)arg4,
					 (struct keyctl_pkey_query __user *)arg5);
	[...]

In other words, there is supposed to be an argument between 'key_id'
and 'info' (presumably for the (currently unsupported) key password
field?) which is supposed to be NULL.  Adding a NULL argument seems to
make things happy.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
---
 keyutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/keyutils.c b/keyutils.c
index 18f2ab4..7234f9d 100644
--- a/keyutils.c
+++ b/keyutils.c
@@ -268,7 +268,7 @@ long keyctl_pkey_query(key_serial_t key_id,
 		       const char *info,
 		       struct keyctl_pkey_query *result)
 {
-	return keyctl(KEYCTL_PKEY_QUERY, key_id, info, result);
+	return keyctl(KEYCTL_PKEY_QUERY, key_id, NULL, info, result);
 }
 
 long keyctl_pkey_encrypt(key_serial_t key_id,
-- 
2.21.0
