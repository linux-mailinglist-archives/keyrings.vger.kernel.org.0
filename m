Return-Path: <keyrings+bounces-3626-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D323CBEA69
	for <lists+keyrings@lfdr.de>; Mon, 15 Dec 2025 16:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B895030FC875
	for <lists+keyrings@lfdr.de>; Mon, 15 Dec 2025 15:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9C9340286;
	Mon, 15 Dec 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="euLqReZi"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A733EB15
	for <keyrings@vger.kernel.org>; Mon, 15 Dec 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808285; cv=none; b=LDL60l8+Qtfc0t+Z5pmWKUtLU/LVz5czGIiub7X5a4LUn5ERzMnWC9redvsDcVszoarnU3eabduNOF+QtuZwrjYStsVPxnjkb8hMYdp6NS+6OHBrWpNr++q75Sv4vTsyfLKL6BEeYCZp4/7E5GrJnWkwqKsljERplfSfPmmTg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808285; c=relaxed/simple;
	bh=Zg7mCOEZ4Z6I10BCWu77BY4uJ1KchHXm6/KivSfImCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+80HmtWDhbA+HOxjCIxzjy/0WWk7HxPjEzog8VqjItgbTq21+SDs1xsyXKrkiilQ1k3mMFren7pXgUZTvZih0IPYuXwfyFgexx6lHolU3t9f2wUE6x0lvc1fsXo/UtDOp1FeUz5BRqy0yUIBSjzLbzSWQMVwsMnir6clxHLyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=euLqReZi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso5661196a12.1
        for <keyrings@vger.kernel.org>; Mon, 15 Dec 2025 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808279; x=1766413079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+EJpP28ACswVH+s22Escdl3RH0kKfptytDh+TM4ml8=;
        b=euLqReZi1buW9Pt6pFNFg1JGQi6ms8IluV+HAjs7TSAJoOBB3hfCWEXlVAPXCTmRKJ
         /nd80Q3krOT0rb7g37WOv3lO1POnMZOPISgXRuRy92dm+jK+ZFw+xWsuR04N6KZZlf8R
         t3QmgdWnFRqRZluw3OBNlODMZoiNXRsnSj/pSsl++MIOObUQ/qozfHEVNnCP0VvwYAnJ
         ixY78zV/uOD5HPgZhrqg/bXdMLkIC9IsvCRAuQc6yHnP4UMaLuiq2DKwqwmU3kR/BzZ6
         X2nTEvzrlMIOe37VNRZ/ALJ8IR3ZA3H3EEVzQ7PtFoBUOvul2UMZIVJpWZ1mq4xtMNHr
         GgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808279; x=1766413079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+EJpP28ACswVH+s22Escdl3RH0kKfptytDh+TM4ml8=;
        b=tJolRpU24gGjKoCmYJGCq/QofMwaFSNPNxAhHd48Muy2C3I6w//lof2RVQXd44Zgsl
         W3tEpFGo8NJ96XEaaKVgskdwwnKDkXZyJZF1CkVu2bm/dAQvPYwez+XmdS4w2l1vMqLT
         XeWo+dJjxklzK7VY13PLde+odv5kz3djSnLLgyqxtMqGYDl9NUqce9z87tXbOISrmA2H
         kIT3orKsCxTMdlnM/h0LBs+tLuVjqx4bAUchkjhOrbHUjeW+L7MBirpgyuueljXoPWOB
         tt3NcYQF5uYebQplj8BJPcRcycRM61wUwwBrZplisr5z68XstH6Qqe7D++5FQ5UVmiBd
         ZW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUqXq++D2IKqSY9U89pMEK6WQW0g0kqO0xJ/RBRJXvU1wQKJOMoHzNJpfUaY3WDKQmlmlbftBVvRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKVyXW92GSWVIQzbUnMUL5UJcErZZ0fxWJrf5QsBBCArD9lnC
	XWzlC3QOQb57wOiiYdKKgwwffJT0ApnzxzuDVYFCm8PfIyrTM929TZWL+8z7lLtYnAA=
