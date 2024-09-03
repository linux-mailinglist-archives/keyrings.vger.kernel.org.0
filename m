Return-Path: <keyrings+bounces-1934-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B3969F60
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 15:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C071C23727
	for <lists+keyrings@lfdr.de>; Tue,  3 Sep 2024 13:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E6A1CA69A;
	Tue,  3 Sep 2024 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJI2EsjF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA71CA682;
	Tue,  3 Sep 2024 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371320; cv=none; b=abQKkYivDDmCuk/Bzdy32rFpbpHNgNMRCWUWjO+aiTLkGJjULTKifOT3O8LZuafnQmDQfM3enRWd4oHsKCwZh9rlehrsm8VqWaZrsJIJjiAm2j3BAqZOZb3taOo1F9C+TLZq5Xkqdsi0R/1OetgiN/X/4qyXoIxTEPCn1nA0zmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371320; c=relaxed/simple;
	bh=GfAJ31uVBCQfDcYwWC28kWiRyOOUCGErkUC149AKq8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPD2d0YpoIE8LeOzR+SC/hjP4b2rRuAp48TW8u/DY6xC6MRCL/BM32oRqKXR0L9cBovvaD/vUDo3TeFAQ8GzNCtNljbVJ+vDc42K3ecp146wHKiLO4eOmHzmxN6sHfeAT8OpmlQKt+HWhAw7dvPT0weGpQxeDTcdI6FgqpSmEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJI2EsjF; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d8f06c2459so1144663a91.0;
        Tue, 03 Sep 2024 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725371318; x=1725976118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CkO4LO0iIgeVPWEypCVZBj97mLMZOxv6D2spYKCPoc=;
        b=CJI2EsjF00XHhky1Nc0ng1TGJeb3UY3ZN8Pe7nAHinIc+Sh6DQQiY3w7vP6GjVFhmQ
         coWb6wVSiEwNBtKQjuKNPQ+PUbxOc4qQDC/d7tYjn9zP1i/0cPHV0+HiGM1HBlobwmTF
         lvsAdPqh+IYR7p/JjorwpkrFBOxrUPh+DCtdQL2jM3dFi/bfmvUINoVc0MOxV/Jxd8Mz
         D3bXP1Bd/5ICvFgIBscj7te/2Paky/rncZjIFwAvGANPHLWXYL4QEglpl3iAXtkQpziO
         uWJprGQOJD4yfbsZ3XJBXu/xYCibIDAZzzZZJ7ynEI7ZtB7P0Owp3Pnzv0sp3R7fQDMS
         Jhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725371318; x=1725976118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CkO4LO0iIgeVPWEypCVZBj97mLMZOxv6D2spYKCPoc=;
        b=FaNoV6MzJcx3fAWuochx+h0CRhQVj4XIDBbZB2aTj0205tkipgixaH7ygqR1SipGKI
         D7wOEe5KbOB37gDs79R7JDWGElfq1EBCucEyjOToydl3vqSY1j+rG4XcuW5jA2X0PcNa
         WEHt2/cJxPb3s9Bil4kIQEY17WumdbEGNAwdOYRBMrAwXh0C48opPLCvBJp9vHJjgE91
         RAqSvITcWYAeTZpVVz+9KxkUs7Sya2qsVAbDnIwbXOgTXQJQpyFSQCS0Tpj5yglMhItn
         Vc6cnplJx7EwW+LhpDVaBGZBrapRh618+YJ3nziLrijhbCHs2FagIYQkUQywRykdkK4N
         uJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO5R3Z4RBUvNJMsul5G6twDGXupb9nqQNIcIr78++eBYyQN23+3AsjQObPTOAhKlIzrjwONvKdGfBeAEk=@vger.kernel.org, AJvYcCUzRu4bgCcYBrxIq6NDSNmcXYF0sBlK+7voanXl2f+Qs5PtKXooAYYwHuWmAOGt1JVFcGmOO4ud6vFOA/X5@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWFPg6jSeiokHf97lAl1RlHYKGLtUYZUZxFHxhd4XwIMgBnPS
	46BDpkgYm6EteSdCv5vSfyUgtmoaLx5h/G/AP9T0uphRdWv6f/6y
X-Google-Smtp-Source: AGHT+IE0ozs3PMwhIotGD8U/MicGghL1ZPAo0jdAAA28tajLjyvmIAl4xRILEG65te3lGOTE67Knsw==
X-Received: by 2002:a17:90b:350d:b0:2d3:c9bb:9cd7 with SMTP id 98e67ed59e1d1-2da55a77e52mr3115600a91.36.1725371317968;
        Tue, 03 Sep 2024 06:48:37 -0700 (PDT)
Received: from fedora.. ([106.219.162.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8d0985062sm4863045a91.12.2024.09.03.06.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 06:48:37 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: dhowells@redhat.com
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] KEYS: asymmetric: Calculate size from pointer
Date: Tue,  3 Sep 2024 19:18:31 +0530
Message-ID: <20240903134831.15448-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate the size from pointer instead of
struct to adhere to linux kernel coding style.

Issue reported by checkpatch.

This commit has no functional changes.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 crypto/asymmetric_keys/asymmetric_type.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index a5da8ccd353e..59b5c6f3ebb4 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -151,7 +151,7 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
 {
 	struct asymmetric_key_id *kid;
 
-	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
+	kid = kmalloc(sizeof(*kid) + len_1 + len_2,
 		      GFP_KERNEL);
 	if (!kid)
 		return ERR_PTR(-ENOMEM);
-- 
2.46.0


