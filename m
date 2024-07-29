Return-Path: <keyrings+bounces-1834-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335493FD14
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 20:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9CE283CF9
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 18:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DF218732A;
	Mon, 29 Jul 2024 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="ft3vYqt2"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B6185606
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722276177; cv=none; b=dBfeMji2Js7s0CPRkNmgmYW0WdeiNa4+rzWcZnSXCuyr1WBT0/ObzjyfE4YwaPKBBKCmQCN9c9u9AY83VP0HbGif8wN1k0HCSIhcT8cgiKhNznTyJ56g06iTtaOoOHD/ly8wQBiFHmAArwruiBG6gzdQ83g0sKHzRgWyGoh3V+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722276177; c=relaxed/simple;
	bh=G7IwQIgY5GxJCQOTsKBFv1NqhOtb2Wha/dJM8TIyRgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kHOWBk/F/zeodwSqHReB33WCdehGX0kEVhNuzOO+8NbK/KbgbXEru/9JcW372k3W7jo5Ue7HneAV8UObv3LQtSc4UlxkppIMOL9Br+eHGj4lI+/cLVRkbHn3ffFV2XJdJSrt1SRfblQ/fPXixS1IkchbTobAQ54Q+cqFR0TxIWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=ft3vYqt2; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WXmRS3PgyzdYP;
	Mon, 29 Jul 2024 20:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1722276164;
	bh=L0THBIvmOBna85CChr16uIpMPbvwv/+jnlq85zYGXQk=;
	h=From:To:Cc:Subject:Date:From;
	b=ft3vYqt2YDQXEWGyXh4v3AXjrzJWHjxaUbwGtvG4FiRi3Evwl346wborPzK2lIjKK
	 V8RmHFipmkzNUXvXJkUIiUFst8ai/juVcZnPVXrB1KhtmO3kr6QCVxJNwfbqYln2hb
	 Rn3khvt8ATtv0+mPUTQv9FFYenLs/HFSMp6rE4Do=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WXmRS09rhzh2s;
	Mon, 29 Jul 2024 20:02:43 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	keyrings@vger.kernel.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Daniel Urbonas <t-durbonas@microsoft.com>
Subject: [PATCH] tools/certs: Make print-cert-tbs-hash.sh compatible with recent OpenSSL
Date: Mon, 29 Jul 2024 20:02:32 +0200
Message-ID: <20240729180233.1114694-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Recent OpenSSL versions (2 or 3) broke the "x509" argument parsing by
not handling "-in -" (unlike OpenSSL 1.1):
  Could not open file or uri for loading certificate from -: No such
  file or directory

Avoid this issue and still make this script work with older versions of
OpenSSL by using implicit arguments instead.

To hopefully make it more future-proof, apply the same simplifications
for other OpenSSL commands.

Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Eric Snowberg <eric.snowberg@oracle.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Reported-by: Daniel Urbonas <t-durbonas@microsoft.com>
Fixes: 58d416351e6d ("tools/certs: Add print-cert-tbs-hash.sh")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 tools/certs/print-cert-tbs-hash.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/certs/print-cert-tbs-hash.sh b/tools/certs/print-cert-tbs-hash.sh
index c93df5387ec9..22bdeec4d286 100755
--- a/tools/certs/print-cert-tbs-hash.sh
+++ b/tools/certs/print-cert-tbs-hash.sh
@@ -54,7 +54,7 @@ RANGE_AND_DIGEST_RE='
 '
 
 RANGE_AND_DIGEST=($(echo "${PEM}" | \
-	openssl asn1parse -in - | \
+	openssl asn1parse | \
 	sed -n -e "${RANGE_AND_DIGEST_RE}"))
 
 if [ "${#RANGE_AND_DIGEST[@]}" != 3 ]; then
@@ -85,7 +85,7 @@ if [ -z "${DIGEST_MATCH}" ]; then
 fi
 
 echo "${PEM}" | \
-	openssl x509 -in - -outform DER | \
+	openssl x509 -outform DER | \
 	dd "bs=1" "skip=${OFFSET}" "count=${END}" "status=none" | \
-	openssl dgst "-${DIGEST_MATCH}" - | \
+	openssl dgst "-${DIGEST_MATCH}" | \
 	awk '{printf "tbs:" $2}'
-- 
2.45.2


