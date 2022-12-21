Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0FB8653253
	for <lists+keyrings@lfdr.de>; Wed, 21 Dec 2022 15:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiLUOSa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 21 Dec 2022 09:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiLUOS3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 21 Dec 2022 09:18:29 -0500
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856281836D
        for <keyrings@vger.kernel.org>; Wed, 21 Dec 2022 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1671632303;
        bh=TYrBETpL7ggohHtWE+aT0xBW3t0+o/BGJryb9CFIk3k=;
        h=Message-ID:Subject:From:To:Date:From;
        b=C3FUU4CM5edc86Uo9iVcjvb4qSBohXfzlAk10EPnJH0aMDpOXGbeeQjULOts+I4Rf
         lZb7ABc2EWd0y2nGytBuQdK78Uipbg0zfE0uy54M72ZOFDCw2vrWckfUEItkQIDFJH
         iNWE1qziGOlXtNVWdyzxNpzsJZ/CTrqsR0ZqX0XU=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 908FD1282CF7;
        Wed, 21 Dec 2022 09:18:23 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7X4xhkQQTkyM; Wed, 21 Dec 2022 09:18:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1671632303;
        bh=TYrBETpL7ggohHtWE+aT0xBW3t0+o/BGJryb9CFIk3k=;
        h=Message-ID:Subject:From:To:Date:From;
        b=C3FUU4CM5edc86Uo9iVcjvb4qSBohXfzlAk10EPnJH0aMDpOXGbeeQjULOts+I4Rf
         lZb7ABc2EWd0y2nGytBuQdK78Uipbg0zfE0uy54M72ZOFDCw2vrWckfUEItkQIDFJH
         iNWE1qziGOlXtNVWdyzxNpzsJZ/CTrqsR0ZqX0XU=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id F208D1280796;
        Wed, 21 Dec 2022 09:18:22 -0500 (EST)
Message-ID: <d73a29f9ab66daa9e4f3bbb385baab5cc6df34bb.camel@HansenPartnership.com>
Subject: [PATCH] KEYS: trusted: return -EEXIST when refusing to update
 existing key
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     keyrings@vger.kernel.org
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Date:   Wed, 21 Dec 2022 09:18:21 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

All other key types return -EEXIST when refusing to update an existing
key, but trusted keys return -EINVAL, which is confusing to users who
can't figure out what the invalid argument is.  Fix by returning
-EEXIST if the key exists and we can't update it.

Fixes: d00a1c72f7f4 ("keys: add new trusted key-type")
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Cc: stable@vger.kernel.org
---
 security/keys/trusted-keys/trusted_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
index c6fc50d67214..8dcd84137035 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -254,7 +254,7 @@ static int trusted_update(struct key *key, struct key_preparsed_payload *prep)
 	datablob[datalen] = '\0';
 	ret = datablob_parse(&datablob, new_p);
 	if (ret != Opt_update) {
-		ret = -EINVAL;
+		ret = -EEXIST;
 		kfree_sensitive(new_p);
 		goto out;
 	}
-- 
2.35.3


