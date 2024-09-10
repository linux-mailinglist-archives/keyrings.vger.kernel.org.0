Return-Path: <keyrings+bounces-1965-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AD973BBD
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01B791C25418
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265E819ABB6;
	Tue, 10 Sep 2024 15:24:36 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE7196434;
	Tue, 10 Sep 2024 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981876; cv=none; b=DFjrknGa8aBjstA9t5FabJEky5aSq2WRQNkhkzKFIhFVU2eGlPJjlvBEH/GVMsKpfrPL9ivwcH6bdlWPfJk4fr5lvp7QVmHP8U48ZfKJBO9wRbSurcMFO/i+CPbQ/pGSo6gspvVGSq5NE9IRHRSoBwZdJkfGJoioWgk/sl88Sh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981876; c=relaxed/simple;
	bh=9NrFXIl4mzBSyQy6skIOWMUuppt7NLCSSu3BHcANNLE=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=N6ypWw8Eq5wluv6L+DP/qgO+l/yUXAVUeAdwZPgh0kgPTjTSJGOjftAOZyyNFvE2NAWIGJQARuY7FAhIteSHgjcH0vE35lcFUZ9WlRwMbAQ+nWp1Q/FjM+tqvstDGg1u7aJslIs0HeIIwq2tUsmjayRjS4qPiln25S5pmpsHas4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 3DDFC10195301;
	Tue, 10 Sep 2024 17:24:32 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 008D760A8B01;
	Tue, 10 Sep 2024 17:24:31 +0200 (CEST)
X-Mailbox-Line: From 16afbc3d1fba51d40977bf0d018f2441f6f1383a Mon Sep 17 00:00:00 2001
Message-ID: <16afbc3d1fba51d40977bf0d018f2441f6f1383a.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:23 +0200
Subject: [PATCH v2 13/19] ASN.1: Clean up include statements in public headers
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

If <linux/asn1_decoder.h> is the first header included from a .c file
(due to headers being sorted alphabetically), the compiler complains:

  include/linux/asn1_decoder.h:18:29: error: unknown type name 'size_t'

Avoid by including <linux/types.h>.

Jonathan notes that the counterpart <linux/asn1_encoder.h> already
includes <linux/types.h>, but additionally includes the unnecessary
<linux/bug.h>.  Drop it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes v1 -> v2:
  * Drop "#include <linux/bug.h>" from <linux/asn1_encoder.h> (Jonathan)

 include/linux/asn1_decoder.h | 1 +
 include/linux/asn1_encoder.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/asn1_decoder.h b/include/linux/asn1_decoder.h
index 83f9c6e1e5e9..b41bce82a191 100644
--- a/include/linux/asn1_decoder.h
+++ b/include/linux/asn1_decoder.h
@@ -9,6 +9,7 @@
 #define _LINUX_ASN1_DECODER_H
 
 #include <linux/asn1.h>
+#include <linux/types.h>
 
 struct asn1_decoder;
 
diff --git a/include/linux/asn1_encoder.h b/include/linux/asn1_encoder.h
index 08cd0c2ad34f..d17484dffb74 100644
--- a/include/linux/asn1_encoder.h
+++ b/include/linux/asn1_encoder.h
@@ -6,7 +6,6 @@
 #include <linux/types.h>
 #include <linux/asn1.h>
 #include <linux/asn1_ber_bytecode.h>
-#include <linux/bug.h>
 
 #define asn1_oid_len(oid) (sizeof(oid)/sizeof(u32))
 unsigned char *
-- 
2.43.0


