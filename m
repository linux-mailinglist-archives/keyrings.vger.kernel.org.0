Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2044B997
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbfFSNTR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53284 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfFSNTQ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:19:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9693E306E61C;
        Wed, 19 Jun 2019 13:19:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 77D325C220;
        Wed, 19 Jun 2019 13:19:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 03/10] keys: sparse: Fix kdoc mismatches [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     James Morris <jamorris@linux.microsoft.com>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:08 +0100
Message-ID: <156095034869.9363.6079500929660783450.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 19 Jun 2019 13:19:16 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix some kdoc argument description mismatches reported by sparse and give
keyring_restrict() a description.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
cc: Mat Martineau <mathew.j.martineau@linux.intel.com>
---

 security/keys/keyring.c     |   10 +++++++---
 security/keys/request_key.c |    2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index e14f09e3a4b0..5b218b270598 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -520,7 +520,7 @@ EXPORT_SYMBOL(keyring_alloc);
  * @keyring: The keyring being added to.
  * @type: The type of key being added.
  * @payload: The payload of the key intended to be added.
- * @data: Additional data for evaluating restriction.
+ * @restriction_key: Keys providing additional data for evaluating restriction.
  *
  * Reject the addition of any links to a keyring.  It can be overridden by
  * passing KEY_ALLOC_BYPASS_RESTRICTION to key_instantiate_and_link() when
@@ -976,9 +976,13 @@ static bool keyring_detect_restriction_cycle(const struct key *dest_keyring,
 
 /**
  * keyring_restrict - Look up and apply a restriction to a keyring
- *
- * @keyring: The keyring to be restricted
+ * @keyring_ref: The keyring to be restricted
+ * @type: The key type that will provide the restriction checker.
  * @restriction: The restriction options to apply to the keyring
+ *
+ * Look up a keyring and apply a restriction to it.  The restriction is managed
+ * by the specific key type, but can be configured by the options specified in
+ * the restriction string.
  */
 int keyring_restrict(key_ref_t keyring_ref, const char *type,
 		     const char *restriction)
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 75d87f9e0f49..1f234b019437 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -24,7 +24,7 @@
 
 /**
  * complete_request_key - Complete the construction of a key.
- * @auth_key: The authorisation key.
+ * @authkey: The authorisation key.
  * @error: The success or failute of the construction.
  *
  * Complete the attempt to construct a key.  The key will be negated

