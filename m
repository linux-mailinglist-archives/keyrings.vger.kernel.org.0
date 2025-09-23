Return-Path: <keyrings+bounces-3071-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27711B94F1A
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 10:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1413AB663
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 08:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2873191C4;
	Tue, 23 Sep 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f9dOI/jO"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8303191A6
	for <keyrings@vger.kernel.org>; Tue, 23 Sep 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615248; cv=none; b=pX8/z0ACzbLQ3CU1RGjVAnKzN1n7JodhITZuZNJ94QFCh699Lr3HYgL4E4vKnvLsY7XAiZbvmxZmaQq7LTdVUrJGYIUUkPlfno9D63F3eejB5zVwYKxj/5uiPeujNR4Z6N9n3j/6yuWcCfA823W5Q8JVfGL2dFu7EniE/Q2vnOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615248; c=relaxed/simple;
	bh=QDvnj6fh+ODknLGOSNnz4hKVoYTOdLHSrUupxVTo67Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ADYwi7iUzr7AC9I+YWre6JgXydYvk7Ctu/eT/ib5Y/iF570xRIuM7HQpLOBwOVAnhA/iIMYewjHHCuEVX/kq8nj6vue5rL1vkrfCsjTGJafqLTvR+JSvQoXZzmdWTE6UdNZ2w3MWF46zbzTNNA0PveuQ28vvXSVr+j5ui708Wrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f9dOI/jO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b986a7b8aso30962175e9.0
        for <keyrings@vger.kernel.org>; Tue, 23 Sep 2025 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758615245; x=1759220045; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZEs14HFxkMeOy3Dt9XfbOyW5vve1fjK1o1XLyd0jzg=;
        b=f9dOI/jOr12vSFIfwMTtSu5YZNiIRMm0X/jQQjSrXsI9zFCqKJp8eiZ0YIL3qzmTtq
         /EMw71fBiVyiiT/bD0Eg5pt07mvJRkrvrIK7c3Yk3nAe9BtgWCNYHsQ+PpJkSep0j/W2
         p046HTUCjS0TyJr/ZzDeuQnP26UOihkXEIOoa/tRY7Y8el5Ze7gEX0OrANzCoff2axhm
         SP3lxBmQ1woSd1gu8CfK9gD1rly0zIdkZnWNs4KQVNRPwMpbbAftDTn5fzxl5W/jxIKT
         Fqa4/wk5B7X2w/7YFrnKcO/WtHmvMtP5HUcJyGpryrrquPUUjxe6B7CBCfgn+/qEoBdS
         +v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615245; x=1759220045;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZEs14HFxkMeOy3Dt9XfbOyW5vve1fjK1o1XLyd0jzg=;
        b=bP0QQ694BpKbIr+LSi/FoUNvQoVt86dcvXQT5PY0aZEeMu3kVIeN7yzjDJAksLM65t
         LkwJwhwz8eEOYrjZodWNAl7hDvKwJ9qXBY/VC8t9W4ipo24nl7PjMwpMOOlBxjuJOF5i
         lEuVDpxsBvmuPHB19vcgX21usV86l5sixTJcDpEL/gQB9Ia9Yyn0FKvnoWSo24rBosiv
         a/fyvTaeolliNkqjGAWWEv56xiApVLzJkK+ECXkGEHQmC3K8hzmG+VVPTZvQRwfLoXYw
         69cQlX7EqmqCWjq/5ciTPAbdCIFaBAS0Awlvn4NYTXnOecW8HttTa0x+6yRWi4ApCAD+
         ayHA==
X-Forwarded-Encrypted: i=1; AJvYcCUWSc1AEEi+VBc/84uR1VuzS9fYLquUedGWPIj6N1stJuaTrIhgG93flGk6Ay8InKVI2zBiyHSqXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qjv0hx7rh7uXgZ2pRMAueK7vrCcfgZjALsLiMPR7v97vIUKI
	VRuAoj7nmET3HXSOqDaGwA0LDyS1bkx93a2//i239Clruv3h4uhUjX1Hztp3jr4KxESLOJ7v4YC
	FOW3O2aIUXFLq/A==
X-Google-Smtp-Source: AGHT+IETXAufy5rC37WgUvjNJhJuvlT1ZCiSimNBELDAoA4V3HzxARk1cjs4fD+l+3YUgJdmCLNu1c6fXuVhZg==
X-Received: from wmbdr20.prod.google.com ([2002:a05:600c:6094:b0:45c:b62f:ca0d])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2511:b0:3ee:ff1:d627 with SMTP id ffacd0b85a97d-405c6efa3f4mr1424841f8f.28.1758615244929;
 Tue, 23 Sep 2025 01:14:04 -0700 (PDT)
Date: Tue, 23 Sep 2025 09:13:42 +0100
In-Reply-To: <20250912100015.1267643-1-gprocida@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250912100015.1267643-1-gprocida@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250923081344.1657783-1-gprocida@google.com>
Subject: [PATCH v2] certs: specify byte alignment
From: Giuliano Procida <gprocida@google.com>
To: dhowells@redhat.com, dwmw2@infradead.org
Cc: Giuliano Procida <gprocida@google.com>, gregkh@linuxfoundation.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

The alignments specified in system_certificates.S and
revocation_certificates.S are intended to be byte quantities.

However, the .align macro is architecture dependent and on arm64 it
behaves as .p2align. So use the .balign macro to avoid unnecessary
padding due to over-alignment.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 certs/revocation_certificates.S | 4 ++--
 certs/system_certificates.S     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/certs/revocation_certificates.S b/certs/revocation_certificates.S
index f21aae8a8f0e..a53b49d49931 100644
--- a/certs/revocation_certificates.S
+++ b/certs/revocation_certificates.S
@@ -4,14 +4,14 @@
 
 	__INITRODATA
 
-	.align 8
+	.balign 8
 	.globl revocation_certificate_list
 revocation_certificate_list:
 __revocation_list_start:
 	.incbin "certs/x509_revocation_list"
 __revocation_list_end:
 
-	.align 8
+	.balign 8
 	.globl revocation_certificate_list_size
 revocation_certificate_list_size:
 #ifdef CONFIG_64BIT
diff --git a/certs/system_certificates.S b/certs/system_certificates.S
index 003e25d4a17e..ea6984b427c9 100644
--- a/certs/system_certificates.S
+++ b/certs/system_certificates.S
@@ -4,7 +4,7 @@
 
 	__INITRODATA
 
-	.align 8
+	.balign 8
 	.globl system_certificate_list
 system_certificate_list:
 __cert_list_start:
@@ -20,14 +20,14 @@ __cert_list_end:
 system_extra_cert:
 	.fill CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE, 1, 0
 
-	.align 4
+	.balign 4
 	.globl system_extra_cert_used
 system_extra_cert_used:
 	.int 0
 
 #endif /* CONFIG_SYSTEM_EXTRA_CERTIFICATE */
 
-	.align 8
+	.balign 8
 	.globl system_certificate_list_size
 system_certificate_list_size:
 #ifdef CONFIG_64BIT
@@ -36,7 +36,7 @@ system_certificate_list_size:
 	.long __cert_list_end - __cert_list_start
 #endif
 
-	.align 8
+	.balign 8
 	.globl module_cert_size
 module_cert_size:
 #ifdef CONFIG_64BIT
-- 
2.51.0.534.gc79095c0ca-goog


