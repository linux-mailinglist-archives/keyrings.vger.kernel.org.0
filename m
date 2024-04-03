Return-Path: <keyrings+bounces-1052-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E689662F
	for <lists+keyrings@lfdr.de>; Wed,  3 Apr 2024 09:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4A81F24A78
	for <lists+keyrings@lfdr.de>; Wed,  3 Apr 2024 07:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77696CDC2;
	Wed,  3 Apr 2024 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="JdueFn8D"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75E60B91
	for <keyrings@vger.kernel.org>; Wed,  3 Apr 2024 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712128911; cv=none; b=Pd3ZXHIXPW9TR3IYdeESaLORT12es0oHRjyomD8zBOkks0f6mzmWNk2uunmX6weeE3yYqu/oPMqCiJ88OL9VPppTONpjdP/yok6aSHkx5Cw7C6d2DPZ5dK4MWT/foMaLK9GKuobWZfgh5cTdoRKbzE71P42yHgRniRcRmi7uAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712128911; c=relaxed/simple;
	bh=Khyeg1/xj46k+x5xR7s8vWgC8Y2GcoM7MOqDayZ6owQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aj+Xqmf8pU0FX8BEv6cbL51iE80u4YTw17xhVTykOR1adi/tZrsdP009488geh8OqR/k7+MjwFXWs6Jn50aImdmECG6aXpTw2E46pn1FBIP/k/MvhR8g4vUgLxGTgZAUAOGz+thdXxB+mdOE41LMT2zgV/ho7q5XJLWXwIN2z4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=JdueFn8D; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41624fe40a2so255705e9.3
        for <keyrings@vger.kernel.org>; Wed, 03 Apr 2024 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1712128908; x=1712733708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=JdueFn8DOrllCF00jh7MZOpnWQ1lhXI07HeDguULMBqeUVFmYd0LdOLUnTcaFzDa9A
         fazroUBnovKNuscyPO4FCLe0JeX3UGKiiFODXPRNspid68bsgjq4/Lbbb6AFzYk6ywQ4
         SBm4k2Gn32Ge60qG9f0JhMyyag9WvGrF5f08YivMgWXoXtMD+vohf+2i6bOhkJyf4bG0
         hL3R6ZJp5c8R3WAkDuasakh8HZJPWC5n6iRvPheE6W2A/pkwAyJj2+wb3Dg22p+fIr9k
         ++8mkLDiq/kTE4jgEWSkkLk3rMbYUuwcbg9BSsKvZGZP6/sy7RT7K+It3kfoOurfgTJ/
         ZWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128908; x=1712733708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=lT+EF6aosQeNZGf0lVjYpybUG+Mk32ZRxTsPziT3gEz/wHpTWkX27ZHsSvPwdNt4zR
         IWv+zqESIZlGDOGCjBm8X36cY8LUlV3q7NzIZOuKdZEF884Vb7jg5Eg4tMtJldYTOiiu
         t6YFSRXkoYOlLIVNj7vAVMkyNBk3mHklN8YnT0UBO36W/i3wB+eEvH8McaEw3IWswYb5
         HdmvCgvR19sR0sCFvWv+ift0ET1PfopID9l4rNr7dvmhDcCzTOu3HggIpuhaRtOO0sZB
         iEGsAvbS63HLDE8PZLfBpoacYW5i1TH2AtZatpYosC9zdIcOjbEuRvwWzuqSqO34iZgt
         KZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCV3rAia/DoAoHQ1GuI5lXRh/dgir09LP9F48vFbaWgU3mXvtEFdVsxfKRcAqtUQeEaDZQlX++nEhUwe3zJKRtjBpV12SzpWN+w=
X-Gm-Message-State: AOJu0YyTc+2ifTvvSup0CSsjvqcz8LZL5rTGEQmq3c/XvukDRkai1rYX
	NB8GeQEd5ZQdtVEI8emvnmQzdl2OEFD4lD/RDsA5P2R6I1P8mQbtuj90rkU4IXg=
X-Google-Smtp-Source: AGHT+IFwfWGPzmjOkZpQ5g13bjj6w//ru+uAqGOIDa7Sctmy6coY4cw7BXdzp+Ags4F/9A/eZ2BqQQ==
X-Received: by 2002:a05:600c:3c92:b0:416:2181:bcaf with SMTP id bg18-20020a05600c3c9200b004162181bcafmr930669wmb.1.1712128908083;
        Wed, 03 Apr 2024 00:21:48 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id n30-20020a05600c501e00b0041621b3cfa8sm1724904wmr.6.2024.04.03.00.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:21:47 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: David Gstir <david@sigma-star.at>,
	Shawn Guo <shawnguo@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	David Howells <dhowells@redhat.com>,
	Li Yang <leoyang.li@nxp.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Tejun Heo <tj@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v8 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Wed,  3 Apr 2024 09:21:20 +0200
Message-ID: <20240403072131.54935-5-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403072131.54935-1-david@sigma-star.at>
References: <20240403072131.54935-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
found in smaller i.MX SoCs.

Signed-off-by: David Gstir <david@sigma-star.at>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 976a5cea1577..ca7f42ca9338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12019,6 +12019,15 @@ S:	Maintained
 F:	include/keys/trusted_caam.h
 F:	security/keys/trusted-keys/trusted_caam.c
 
+KEYS-TRUSTED-DCP
+M:	David Gstir <david@sigma-star.at>
+R:	sigma star Kernel Team <upstream+dcp@sigma-star.at>
+L:	linux-integrity@vger.kernel.org
+L:	keyrings@vger.kernel.org
+S:	Supported
+F:	include/keys/trusted_dcp.h
+F:	security/keys/trusted-keys/trusted_dcp.c
+
 KEYS-TRUSTED-TEE
 M:	Sumit Garg <sumit.garg@linaro.org>
 L:	linux-integrity@vger.kernel.org
-- 
2.35.3


