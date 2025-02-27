Return-Path: <keyrings+bounces-2413-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F8A47C4A
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 12:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AE24166EBF
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2025 11:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26831DB122;
	Thu, 27 Feb 2025 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5aJlq2F"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185282253A8
	for <keyrings@vger.kernel.org>; Thu, 27 Feb 2025 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655998; cv=none; b=fbMnKGeJL+nvIDJ7M/ETKvprf/sotmgZRz7nE55/z+vOq5DeRw3ESjwF96yMcweZAK6zuBa25Thdp1hmqO5c1eVEVL4kI1HNk43CJCy6FlYXwxPTsl7nvFtfIgG4plf61VE2Wb2hW8wK8/3s9b4AHVTJyWPTf9CqPNXiVAARaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655998; c=relaxed/simple;
	bh=LO2N9vciU7HB99mtlW3h5ysZsPTzOm1mscKvDNw90XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GwnwyaNiRzi+i8K9gP+YX1xSFXTk4gHphWkV0xKR06oj96J4zDn5HkpJCY3O+VSqAmcgXx0mByx/Jgi8FW1+a1+ZMW+JjLRnDFCNBH3nUMUU/lPTHMI1U/8lX4RaNCPtz5+fYbLHqCsT9MJzorKpkTYl5bqjpUZ4UPj3G8Pf6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5aJlq2F; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2232b12cd36so10349745ad.0
        for <keyrings@vger.kernel.org>; Thu, 27 Feb 2025 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740655995; x=1741260795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cg8yMwZ72Jlc0r5z1N3IiuaraHv4s6b2xThN5W01Djk=;
        b=D5aJlq2F6R3GUVFt9YVYvhZSbEIyrGG1WMu63jw39i9UyiEW8h3xQDgfWN5Pycnn8P
         beqrTO3UYTF8846iPQOltFhA1dkAD6wN6puK4jcojLYSt2ztSzGi9i2tx3dMkFy8F7Y8
         3P9XUvlZfrALUIckJ3n71tffqsz1+ZFWZbAMasuiVZQ3Gy7K1ceewuk3Z8DOIU6Nricn
         HKI1frdmWR289oCt0FpSOlm4NMj0HnV1FFhyvdPGR1hYfOyyT45CDAmLcC4VQhbRhJIZ
         jJGWvxdM7sF3f+YSy4oeDBoDeCdtPGkLeFXR2pwUJ8mafwT3f8hiUkKPJhpxeUYviKDT
         NCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740655995; x=1741260795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cg8yMwZ72Jlc0r5z1N3IiuaraHv4s6b2xThN5W01Djk=;
        b=VBYf+Lz25JJIyr+ph1Bzye3bnbnlPobzn/Ycej0lo1xO1SvEvUJzkNfumTsJIFraMW
         QQQC0vABlEMlIS9MkiPakMHioKUo7XmhpGD3g1w8MekkDatliAt+n7Q4oeDTjR7XFUjr
         64tNBYEOul3666VQrI3Ot/LyFYtQ5fFBU7qpkPcoETgdwLHVMrSYPokBxT8+PveeLLxf
         4z16HH+QkR8UyT4t96VA+tpeUxKDBjTJJqx9po6xtsl2vkWUEX9cmEq245YIDObGbDDa
         OA+llbARW/AJEgjlk5w/XD6ix2cqgd1vu3dHGh1ubuPZn3JKXyFSP46d8SpI6jbabMoz
         ULcA==
X-Forwarded-Encrypted: i=1; AJvYcCXe/A7bU258BsCAq5UJ5x76Uoj+TZHM8rIO1VTGtnWyFR97lGzk0gMt3edAfC2yVk4rWXbrSllb/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgepRbcrmeiJUH6W++KZuoIhfxaPtCDAnMk3lCqwuvBaiQClU
	4zfYoFZEUQ3/hvRrlf5DzKkC3L/EGFYVSRjLdg6yStVCWNFYv2Ths7Luc5RRF3E=
