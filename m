Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4C09F337
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2019 21:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbfH0TUW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 27 Aug 2019 15:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730379AbfH0TUW (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 27 Aug 2019 15:20:22 -0400
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6D292186A;
        Tue, 27 Aug 2019 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566933621;
        bh=qqEBJ2FCME7+AKMx+1k/OFVhUCCoXLnsi7Lbz8oYA/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sw0uke7eJgj4lkXidabR1QbxABgTzQR9wmu2uK1q35Xm+O7l9b8jz5S2GfFk9ROip
         kO0394JBQlUQiXvmN0JV+ZfZG2U/YWfAJ6peI27TGIuFox1iqZUc161J8rjpBft4Fi
         9iYaffaGs5Sund73FX03vxUumAtceEETUZCF5zdU=
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     linux-security-module@vger.kernel.org,
        James Morris <jmorris@namei.org>
Subject: [PATCH keys-next] keys: Fix permissions assigned to anonymous session keyrings
Date:   Tue, 27 Aug 2019 12:18:24 -0700
Message-Id: <20190827191824.259566-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190814224106.GG101319@gmail.com>
References: <20190814224106.GG101319@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

JOIN permission was incorrectly removed from anonymous session keyrings
when the old-style key permissions were translated to an ACL, thus
breaking 'keyctl new_session'.

Fixes: f802f2b3a991 ("keys: Replace uid/gid/perm permissions checking with an ACL")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/keys/process_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index aa3bfcadbc6600..519c94f1cc3c2c 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -58,7 +58,7 @@ static struct key_acl session_keyring_acl = {
 	.possessor_viewable = true,
 	.nr_ace	= 2,
 	.aces = {
-		KEY_POSSESSOR_ACE(KEY_ACE__PERMS & ~KEY_ACE_JOIN),
+		KEY_POSSESSOR_ACE(KEY_ACE__PERMS),
 		KEY_OWNER_ACE(KEY_ACE_VIEW | KEY_ACE_READ),
 	}
 };
-- 
2.23.0.187.g17f5b7556c-goog

