Return-Path: <keyrings+bounces-814-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C1875376
	for <lists+keyrings@lfdr.de>; Thu,  7 Mar 2024 16:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75A91F27FAC
	for <lists+keyrings@lfdr.de>; Thu,  7 Mar 2024 15:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A63312EBEA;
	Thu,  7 Mar 2024 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="VAEefIaw"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DEC130AF1
	for <keyrings@vger.kernel.org>; Thu,  7 Mar 2024 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709825955; cv=none; b=uxDboTuK7ujhwz9QXO2RUZxEWfig7dwzf90CHXlKWCn0fVBtebQeSmRjRjWw5zn37quQld5t4t17sbz6MKqhX6pUzNNXMy9N20OHTK/T9uC8n7SIXIcIpMbBZdGFoSc0aZh9RD9i6oCHT3YGg23cS/JCceE0w4lzv4nqna5hAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709825955; c=relaxed/simple;
	bh=IoJ5PhDwmkZFYUe1jIRt3XY+XYejXNxDc1GhQecxiN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vj/jjz39BwzBENY36BC0HRUpyb4hNF8XbuKOJMxHbwP2JfMzR0+24oShPxhS8IBFbBwgR468uDDgaYVjuH1hqDz6ejw0cjlPzMLT8bzmZjs3hqq+6BWcz5S/1XF95liIRfOCecjVaFp0pWln0oU4lEiPRQcxpNhwKmCubGWNwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=VAEefIaw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso1287757a12.2
        for <keyrings@vger.kernel.org>; Thu, 07 Mar 2024 07:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825951; x=1710430751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q95Pv5eUd7/PCCDIkGY46bAHfemcttBtSKECUmP8rbg=;
        b=VAEefIawjg3T0EMzO060miLSluQ2j4JanLZgMzl00mJvqwgSMPPKXwZ9BJepZgjYkQ
         QnE4IS13xqUFvGK/2SHXykv0Q2biLLRBi42Remc8PMD3TpTDfEqELcub0UTe3QMJ8bfz
         YexEZi0lkba5r3Cs+Pqm9bKpVZJoXHAxhuZRGHQTpHvayfDeftj1wvQKNU2Sceroy1NT
         1KQEERpIUAQnwIsVZTSegM4nk9MruwD1nsyByloMl/GBV0to/nq/js1vzS9g0pU7QbJ6
         4YVNTeaWfcXV9e8J7rHqVVrjXliJKq/rIXFJU2EOOfXSsGHEj1AV81nfKfFknFeDaqkG
         9r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825951; x=1710430751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q95Pv5eUd7/PCCDIkGY46bAHfemcttBtSKECUmP8rbg=;
        b=LrVGCnrWZ4Q5Jw9GPxyk9xTa7be422YSuAJUBs39z/5iR14wVQwVQHrZSG7a9oIxZf
         xWgGtC/DONqzYAqeQx/VrEvneV0bXqeXYxVU+iFFufldrHA6DSwmLe2Y3POtXokZK15D
         4VJovirh7ZbtsrpNL6qG3+SCkKsVTCc/qpN2Zpv+hk+eZwNx6spC/A2ja/rjcHhGoHh6
         vHxtJqbPZ4vaaFUyUjWUOu3XubnKiI2xUVmZstoa32n5oVmgvAitVNy/spd7tbexreNG
         X1fc7GWaEKiyB/jxjrZp/94aeLDc2J3LlwMaePAvpcZfuYFvSRtKNA0WcK6TSC3xnOAV
         wb8w==
X-Forwarded-Encrypted: i=1; AJvYcCV7nweZmDKNgoGC9JGNavvIqmhKTwdq9cjWDfb2jaMpbER+JFfWOWT2yq+Vl5ePJrHIamuG4Jz4UPpBjRg3HtbiY78uqamTMbs=
X-Gm-Message-State: AOJu0YyzoKsN6FCywcouySH7AxOWnba+tON7tBvypaEmlm172Z/Vdd1c
	9EHPyONAwq3KmckxbMntPTqih7QzsHJDTLLEI4/7YeCv0oHCeJ6Yy9y2OU3UlIs=
X-Google-Smtp-Source: AGHT+IFQim0IlvlrKFx/Yx6UJFZNUGR3Suw118WkReabIIWNHe5La99iFLjJ/8OXFgt0a3qNMqW7EQ==
X-Received: by 2002:a50:d514:0:b0:564:5c90:f521 with SMTP id u20-20020a50d514000000b005645c90f521mr115786edi.14.1709825951647;
        Thu, 07 Mar 2024 07:39:11 -0800 (PST)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id a26-20020a50c31a000000b00567f9d21b7csm1617918edb.94.2024.03.07.07.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:39:11 -0800 (PST)
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
	linux-security-module@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v6 5/6] docs: document DCP-backed trusted keys kernel params
Date: Thu,  7 Mar 2024 16:38:32 +0100
Message-ID: <20240307153842.80033-6-david@sigma-star.at>
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

Document the kernel parameters trusted.dcp_use_otp_key
and trusted.dcp_skip_zk_test for DCP-backed trusted keys.

Co-developed-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 24c02c704049..b6944e57768a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6698,6 +6698,7 @@
 			- "tpm"
 			- "tee"
 			- "caam"
+			- "dcp"
 			If not specified then it defaults to iterating through
 			the trust source list starting with TPM and assigns the
 			first trust source as a backend which is initialized
@@ -6713,6 +6714,18 @@
 			If not specified, "default" is used. In this case,
 			the RNG's choice is left to each individual trust source.
 
+	trusted.dcp_use_otp_key
+			This is intended to be used in combination with
+			trusted.source=dcp and will select the DCP OTP key
+			instead of the DCP UNIQUE key blob encryption.
+
+	trusted.dcp_skip_zk_test
+			This is intended to be used in combination with
+			trusted.source=dcp and will disable the check if all
+			the blob key is zero'ed. This is helpful for situations where
+			having this key zero'ed is acceptable. E.g. in testing
+			scenarios.
+
 	tsc=		Disable clocksource stability checks for TSC.
 			Format: <string>
 			[x86] reliable: mark tsc clocksource as reliable, this
-- 
2.35.3


