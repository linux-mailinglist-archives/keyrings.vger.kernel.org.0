Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5860A2D4214
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731393AbgLIMVe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731301AbgLIMQQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e1SC77/gmsTtCItAM3yMxTuezkHcxFKFW3rr38I5Qso=;
        b=Nbvr6RPX2gkgJhmR5D8NJEuyNuAVKtX1hfRAQC+MvcHbx8pKSbYO3sszKHAEAZF10rshxr
        ETD4pzIOVF/xOn1QjCcr36f+Iff2f93RFaRqUNtbO0IFa+bjnS4rAWz4JVD5R0dYyfmc3+
        j9DSJd1DnO77zmYtBftmrtCosj9r2qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-1JMbnN0mMte__uUPI152Xw-1; Wed, 09 Dec 2020 07:14:46 -0500
X-MC-Unique: 1JMbnN0mMte__uUPI152Xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C097E190A7C2;
        Wed,  9 Dec 2020 12:14:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CEAE06E41C;
        Wed,  9 Dec 2020 12:14:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 02/18] keys: Remove outdated __user annotations
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Jann Horn <jannh@google.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:14:43 +0000
Message-ID: <160751608302.1238376.17507023175166742919.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Jann Horn <jannh@google.com>

When the semantics of the ->read() handlers were changed such that "buffer"
is a kernel pointer, some __user annotations survived.
Since they're wrong now, get rid of them.

Fixes: d3ec10aa9581 ("KEYS: Don't write out to userspace while holding key semaphore")
Signed-off-by: Jann Horn <jannh@google.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/keyring.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 14abfe765b7e..977066208387 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -452,7 +452,7 @@ static void keyring_describe(const struct key *keyring, struct seq_file *m)
 struct keyring_read_iterator_context {
 	size_t			buflen;
 	size_t			count;
-	key_serial_t __user	*buffer;
+	key_serial_t		*buffer;
 };
 
 static int keyring_read_iterator(const void *object, void *data)
@@ -479,7 +479,7 @@ static int keyring_read_iterator(const void *object, void *data)
  * times.
  */
 static long keyring_read(const struct key *keyring,
-			 char __user *buffer, size_t buflen)
+			 char *buffer, size_t buflen)
 {
 	struct keyring_read_iterator_context ctx;
 	long ret;
@@ -491,7 +491,7 @@ static long keyring_read(const struct key *keyring,
 
 	/* Copy as many key IDs as fit into the buffer */
 	if (buffer && buflen) {
-		ctx.buffer = (key_serial_t __user *)buffer;
+		ctx.buffer = (key_serial_t *)buffer;
 		ctx.buflen = buflen;
 		ctx.count = 0;
 		ret = assoc_array_iterate(&keyring->keys,


