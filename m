Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE13C41E67F
	for <lists+keyrings@lfdr.de>; Fri,  1 Oct 2021 06:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhJAENl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 Oct 2021 00:13:41 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:41143 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhJAENl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 1 Oct 2021 00:13:41 -0400
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Oct 2021 00:13:41 EDT
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-09.nifty.com with ESMTP id 191422Xf007736
        for <keyrings@vger.kernel.org>; Fri, 1 Oct 2021 13:02:26 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 19141WTN003428;
        Fri, 1 Oct 2021 13:01:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 19141WTN003428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633060893;
        bh=Lu4p3V/xxGLNCSHJGvk3pxjNusgCANavrVDQnaMoHTM=;
        h=From:To:Cc:Subject:Date:From;
        b=dd+t/k+M03RVwQkpC5ZUDDZYCKXtUcg7oOPUfEZzH9Ry9tdF3CGEyF5DorfcR6CYL
         27khpNWL/OqoQ6CCGv9n7vJO4yb4tI6Xx8mkORAY1oR691dP1ZA4V3A6l6MuES37xb
         5mXa4ldxR6xIIlFNJmY75N5R5L1CKUxwc5SPol0Oy7ES2wMXHLm2/Q4Cz4KnOxfKAH
         wXw7ldfyHxah4z9/W/ixRJcUrnkaYHlZTRJI9h3bLrgxwulnGBTSPJGg/YnoGD6EAU
         RP8RG+m77whzXA7C/DpZPX0x5n/9ij/FMcEYybvMEXZv+fJJRWIjG1W9VWmRC0F8h+
         ZVK9zz9kUpN7A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     keyrings@vger.kernel.org
Cc:     Stefan Berger <stefanb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] certs: move the 'depends on' to the choice of module signing keys
Date:   Fri,  1 Oct 2021 13:01:26 +0900
Message-Id: <20211001040126.1200230-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When the condition "MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)"
is unmet, you cannot choose anything in the choice, but the choice
menu is still displayed in the menuconfig etc.

Move the 'depends on' to the choice to hide the meaningless menu.

Also delete the redundant 'default'. In a choice, the first entry is
the default.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 certs/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/certs/Kconfig b/certs/Kconfig
index ae7f2e876a31..73d1350c223a 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -17,21 +17,19 @@ config MODULE_SIG_KEY
 
 choice
 	prompt "Type of module signing key to be generated"
-	default MODULE_SIG_KEY_TYPE_RSA
+	depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
 	help
 	 The type of module signing key type to generate. This option
 	 does not apply if a #PKCS11 URI is used.
 
 config MODULE_SIG_KEY_TYPE_RSA
 	bool "RSA"
-	depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
 	help
 	 Use an RSA key for module signing.
 
 config MODULE_SIG_KEY_TYPE_ECDSA
 	bool "ECDSA"
 	select CRYPTO_ECDSA
-	depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
 	help
 	 Use an elliptic curve key (NIST P384) for module signing. Consider
 	 using a strong hash like sha256 or sha384 for hashing modules.
-- 
2.30.2

