Return-Path: <keyrings+bounces-2204-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D799FB4C
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79EE284614
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9EA1B6D08;
	Tue, 15 Oct 2024 22:22:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09F721E3A7;
	Tue, 15 Oct 2024 22:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030976; cv=none; b=o5yMXfhyh03nSr2lnD+Mg9i5YDljdBQLdGRiu0eZGqSFGuedBtl1YAItD9EKTSD2y+Vv/LP+xB5bKEzP1en0VyWEgXH9ot0teLRERLyqU1zpbYDUQcJIwQGqVBcZQo5s782hRciTV72TIVoHOoV8Cugj+Q56TplPKiv0QDUYvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030976; c=relaxed/simple;
	bh=ChJp3FkdlrjyBMH8e4YX8Xck6vININFbQO4OvSITy5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejhJ8tiJ6EZxf3SkjgoGekEDFqdx2ZSml58sHVz9RdkfUsHpRPnXAwHvvgNljaPgkzUU6PKkI4iWj4OHzAoMpYgkN0L3x7nG015OPBfcJ1QUWnvnoovcitvfmr3whTNm2CqlnwnK1168ciKfOG2gTW//w2Ue8I6NCf6tf9aF5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E91ADDA7;
	Tue, 15 Oct 2024 15:23:22 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 030F23F71E;
	Tue, 15 Oct 2024 15:22:53 -0700 (PDT)
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
Subject: [RFC 0/5] Another initramfs signature checking set
Date: Tue, 15 Oct 2024 17:22:30 -0500
Message-ID: <20241015222235.71040-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the advent of UKI's wrapping kernel and cpio archives up into
single UEFI PE executables it seems like its probably time to
reconsider whether the core idea of signing the initrd and verifying
it in its entirely is a useful function of the core kernel.

Moving this functionality in the kernel should provide a similar
security statement to the UKIs with a more traditional kernel + initrd
boot flow and the ability to have a single kernel image that
selects between multiple signed initrd images. Say a normal boot
image, and a recovery image.

This set is a very basic implementation of that concept using the kernel
built in trusted keyring, and a signature format that is similar to the
existing module signature. The core change is quite trivial with the larger
questions around the policy for enforcing or simply checking
for a valid signature. I've considered various policies, tying it to
lockdown/etc but this set simply enforces it by default with an kernel
parameter to override the behavior.

Outside of the core patch the largest change revolves around making
sure that the asymmetric key and built in cert/keyring/blacklist logic
is started much earlier in the boot process than normal. This means
that beyond the hacky _initcall changes in patch 2 there are a bit of
additional Kconfig changes necessary.

Finally, before the RFC is dropped there are a number of
/Documentation changes that will be completed as needed.

Jeremy Linton (5):
  initramfs: Add initramfs signature checking
  KEYS/certs: Start the builtin key and cert system earlier
  initramfs: Use existing module signing infrastructure
  sign-file: Add -i option to sign initramfs images
  initramfs: Enforce initramfs signature

 certs/blacklist.c                        |  2 +-
 certs/system_keyring.c                   |  4 +-
 crypto/asymmetric_keys/asymmetric_type.c |  2 +-
 crypto/asymmetric_keys/x509_public_key.c |  2 +-
 include/linux/initrd.h                   |  3 +
 init/initramfs.c                         | 84 +++++++++++++++++++++++-
 scripts/sign-file.c                      | 11 +++-
 usr/Kconfig                              |  9 +++
 8 files changed, 109 insertions(+), 8 deletions(-)

-- 
2.46.0