X-Gm-Gg: ASbGncustQ9dZASkUonlnJX5ENln0DsCBimJVBh/ueMPdcvsqlgMkm0SEzqP3835hCk
	trZ28p+ucjXkTfczSyXYfOVmbPZNnjw37BJRyN2vuYKxA+m9br9d9gOgEmewX7fsjwIgmEbH6kk
	+zy2v/d1ZrESe2TJj7yv+Wbl2w4LpLYcdnmMai/LFAYLwJGcM5BWSciyLxExWs+JteJXZUA5vNo
	MfIDbNLNqcJja81NwHiZkikdpItFype0aMa9ZK+ugA3HzP+fdLU0b8uBqYE3gwHr6hwifYs3+bs
	N8CVtuHXJooZsQDDmb7exhBsnc5E
X-Google-Smtp-Source: AGHT+IG4VU2x6YDtNodsc0R4UfSHlwxikIm91sBEmZvthobIJS1xQjZsA9eqGdyUlDUdvBKd735Xuw==
X-Received: by 2002:a05:6a00:4614:b0:732:13fd:3f1f with SMTP id d2e1a72fcca58-7348be7eeb2mr12060717b3a.24.1740655995332;
        Thu, 27 Feb 2025 03:33:15 -0800 (PST)
Received: from sumit-X1.. ([223.178.212.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe48858sm1343733b3a.51.2025.02.27.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:33:14 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: akpm@linux-foundation.org,
	herbert@gondor.apana.org.au,
	jarkko@kernel.org,
	jens.wiklander@linaro.org
Cc: sumit.garg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-crypto@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] MAINTAINERS: .mailmap: Update Sumit Garg's email address
Date: Thu, 27 Feb 2025 17:02:28 +0530
Message-ID: <20250227113228.1809449-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Sumit Garg's email address to @kernel.org.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index a897c16d3bae..4a93909286d8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -689,6 +689,7 @@ Subbaraman Narayanamurthy <quic_subbaram@quicinc.com> <subbaram@codeaurora.org>
 Subhash Jadavani <subhashj@codeaurora.org>
 Sudarshan Rajagopalan <quic_sudaraja@quicinc.com> <sudaraja@codeaurora.org>
 Sudeep Holla <sudeep.holla@arm.com> Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
+Sumit Garg <sumit.garg@kernel.org> <sumit.garg@linaro.org>
 Sumit Semwal <sumit.semwal@ti.com>
 Surabhi Vishnoi <quic_svishnoi@quicinc.com> <svishnoi@codeaurora.org>
 Sven Eckelmann <sven@narfation.org> <seckelmann@datto.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1b0cc181db74..616f859c5f92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12861,7 +12861,7 @@ F:	include/keys/trusted_dcp.h
 F:	security/keys/trusted-keys/trusted_dcp.c
 
 KEYS-TRUSTED-TEE
-M:	Sumit Garg <sumit.garg@linaro.org>
+M:	Sumit Garg <sumit.garg@kernel.org>
 L:	linux-integrity@vger.kernel.org
 L:	keyrings@vger.kernel.org
 S:	Supported
@@ -17661,7 +17661,7 @@ F:	Documentation/ABI/testing/sysfs-bus-optee-devices
 F:	drivers/tee/optee/
 
 OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Sumit Garg <sumit.garg@linaro.org>
+M:	Sumit Garg <sumit.garg@kernel.org>
 L:	op-tee@lists.trustedfirmware.org
 S:	Maintained
 F:	drivers/char/hw_random/optee-rng.c
@@ -23272,7 +23272,7 @@ F:	include/media/i2c/tw9910.h
 
 TEE SUBSYSTEM
 M:	Jens Wiklander <jens.wiklander@linaro.org>
-R:	Sumit Garg <sumit.garg@linaro.org>
+R:	Sumit Garg <sumit.garg@kernel.org>
 L:	op-tee@lists.trustedfirmware.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-tee
-- 
2.43.0


