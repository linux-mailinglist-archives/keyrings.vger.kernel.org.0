Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E45327248
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2019 00:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbfEVW20 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 May 2019 18:28:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50912 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbfEVW20 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 May 2019 18:28:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 350DD30001DD;
        Wed, 22 May 2019 22:28:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 616A2544EF;
        Wed, 22 May 2019 22:28:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/7] keys: sparse: Fix kdoc mismatches
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 22 May 2019 23:28:23 +0100
Message-ID: <155856410370.10428.4854212353631906601.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 22 May 2019 22:28:26 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix some kdoc argument description mismatches reported by sparse and give
keyring_restrict() a description.

Signed-off-by: David Howells <dhowells@redhat.com>
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

