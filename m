Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FD6445EFC
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 05:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhKEEGD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 00:06:03 -0400
Received: from condef-07.nifty.com ([202.248.20.72]:64901 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhKEEGD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 00:06:03 -0400
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-07.nifty.com with ESMTP id 1A540gXj013396
        for <keyrings@vger.kernel.org>; Fri, 5 Nov 2021 13:00:58 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 1A5403LS022540;
        Fri, 5 Nov 2021 13:00:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 1A5403LS022540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636084806;
        bh=8vQXG6riwPCY1OZUaVklMhf4cyaWbn73E2iQY/uxxAY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MP/ddmeaCKhigbw8ynRkAJJDefLnZJCAj2+TR4Ne/hPxsSWsafpG2yWeMMB/c2ue5
         HIgiwqOq0SuTqdgXgZY+DaQPpsk5xGP6oYITFEn3RjhUh3pzDhD1iGeejFffcvTrnT
         YHYSWMpp6mGxKRxeRlZtTzpxJPofo9N3jR1/omBFKDx93axhj7tTBCIoZAMd4NG5Ki
         STU82oH6mWx+T4iGkPvwsIy4Swwx7rMiQlSNasH8PNB9X9F0UgnHxxpoU8aQmKOQAx
         E+R6EIi+ZJW5e4x9muOtDJ6RwKYYiB72KvncCbhWSoGsRwjN0z5/aXWZDhrncuu1TE
         8RXXVLUTeyiqA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] certs: remove noisy messages while generating the signing key
Date:   Fri,  5 Nov 2021 12:59:56 +0900
Message-Id: <20211105035959.93748-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105035959.93748-1-masahiroy@kernel.org>
References: <20211105035959.93748-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When you run Kbuild with the parallel option -j, the messages from this
rule and others are interleaved, like follows:

    ###
      CC      arch/x86/mm/pat/set_memory.o
    ### Now generating an X.509 key pair to be used for signing modules.
    ###
    ### If this takes a long time, you might wish to run rngd in the
    ### background to keep the supply of entropy topped up.  It
      CC      arch/x86/events/intel/bts.o
      HDRTEST usr/include/linux/qnx4_fs.h
      CC      arch/x86/events/zhaoxin/core.o
    ### needs to be run as root, and uses a hardware random
    ### number generator if one is available.
      AR      init/built-in.a
    ###

On modern machines, it does not take a long time to generate the key.

Remove the ugly log messages.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 certs/Makefile | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/certs/Makefile b/certs/Makefile
index fc94a260e3f3..a8c9abceef00 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -80,23 +80,12 @@ endif
 endif # CONFIG_MODULE_SIG_KEY_TYPE_RSA
 
 $(obj)/signing_key.pem: $(obj)/x509.genkey
-	@$(kecho) "###"
-	@$(kecho) "### Now generating an X.509 key pair to be used for signing modules."
-	@$(kecho) "###"
-	@$(kecho) "### If this takes a long time, you might wish to run rngd in the"
-	@$(kecho) "### background to keep the supply of entropy topped up.  It"
-	@$(kecho) "### needs to be run as root, and uses a hardware random"
-	@$(kecho) "### number generator if one is available."
-	@$(kecho) "###"
 	$(Q)openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
 		-batch -x509 -config $(obj)/x509.genkey \
 		-outform PEM -out $(obj)/signing_key.pem \
 		-keyout $(obj)/signing_key.pem \
 		$(keytype_openssl) \
 		$($(quiet)redirect_openssl)
-	@$(kecho) "###"
-	@$(kecho) "### Key pair generated."
-	@$(kecho) "###"
 
 quiet_cmd_copy_x509_config = COPY    $@
       cmd_copy_x509_config = cat $(srctree)/$(src)/default_x509.genkey > $@
-- 
2.30.2

