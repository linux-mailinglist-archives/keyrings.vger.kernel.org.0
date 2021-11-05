Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6102E445F02
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 05:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhKEEG0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 00:06:26 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:61766 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhKEEGZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 00:06:25 -0400
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-04.nifty.com with ESMTP id 1A540ge5002124
        for <keyrings@vger.kernel.org>; Fri, 5 Nov 2021 13:00:57 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 1A5403LQ022540;
        Fri, 5 Nov 2021 13:00:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 1A5403LQ022540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636084804;
        bh=UBeP22s4xfPYWsFjyoiM12my2Sqc+H6BgyJExMAZa7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aZz5LIrfqBkBbjSDtExiwKrybXovZ8unNqfpMxgJjRutoLT+GtFTH5GdfrpBNq4BC
         Vsi/Hzwi8uBSoNYEUSPSg/Qbla0bPpAPR2mpkhgA09sFfekMN2B6EO9T2JGK0oyInW
         2TA63C5OkJYB+mbwIkTX0+fd7kfChD9Co7LHdZ5fvuSx9aDIKmT5c71dE6vEQnH+UT
         8YG/0lJLWtpv9ZZk+6D1sINOx9hB7xBOaVKK2oVLEv1XEB5BXZ6wCKBsOnLV9C1RI6
         uQwBDFfcnQt+RlCrTLMDBwFckCIHfbyni+CE8ypEqrKSgdscIsYu/efoYxvHVcJf+r
         /h61pD40FPUiA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] certs: remove meaningless $(error ...) in certs/Makefile
Date:   Fri,  5 Nov 2021 12:59:54 +0900
Message-Id: <20211105035959.93748-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105035959.93748-1-masahiroy@kernel.org>
References: <20211105035959.93748-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

CONFIG_MODULE_SIG_HASH is defined by init/Kconfig. This $(error ...) is
never reachable. (If it is, you need to fix the bug.)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 certs/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/certs/Makefile b/certs/Makefile
index 279433783b10..db1fd2f4b950 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -50,9 +50,6 @@ ifdef SIGN_KEY
 # fail and that the kernel may be used afterwards.
 #
 ###############################################################################
-ifndef CONFIG_MODULE_SIG_HASH
-$(error Could not determine digest type to use from kernel config)
-endif
 
 redirect_openssl	= 2>&1
 quiet_redirect_openssl	= 2>&1
-- 
2.30.2

