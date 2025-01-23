Return-Path: <keyrings+bounces-2370-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C928BA1AAAF
	for <lists+keyrings@lfdr.de>; Thu, 23 Jan 2025 20:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AB318805FB
	for <lists+keyrings@lfdr.de>; Thu, 23 Jan 2025 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C4192B76;
	Thu, 23 Jan 2025 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="qc7ouZ1M"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66FE8C07;
	Thu, 23 Jan 2025 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661819; cv=none; b=VSxUKXymWU/GP3CW+g5UP6CSRrbVz3LlGSa5y/M6RRBEhOfR0qWAUIMbv9aKV/N+7E+h0xfhjHKWs6Qsrn9C0dOcul1xieqLtch6L/ScFE6wV83ETnf5vsSrTEXEeJmLeCqIZoBbPS7WYsRcVf+z4jxjEuKM4dTgaWbHxC0WToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661819; c=relaxed/simple;
	bh=ers5d3hrIIu2OYOmGLo8rUQlnJ5Fe/BNUYCkOmAW7CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XFlPlLN8Lp9xW8jh4LybnU+4GqGVQuCoyfaLfIqDpnIiSi0KvPUZnhVK2KZMYWkWYIx/wGZJd/0lBZZFvlY0iHiLmxEIKm6ixG7obJHBp6wA/wERm+IUIE2H+QFDBiO5LVVMI2gkZZ3old8Tx7H7MU8ODuRNoZFWD2HH5Z0cn6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=qc7ouZ1M; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso1975158a91.1;
        Thu, 23 Jan 2025 11:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737661817; x=1738266617;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wA3gnsLg3TCdMzh4yL31wyhBkqAEvprGU9EsW3rVBk=;
        b=pBdVhDCSPU0eQ+lYhv3NKowEmK42/8s7xvT+1vEgPqXgcAV8QlrJqy1GGTF9vWcsJi
         JoiLve7l345ybuMsstfGCB4mf+iu7kXQrA3wM/Sc+FHcU/fzhZpEsgohxPwSsJj3Q+v1
         6xK/RUHrOZwIIAn/9SOlSP4c+e6ToMOQusqqVHZvYVHhMfT+MhFc29R33oPfr8Z7nMAD
         RlsNcAMIhzKCjZmxcXfrREsy3qolM43Z1u3R3X/aOSqde3nus69yPAZNniGY9MIKrqzd
         W8LoUPHNiH1PvwEzFuyPs5aQJqUF9T+hLrhyQF/YKMxRxnnohZ0l32MOUCE/2RjLW86M
         Dqow==
X-Forwarded-Encrypted: i=1; AJvYcCUhOUKBEV31LItc5FQtakG4FQByuBhENHsifuBrLz5WV67y6ygIF6SaiYVLKE5v+2ZLj9mHZJ9x23iXxYLSnEwuLQGlOmfi@vger.kernel.org, AJvYcCWam9ZE68HEwrZzkgJAe3XIHNVKdOSFW9dPEwl/0DzeisYuMx9FT38C3zoxk6JKkYJoIQSVW7k1me00b8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcxMmaqDXF1ATRL2qEepl/ZbIMSb3U1kNACiObBX6wTbKu0Jy
	9FGjQJYR918bnzOFi0pZwVTslRRKkMCYn2npCj26Y/yiLxztHU6DhSrm6fnvAng=
X-Gm-Gg: ASbGncs3X+djicvbaP2BJuufmszb0usPmy/F2z7urp6wQVPadMdSgiLET4FSahJ2hql
	xK3hUR28rRDOkpPbWEMxpyM+Nr9z3U+WH1L+vfHPAoxCJnq4PnddTKXy3TLq36/FsE5rmcEWXvw
	lGDNJ6RdT5VP6RHI+eLlb9kk0mrzvHE2TS2hviiOfohBnJvXRGW6Qquj7gyYitvqd7+hishaMJC
	VdYeXh8THIOVbOeM1cvr3v1kUDnz1i9ZV9r+jaHxtMSnqEpKdXTeE6YjMPoryv6RSgH/xRBQ3Ct
	rLbfIz4DDR5wveLqMkXqJw==
X-Google-Smtp-Source: AGHT+IEx3fxH+fsuONSZZ2tzSU2LlotC0s9f5eO7pJ8Qg3HhWZzK+zix7fB1PP7B0zPdNZzaYIyF3w==
X-Received: by 2002:a17:90a:c2c5:b0:2ee:8008:b583 with SMTP id 98e67ed59e1d1-2f782c9c88fmr42930519a91.16.1737661816962;
        Thu, 23 Jan 2025 11:50:16 -0800 (PST)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa56155sm97391a91.19.2025.01.23.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:50:16 -0800 (PST)
