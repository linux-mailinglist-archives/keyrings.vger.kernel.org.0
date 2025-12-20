Return-Path: <keyrings+bounces-3692-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8FCD267D
	for <lists+keyrings@lfdr.de>; Sat, 20 Dec 2025 04:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC333017F0A
	for <lists+keyrings@lfdr.de>; Sat, 20 Dec 2025 03:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD05257452;
	Sat, 20 Dec 2025 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6T1wVxO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE71D90DF;
	Sat, 20 Dec 2025 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766202644; cv=none; b=p5l1zYnCZ1QY6sFJd6eZlDrfQhE80ilf93j9rsNj2ZwcwBcz55VUCJNuLPzZXyKKgvsYQpdmlDLpeCHBSf3n2KWGUU5MDC5K3bzMKlzPK1UFXA/TQsHi8hyLhqMp93AyyU0pHywksCVnmPVN3omu7orEjk0+r3yy36sMGTsIr1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766202644; c=relaxed/simple;
	bh=MrMds3utW8eAWwtDygjBW2IqUKEl4oFRSbnzbCmLv7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tT+MTwmkER0Ek2Bzi0uaPE96voC3zNtkcaDEuo4W0aGsXnCFD/w4wjfMAKGUtvO3U0Uoa7J+a75M3U3JXTl8J67Vtz9g2gPtu8kx+UWRJoG1iYU3C0GyUN1CDKhu+6F6s6Ym+S/RlX2h9ZgPO0cfHJ4pu8y1w5nG80xekxSzqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6T1wVxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8542DC4CEF5;
	Sat, 20 Dec 2025 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766202644;
	bh=MrMds3utW8eAWwtDygjBW2IqUKEl4oFRSbnzbCmLv7o=;
	h=From:Date:Subject:To:Cc:From;
	b=f6T1wVxO5/BnJq19l7xlgAyL3t9t8ZSt2+XcG4Xt0o9yqBk+n+LBR873K82UEMCXl
	 lkfR8Zpz8/N1i7IIYwt+Tc+8IzUYETOiO0bV66IP5ZMX8J1AhEVldltoAUOJNr+WRk
	 zHO5xpGEf3QFGsu4ITn05+cn7tnbD/IOVa4/MpNr4XzfM5dSPa22Db5vTSL6xxx/o/
	 B8MJhXIqZu3ahd6sLKfGsiGn4/GLfq724WN96Ec5lxwcoi5yUgONt0F960cnfvapTd
	 N5TmTWnUVbbA5RmTlWz1l2cPkFJl1liEFAR3sl+TETJsIj4in68nOozTvxBhEbL+By
	 2OqfopSQTgzqw==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Sat, 20 Dec 2025 04:50:31 +0100
Subject: [PATCH] KEYS: replace -EEXIST with -EBUSY
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>
X-B4-Tracking: v=1; b=H4sIAAYdRmkC/x2NwQqDMBAFf0X27EISlIq/UnpQ89RFG0tWRRH/3
 dDjMDBzkSIKlOrsoohdVJaQwOYZdWMTBrD4xOSMK62zFXvs/F38NicTZGXgEF2VJ5xRwsBla0z
 lX+jbwlCq/CJ6Of6H9+e+HxemqPNxAAAA
