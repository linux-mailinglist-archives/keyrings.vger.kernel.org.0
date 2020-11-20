Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1742BB22A
	for <lists+keyrings@lfdr.de>; Fri, 20 Nov 2020 19:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgKTSLQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 20 Nov 2020 13:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbgKTSLM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 20 Nov 2020 13:11:12 -0500
X-Greylist: delayed 396 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 Nov 2020 10:11:12 PST
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [IPv6:2001:1600:3:17::8fab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E81C0617A7
        for <keyrings@vger.kernel.org>; Fri, 20 Nov 2020 10:11:12 -0800 (PST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Cd4FM1thyzlhCpj;
        Fri, 20 Nov 2020 19:04:39 +0100 (CET)
Received: from localhost (unknown [94.23.54.103])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Cd4FL73dLzlh8T2;
        Fri, 20 Nov 2020 19:04:38 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v1 5/9] PKCS#7: Fix missing include
Date:   Fri, 20 Nov 2020 19:04:22 +0100
Message-Id: <20201120180426.922572-6-mic@digikod.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120180426.922572-1-mic@digikod.net>
References: <20201120180426.922572-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

Add missing stddef.h for size_t.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
---
 include/linux/verification.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/verification.h b/include/linux/verification.h
index 911ab7c2b1ab..b4a74568c0f0 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -8,6 +8,8 @@
 #ifndef _LINUX_VERIFICATION_H
 #define _LINUX_VERIFICATION_H
 
+#include <stddef.h>
+
 /*
  * Indicate that both builtin trusted keys and secondary trusted keys
  * should be used.
-- 
2.29.2

