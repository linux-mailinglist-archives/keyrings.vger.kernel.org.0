Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF0776C3FE
	for <lists+keyrings@lfdr.de>; Wed,  2 Aug 2023 06:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjHBEP0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 2 Aug 2023 00:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjHBEPY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 2 Aug 2023 00:15:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842CEED;
        Tue,  1 Aug 2023 21:15:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09326617B3;
        Wed,  2 Aug 2023 04:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355C8C433C7;
        Wed,  2 Aug 2023 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690949722;
        bh=FwYw1Ys6mearw8rtCro8FNVS+u6xf9XdpTbTQekj87g=;
        h=From:To:Cc:Subject:Date:From;
        b=mRdg+NuHMAQD7AwmkHXeiO+PTi0Mx5e7Zk0S0vkZ7vwDNnw7PxJFepqIXyYHYvKgl
         LtXOf0yCRNyveC9JUWaL2Qqc5RSYwoxWcXpnI+4cgh4/yx3QbgSPWNbsZJvh+dmL3U
         gxQpBLr3rLOVz8l1EF4ADxzZEh4YFks9xkyrFG6PFG1JW7wZrPXSS1vWiA/mBtws3o
         2rv1cVEiVU8XeDHUYQaYbetfl0EHbEAz00OVWi01+chP0MkYNa/hhvwSpyQszO+fXv
         focjhafydkqJOSbOxBMANzudDhkBhREKLXNmxbm/dUn8ZQzXk5KymNZITBIKTZ3IW3
         4B8lEm+bv263Q==
From:   Eric Biggers <ebiggers@kernel.org>
To:     fsverity@lists.linux.dev
Cc:     keyrings@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
        stable@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH v2] fsverity: skip PKCS#7 parser when keyring is empty
Date:   Tue,  1 Aug 2023 21:15:03 -0700
Message-ID: <20230802041503.11530-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

If an fsverity builtin signature is given for a file but the
".fs-verity" keyring is empty, there's no real reason to run the PKCS#7
parser.  Skip this to avoid the PKCS#7 attack surface when builtin
signature support is configured into the kernel but is not being used.

This is a hardening improvement, not a fix per se, but I've added
Fixes and Cc stable to get it out to more users.

Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
Cc: stable@vger.kernel.org
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: check keyring and return early before allocating formatted digest

 fs/verity/signature.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index b95acae64eac6..8f474702aa249 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -62,6 +62,21 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 		return 0;
 	}
 
+	if (fsverity_keyring->keys.nr_leaves_on_tree == 0) {
+		/*
+		 * The ".fs-verity" keyring is empty, due to builtin signatures
+		 * being supported by the kernel but not actually being used.
+		 * In this case, verify_pkcs7_signature() would always return an
+		 * error, usually ENOKEY.  It could also be EBADMSG if the
+		 * PKCS#7 is malformed, but that isn't very important to
+		 * distinguish.  So, just skip to ENOKEY to avoid the attack
+		 * surface of the PKCS#7 parser, which would otherwise be
+		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
+		 */
+		fsverity_err(inode, "fs-verity keyring is empty");
+		return -ENOKEY;
+	}
+
 	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;

base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
-- 
2.41.0

