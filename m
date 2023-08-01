Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFBB76A82A
	for <lists+keyrings@lfdr.de>; Tue,  1 Aug 2023 07:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjHAFJI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 1 Aug 2023 01:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjHAFJI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 1 Aug 2023 01:09:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7905F173A;
        Mon, 31 Jul 2023 22:09:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 151E861460;
        Tue,  1 Aug 2023 05:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5027CC433C7;
        Tue,  1 Aug 2023 05:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690866545;
        bh=erFyHPkFzUaKQZWyMrsZygmMCnR3AvgrkSfnViTNgrM=;
        h=From:To:Cc:Subject:Date:From;
        b=ADoWAYOrSNgHN2SAwv21aWdd70EVNQfj1xITQPCIzFrJ1K0TfPelT5V7hjXKhwc75
         6XeyMKnh9XyFw/3J64ppWcmq1I55t/YblOIYnneO/vgqhHVz5r8Y8t4yxZxUji7m/j
         jfvxB9T4isqeGy6XaPOciLNqGSQgO1Znwg/fkpyf01hDaOFdSlSZ26aCsBw2priH5/
         tl30ukQHTMZk6DlQ5SW08JIt64JCHyLuKAwC/6V3tyLkDBZeDSZqzq/djfeavVLm1Q
         enWKSG5IvM/gpMQOFOsw5mUfT+0UP6VvCq+6Gi76HZvDt5kIM+RP8lajEkbPz/Gu12
         sHIdXJ0UfGLLA==
From:   Eric Biggers <ebiggers@kernel.org>
To:     fsverity@lists.linux.dev
Cc:     keyrings@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
        stable@vger.kernel.org
Subject: [PATCH] fsverity: skip PKCS#7 parser when keyring is empty
Date:   Mon, 31 Jul 2023 22:07:14 -0700
Message-ID: <20230801050714.28974-1-ebiggers@kernel.org>
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
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/signature.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index b95acae64eac6..f6668d92d8151 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -70,10 +70,26 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	d->digest_size = cpu_to_le16(hash_alg->digest_size);
 	memcpy(d->digest, vi->file_digest, hash_alg->digest_size);
 
-	err = verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
-				     signature, sig_size, fsverity_keyring,
-				     VERIFYING_UNSPECIFIED_SIGNATURE,
-				     NULL, NULL);
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
+		err = -ENOKEY;
+	} else {
+		err = verify_pkcs7_signature(d,
+					     sizeof(*d) + hash_alg->digest_size,
+					     signature, sig_size,
+					     fsverity_keyring,
+					     VERIFYING_UNSPECIFIED_SIGNATURE,
+					     NULL, NULL);
+	}
 	kfree(d);
 
 	if (err) {

base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
-- 
2.41.0

