Return-Path: <keyrings+bounces-813-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FE87536D
	for <lists+keyrings@lfdr.de>; Thu,  7 Mar 2024 16:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C324B1C222CA
	for <lists+keyrings@lfdr.de>; Thu,  7 Mar 2024 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB3130ADC;
	Thu,  7 Mar 2024 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="ho1udeym"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57712FF92
	for <keyrings@vger.kernel.org>; Thu,  7 Mar 2024 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709825952; cv=none; b=keM0v9+DS3hoenxncZ2QMn4LOGw/com4h5RTcWZmMmJ/X00a1GmUV6uynBejQmA+MppVBMeGkxoU7KbZ+EoClPx/BZ+fdB5Gda2tuDEgreWYChQyYtNTIKebTSZMZTKJ+XKiEDbhvoT4vQC2RRdpCXyaP/o8db4y2918BYK1LgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709825952; c=relaxed/simple;
	bh=Khyeg1/xj46k+x5xR7s8vWgC8Y2GcoM7MOqDayZ6owQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iufYcBglFoykxRMbp5UciGDxyk1vJ/M8jWiexpSSHk4YpaaVatoayBqQCi9wfvewL75Jd1lMBjtOhe1bi7XLeE4p/kF5bA1fsu43biDardnF2j5c6/29YLmyKGcB0uAtSrAVmHpZqqMvLPjHTG6UHSrDyeFRYDqV0gisdGfj+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=ho1udeym; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-564647bcdbfso1281011a12.2
        for <keyrings@vger.kernel.org>; Thu, 07 Mar 2024 07:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825949; x=1710430749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=ho1udeymobi1MXsv1z5Gtznhwlhb9Q7KboVxk3oUSIxc9Jyug0neZfPGPNJq5vwZH3
         /h8tEeAuF8C0qQBbFnkmok2dvOuG2shaHSl7sh3wqP3g5VT7RtOqASvbky55dOJmPK3V
         t3evD5ZqZxrmUTrrlQuQgan7YE6JY6ccazyogc3FV6D3hXEypRHUxDe6H9UkW17OexgI
         MSMgS0RqCOiPim9WA/kdzXiFxqRjqVgoUFKwQ/b+PMG8CA6dDfOhS6nTK/ft1oia2lWc
         60rE1ZxbS5U/YEb0aNxCnLPrg+dV3ozmAma1p59kP8V09vzNLseE5RNY0VUK6rjNo58d
         a/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825949; x=1710430749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xm7Qk02wEciH96RlDxlZxQKfuGKusC1XnJuVX2I7s=;
        b=DwLFwfRqZqmF0wpaOZaBretIhJ5Z8rahEQJhuAJmZb922fe/RhZZxRQm9UUu8ab4uZ
         5NPnj2h7T115w75DZmciaiN2i+JcmsRiSRDX3PQAnpDa8hM+COHDRyCJKkPIOFSZXHbM
         wDzdJLQ54yA8XDEAb2RESErXTG1sKlMXK4tMWpkUGPnl4AWTPZNmnOIRsGwnA4NjH70m
         1nK3e59jqnefOgSE8dtNgeTIBxd/meCO4G7M5aOBuWFm0etGd3sM1OdLB/VleBxYgEew
         ZoGMcVriPgaOGzzFW+lOFP1vt6XFYOJNnv5KsjLSsVwTTVsrkpXmBXe6CdibyWjbl5wX
         u/jw==
X-Forwarded-Encrypted: i=1; AJvYcCUZKGwrrIVptH1D+1u4xSqpH8qWkn3jJTKGTD6a90ct6TzD/SYOtuj4SWrpwBtOujKkNDaTOXNz3IAwJlDRfX2ED6xn/vxBEXc=
X-Gm-Message-State: AOJu0YwLBfHo3Edh5GDOpIfZxwXOz8Dv2Y3AfV8cMnHqatD3VNwdULV/
	uSdiS/tQvZJ/HPMm89CQqCYhCYM1zWbfvWBs9k8zAI7KI9gDICb62VCHUNGK7B4=
X-Google-Smtp-Source: AGHT+IEb9uHzTYNh6kQ0uZHCI0k1QlwHmc0IaGoKGOXcT/uSlXvTVZyP49tsb/Hi9juDacNHze2C5g==
X-Received: by 2002:a17:906:3d3:b0:a3d:482f:3fc4 with SMTP id c19-20020a17090603d300b00a3d482f3fc4mr11303302eja.70.1709825949141;
        Thu, 07 Mar 2024 07:39:09 -0800 (PST)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id k14-20020a170906128e00b00a44b91ae6d4sm6687757ejb.33.2024.03.07.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:39:08 -0800 (PST)
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
Subject: [PATCH v6 4/6] MAINTAINERS: add entry for DCP-based trusted keys
Date: Thu,  7 Mar 2024 16:38:31 +0100
Message-ID: <20240307153842.80033-5-david@sigma-star.at>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307153842.80033-1-david@sigma-star.at>
References: <20240307153842.80033-1-david@sigma-star.at>
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


