Return-Path: <keyrings+bounces-3268-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4956C02CD0
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 19:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E3B93AB453
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 17:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5363934AAE5;
	Thu, 23 Oct 2025 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J6jXXkXM"
X-Original-To: keyrings@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F134A787
	for <keyrings@vger.kernel.org>; Thu, 23 Oct 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761241977; cv=none; b=ayJ5C0RWd2GdCOWX91LyVvu/z2/DRWx2qfiFc+Ko6aC/aDug5wO0qO9fItvAtEHNLLrLVADvb5sp5X7s5jey2yTpf9Rg5yWtEz+xnWYNS3vgw0KlMuKJa+3YvNgTPwKEAlTTE8wO0LYCY2ELN7mFCXLiJcnLJO5fLnK4K95DA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761241977; c=relaxed/simple;
	bh=3/Hb62kc+NYq2C0hsOSogiX9/a2NhcysJRz/S17ajqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRnlrq5J6NkjTdPMnpn/zUa527JOll3EksVd8XLxY1H5Mgh7NEovNOaW7Q+nAPTLj7AmOve1qGiQawjW9vutsFafco9YmONt3/1QDNbdxn0xlZlujSGaeiySgKTmi0vaOvxEVTcJlMs/+dS5Upr/wogKd95hCdYr6shX5ztgWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J6jXXkXM; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761241963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vENFCP7b3Pf6ElRkmq5+rmKi7BK0xmEqT+h7PKf7AdY=;
	b=J6jXXkXMi8Ubq7RroFsuYEnRLp8rKwwL6hlNp0XDYItLFMdhPWHPb5Hn5PwIZhfMh/cdwb
	NOPmbD/jd23Pk3v5Sbd7GPkIrW2MeVDMzak4b00jtpZ5ktFeMlxdVKsflh3kZBuFsiDCsw
	/fsTnKEcza+D9bagRrMkNpLuzQUXQrI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] keys: Annotate struct asymmetric_key_id with __counted_by
Date: Thu, 23 Oct 2025 19:48:11 +0200
Message-ID: <20251023174810.75805-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the __counted_by() compiler attribute to the flexible array member
'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/keys/asymmetric-type.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 69a13e1e5b2e..1b91c8f98688 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -49,7 +49,7 @@ enum asymmetric_payload_bits {
  */
 struct asymmetric_key_id {
 	unsigned short	len;
-	unsigned char	data[];
+	unsigned char	data[] __counted_by(len);
 };
 
 struct asymmetric_key_ids {
-- 
2.51.0


