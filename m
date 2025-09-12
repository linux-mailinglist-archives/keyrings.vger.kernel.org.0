Return-Path: <keyrings+bounces-2993-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A1B54894
	for <lists+keyrings@lfdr.de>; Fri, 12 Sep 2025 12:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D441899283
	for <lists+keyrings@lfdr.de>; Fri, 12 Sep 2025 10:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0171292B44;
	Fri, 12 Sep 2025 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/i/tQva"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A72848AE
	for <keyrings@vger.kernel.org>; Fri, 12 Sep 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671229; cv=none; b=DacS0Hkk2FpVZTQjHf3d2xUf8YBeQL4oZUIrun3p19Poz/0bfo06EyuIEKRKdqIRtmX3RwfFH7tzcwYiJQb3HVXqOXy3JY9aqO89fJSyE9xvDjUHlucITc/q2VdDkk76krhhrjMDD2sQv1fiudss4quGcWfwWmb/8XMVoE5cEVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671229; c=relaxed/simple;
	bh=S/x/ppCYsVKnPqW5lJ3vPbClxwzvq+hWg15z5y1V1lI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G+MW225OG1+g2CF8q+r7URwn2Fd7mkJRnRP4scIDRGJ7uKnpC0uHS2JfbiJxSEOwFME1ssbiBtn8feYsH9COsUUnsxTAH0DGwFPPTJZXdWRa2CZWTxwZWLEpSHsgX54IaLzRjkSpPA6B5mvdyg5YQz008ezcwbo6gRSq1YyOVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/i/tQva; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b9a856d58so16361485e9.0
        for <keyrings@vger.kernel.org>; Fri, 12 Sep 2025 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757671226; x=1758276026; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwTohfVuh5PCFcdhMILG+0i9bjyVI3+AI7hJz72zYt4=;
        b=J/i/tQvamjKLeyiOch0xq77ssiKWCSZaHXE/d/FaghHnry3LQG0zrY/F/HpymfcDzu
         dMowwCPESycQ/9LIYZiWmznAO9Ah5+o0R9MTG3jEH5ck07lXdCRvNA1AAlCYfYVGZi2v
         CJN+VkqJeWHzJysjcs8ckTCHIIxUAZ/0gaAolWYqkiP38Ud0ahpHaPmmmE5avTjBl9Tr
         g+oLFxC2s14XUksw027IVso4spXvu7M1bKeDSiYDElXPBnpd1woD+2FzcQfMuTS8olcH
         pXDNmKHFY6/tyZIYngpYI9nOOGsqRDMJzuy62su5ZL3Cn/pAW+qqSCQ3rXpu8sCV07hl
         E9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671226; x=1758276026;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwTohfVuh5PCFcdhMILG+0i9bjyVI3+AI7hJz72zYt4=;
        b=PC/VlsUje22a/IB3mLWruOGY9ICtz2RCPzwu+Bn0F4ilKSe09+K7SI9d2hDxPi/J/N
         NJqFwB1pIg4Xq5oDGnTI2U6HFqG17hiB5hvyT6PV2EiqUVsi7vImLEz/iNaobFGPPEMD
         GB5fubdsDlNRJHgDsQ3zL6aTmwqQEv7/cBK5m5QB6ATTQmefzt7hAm8OPueSXGOeogPI
         1SJkXHwRxrEB9ClwEP87LQpF66Gd5tQMoGiWflYEImZwU1J6DAtl/ClAS6LK+/omFREo
         9g/4MSh7z/TPDook8PcHuk9+c68PCT+pZYNg9idNPOL5vab/cEbLxnHoVtSk3+EEmuDU
         uxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcreO6BBy7b5OMZR7oGJtPmqrz+4U0rldE8RJbyM3ET2VRElyit1w4jQwuV4WuMctM0sZX50ESUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5W8PESfrxJyFK5GPynm19qJHHCzOzI3/rFTjhW+rZRJY8dwYZ
	KPwoxDXvFAGjL+gepig8UhBfnWiC95VjluSyhPNzdGliKmjvNMnUY9BHBbBM7jueBZQTui8hJg+
	MFCYkcvNH+RvvJQ==
X-Google-Smtp-Source: AGHT+IH1ZphgVBskCHC7cnBOzxeNR0ANeresyUwpGGhDl92WBxqq9bOPNP8hkuW2FGkocQtamiJF3VTVIKItpw==
X-Received: from wmth22.prod.google.com ([2002:a05:600c:8b76:b0:45c:b62f:ca0d])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c8c3:0:b0:45b:b05a:aeeb with SMTP id 5b1f17b1804b1-45f211ffa3bmr17986815e9.28.1757671226243;
 Fri, 12 Sep 2025 03:00:26 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:00:15 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250912100015.1267643-1-gprocida@google.com>
Subject: [PATCH] system certificates: specify byte alignment
From: Giuliano Procida <gprocida@google.com>
To: dhowells@redhat.com, dwmw2@infradead.org
Cc: gregkh@linuxfoundation.org, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

The .align macro is architecture dependent. On arm64 it behaves as
.p2align. The various alignments in this file are all bytes.

So use the .balign macro to avoid unnecessary padding due to
over-alignment.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 certs/system_certificates.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
2.51.0.384.g4c02a37b29-goog


