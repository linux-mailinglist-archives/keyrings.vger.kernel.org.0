Return-Path: <keyrings+bounces-1821-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442A93F717
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 15:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA1F1F221A4
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 13:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC0514D29B;
	Mon, 29 Jul 2024 13:54:48 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3766B14A0B7;
	Mon, 29 Jul 2024 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261288; cv=none; b=FoFS8boOkbgNE3+2SQtz7w5LRjI92+cxgCCTQfBk0AIdsa3kHkkDskv03G+DwI5TAbEk8756Nt+KsQ7Mz7XeoVpqm5eU5mSHabVMehN4uIFr7iVcshFUSm8J+RofndpOGTC1OAlaRwUN/GDjJmW+DAbyhdHRDxVvjiQDKpI5ZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261288; c=relaxed/simple;
	bh=mmMiCaan3yYLojE8j7BKR5C4fRKRSyRZ+VaJI9HwKXg=;
	h=Message-ID:From:Date:Subject:To:Cc; b=B5KkfUweyAPSbpAOTZq9tcdlNL1L6wfi8IWm5quzyVCa6TpVlcT/RWJ2xhQIuRKucYyZ+s0L7OBdgjgt8TQ5WGdK/J2d667devQ1Mrfp0QXSDPWhDjcthg8c2w/tvWOF0HWzqBj2AwR6xEWVNnEeFgmR02AKRLXMn9f5boZRgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 0AEFC1007577C;
	Mon, 29 Jul 2024 15:46:01 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id BB4EA62563B0;
	Mon, 29 Jul 2024 15:46:00 +0200 (CEST)
X-Mailbox-Line: From 73f2190e7254181f9ab7e9a3ec64cae56def8435 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1722260176.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 29 Jul 2024 15:46:00 +0200
Subject: [PATCH 0/5] Templatize ecdsa signature decoding
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Move X9.62 signature decoding out of the ecdsa driver and into a
template (patch [4/5]).

This allows introduction of P1363 signature decoding as another
template (patch [5/5]), which is needed by the upcoming SPDM library
(Security Protocol and Data Model) for PCI device authentication.

Drop usage of sglists for signature verification and use kernel
buffers instead (patch [2/5]) to avoid the overhead of extracting
from sglists into kernel buffers both in the templates and in the
ecdsa driver.  This builds on Herbert's elimination of sglists
from the akcipher API with commit 63ba4d67594a ("KEYS: asymmetric:
Use new crypto interface without scatterlists").

I realize that P1363 support (patch [5/5]) might not be acceptable
standalone, but I'm hoping to get an ack for it so that I may
upstream the patch as part of PCI device authentication.
Patches [1/5] to [4/5] will hopefully be acceptable standalone.

Note that I've duplicated the ecdsa test vectors in their entirety
in patch [4/5].  If that is considered overzealous, I can reduce
them to one or a few for testing the "raw" internal encoding.
In patch [5/5] I've included just a single test vector for P1363.
I can add more if desired.

Link to Herbert's suggestion to use templates for X9.62 and P1363:
https://lore.kernel.org/all/ZoHXyGwRzVvYkcTP@gondor.apana.org.au/

Link to PCI device authentication v2 patches:
https://lore.kernel.org/all/cover.1719771133.git.lukas@wunner.de/

Please review and test -- thank you!

Lukas Wunner (5):
  ASN.1: Add missing include <linux/types.h>
  crypto: akcipher - Drop usage of sglists for verify op
  crypto: ecdsa - Avoid signed integer overflow on signature decoding
  crypto: ecdsa - Move X9.62 signature decoding into template
  crypto: ecdsa - Support P1363 signature decoding

 crypto/Makefile                     |   4 +-
 crypto/akcipher.c                   |  11 +-
 crypto/asymmetric_keys/public_key.c |  43 +-
 crypto/ecdsa-p1363.c                | 155 +++++
 crypto/ecdsa-x962.c                 | 211 +++++++
 crypto/ecdsa.c                      | 122 ++--
 crypto/ecrdsa.c                     |  28 +-
 crypto/rsa-pkcs1pad.c               |  27 +-
 crypto/sig.c                        |  24 +-
 crypto/testmgr.c                    |  57 +-
 crypto/testmgr.h                    | 847 +++++++++++++++++++++++++++-
 include/crypto/akcipher.h           |  53 +-
 include/crypto/internal/ecc.h       |   2 +
 include/linux/asn1_decoder.h        |   1 +
 14 files changed, 1391 insertions(+), 194 deletions(-)
 create mode 100644 crypto/ecdsa-p1363.c
 create mode 100644 crypto/ecdsa-x962.c

-- 
2.43.0


