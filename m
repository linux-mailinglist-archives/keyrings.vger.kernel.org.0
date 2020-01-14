Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45EAE13AE5C
	for <lists+keyrings@lfdr.de>; Tue, 14 Jan 2020 17:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgANQGY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Jan 2020 11:06:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36646 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728899AbgANQGW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Jan 2020 11:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579017981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zFvHM3AeFQ6gPIf7yqo2C1O21SKvnYRszvRgL2Vd76U=;
        b=TzvW822l8VpsVHzFCieIoIwFnjZa6/QOTrKun6SV3C4XkrMdlLze3ne3+BgM1CIuL+r+g1
        X7pELBgvVGUD1FVaBwr+d0ymw3ryG3Vc/f5FSshj4Tc1la6lr4qWajiVY7J5eWMTSGP0vF
        fpeFYHc/sP+HgDtGoCj5Kvr10e1qYw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-IilqvlY_MQGKWipUHzyBQA-1; Tue, 14 Jan 2020 11:06:17 -0500
X-MC-Unique: IilqvlY_MQGKWipUHzyBQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94755593A1;
        Tue, 14 Jan 2020 16:06:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com [10.10.120.52])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D51460BE0;
        Tue, 14 Jan 2020 16:06:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] keys: Fix request_key() cache
From:   David Howells <dhowells@redhat.com>
To:     torvalds@linux-foundation.org
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 14 Jan 2020 16:06:14 +0000
Message-ID: <157901797479.32540.1716642299317411940.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When the key cached by request_key() and co. is cleaned up on exit(), the
code looks in the wrong task_struct, and so clears the wrong cache.  This
leads to anomalies in key refcounting when doing, say, a kernel build on an
afs volume, that then trigger kasan to report a use-after-free when the key
is viewed in /proc/keys.

Fix this by making exit_creds() look in the passed-in task_struct rather
than in current (the task_struct cleanup code is deferred by RCU and
potentially run in another task).

Fixes: 7743c48e54ee ("keys: Cache result of request_key*() temporarily in task_struct")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 kernel/cred.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index c0a4c12d38b2..56395be1c2a8 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -175,8 +175,8 @@ void exit_creds(struct task_struct *tsk)
 	put_cred(cred);
 
 #ifdef CONFIG_KEYS_REQUEST_CACHE
-	key_put(current->cached_requested_key);
-	current->cached_requested_key = NULL;
+	key_put(tsk->cached_requested_key);
+	tsk->cached_requested_key = NULL;
 #endif
 }
 