From: Ricardo B. Marliere <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1737661814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1wA3gnsLg3TCdMzh4yL31wyhBkqAEvprGU9EsW3rVBk=;
	b=qc7ouZ1MzjIXOPd0+Fg66Evf/M905lsps/+gEsHiD/CGNJ7WeVRKBwbeQnxfV4A0dBs53w
	ZdXSz2ZzHZiLulZ7RBEfHfm8f3H4GJ20ywu9/zdCI01qFBDMYRfHBt6z4rVN2uAE/F/GTD
	rlTNKVggPh3ve7PKfZ9RR/nDzYFkY5rRhPFNpfe78bY8XNKXTFxW94CnkUa6Tkdnk86PiM
	DcwC1yfy61SyKT7tiKYS/mMOTmYdtfceu14nVSXshZnNyncz+zom3JsBk3rx+T+jdr0kyO
	O9UbDPgENRmwB9IKOnSay4rBwpBNEgjhg1mZVOS5dMrECfeQqIOU38YGqF/sYQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Thu, 23 Jan 2025 16:50:11 -0300
Subject: [PATCH] security: keys: Make sysctl table const
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250123-sysctl_const-pcmoore-v1-1-d9f918dbb0be@suse.com>
X-B4-Tracking: v=1; b=H4sIAHKdkmcC/y3MQQrCMBBA0auUWTvYJAqtVxGRJJ3aAU3KTJBK6
 d0bxeVb/L+CkjApXJoVhN6snFOFOTQQJ58ehDxUg23tuTXWoX40luc95qQF5/jKWQhHb06u60P
 nbA81nYVGXn7b6606eCUM4lOcvrN/dky0FNi2HdEXMJ2FAAAA
X-Change-ID: 20250123-sysctl_const-pcmoore-fa14389b8329
To: David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=rbm@suse.com;
 h=from:subject:message-id; bh=ers5d3hrIIu2OYOmGLo8rUQlnJ5Fe/BNUYCkOmAW7CA=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBnkp1zcdHGjKz10Q8tmQjWzNrLeBbygK3QlJJSR
 t2dFO6QrnaJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ5KdcwAKCRDJC4p8Y4ZY
 pnZBD/97wZTWMyt/pwhqvAVdXL0cbJiQ+hxYxRCU7z0aR4p8mLxSvR6XrX3zTIXBxmMkK6Ag76/
 g9oFwECRHMtgIT1gWgDlv6O1upGP38BY10OLb4Sy6bLQP/5HxdQKQkZIvqSZ8y2XEF5RircM1TA
 yKmAdHEVf5vhn6VtasWkXMOQltc7qF4HiE6t65ZRb1bBZ5LUUwpp3RVS4NPGpGStDxaO0U66vQu
 I4v7OVVZ2B8LCHSmAx3SpbBQuQx7N81w0k+/kXk+p88+c/lg0fZ8727pR+FVvRY5ZQMW0B8n5cu
 88/BmPDoyYnn7/zgl++a/gfEfrkxBnUiT/Gb5dACdK8R3qEegTLXBrwVeh7VRFNisyBlKLTIklo
 jXASJapUNFEFj4CJOdf2NsMJZv8c3OPR43wqodfIgt8/dCUol95pO+2OSvc5o0J95zj3O5s5Ayu
 kicSVT6cDbzL85Lh1vKAMlFEpBT6BIoLWQnIKc9Nx1I4fAS1IMWn8AMaI1wO/1BcOplFiJE8BXi
 Tg3/ZyNJEhTquxULA/gCizl29fj8Ng+oiQT3yyIY780JG+yrOwOYBhOMLhnNmOm9Xz0psUGPinT
 E+QbWgeyi3or9pe5Uur/w1cdMCktb4fjQU4yzSrp1vDkOUumebdQk1V4v2H7GotkDw+J3qRrugK
 KJeQCFlTUe3L61w==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
ctl_table"), the sysctl registration API allows for struct ctl_table to be
in read-only memory. Move key_sysctls to be declared at build time, instead
of having to be dynamically allocated at boot time.

Cc: Thomas Weißschuh <linux@weissschuh.net>
Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 security/keys/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/sysctl.c b/security/keys/sysctl.c
index 91f000eef3ad82370250e5238d9c9c80757aab61..cde08c478f3272081304e6db34e36b64ce0d321a 100644
--- a/security/keys/sysctl.c
+++ b/security/keys/sysctl.c
@@ -9,7 +9,7 @@
 #include <linux/sysctl.h>
 #include "internal.h"
 
-static struct ctl_table key_sysctls[] = {
+static const struct ctl_table key_sysctls[] = {
 	{
 		.procname = "maxkeys",
 		.data = &key_quota_maxkeys,

---
base-commit: 714d87c90a766e6917f7d69f618b864d350f09d3
change-id: 20250123-sysctl_const-pcmoore-fa14389b8329

Best regards,
-- 
Ricardo B. Marliere <rbm@suse.com>


