Return-Path: <keyrings+bounces-2356-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99975A0AAE0
	for <lists+keyrings@lfdr.de>; Sun, 12 Jan 2025 17:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE5C3A26C3
	for <lists+keyrings@lfdr.de>; Sun, 12 Jan 2025 16:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274281BDA95;
	Sun, 12 Jan 2025 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="j71QrzZB"
X-Original-To: keyrings@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB51E51D;
	Sun, 12 Jan 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699470; cv=none; b=PlFYvHkwzrYiUOKEkGPH77Tdw5nPFv5JJNCFQ1zwIP57Z1uPD1MyGDgQQuZwEBDlROdjBNu5OL0j1Lomk+VASHbcLIq+KNI8q116t6ZTHKMtMcuR2H4B3g2kHYSrI3vdOQDshhv6jmpCO246/Lg99Hcuva5vKmgf0wUXf2WR18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699470; c=relaxed/simple;
	bh=XXvAgfwcbB6cpPEytTAEUCvUaXhPZHGZldUGUkx6Uzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWMv7HxeGDoSxXNQ7xc5xWVXlsqcCh/63A/3ILGVFCQSJfQ0ox8nRG774gSKXhuFYBQNxCTGYKKIfoY9WxV6qrKNP3y+jTeAzY0pDYN1dQ+zcbLKfrDlLCxJUDyElJz8jaPX3DDb211mXjSB4LhBkGhoGHdVWdPmLn1bgWvgoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=j71QrzZB; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+ym7V8wJzpOarwGUezYnKU26PffD1D4E/rFHgGxsB0o=; b=j71QrzZByc/Mdk+K
	V0IxdBFEaH6hQ+jH/vMHxaCd+yIVNsa7udwPvVjgKIPokIcYzBPtrJajI+9DbuZ45DqNJwiSqlMRJ
	1708nZk4xteaQfLckeX5gpjwUXsYkiFi1IHzJN2pSK29+3d7lGCbYlRtBs9xHT3Da8W7M7j4xAAeo
	QA6c6AknLQAi1zcPcZrCP5bCMrXCtpX1nAuhyrU2YjYK04/QwQ31fCIP30dzhXFj4B9zLHHBhus9Y
	Ib/o4nqPcktOY5V6z45htN+VJMvLRaagYVYDF4n3dImH6iCWEZqfaaOjai0NuoS72+nlIEd0Az0BY
	zoTelZAXqzH/uTWdug==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tX0rb-009kUx-2r;
	Sun, 12 Jan 2025 16:30:59 +0000
From: linux@treblig.org
To: dhowells@redhat.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] crypto: asymmetric_keys - Remove unused key_being_used_for[]
Date: Sun, 12 Jan 2025 16:30:59 +0000
Message-ID: <20250112163059.467573-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

key_being_used_for[] is an unused array of textual names for
the elements of the enum key_being_used_for.  It was added in 2015 by
commit 99db44350672 ("PKCS#7: Appropriately restrict authenticated
attributes and content type")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 crypto/asymmetric_keys/asymmetric_type.c | 10 ----------
 include/linux/verification.h             |  2 --
 2 files changed, 12 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 43af5fa510c0..ba2d9d1ea235 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -18,16 +18,6 @@
 #include "asymmetric_keys.h"
 
 
-const char *const key_being_used_for[NR__KEY_BEING_USED_FOR] = {
-	[VERIFYING_MODULE_SIGNATURE]		= "mod sig",
-	[VERIFYING_FIRMWARE_SIGNATURE]		= "firmware sig",
-	[VERIFYING_KEXEC_PE_SIGNATURE]		= "kexec PE sig",
-	[VERIFYING_KEY_SIGNATURE]		= "key sig",
-	[VERIFYING_KEY_SELF_SIGNATURE]		= "key self sig",
-	[VERIFYING_UNSPECIFIED_SIGNATURE]	= "unspec sig",
-};
-EXPORT_SYMBOL_GPL(key_being_used_for);
-
 static LIST_HEAD(asymmetric_key_parsers);
 static DECLARE_RWSEM(asymmetric_key_parsers_sem);
 
diff --git a/include/linux/verification.h b/include/linux/verification.h
index cb2d47f28091..4f3022d081c3 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -38,8 +38,6 @@ enum key_being_used_for {
 	VERIFYING_UNSPECIFIED_SIGNATURE,
 	NR__KEY_BEING_USED_FOR
 };
-extern const char *const key_being_used_for[NR__KEY_BEING_USED_FOR];
-
 #ifdef CONFIG_SYSTEM_DATA_VERIFICATION
 
 struct key;
-- 
2.47.1


