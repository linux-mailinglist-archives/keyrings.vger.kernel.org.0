Return-Path: <keyrings+bounces-1101-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE18AD656
	for <lists+keyrings@lfdr.de>; Mon, 22 Apr 2024 23:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F091C20C12
	for <lists+keyrings@lfdr.de>; Mon, 22 Apr 2024 21:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E271C6A5;
	Mon, 22 Apr 2024 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsOc2Qxo"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0F1C286;
	Mon, 22 Apr 2024 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713820247; cv=none; b=YN3l/21J5txXbPplrVEb4i6IwJjKqt8uGoiy8ZtWfBIPfWuRVCZr4STmxzQwdFcG1h5HQP3uOsz9nQ439MW4orQQdtUXm5YdSzO0F7CZkyluz5TfuRjm2jfzpijYle7HVQTp0NzCNbgcCNT+hHOUkGTXyiryaM2D2ARHFN1Wkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713820247; c=relaxed/simple;
	bh=diTLo/4zFtm6Jo2zsAsJ+rap63fptQCLoKGIjHEDegU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiHNhzgH3XG8iVi9v8wyN/3jr6hPT94vr8FHa/V1SJUiF89dTCEAbxSvpgm4Di0RFQrN6lJE+9E4ps3bNTpxhip49IoKMr4fgSG40DiF1lJtxuU9uHENCktLiP2qyv1jgOw0Va/Usq0hqphUSqR4EEyhws8nshb4inMdIRshjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsOc2Qxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD7C113CC;
	Mon, 22 Apr 2024 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713820246;
	bh=diTLo/4zFtm6Jo2zsAsJ+rap63fptQCLoKGIjHEDegU=;
	h=From:To:Cc:Subject:Date:From;
	b=jsOc2QxoXL3agl7CwGD9if8jd+icLfMhTxMwrAAB2240qLeOAhKLJR5Apb8PC/lda
	 HH3N9nDSc+EnhNaRtNMfZ3OutrCMv/oPOks02rCrF6ydAdfr/Hpg97uHPtMtxSMSH9
	 RxwigkxEDqO0mn5WALHHL4OsWkb/XTrIU9qNQWHFV1I+Fl/azq0aPX5DEC9CBtUkCl
	 UOAYv50JEd5Wye8ypZXispajIetVgwRgKv7/P/t6Lb2AzWkvwDeroThirEx6Ko932y
	 bIaEUg1wntt0UzsmLpnlUcP43om+Z1zu6ZXrkPe/+ukZUxHSW4ttC1Bs/X3FiktpzJ
	 d6VZg2RoBRL5Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org
Cc: stable@vger.kernel.org,
	Simo Sorce <simo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] KEYS: asymmetric: Add missing dependencies of FIPS_SIGNATURE_SELFTEST
Date: Mon, 22 Apr 2024 14:10:41 -0700
Message-ID: <20240422211041.322370-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Since the signature self-test uses RSA and SHA-256, it must only be
enabled when those algorithms are enabled.  Otherwise it fails and
panics the kernel on boot-up.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202404221528.51d75177-lkp@intel.com
Fixes: 3cde3174eb91 ("certs: Add FIPS selftests")
Cc: stable@vger.kernel.org
Cc: Simo Sorce <simo@redhat.com>
Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 59ec726b7c77..4abc58c55efa 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -83,7 +83,9 @@ config FIPS_SIGNATURE_SELFTEST
 	  for FIPS.
 	depends on KEYS
 	depends on ASYMMETRIC_KEY_TYPE
 	depends on PKCS7_MESSAGE_PARSER=X509_CERTIFICATE_PARSER
 	depends on X509_CERTIFICATE_PARSER
+	depends on CRYPTO_RSA
+	depends on CRYPTO_SHA256
 
 endif # ASYMMETRIC_KEY_TYPE

base-commit: ed30a4a51bb196781c8058073ea720133a65596f
-- 
2.44.0


