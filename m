Return-Path: <keyrings+bounces-3577-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC36CB6A69
	for <lists+keyrings@lfdr.de>; Thu, 11 Dec 2025 18:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDC8304345C
	for <lists+keyrings@lfdr.de>; Thu, 11 Dec 2025 17:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F0731A076;
	Thu, 11 Dec 2025 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IgjWqMd9"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DE31984C
	for <keyrings@vger.kernel.org>; Thu, 11 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473374; cv=none; b=R2LXDyYqfiZqAl77It+uBVENbNcl7F65ow22lUj7B4f5yDe5PYHEmC7Q/Gd8HQUGS7+bKKPhU6jlQFFkRUtgmRDG4e8tMF/OTA8gzJjbw0LWKieJODcykqetH4xoybP42uMxJLpLtcOpPGUreie4RTAbw2c3oy/bMgraWee3S40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473374; c=relaxed/simple;
	bh=CzasmjigxMDc3RbPNhKzZOfqJrGSXpxinQ87lLaAs6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH1p3sdC48TNMoE7//D06FFQknV44ErsXFXtMs9N52HN8WUiHq0EGbSOZhgh2Uc16GXd4tpyunb7poQCFtvMMXB4CVauj/cpppYtRRDChfZgQtRQIn6Nu31g/eKpGZcytdFF+d8Y4ZlSJbVcIqVweCrX8JcYXpYtRd7Fj2qwiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IgjWqMd9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42f9ece6387so175072f8f.0
        for <keyrings@vger.kernel.org>; Thu, 11 Dec 2025 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473370; x=1766078170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+SHfa6vAHr55xEpYtx8saNp/3XbgtX4zTiJHIYfZ1k=;
        b=IgjWqMd9j04SJLnMtl+zQippp7RKIYHp0avf98okpcRZctk9dwkIOVIm/h4F6e9gNG
         R16rEHDttSX2nlOUb3axfIPs4SuLcNY4LqlwuLMAfkpjnkgJKDR24Lna63MRVnVgDSSC
         jf7dnvXuHKEVjgw9LKWcfMglWf4gAWzWNNPKaDPXx+Y5/0Mr9F4At1yrO9Bbd1Y2nWTg
         jarUF9Kxpy/Tys7m/Ep46iyTD2tiErOlkA+vhf1Z1vlU/EtGTY8GHzudzxKNpqxIo6wC
         /v/R6T0N866RML9olQDqs+ehSlADhbM2VBcSDbTYQmkpmi9a7I1MlpwP6bSwLLS5N/CO
         RNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473370; x=1766078170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n+SHfa6vAHr55xEpYtx8saNp/3XbgtX4zTiJHIYfZ1k=;
        b=B4FK7eE0i/+9pZtKe07PUNv63/jQp3VJRwfKye8zlInOA5wROtJQg2aaR1yzMFFM6F
         8PveQPrx8FjVPswcp25bgRKOM10ihnTdafMicGe8wpqGLdg3yTezJh9F1z5ap1JxIa8A
         G0V1rCGSbjrHQvk2XRtwxRdKO9lYeP6eaa8mI/pxX9weFXExZzMpODb4eVcjlcYAPg/M
         M89GUpz0PRrW8jeU6a64P2WBXOcUKXutz8n4iyF5jfRb1dg8W84cN92aVayENZzPzKzf
         U7xqpxmGE37zxEazTgbM5FBEBDtOxQFrnqkCfcRrIBMOtZFT7v7T6KuVNQCqz9NhXRbF
         ikxg==
X-Forwarded-Encrypted: i=1; AJvYcCUabbKAHwv0/CkNVGa5apBrMr2eDUVjJ9mefKzTHQM3afsRfuLkpnX3EoxMsqjpc959PqAyoVDiAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MB8kFE/V5eHgKzKVnLFlT/BK6e/qQgXpsUqN7jKlOh1NqmN0
	tL/qEIYsNkW98yb2n0P+ql6wLSA4/JeY7HBa15dnElhqath7FnMYeP20gb4g3KhI0/M=
