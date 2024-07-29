Return-Path: <keyrings+bounces-1823-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069793F73D
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E907F2819EA
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD4D1487C6;
	Mon, 29 Jul 2024 14:07:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56517548F7;
	Mon, 29 Jul 2024 14:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262021; cv=none; b=WXLzs2bXnLjCboSWwFDvAut4rU9n2jWO/n64FUljUd6K7uzDMnIJnuGnUjU7XS7YEY1n/RZVF2pC11lwUpa4BTXqCojTyiJzErfvmkBW7dzr0AHmOvz+cFq8ENsNrZL6U6blNYB3sNUskVpfY8nuicXQzi3ymOJfFJseKxjcbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262021; c=relaxed/simple;
	bh=VYKoO5jCsoT/rtfMdAueqUF+CIUYafh1Q3PNMn+NI0I=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=WSwrcmK7j/fvk3JEwDDGrF4H0/v90a3yrBQmB2iw4TT0iedOpulRdCte7kdCrAalfAW8j59JNPk06BMvO3VotfD86xlPmaBC/34OffqUSc0FqVHSQkFRnuK+QyTdl2712Kpawlpgb45yXD5tlS5DhjR7uSLXNIL4fRVa74OuRW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 75E59101917AC;
	Mon, 29 Jul 2024 15:57:19 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 42FDD62754AE;
	Mon, 29 Jul 2024 15:57:19 +0200 (CEST)
X-Mailbox-Line: From a98ae07646e243fe0d9c1a25fcb3feb3e5987960 Mon Sep 17 00:00:00 2001
Message-ID: <a98ae07646e243fe0d9c1a25fcb3feb3e5987960.1722260176.git.lukas@wunner.de>
In-Reply-To: <cover.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 29 Jul 2024 15:47:00 +0200
Subject: [PATCH 1/5] ASN.1: Add missing include <linux/types.h>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

If <linux/asn1_decoder.h> is the first header included from a .c file
(due to headers being sorted alphabetically), the compiler complains:

include/linux/asn1_decoder.h:18:29: error: unknown type name 'size_t'

Fix it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 include/linux/asn1_decoder.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/asn1_decoder.h b/include/linux/asn1_decoder.h
index 83f9c6e1e5e9..b41bce82a191 100644
--- a/include/linux/asn1_decoder.h
+++ b/include/linux/asn1_decoder.h
@@ -9,6 +9,7 @@
 #define _LINUX_ASN1_DECODER_H
 
 #include <linux/asn1.h>
+#include <linux/types.h>
 
 struct asn1_decoder;
 
-- 
2.43.0


