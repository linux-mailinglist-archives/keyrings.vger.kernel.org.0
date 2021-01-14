Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FA52F642A
	for <lists+keyrings@lfdr.de>; Thu, 14 Jan 2021 16:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbhANPT7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 Jan 2021 10:19:59 -0500
Received: from smtp-190f.mail.infomaniak.ch ([185.125.25.15]:46961 "EHLO
        smtp-190f.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729497AbhANPT5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 Jan 2021 10:19:57 -0500
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DGnz24C0JzMr6dr;
        Thu, 14 Jan 2021 16:19:10 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DGnz21z4Szlh8TH;
        Thu, 14 Jan 2021 16:19:10 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        James Morris <jmorris@namei.org>,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v3 05/10] certs: Replace K{U,G}IDT_INIT() with GLOBAL_ROOT_{U,G}ID
Date:   Thu, 14 Jan 2021 16:19:04 +0100
Message-Id: <20210114151909.2344974-6-mic@digikod.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114151909.2344974-1-mic@digikod.net>
References: <20210114151909.2344974-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

Align with the new macros and add appropriate include files.

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

Changes since v2:
* Cherry-pick v1 patch from
  https://lore.kernel.org/lkml/2659836.1607940186@warthog.procyon.org.uk/
  to rebase on v5.11-rc3.
---
 certs/blacklist.c      | 4 ++--
 certs/system_keyring.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 029471947838..bffe4c6f4a9e 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -14,6 +14,7 @@
 #include <linux/ctype.h>
 #include <linux/err.h>
 #include <linux/seq_file.h>
+#include <linux/uidgid.h>
 #include <keys/system_keyring.h>
 #include "blacklist.h"
 
@@ -156,8 +157,7 @@ static int __init blacklist_init(void)
 
 	blacklist_keyring =
 		keyring_alloc(".blacklist",
-			      KUIDT_INIT(0), KGIDT_INIT(0),
-			      current_cred(),
+			      GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
 			      (KEY_POS_ALL & ~KEY_POS_SETATTR) |
 			      KEY_USR_VIEW | KEY_USR_READ |
 			      KEY_USR_SEARCH,
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 798291177186..4b693da488f1 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -11,6 +11,7 @@
 #include <linux/cred.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/uidgid.h>
 #include <linux/verification.h>
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
@@ -98,7 +99,7 @@ static __init int system_trusted_keyring_init(void)
 
 	builtin_trusted_keys =
 		keyring_alloc(".builtin_trusted_keys",
-			      KUIDT_INIT(0), KGIDT_INIT(0), current_cred(),
+			      GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
 			      ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
 			      KEY_USR_VIEW | KEY_USR_READ | KEY_USR_SEARCH),
 			      KEY_ALLOC_NOT_IN_QUOTA,
@@ -109,7 +110,7 @@ static __init int system_trusted_keyring_init(void)
 #ifdef CONFIG_SECONDARY_TRUSTED_KEYRING
 	secondary_trusted_keys =
 		keyring_alloc(".secondary_trusted_keys",
-			      KUIDT_INIT(0), KGIDT_INIT(0), current_cred(),
+			      GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
 			      ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
 			       KEY_USR_VIEW | KEY_USR_READ | KEY_USR_SEARCH |
 			       KEY_USR_WRITE),
-- 
2.30.0