X-Gm-Gg: AY/fxX4Oj9EF5q21C/lAGs/oBpiDR9MTJWIUFA3/8rZvBrElSXhTm++Uw6ScpRKHTIT
	kaFLJXm0AUck5c6od8qBd559gmm0ZIoMl3YCYyGqdx8igNTd0nYOmoK/G8huBaUGcW2zvYbXh7Y
	Uwct+0ipmZO3EGitUlbGbTMh79BTFX64Ws3/uNeUeLvjwg2Er/uz0O77jK6oeZLVjDfnGkJIu4+
	mWr9Ga4ylOHZdO/z6kiUANjPNfSf/qVuCF4NRRztLW2GbiGefQ1TXf6pbSuAc9A3k65k9/cE6a3
	N8VJeneStV7GRcjREegh2/cdjVtzD+TcickxgDWeBEzo0TFqJj24SpbkR8zAjLl2Kms7lGVmGoS
	RT+EEsnS1JzQBHsaVH0taiRHhR0W2MQAWzIFiOah5qSFgup3qVEiVWZi1p8VO+/z2m3sLRYaOVA
	wx7KXPgO0cT+9y6rnCX1fA0QcTiCRKTHA1iHYepLtwE9/JvFe6pg/cMCOaiHZbIJXyrnkhnOa/G
	UQ=
X-Google-Smtp-Source: AGHT+IEVlfLgsF/P2fkju8/EGLrakjagEMlQtCpgWX8RHB5vEnT2Q9O+No1JYvdMM/sRnem0fYfvQQ==
X-Received: by 2002:a05:6000:2012:b0:42b:3978:158e with SMTP id ffacd0b85a97d-42fa3af895fmr6416347f8f.30.1765473370344;
        Thu, 11 Dec 2025 09:16:10 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8b8a973sm7064875f8f.36.2025.12.11.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:09 -0800 (PST)
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
Cc: op-tee@lists.trustedfirmware.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 15/17] KEYS: trusted: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:09 +0100
Message-ID:  <aab4c00b7e89abce7bcd8241c47f3398fb7227f8.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CzasmjigxMDc3RbPNhKzZOfqJrGSXpxinQ87lLaAs6M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvw6brlrzvg29fcU3xprVy3jDUvD6QI895K+A 4P0ITtETEGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8OgAKCRCPgPtYfRL+ ToAKCACHrdHSasYStywLZJGRNAkC64NWvFb/BwKzZCoF8C+nTT45O0JbfN5t/ZZlz3WQUTo5Kj7 m5QHbprAIkb7KlG6c9wMZpIvnIBvKwpE7j+PUzZ2X2+UD2nnn20123zaagJYaJHriTJetqmRK/g fl4EgbD/AzpOofrYMbezG60UvGRmRCPd4NvhNQ6GXkzjyAH5oICnrjI/ufaG65GzQSejD8nT5qK UIdLIccaehc7imlrk0QNv17cD5+/y0ZIwdI2uAIuelzdvUdNHWDYI1/zMNQ3t+FkqM+vgaElDdx 8Ft+pQXoK9ErCp8MIxolmLzr+4840mvUoLiV3YhnVRyUrSkT
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 security/keys/trusted-keys/trusted_tee.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tee.c b/security/keys/trusted-keys/trusted_tee.c
index 3cea9a377955..6e465c8bef5e 100644
--- a/security/keys/trusted-keys/trusted_tee.c
+++ b/security/keys/trusted-keys/trusted_tee.c
@@ -202,9 +202,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 		return 0;
 }
 
-static int trusted_key_probe(struct device *dev)
+static int trusted_key_probe(struct tee_client_device *rng_device)
 {
-	struct tee_client_device *rng_device = to_tee_client_device(dev);
+	struct device *dev = &rng_device->dev;
 	int ret;
 	struct tee_ioctl_open_session_arg sess_arg;
 
@@ -244,13 +244,11 @@ static int trusted_key_probe(struct device *dev)
 	return ret;
 }
 
-static int trusted_key_remove(struct device *dev)
+static void trusted_key_remove(struct tee_client_device *dev)
 {
 	unregister_key_type(&key_type_trusted);
 	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
 	tee_client_close_context(pvt_data.ctx);
-
-	return 0;
 }
 
 static const struct tee_client_device_id trusted_key_id_table[] = {
@@ -261,11 +259,11 @@ static const struct tee_client_device_id trusted_key_id_table[] = {
 MODULE_DEVICE_TABLE(tee, trusted_key_id_table);
 
 static struct tee_client_driver trusted_key_driver = {
+	.probe		= trusted_key_probe,
+	.remove		= trusted_key_remove,
 	.id_table	= trusted_key_id_table,
 	.driver		= {
 		.name		= DRIVER_NAME,
-		.probe		= trusted_key_probe,
-		.remove		= trusted_key_remove,
 	},
 };
 
-- 
2.47.3


