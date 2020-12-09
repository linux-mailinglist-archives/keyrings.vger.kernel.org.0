Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4802D41E0
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgLIMQb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26561 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731193AbgLIMQX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PpleZkV+ZWSa0z96CHloykgw95HcUmPRhkkWDfQcmC0=;
        b=h8s2A9IdCFoeUyniGpoY5PbaDHL5H2qaLcYU4BMUG93CGuGRddsLtvnutKzkFmlQR2Q0J7
        FeYLHKDXbEzImzbgLnMe9M+VutOUNEubX62oUYhsllOuK2cpmvgaIKt5uRMzofWvScb4ch
        IK5ZdwegWz2wvM45UzncSvEyC1zPtMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-x5YsyHI-Po6Gdjuv_u1CVg-1; Wed, 09 Dec 2020 07:14:53 -0500
X-MC-Unique: x5YsyHI-Po6Gdjuv_u1CVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C41B610054FF;
        Wed,  9 Dec 2020 12:14:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BC8486E41C;
        Wed,  9 Dec 2020 12:14:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 03/18] watch_queue: Drop references to /dev/watch_queue
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:14:50 +0000
Message-ID: <160751609000.1238376.15155902499805348989.stgit@warthog.procyon.org.uk>
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

From: Gabriel Krisman Bertazi <krisman@collabora.com>

The merged API doesn't use a watch_queue device, but instead relies on
pipes, so let the documentation reflect that.

Fixes: f7e47677e39a ("watch_queue: Add a key/keyring notification facility")
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---

 Documentation/security/keys/core.rst |    4 ++--
 samples/Kconfig                      |    2 +-
 samples/watch_queue/watch_test.c     |    2 +-
 security/keys/Kconfig                |    8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index aa0081685ee1..b3ed5c581034 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1040,8 +1040,8 @@ The keyctl syscall functions are:
 
      "key" is the ID of the key to be watched.
 
-     "queue_fd" is a file descriptor referring to an open "/dev/watch_queue"
-     which manages the buffer into which notifications will be delivered.
+     "queue_fd" is a file descriptor referring to an open pipe which
+     manages the buffer into which notifications will be delivered.
 
      "filter" is either NULL to remove a watch or a filter specification to
      indicate what events are required from the key.
diff --git a/samples/Kconfig b/samples/Kconfig
index 0ed6e4d71d87..e76cdfc50e25 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -210,7 +210,7 @@ config SAMPLE_WATCHDOG
 	depends on CC_CAN_LINK
 
 config SAMPLE_WATCH_QUEUE
-	bool "Build example /dev/watch_queue notification consumer"
+	bool "Build example watch_queue notification API consumer"
 	depends on CC_CAN_LINK && HEADERS_INSTALL
 	help
 	  Build example userspace program to use the new mount_notify(),
diff --git a/samples/watch_queue/watch_test.c b/samples/watch_queue/watch_test.c
index 46e618a897fe..8c6cb57d5cfc 100644
--- a/samples/watch_queue/watch_test.c
+++ b/samples/watch_queue/watch_test.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Use /dev/watch_queue to watch for notifications.
+/* Use watch_queue API to watch for notifications.
  *
  * Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
diff --git a/security/keys/Kconfig b/security/keys/Kconfig
index 83bc23409164..c161642a8484 100644
--- a/security/keys/Kconfig
+++ b/security/keys/Kconfig
@@ -119,7 +119,7 @@ config KEY_NOTIFICATIONS
 	bool "Provide key/keyring change notifications"
 	depends on KEYS && WATCH_QUEUE
 	help
-	  This option provides support for getting change notifications on keys
-	  and keyrings on which the caller has View permission.  This makes use
-	  of the /dev/watch_queue misc device to handle the notification
-	  buffer and provides KEYCTL_WATCH_KEY to enable/disable watches.
+	  This option provides support for getting change notifications
+	  on keys and keyrings on which the caller has View permission.
+	  This makes use of pipes to handle the notification buffer and
+	  provides KEYCTL_WATCH_KEY to enable/disable watches.


