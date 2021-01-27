Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211E430553B
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 09:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhA0IFn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Wed, 27 Jan 2021 03:05:43 -0500
Received: from mx1.emlix.com ([136.243.223.33]:47834 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234295AbhA0IDY (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 27 Jan 2021 03:03:24 -0500
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 98AAE5FCE6;
        Wed, 27 Jan 2021 08:50:55 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v6] scripts: use pkg-config to locate libcrypto
Date:   Wed, 27 Jan 2021 08:50:55 +0100
Message-ID: <3207945.kN7qQvqmsI@devpool47>
Organization: emlix GmbH
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35> <3394639.6NgGvCfkNl@devpool47>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From f467f251e44cd406c9556ea7d68d131f56e0d832 Mon Sep 17 00:00:00 2001
From: Rolf Eike Beer <eb@emlix.com>
Date: Thu, 22 Nov 2018 16:40:49 +0100
Subject: [PATCH] scripts: use pkg-config to locate libcrypto

Otherwise build fails if the headers are not in the default location. While at
it also ask pkg-config for the libs, with fallback to the existing value.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Cc: stable@vger.kernel.org # 5.6.x
---
 scripts/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Changes in v6:
 - hardcode pkg-config

diff --git a/scripts/Makefile b/scripts/Makefile
index b5418ec587fb..9de3c03b94aa 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -3,6 +3,9 @@
 # scripts contains sources for various helper programs used throughout
 # the kernel for the build process.
 
+CRYPTO_LIBS = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
+CRYPTO_CFLAGS = $(shell pkg-config --cflags libcrypto 2> /dev/null)
+
 hostprogs-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
@@ -14,8 +17,9 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-HOSTLDLIBS_sign-file = -lcrypto
-HOSTLDLIBS_extract-cert = -lcrypto
+HOSTLDLIBS_sign-file = $(CRYPTO_LIBS)
+HOSTCFLAGS_extract-cert.o = $(CRYPTO_CFLAGS)
+HOSTLDLIBS_extract-cert = $(CRYPTO_LIBS)
 
 ifdef CONFIG_UNWINDER_ORC
 ifeq ($(ARCH),x86_64)
-- 
2.30.0

-- 
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 Göttingen, Germany
Sitz der Gesellschaft: Göttingen, Amtsgericht Göttingen HR B 3160
Geschäftsführung: Heike Jordan, Dr. Uwe Kracke – Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source



