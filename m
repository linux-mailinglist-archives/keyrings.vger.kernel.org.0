Return-Path: <keyrings+bounces-2199-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9C99C67F
	for <lists+keyrings@lfdr.de>; Mon, 14 Oct 2024 11:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97CA628138B
	for <lists+keyrings@lfdr.de>; Mon, 14 Oct 2024 09:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7619154C0F;
	Mon, 14 Oct 2024 09:54:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B29146D55
	for <keyrings@vger.kernel.org>; Mon, 14 Oct 2024 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899698; cv=none; b=qzJ+pz9eqcjg0lQUX58cgZtSkiKp2CoMQ0rDC5bcnmUNHK+jrxgqYnJAX4tyst/V0CB29WZa77v/+h4GkFzTwUmLA8eppEVCJIowHEjShW1chZtpdt/Z43rr7Yf84usIJuUZq/nYk77skLqVaQydzRf5xY4jhqUciIh05K2FhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899698; c=relaxed/simple;
	bh=opJWGRJzJmm8FlVLRJmQbEMa7Z55QytunZlZn1fcnG4=;
	h=Message-ID:From:Date:Subject:To:Cc; b=t9JxeLQ9hjDh6tVIVh0ii4ykstvSP0wVq6WUspTMVZvIPdvWM165HJMXmyLqMZj2zi4ww5Bv2Kkib64g5/HvZlhsPEGdrZwYF4TibG1O+8GKYgsys791dOQeCMrfHQ27nafaEUF3CKyBhqjcHDqsulsOvemMKkUA8Tl51oLqdEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id C8641100FAD88;
	Mon, 14 Oct 2024 11:54:45 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 9C83560FC0F1;
	Mon, 14 Oct 2024 11:54:45 +0200 (CEST)
X-Mailbox-Line: From c6db4d5e631df30499b6a34885b5551f2da2436c Mon Sep 17 00:00:00 2001
Message-ID: <c6db4d5e631df30499b6a34885b5551f2da2436c.1728899510.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 14 Oct 2024 11:54:46 +0200
Subject: [PATCH keyutils] man: keyctl(1): Fix typo pkey_decrypt -> pkey_verify
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The synopsis of keyctl(1) erroneously lists "pkey_decrypt" not once but
twice.  The second occurrence was obviously meant to be "pkey_verify".

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 man/keyctl.1 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/keyctl.1 b/man/keyctl.1
index c1d067f..67e48b8 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -113,7 +113,7 @@ keyctl \- key management facility control
 .br
 \fBkeyctl\fR pkey_sign <key> <pass> <datafile> [k=v]* ><sigfile>
 .br
-\fBkeyctl\fR pkey_decrypt <key> <pass> <datafile> <sigfile> [k=v]*
+\fBkeyctl\fR pkey_verify <key> <pass> <datafile> <sigfile> [k=v]*
 .br
 \fBkeyctl\fR watch [\-f<filters>] <key>
 .br
-- 
2.43.0


