Return-Path: <keyrings+bounces-2206-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F599FB53
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D2928465D
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB261D63DB;
	Tue, 15 Oct 2024 22:22:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21DD21E3DB;
	Tue, 15 Oct 2024 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030977; cv=none; b=BARBFdB4jjSsy32lYy+qIS89SsasddG1QDsOWuppAAqIh3I0LbU1420AlBW6FTDH41MBKwBstBCneMSKIYXfVORuKWwQNmHrk/6Ux8/6V59K2JnbzofTQBmhcFres5al2wt8TCB3YsIq3F1rYV72Bmd/6VGZuPoCH71mXbqjWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030977; c=relaxed/simple;
	bh=a/9waGCx6zmCoPndDtrnBw09clAutUJbVmjhCyxxTzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDG9QERH4P59SbzhB+5vjg5wPmK7MUGh97bFxJsVIx4iGu4n+ucoAnD0tccVJJKNNPhyhMZEP2nPq8BwHhuZvg0SxFiW7p46AHcf9oKUrpi+VgfYkHKbBDcafaFkNh95wPXSgpm0/GerA0sKCXvYwIqeoZfCmPUa2CfKeqsgLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB6D71007;
	Tue, 15 Oct 2024 15:23:23 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 226023F71E;
	Tue, 15 Oct 2024 15:22:54 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	gregkh@linuxfoundation.org,
	graf@amazon.com,
	lukas@wunner.de,
	wufan@linux.microsoft.com,
	brauner@kernel.org,
	jsperbeck@google.com,
	ardb@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	keyrings@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 1/5] initramfs: Add initramfs signature checking
Date: Tue, 15 Oct 2024 17:22:31 -0500
Message-ID: <20241015222235.71040-2-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241015222235.71040-1-jeremy.linton@arm.com>
References: <20241015222235.71040-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various root-level processes, configurations, and the like can exist
in the initramfs provided by the boot loader. The kernel does a
reasonable job of signature checking and blocking unsigned code from
running in the kernel, but this is only one aspect of system
security. The remaining init and early startup code running in
userspace are just as critical to system security.

This option provides a basic initramfs signature check, which reuses
the module signature checking infrastructure to validate the boot
loader provided initramfs. Later, a system policy can allow or deny
images that fail the signature check.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 usr/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/usr/Kconfig b/usr/Kconfig
index 9279a2893ab0..a9c0dc0112eb 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -32,6 +32,15 @@ config INITRAMFS_FORCE
 	  and is useful if you cannot or don't want to change the image
 	  your bootloader passes to the kernel.
 
+config INITRAMFS_SIG
+	bool "Validate signed initramfs images"
+	depends on SYSTEM_DATA_VERIFICATION
+	help
+	  This option validates that image provided by the
+	  bootloader is signed. The decision to accept or
+	  reject the image is then left to the kernel lockdown
+	  logic.
+
 config INITRAMFS_ROOT_UID
 	int "User ID to map to 0 (user root)"
 	depends on INITRAMFS_SOURCE!=""
-- 
2.46.0


