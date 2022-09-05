Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E90FC5AD715
	for <lists+keyrings@lfdr.de>; Mon,  5 Sep 2022 18:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiIEQHL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 5 Sep 2022 12:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiIEQHJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 5 Sep 2022 12:07:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC4452DC8;
        Mon,  5 Sep 2022 09:07:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D5E671FAA3;
        Mon,  5 Sep 2022 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662394027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ZVlSjeNontBozDWtj16dcigrwLPTjtnOd1uYYDXP6bo=;
        b=IMSohb3BzLJ+pAGf8W4wyEH0x2MyFGfM42q65FUbnY+2+q+gjxN0GR2mfmkoIWDyhIiYgn
        YbV4pJm7xb+uNOsJ+FkqwvxU1dH2NrmbBf7oEQ0xXrG7vwH5MHR9A6VzcXH4KVWQahGl1K
        CFOXGaF8k3Yjpaj1iMXTkHZKW0+A06k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662394027;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ZVlSjeNontBozDWtj16dcigrwLPTjtnOd1uYYDXP6bo=;
        b=qyf+kvKGoBiKNmH0xbj1/nfKomDS+tKN8XvRKlhcxhwXuOrWwDSquVV9RMnLdvpSmQgU5c
        us6Vp7t20tch5gBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3FBDD139C7;
        Mon,  5 Sep 2022 16:07:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pyx3DKseFmNuawAAMHmgww
        (envelope-from <pvorel@suse.cz>); Mon, 05 Sep 2022 16:07:07 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     keyrings@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        Paul Moore <paul@paul-moore.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        linux-security-module@vger.kernel.org
Subject: [PATCH 1/1] keys/request_key_auth.c: Use strscpy instead of strlcpy
Date:   Mon,  5 Sep 2022 18:07:03 +0200
Message-Id: <20220905160703.30364-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

strlcpy is deprecated, use its safer replacement.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 security/keys/request_key_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index 41e9735006d0..8f33cd170e42 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -178,7 +178,7 @@ struct key *request_key_auth_new(struct key *target, const char *op,
 	if (!rka->callout_info)
 		goto error_free_rka;
 	rka->callout_len = callout_len;
-	strlcpy(rka->op, op, sizeof(rka->op));
+	strscpy(rka->op, op, sizeof(rka->op));
 
 	/* see if the calling process is already servicing the key request of
 	 * another process */
-- 
2.35.3

