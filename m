Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6908310D22D
	for <lists+keyrings@lfdr.de>; Fri, 29 Nov 2019 09:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfK2IBl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Fri, 29 Nov 2019 03:01:41 -0500
Received: from mx1.emlix.com ([188.40.240.192]:38192 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfK2IBl (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 29 Nov 2019 03:01:41 -0500
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Fri, 29 Nov 2019 03:01:40 EST
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id A0895602E7;
        Fri, 29 Nov 2019 08:56:34 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH v3][RESEND #2] scripts: use pkg-config to locate libcrypto
Date:   Fri, 29 Nov 2019 08:56:34 +0100
Message-ID: <3291155.4g3vBG3qv5@devpool35>
Organization: emlix GmbH
In-Reply-To: <2010898.sAvVGPNi7W@devpool35>
References: <20538915.Wj2CyUsUYa@devpool35> <2010898.sAvVGPNi7W@devpool35>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Otherwise build fails if the headers are not in the default location. While at
it also ask pkg-config for the libs, with fallback to the existing value.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Cc: stable@vger.kernel.org
---
 scripts/Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 3e86b300f5a1..034789783317 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -8,7 +8,11 @@
 # conmakehash:   Create chartable
 # conmakehash:	 Create arrays for initializing the kernel console tables
 
+PKG_CONFIG?= pkg-config
+
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
+CRYPTO_LIBS = $(shell $(PKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+CRYPTO_CFLAGS = $(shell $(PKG_CONFIG) --cflags libcrypto 2> /dev/null)
 
 hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
@@ -23,8 +27,9 @@ hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
 
 HOSTCFLAGS_sortextable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-HOSTLDLIBS_sign-file = -lcrypto
-HOSTLDLIBS_extract-cert = -lcrypto
+HOSTLDLIBS_sign-file = $(CRYPTO_LIBS)
+HOSTCFLAGS_extract-cert.o = $(CRYPTO_CFLAGS)
+HOSTLDLIBS_extract-cert = $(CRYPTO_LIBS)
 
 always		:= $(hostprogs-y) $(hostprogs-m)
 
-- 
2.24.0


-- 
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 Göttingen, Germany
Sitz der Gesellschaft: Göttingen, Amtsgericht Göttingen HR B 3160
Geschäftsführung: Heike Jordan, Dr. Uwe Kracke – Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source


