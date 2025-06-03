Return-Path: <keyrings+bounces-2786-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372CACC610
	for <lists+keyrings@lfdr.de>; Tue,  3 Jun 2025 14:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DBA3A42E0
	for <lists+keyrings@lfdr.de>; Tue,  3 Jun 2025 11:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C041DEFDB;
	Tue,  3 Jun 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lublin.se header.i=@lublin.se header.b="rmM4KwKP"
X-Original-To: keyrings@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1C422ACEF
	for <keyrings@vger.kernel.org>; Tue,  3 Jun 2025 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952015; cv=none; b=BsHSohfEO1OyixyUSnTnANUB2dSkUSEFZR22Ru/fmwAnIdMzJu41Dw+ZN86pvkXuscUy5MW2NYXAdZ5/ckECSxM3XGqWEFoPNnE0wsVLps+Mu1K+ia2L4HLDXCsgfwkcBVsyIzf8czCkFmbwnbRUoOvQsSX/PIV5J3uct/QIR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952015; c=relaxed/simple;
	bh=73RwoBDloBa/5yrmdHD6O1u61kmLT0teB/Uc/mv+vIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBrtbmaLBJChKlAliDmKGjcjVxA3JOqxYfYcmCW7TfS1D9HBxO2NR6OcLTnjNXfprWkgdRSOeOqnA1c72dXHzJ7anZd5X7X9nWRl4yrGuYR2vZ7G2IhfsU0/al60MFyMdSpeZVq8JKSdOK+s9RuYlEcLhvTP6efYDkKR1Ig8uo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lublin.se; spf=pass smtp.mailfrom=lublin.se; dkim=fail (0-bit key) header.d=lublin.se header.i=@lublin.se header.b=rmM4KwKP reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lublin.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lublin.se
Received: from dysnomia.uberspace.de (dysnomia.uberspace.de [185.26.156.223])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 26E971801D9
	for <keyrings@vger.kernel.org>; Tue,  3 Jun 2025 13:51:05 +0200 (CEST)
Received: (qmail 22471 invoked by uid 989); 3 Jun 2025 11:51:05 -0000
Authentication-Results: dysnomia.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by dysnomia.uberspace.de (Haraka/3.0.1) with ESMTPSA; id 377011C0030; Tue, 03 Jun 2025 13:51:04 +0200 (CEST)
From: Daniel Lublin <daniel@lublin.se>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Cc: Daniel Lublin <daniel@lublin.se>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sign-file: Show -k flag in usage when built for CMS signing
Date: Tue,  3 Jun 2025 13:50:49 +0200
Message-ID: <e66415d1953fbb074e2e32f0e6cdcaa0d027b550.1748951428.git.daniel@lublin.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: +
X-Rspamd-Report: BAYES_HAM(-0.171035) MIME_GOOD(-0.1) MID_CONTAINS_FROM(1) FORGED_SENDER(0.3) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: 1.528964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lublin.se; s=uberspace;
	h=from:to:cc:subject:date;
	bh=73RwoBDloBa/5yrmdHD6O1u61kmLT0teB/Uc/mv+vIo=;
	b=rmM4KwKPeIQuV/p1kyLIrzduvqMY/TtN9ejrj2+XXOB0PaEw38NR4WRUPZXeUk71gHslSR7L+J
	+jTrF6AvCUSaFrWpSP6TTv5IbAUdD8rFFiqhCwJUu+j2CEAAxUNQqa2q7nq0wKGhMp1WpkLbwHof
	pEhEhDZHLWTBfNkiVWsZnsQd7Nkl/zYin4KGgLnTjiFPCPTF/LctXZiyiAYiS6OU8CsTv2F1RVFv
	s/+7iWA07b6zhfFAKQnvmJ9cqYm5vgIHQ1Za1ksvkudG9QBS8dnX+gEW2KwLkEW3cipG7koq+lIP
	8zThaXLMixUAZcVNYinvuooD6LYPR108ZbGnLY/h8UxjPRyjdIj6lorLR1cttqpYurtrEoQsNbpJ
	yfVeHJBoFY4MJ8szHN3cDXhQE2aUmD+C0qFQ4IUNcFBt9rGiRxulPcxd7px1klrgh2UwY3nRRQ30
	2hhkbSdAYchWCqAO1LeeN05S4hTlU1yGjZ8tjG2Vii3izNWG6lac/6MjWFo8+gET2gY7+nWNNbsY
	jZcM+Z2kpRVz1zUYHVWR0oVRQoG86Ud52fertUl1C9OzD01vw5diqgHj1SvDvs/3jEmHR/5R/W1O
	4KIDstVr/9Wrf4SUgLS5v7P7v9xED33kMX2fU3MQcEBOmPoZgSQpx/btC/jY90r7+K2bpwx3hPbt
	c=

When sign-file is built for CMS signing (when USE_PKCS7 is undefined) it
handles the -k flag, so show that in the usage. The -k (keyid) flag is
not cared for used when -s rawsig is used, so that usage is not altered.

This change also makes it more obvious whether or not a sign-file binary
actually has been built for CMS signing.

Signed-off-by: Daniel Lublin <daniel@lublin.se>
---
 scripts/sign-file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..0b9a3af9115f 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -79,8 +79,13 @@ static char magic_number[] = "~Module signature appended~\n";
 static __attribute__((noreturn))
 void format(void)
 {
+#ifndef USE_PKCS7
+	fprintf(stderr,
+		"Usage: scripts/sign-file [-dpk] <hash algo> <key> <x509> <module> [<dest>]\n");
+#else
 	fprintf(stderr,
 		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+#endif
 	fprintf(stderr,
 		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
 	exit(2);
-- 
2.49.0