X-Gm-Gg: AY/fxX5kHmL5rAQQF9YDv2vbxTQEVLtcex4pucyCtbEjkH0d7k3tpcV0TqS1TGZKW61
	bqxeZfSK7TYW6XZRq09EYGoo/wnAZR73wiNyk5lZZWmU5Cklb+xTvzujfDnxmjIX9UP4xQadrq0
	3OGMMgQ737G1DVXfyIt7yg9zx4/hS23cSIHeogCVCNqcIQ85p08Y2h6TTRxrK5Rb09jhGC1aKa6
	yyE26LG1av236NLzFZQrxz39p+MWAAA6TdWgQseo2erg5EBu9L2ijiHJz478bVHmRloqBfC9ex0
	63a1jY+j4FjvLFIf2X4pxjaf1G0Mokm42aB9P7+44Uny8vKSqwOTOyaOslO8sksYMGVIqQ+ylEB
	NaPaBfAG/jAx/5wdFMpu6GfuSLTsHVljdDVz6Eu2EYMuJ46miCOKs0q2GkG9FJgDDoIk43VM00H
	AeUYaRY8NgK6A8tqhVm+Mh41vkxCTPKoY4OyewbOTbEKOmDmYuIgjdmd58Kw==
X-Google-Smtp-Source: AGHT+IEK116a+hzlpDVrTZCFE6XuiyE4/HJN0uW0RxfmRWXh+Z7K4wAXn5iM/HwRNMkehyWwuERbtA==
X-Received: by 2002:a17:907:944a:b0:b7c:f5b6:bb52 with SMTP id a640c23a62f3a-b7d23a22c68mr1176743866b.43.1765808279239;
        Mon, 15 Dec 2025 06:17:59 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa29e060sm1447274266b.2.2025.12.15.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 14/17] KEYS: trusted: Migrate to use tee specific driver registration function
Date: Mon, 15 Dec 2025 15:16:44 +0100
Message-ID:  <687c004c32718ba7044ffa9165f33842267a745d.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Zg7mCOEZ4Z6I10BCWu77BY4uJ1KchHXm6/KivSfImCk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhuRfKfm9AOVl8Q/VvcEeDtJDpwUt6Lmf7cq XA9w6mZtvWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYbgAKCRCPgPtYfRL+ TsZpCACirKqeCOo4fBLSL2yhYE15pWpKfHROUGgAZZeKbVTJC+rvy2kfsHLSn29V5iUFd6n/aBB RLMpQStbyHgc70HfHAyCuTdZObAa7h3bTSPGnjOjmLZigHIKG8/6g3+CqxBL8pTOH97z5DxZWNX VvkFx7JbUtReVr6BFh73Afq+MQ+f5TAL8pAFAgaE/nIFZCpM/LtSoIbp2blmkVrNpNEeNa0PYfd RA5nfTVhDCElUIctzgjpURVdvtEdKi8neQAbH6MIaiIU0cei0mA1FAKf6PQmApjRoegk+gVMHbu EBwmm55AFygfkyiAxcXwwxwcne/wKbaG9kvdFW74ByDZmhIM
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee subsystem recently got a set of dedicated functions to register
(and unregister) a tee driver. Make use of them. These care for setting the
driver's bus (so the explicit assignment can be dropped) and the driver
owner (which is an improvement this driver benefits from).

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 security/keys/trusted-keys/trusted_tee.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tee.c b/security/keys/trusted-keys/trusted_tee.c
index aa3d477de6db..3cea9a377955 100644
--- a/security/keys/trusted-keys/trusted_tee.c
+++ b/security/keys/trusted-keys/trusted_tee.c
@@ -264,7 +264,6 @@ static struct tee_client_driver trusted_key_driver = {
 	.id_table	= trusted_key_id_table,
 	.driver		= {
 		.name		= DRIVER_NAME,
-		.bus		= &tee_bus_type,
 		.probe		= trusted_key_probe,
 		.remove		= trusted_key_remove,
 	},
@@ -272,12 +271,12 @@ static struct tee_client_driver trusted_key_driver = {
 
 static int trusted_tee_init(void)
 {
-	return driver_register(&trusted_key_driver.driver);
+	return tee_client_driver_register(&trusted_key_driver);
 }
 
 static void trusted_tee_exit(void)
 {
-	driver_unregister(&trusted_key_driver.driver);
+	tee_client_driver_unregister(&trusted_key_driver);
 }
 
 struct trusted_key_ops trusted_key_tee_ops = {
-- 
2.47.3