X-Change-ID: 20251218-dev-module-init-eexists-keyring-5b008d7efb40
To: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
 Ignat Korchagin <ignat@cloudflare.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Lucas De Marchi <demarchi@kernel.org>, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=q4cI0aBVoXHVJKhjzx9eP5SA50zhMHGoxrB7LDqV3kk=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpRh0PGnY21kDDwXOVauY8RTS22ihvwD0eaIfmf
 LMLk8+ZhcKJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCaUYdDwAKCRBAnqPEHxlR
 +wa0D/4xxAMBT8H1iUmQHNZewuG0zfcL0uHrZ4rgUTrfKRV7AuL9BlOhEGfLmU88ORKPQBzDn2o
 rzMJF6+V0/1lJ3Q3+qCabABUADW50OaouR8mNzXsg+tpxOXg8IC1rJe+u4awcuQOsaoO43b1slK
 mZm3lsR7gb6mZWc8DjEu9yrzqZB82df1N6AdVZ+3mnj/ar9R9lymNNILHpp/W5RFy2DDkcD26Rv
 coGeKkdvHsFDyZpf46Y2K+YXHbu07FL6gX/7Ho9GYVCF4BdFy8GJjiihUZ7zQXcqAt3H1Cl60Y/
 lGnEtQZnFeixpWRlYO4vUMnwV43AErB49Nm1AB6EhM3ZVsMhcBKz680y/VqxHE8UnJxQFP5qI4M
 yYgzqy/v8W+sN1FD7kW1AEDSxmKVnJR3ZyP4JrH8kOo5Vlvg2edb/3yBdOyD8rY8tGxNHq9rrT1
 wyRNdFBtcjH/CoGsmYFq9AYs+vEqyHP2CJYHupXnE4q2TIUG0RFATLLzKIREXRQ0DhLKXwXRROf
 At+x3LxriA0mN4fFA8pAMlz0v/5kHM5PNZrCXYDbgxqdSEwN6mmCs2N5EhSA9AgFgSthpUF4tPc
 7LcAcaasdDpqoszbNavgk10dTc9R5kcTtRUNv+3OBmzJMWRAHTXmHx5de6F1JrgZO6LpiMjzDG5
 AXv0xrgDZdSlx7w==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F

From: Daniel Gomez <da.gomez@samsung.com>

The -EEXIST error code is reserved by the module loading infrastructure
to indicate that a module is already loaded. When a module's init
function returns -EEXIST, userspace tools like kmod interpret this as
"module already loaded" and treat the operation as successful, returning
0 to the user even though the module initialization actually failed.

This follows the precedent set by commit 54416fd76770 ("netfilter:
conntrack: helper: Replace -EEXIST by -EBUSY") which fixed the same
issue in nf_conntrack_helper_register().

Affected modules:
  * pkcs8_key_parser x509_key_parser asymmetric_keys dns_resolver
  * nvme_keyring pkcs7_test_key rxrpc turris_signing_key

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
The error code -EEXIST is reserved by the kernel module loader to
indicate that a module with the same name is already loaded. When a
module's init function returns -EEXIST, kmod interprets this as "module
already loaded" and reports success instead of failure [1].

The kernel module loader will include a safety net that provides -EEXIST
to -EBUSY with a warning [2], and a documentation patch has been sent to
prevent future occurrences [3].

These affected code paths were identified using a static analysis tool
[4] that traces -EEXIST returns to module_init(). The tool was developed
with AI assistance and all findings were manually validated.

Link: https://lore.kernel.org/all/aKEVQhJpRdiZSliu@orbyte.nwl.cc/ [1]
Link: https://lore.kernel.org/all/20251013-module-warn-ret-v1-0-ab65b41af01f@intel.com/ [2]
Link: https://lore.kernel.org/all/20251218-dev-module-init-eexists-modules-docs-v1-0-361569aa782a@samsung.com/ [3]
Link: https://gitlab.com/-/snippets/4913469 [4]
---
 crypto/asymmetric_keys/asymmetric_type.c | 2 +-
 security/keys/key.c                      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 348966ea2175..2c6f3a725102 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -634,7 +634,7 @@ int register_asymmetric_key_parser(struct asymmetric_key_parser *parser)
 		if (strcmp(cursor->name, parser->name) == 0) {
 			pr_err("Asymmetric key parser '%s' already registered\n",
 			       parser->name);
-			ret = -EEXIST;
+			ret = -EBUSY;
 			goto out;
 		}
 	}
diff --git a/security/keys/key.c b/security/keys/key.c
index 3bbdde778631..ed597660f72e 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -1219,7 +1219,7 @@ EXPORT_SYMBOL(generic_key_instantiate);
  *
  * Register a new key type.
  *
- * Returns 0 on success or -EEXIST if a type of this name already exists.
+ * Returns 0 on success or -EBUSY if a type of this name already exists.
  */
 int register_key_type(struct key_type *ktype)
 {
@@ -1228,7 +1228,7 @@ int register_key_type(struct key_type *ktype)
 
 	memset(&ktype->lock_class, 0, sizeof(ktype->lock_class));
 
-	ret = -EEXIST;
+	ret = -EBUSY;
 	down_write(&key_types_sem);
 
 	/* disallow key types with the same name */

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-dev-module-init-eexists-keyring-5b008d7efb40

Best regards,
--  
Daniel Gomez <da.gomez@samsung.com>


