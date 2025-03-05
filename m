Return-Path: <keyrings+bounces-2441-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2060A50632
	for <lists+keyrings@lfdr.de>; Wed,  5 Mar 2025 18:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F233A28A9
	for <lists+keyrings@lfdr.de>; Wed,  5 Mar 2025 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512DD17BEC6;
	Wed,  5 Mar 2025 17:17:06 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A2567D;
	Wed,  5 Mar 2025 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741195026; cv=none; b=qEe8fGhU2heM6bsb3iFuWycRXrZ2a9b0vgm6so2LfU9JKrFQy9xHTeug+1esDG+6g51uhWaYyQGxg3qYyF6ihf5nVFgATepgCwvuMwojiHKY5Ym7Jjohn9n6lHCnODmoK2XK/hCr8TLytCdImX1lKMZZBVOuuFc3unLldGrBDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741195026; c=relaxed/simple;
	bh=3XbN8qRobWrAztvAkHqAPv4HcVw1mR5SEU8MQNSX7ls=;
	h=Message-Id:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=P8XK6nW7Xovk0PvKOFa2fxzioGEkaLf+tqYfTSoU760dgwtWUvOlghsGjlVpUwzwkIvHowsiWUJwa7rLSyNJyR9huQ8JaNv++S8CBMGGsPixt7mjhUZG8oVICgH0P6wpQhKZSzp46i77kK8wfsCMSolFxQLAZ9qZIsV0uaQBMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E3A433000A3A4;
	Wed,  5 Mar 2025 18:16:51 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id CC7731BCE7; Wed,  5 Mar 2025 18:16:51 +0100 (CET)
Message-Id: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 5 Mar 2025 18:14:32 +0100
Subject: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric keys
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, Stefan Berger <stefanb@linux.ibm.com>
Cc: Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>, Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>

Herbert asks for long-term maintenance of everything under
crypto/asymmetric_keys/ and associated algorithms (ECDSA, GOST, RSA) [1].

Ignat has kindly agreed to co-maintain this with me going forward.

Stefan has agreed to be added as reviewer for ECDSA.  He introduced it
in 2021 and has been meticulously providing reviews for 3rd party
patches anyway.

Retain David Howells' maintainer entry until he explicitly requests to
be removed.  He originally introduced asymmetric keys in 2012.

RSA was introduced by Tadeusz Struk as an employee of Intel in 2015,
but he's changed jobs and last contributed to the implementation in 2016.

GOST was introduced by Vitaly Chikunov as an employee of Basealt LLC [2]
(Базальт СПО [3]) in 2019.  This company is an OFAC sanctioned entity
[4][5], which makes employees ineligible as maintainer [6].  It's not
clear if Vitaly is still working for Basealt, he did not immediately
respond to my e-mail.  Since knowledge and use of GOST algorithms is
relatively limited outside the Russian Federation, assign "Odd fixes"
status for now.

[1] https://lore.kernel.org/r/Z8QNJqQKhyyft_gz@gondor.apana.org.au/
[2] https://prohoster.info/ru/blog/novosti-interneta/reliz-yadra-linux-5-2
[3] https://www.basealt.ru/
[4] https://ofac.treasury.gov/recent-actions/20240823
[5] https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50178
[6] https://lore.kernel.org/r/7ee74c1b5b589619a13c6318c9fbd0d6ac7c334a.camel@HansenPartnership.com/

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 MAINTAINERS | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736d..b16a1cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3595,14 +3595,42 @@ F:	drivers/hwmon/asus_wmi_sensors.c
 
 ASYMMETRIC KEYS
 M:	David Howells <dhowells@redhat.com>
+M:	Lukas Wunner <lukas@wunner.de>
+M:	Ignat Korchagin <ignat@cloudflare.com>
 L:	keyrings@vger.kernel.org
+L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	Documentation/crypto/asymmetric-keys.rst
 F:	crypto/asymmetric_keys/
 F:	include/crypto/pkcs7.h
 F:	include/crypto/public_key.h
+F:	include/keys/asymmetric-*.h
 F:	include/linux/verification.h
 
+ASYMMETRIC KEYS - ECDSA
+M:	Lukas Wunner <lukas@wunner.de>
+M:	Ignat Korchagin <ignat@cloudflare.com>
+R:	Stefan Berger <stefanb@linux.ibm.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	crypto/ecc*
+F:	crypto/ecdsa*
+F:	include/crypto/ecc*
+
+ASYMMETRIC KEYS - GOST
+M:	Lukas Wunner <lukas@wunner.de>
+M:	Ignat Korchagin <ignat@cloudflare.com>
+L:	linux-crypto@vger.kernel.org
+S:	Odd fixes
+F:	crypto/ecrdsa*
+
+ASYMMETRIC KEYS - RSA
+M:	Lukas Wunner <lukas@wunner.de>
+M:	Ignat Korchagin <ignat@cloudflare.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	crypto/rsa*
+
 ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
 R:	Dan Williams <dan.j.williams@intel.com>
 S:	Odd fixes
-- 
2.43.0


