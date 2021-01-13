Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55BF2F4BE8
	for <lists+keyrings@lfdr.de>; Wed, 13 Jan 2021 14:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbhAMM5k convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Wed, 13 Jan 2021 07:57:40 -0500
Received: from mx1.emlix.com ([136.243.223.33]:34754 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbhAMM5j (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 13 Jan 2021 07:57:39 -0500
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Jan 2021 07:57:39 EST
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 5386F5FA09;
        Wed, 13 Jan 2021 13:49:13 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v5] scripts: use pkg-config to locate libcrypto
Date:   Wed, 13 Jan 2021 13:49:12 +0100
Message-ID: <3394639.6NgGvCfkNl@devpool47>
Organization: emlix GmbH
In-Reply-To: <2278760.8Yd83Mgoko@devpool35>
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Otherwise build fails if the headers are not in the default location. While at
it also ask pkg-config for the libs, with fallback to the existing value.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Cc: stable@vger.kernel.org # 5.6.x
---
 scripts/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

This has been sent multiple times since more than 2 year, please pick it up 
through whatever tree. I need to patch every new stable kernel version to 
make them build in our chrooted environment.


diff --git a/scripts/Makefile b/scripts/Makefile
index b5418ec587fb..7553692d241f 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -3,6 +3,11 @@
 # scripts contains sources for various helper programs used throughout
 # the kernel for the build process.
 
+PKG_CONFIG ?= pkg-config
+
+CRYPTO_LIBS = $(shell $(PKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+CRYPTO_CFLAGS = $(shell $(PKG_CONFIG) --cflags libcrypto 2> /dev/null)
+
 hostprogs-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
@@ -14,8 +19,9 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
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
2.29.2
-- 
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 Göttingen, Germany
Sitz der Gesellschaft: Göttingen, Amtsgericht Göttingen HR B 3160
Geschäftsführung: Heike Jordan, Dr. Uwe Kracke – Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source



