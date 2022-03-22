Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584A34E3D4A
	for <lists+keyrings@lfdr.de>; Tue, 22 Mar 2022 12:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiCVLNy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Mar 2022 07:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbiCVLNw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Mar 2022 07:13:52 -0400
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [IPv6:2001:1600:3:17::42af])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47C081667
        for <keyrings@vger.kernel.org>; Tue, 22 Mar 2022 04:12:24 -0700 (PDT)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4KN82v01l3zMqKMC;
        Tue, 22 Mar 2022 12:12:23 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4KN82t5Gg3zlhMCB;
        Tue, 22 Mar 2022 12:12:22 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        David Howells <dhowells@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        Paul Moore <paul@paul-moore.com>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v2 1/1] certs: Explain the rationale to call panic()
Date:   Tue, 22 Mar 2022 12:13:23 +0100
Message-Id: <20220322111323.542184-2-mic@digikod.net>
In-Reply-To: <20220322111323.542184-1-mic@digikod.net>
References: <20220322111323.542184-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

The blacklist_init() function calls panic() for memory allocation
errors.  This change documents the reason why we don't return -ENODEV.

Suggested-by: Paul Moore <paul@paul-moore.com> [1]
Requested-by: Jarkko Sakkinen <jarkko@kernel.org> [1]
Link: https://lore.kernel.org/r/YjeW2r6Wv55Du0bJ@iki.fi [1]
Reviewed-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Link: https://lore.kernel.org/r/20220322111323.542184-2-mic@digikod.net
---

Changes since v1:
* Fix commit subject spelling spotted by David Woodhouse.
* Reword one sentence as suggested by Paul Moore.
* Add Reviewed-by Paul Moore.
* Add Reviewed-by Jarkko Sakkinen.
---
 certs/blacklist.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index 486ce0dd8e9c..25094ea73600 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -307,6 +307,15 @@ static int restrict_link_for_blacklist(struct key *dest_keyring,
 
 /*
  * Initialise the blacklist
+ *
+ * The blacklist_init() function is registered as an initcall via
+ * device_initcall().  As a result if the blacklist_init() function fails for
+ * any reason the kernel continues to execute.  While cleanly returning -ENODEV
+ * could be acceptable for some non-critical kernel parts, if the blacklist
+ * keyring fails to load it defeats the certificate/key based deny list for
+ * signed modules.  If a critical piece of security functionality that users
+ * expect to be present fails to initialize, panic()ing is likely the right
+ * thing to do.
  */
 static int __init blacklist_init(void)
 {
-- 
2.35.1

