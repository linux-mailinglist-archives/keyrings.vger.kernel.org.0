Return-Path: <keyrings+bounces-347-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F681F239
	for <lists+keyrings@lfdr.de>; Wed, 27 Dec 2023 22:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CF4281EE9
	for <lists+keyrings@lfdr.de>; Wed, 27 Dec 2023 21:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B1247F59;
	Wed, 27 Dec 2023 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwWULeo8"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060347F55
	for <keyrings@vger.kernel.org>; Wed, 27 Dec 2023 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7810827e54eso530998585a.2
        for <keyrings@vger.kernel.org>; Wed, 27 Dec 2023 13:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703712982; x=1704317782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F59TL2r9+gmkl9Lt1/UOOhoybbFjeFixeFZdCwpZoIg=;
        b=TwWULeo8z8AB/dpYn1FtCj6mPEUfllCEKtVm7lHnjhyf4LK24D2WA619BzmhhaD6Hq
         /huPBp+x8oRaSrLZ1RkXsZjF//gVSNRkN9Jnq/DnkPyLx3Ch8uS4/ZuDuxRrg3a0cfPL
         SXRrGwSaEF9HE8/plNf5d0UY0fB7Ga4wqjrOEbS+sX2o521RSsphBMkPrkrOWvhvAPmv
         dKIaLIafKB64dhyC0DLhFe6jhpLmQHdEsnJ1y4t2l44GXnFDNImOVa4hRd7e9vK0aNHd
         tWj1koQZtofW31xM6wwA80mwjZ4X2CbWHPHE1EKa5D/H0eyjARCpiwvSDw/EoaEHSv+v
         xSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703712982; x=1704317782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F59TL2r9+gmkl9Lt1/UOOhoybbFjeFixeFZdCwpZoIg=;
        b=w4itfnTye5EimWUEJ2oyUR9aWGs82BrVlV6n9CbE/ZcAqaZOGwFvwL3Jdlyz/4E7oH
         ouJPsoFPyRY27KnDl7tlDHEmsc8RFaIRhN2VTcwNoNzn8kpBILG0gYjqWLtg3aNCvtl+
         WnmvXC4FRK/Q3P5hng/sROg8mC20K6z7jaACUTSuq70Vaufp3/vWFfWq2j4Zf/ZwSLD6
         gLfW4BNKFNhYzUlT3YzowUq2Pwcm2tBBx9uHd4H93pd/aT8bf72TIdt6wjOgUnt4Gd1q
         fDKqmtBgX0o3VuYEJIG/NXetab02VXE/zwB4H9bzwXk744VLlph+Sub8mM8xX50TmSHX
         bwAQ==
X-Gm-Message-State: AOJu0Yy7SVt3zBEc3bB/ZK53bntOrFdqI8Gbhv5yw2R2EdjMKa26YdNS
	Gl2T1+D3Bj5tYKjQQYV1rAuAfcuXS30=
X-Google-Smtp-Source: AGHT+IEf1oZfM1kJJ/dlSR1e+ZU0WPb0dfU35xWdr9bDF0mOd1GeNNO+lzKSA3jIeO3BNVKGFMzXHg==
X-Received: by 2002:a05:620a:2611:b0:781:3bcf:ce1a with SMTP id z17-20020a05620a261100b007813bcfce1amr11180278qko.134.1703712982525;
        Wed, 27 Dec 2023 13:36:22 -0800 (PST)
Received: from localhost.localdomain ([2602:47:d950:3e00:31d5:414f:e827:d642])
        by smtp.googlemail.com with ESMTPSA id br41-20020a05620a462900b007815ce9fe78sm985215qkb.92.2023.12.27.13.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 13:36:22 -0800 (PST)
From: Nicholas Vinson <nvinson234@gmail.com>
To: keyrings@vger.kernel.org,
	dhowells@redhat.com
Cc: Nicholas Vinson <nvinson234@gmail.com>
Subject: [keyutils] Remove undefined functions afrom version.lds
Date: Wed, 27 Dec 2023 16:35:16 -0500
Message-ID: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
nodefined. Their inclusion in version.lds causes clang/llvm LTO
optimizations to fail with error messages similar to

    error: version script assignment of KEYUTILS_1.7 to symbol
    keyctl_restrict failed: symbol not defined

This patch fixes the issue by removing the symbol names from
version.lds.

Fixes Gentoo bug 914637 (https://bugs.gentoo.org/914637)

Signed-off-by: Nicholas Vinson <nvinson234@gmail.com>
---
 version.lds | 2 --
 1 file changed, 2 deletions(-)

diff --git a/version.lds b/version.lds
index 6c34adf..6186fb6 100644
--- a/version.lds
+++ b/version.lds
@@ -76,9 +76,7 @@ KEYUTILS_1.6 {
 
 KEYUTILS_1.7 {
 	/* management functions */
-	keyctl_restrict;
 	keyctl_dh_compute_kdf;
-	keyctl_dh_compute_kdf_alloc;
 
 } KEYUTILS_1.6;
 
-- 
2.43.0


