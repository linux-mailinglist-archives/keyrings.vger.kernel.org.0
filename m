Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0533445F00
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 05:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhKEEGM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 00:06:12 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:47514 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhKEEGK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 00:06:10 -0400
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-09.nifty.com with ESMTP id 1A540gqg012303
        for <keyrings@vger.kernel.org>; Fri, 5 Nov 2021 13:00:56 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 1A5403LT022540;
        Fri, 5 Nov 2021 13:00:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 1A5403LT022540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636084807;
        bh=93aItTC3cXJl6t5PrCLwMkGAcu0s3I3/mz3gepIjUKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwEeIpP4AgaKYBvSqd4bKtoQj6Iy2NIKpfHCw2fPXJZ+9ZG6R8VB7EOAiU1prClcn
         kMdh+/dgkZaLlYq7/U3d4frSmg6ajLHE1JMGkPPc0wC/YFVm5NIXZkBtI3xsU6gqHh
         yVIcLZNY+UQBY8RAC5GewTJP0Z3f2X/J0lz8ZaF4fxj6PpHXv2asV+UNknDEfVdjA0
         4yewAwiCzOowBru+7HPXF0yZkiKysN6ACxFh2xcbEzXwZK4J0GkIJ7dNAT5cC6fPYy
         c05X0VLbc915YN0vgwfLJPB/hMNFeUvzYiRLN2WkjR8Jac1NHDLRPMnMjy4qaLGnNz
         7EQsd9YTA9Duw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] certs: use 'cmd' to hide openssl output in silent builds more simply
Date:   Fri,  5 Nov 2021 12:59:57 +0900
Message-Id: <20211105035959.93748-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105035959.93748-1-masahiroy@kernel.org>
References: <20211105035959.93748-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Commit 5d06ee20b662 ("modsign: hide openssl output in silent builds")
silenced the key generation log from openssl in silent builds.

Since commit 174a1dcc9642 ("kbuild: sink stdout from cmd for silent
build"), the 'cmd' macro can handle it in a cleaner way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 certs/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/certs/Makefile b/certs/Makefile
index a8c9abceef00..fdf206022113 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -51,9 +51,6 @@ ifdef SIGN_KEY
 #
 ###############################################################################
 
-redirect_openssl	= 2>&1
-quiet_redirect_openssl	= 2>&1
-silent_redirect_openssl = 2>/dev/null
 openssl_available       = $(shell openssl help 2>/dev/null && echo yes)
 
 # We do it this way rather than having a boolean option for enabling an
@@ -79,13 +76,16 @@ $(if $(findstring rsaEncryption,$(X509TEXT)),,$(shell rm -f "certs/signing_key.p
 endif
 endif # CONFIG_MODULE_SIG_KEY_TYPE_RSA
 
-$(obj)/signing_key.pem: $(obj)/x509.genkey
-	$(Q)openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
+quiet_cmd_gen_key = GENKEY  $@
+      cmd_gen_key = openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
 		-batch -x509 -config $(obj)/x509.genkey \
 		-outform PEM -out $(obj)/signing_key.pem \
 		-keyout $(obj)/signing_key.pem \
 		$(keytype_openssl) \
-		$($(quiet)redirect_openssl)
+		2>&1
+
+$(obj)/signing_key.pem: $(obj)/x509.genkey
+	$(call cmd,gen_key)
 
 quiet_cmd_copy_x509_config = COPY    $@
       cmd_copy_x509_config = cat $(srctree)/$(src)/default_x509.genkey > $@
-- 
2.30.2

