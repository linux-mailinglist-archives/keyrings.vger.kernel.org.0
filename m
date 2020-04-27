Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DCE1B99E9
	for <lists+keyrings@lfdr.de>; Mon, 27 Apr 2020 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgD0IVD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 27 Apr 2020 04:21:03 -0400
Received: from mx1.emlix.com ([188.40.240.192]:40976 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgD0IVD (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Mon, 27 Apr 2020 04:21:03 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Apr 2020 04:21:02 EDT
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 4F4F55F75F;
        Mon, 27 Apr 2020 10:11:28 +0200 (CEST)
From:   Rolf Eike Beer <eb@emlix.com>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH v4] scripts: use pkg-config to locate libcrypto
Date:   Mon, 27 Apr 2020 10:11:28 +0200
Message-ID: <2278760.8Yd83Mgoko@devpool35>
Organization: emlix GmbH
In-Reply-To: <20538915.Wj2CyUsUYa@devpool35>
References: <20538915.Wj2CyUsUYa@devpool35>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From 082ba542ca4c710dcf592a6f9233603b9275d05d Mon Sep 17 00:00:00 2001
From: Rolf Eike Beer <eb@emlix.com>
Date: Thu, 22 Nov 2018 16:40:49 +0100
Subject: [PATCH 1/2] scripts: use pkg-config to locate libcrypto

Otherwise build fails if the headers are not in the default location. While at
it also ask pkg-config for the libs, with fallback to the existing value.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Cc: stable@vger.kernel.org # 5.6.x
---
 scripts/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 95ecf970c74c..35ed997e074b 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -3,6 +3,11 @@
 # scripts contains sources for various helper programs used throughout
 # the kernel for the build process.
 
+PKG_CONFIG?= pkg-config
+
+CRYPTO_LIBS = $(shell $(PKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+CRYPTO_CFLAGS = $(shell $(PKG_CONFIG) --cflags libcrypto 2> /dev/null)
+
 always-$(CONFIG_BUILD_BIN2C)			+= bin2c
 always-$(CONFIG_KALLSYMS)			+= kallsyms
 always-$(BUILD_C_RECORDMCOUNT)			+= recordmcount
@@ -14,8 +19,9 @@ always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
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
2.26.1




