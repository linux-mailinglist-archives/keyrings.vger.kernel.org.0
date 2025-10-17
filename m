Return-Path: <keyrings+bounces-3244-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F9ABEB28C
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 20:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48343744439
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 18:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C3432F757;
	Fri, 17 Oct 2025 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl4OBVZl"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1932E13C
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724706; cv=none; b=eCxbm9/NWRcn58OxEwvDGtkwLIlcnwjcWSbI/jrqOFC+XQ0edSQ/Rp2phWErGaLOFRAPfvg3w6Q11m+2mp2vup4GONo/+eJtohheH/lRQLS9aJPOnYyeUM3i/AkS8BeITVoB+1MzfEvQxNceAT7a7+Suz9h9h1OB3/yvmSCq5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724706; c=relaxed/simple;
	bh=r3dihmDf7EmTwHyOQk7Zkgw4snf1eF5k1wp6/pUMG+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoAaB7/jQs6z/YTETlkWG+CuRAVlqGh+woZHkrSa3i6id+GZXCXKOwQ8toieBvUPq741uaRzCmjuIPnF8lxtLMSkDJTMVAlrYK17wo/TUORRH0vdc3EUtXuRazxpfFR6R0AgnLo2rqlAngPTyotgGrFJuROnqeQGdHkgcxwQz+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl4OBVZl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7833765433cso3024878b3a.0
        for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760724704; x=1761329504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=dl4OBVZlGLH3QZINSVf9RfP3FLWtOp1hDEcpU56LB/ck2q7dy7iBk85r9prlZs01mb
         la8iwuKAsdssVw6rtHthQhzwF7EJCDa1Q9XEH8jnWt8DM3bRIz8QztQZuuFM5sRWW0yZ
         iTUnjGWqvle8X7tUtXd7uZEGIKnIC2u8uV5KvdOcI6HasgF4rYo3E1Hp244fHcpxGeBV
         k03ssilvPliiIgA6beHebkKRwRUDuFOcmVMfyoBNPj7Wmm6V0E7NIvs9BJolOQjj8cKC
         2/QbVuopRzIeIH+xsiAmoSl0sOShQZZfn8vo0hsuC/oG7WDjE6No/pmRsYQ0Ddyppt1J
         5ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724704; x=1761329504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFIEDJTAopNEIqPSdh3Jplcei1xeOHRhpzrjHf2iOMc=;
        b=jQy319ynqORNIQwq61dI4p4HhUz1yzMh9wlDLAmE5YHahWralPxJGpxgzCuEVz+i8j
         IhO+8YQJyg6usslNUuKqheUN4Ar0zXSTDeIquThzZAp+FTxxwUqOezvYleogE3V5P6dI
         ksuBvQTHj/kDSI5Zi4Ao6hHJtrZNK9VSNeyqGO10yvh+/rFzC367207yoZpXWcpU53pr
         wapeyT70GbnN9OAuF9MSvBWBh+oKEs9JdBoKGeaIIGz3jVSWQMu6SbG5RWZO0CQkbBiH
         zhh2Enr7zDfjmJbiyPhA+yHTYJVPV1O0PsF55jyxUSzrMfiUHTk4hOZc68NDLCkPkgqU
         PYfA==
X-Forwarded-Encrypted: i=1; AJvYcCXOUNgr49NVWHwP/GfgZtqD5z6+0ZH/vKEPVLpVJKHLbYZu9xz/JjbaTB+0KIgUvtH9kEi1iQxTuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TkSvNTs9JR7eK+k+p3WtX1att5uEcumol0DB64Iwt7OqtKUD
	hzE11qIQtBRFDGvIwKDk0vMglqy+BYq8WJQKcelwt9a2ivl6GCZP1SGu
X-Gm-Gg: ASbGnctv11w/zOLarqwUanCIK+zzObrtRdJH2zGD7oKcBmnbcLyGT+TJvAc+xUVgOvY
	ZAU9aCPo4swvNzsbwk+jYRqUNYE5ojcuQ1xFjGO85NYKbQcg0SHoBhrjPMKSkeLhScUsI8wa9B3
	wTua9vCbKPQcuamfNabm2UIVSNXkkCX3jCco6Ssd9y7q1bPL5Ewi7M7HPdSG1IrWLr9h8NmPY35
	9SvRpSLThWdq9LGn7SgMTXJ73HPtA8HJKQH5FrWd9WAaILse6S/Cxy5Z91BwaKbcSfCK0dltNaB
	T6PjSxKQ2WBiy4ti0Tl7z8E0NzeEd3RHxtPC6mOHRy8hUMpBLPKtokIXgJjpBbwXoYeY+288FOq
	J0Ff03t7eguZIVGlB5JDmD7qW1eW+iPIPNsxpap8S1lY4hFlajbEkG0+/LyBZGI4kUVphEQPnjB
	6SrKJKJcSNRvDE/TZhb6s=
X-Google-Smtp-Source: AGHT+IE1h8o5AFVacUuJYOfSDEzDV+0FD/VCXQsxR8OMX32EA6L/ZDfNJDJ4BWWf59gxnTA0758alA==
X-Received: by 2002:a05:6a00:182a:b0:781:556:f41 with SMTP id d2e1a72fcca58-7a220b07183mr5214886b3a.19.1760724704302;
        Fri, 17 Oct 2025 11:11:44 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24desm200093b3a.48.2025.10.17.11.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:11:43 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: zohar@linux.ibm.com,
	James.Bottomley@HansenPartnership.com,
	jarkko@kernel.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH] docs: trusted-encrypted: fix htmldocs build error
Date: Fri, 17 Oct 2025 23:41:15 +0530
Message-ID: <20251017181135.354411-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error and
warning in trusted-encrypted.rst:

Documentation/security/keys/trusted-encrypted.rst:18: ERROR: Unexpected indentation.
Documentation/security/keys/trusted-encrypted.rst:19: WARNING: Block quote ends without a blank line; unexpected unindent.

Add a blank line before bullet list and fix the indentation of text to
fix the build error and resolve the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

Tested by running "make htmldocs" before and after the change,
ensuring that output renders correctly in browsers.

 Documentation/security/keys/trusted-encrypted.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index 2bcaaa7d119b..eae6a36b1c9a 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -14,10 +14,11 @@ Trusted Keys as Protected key
 =============================
 It is the secure way of keeping the keys in the kernel key-ring as Trusted-Key,
 such that:
+
 - Key-blob, an encrypted key-data, created to be stored, loaded and seen by
-            userspace.
+  userspace.
 - Key-data, the plain-key text in the system memory, to be used by
-            kernel space only.
+  kernel space only.
 
 Though key-data is not accessible to the user-space in plain-text, but it is in
 plain-text in system memory, when used in kernel space. Even though kernel-space
-- 
2.43.0


