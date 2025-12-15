Return-Path: <keyrings+bounces-3627-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B960CBEDE3
	for <lists+keyrings@lfdr.de>; Mon, 15 Dec 2025 17:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C8F53018EF1
	for <lists+keyrings@lfdr.de>; Mon, 15 Dec 2025 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E75340DA1;
	Mon, 15 Dec 2025 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yizn8qVm"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42233F8C0
	for <keyrings@vger.kernel.org>; Mon, 15 Dec 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808286; cv=none; b=rYHeEyJbw2QNJ5ZKJieft5TzbmC2p0N/JhbFSvefHIbUv1wqbQqctcW9+VKsmF+9stbmrERsgytetJ7zessaxUxYS6rnniz4GIc4kG/a86XXPvECD+9V4Aip9b+aSZuhYTaSglavYC3JV7AEh7fBp0QX+2CRMmrxdxwBUjVcwHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808286; c=relaxed/simple;
	bh=GGyKb0nPpNUP9YxvKC/UL/zntZq4nlTFqMxQrMaeHc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVsDXZGKyEjPSgnKV8i8wQ0/dg1rL3kr7JUy/WwBOSrtQ894Ly44K2pV/VdxZedHaslVD9zDpB4CgyEd9yi0GG7TrrtOP6+XJiEuVXPJnW3TAoCRyCTWm6ATh9xpWlXwRn4fy/b/Rw9QNFb6VlkRy6dXdvB7IBqP+ePgwiTMnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yizn8qVm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7a02592efaso517727466b.1
        for <keyrings@vger.kernel.org>; Mon, 15 Dec 2025 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808281; x=1766413081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhxFEbi3upUhHH0lvs3ziMzH7rdhLkVDsyriiRkxcyM=;
        b=yizn8qVmlHUteyWzETfUZFGprgK080TTkYDl9FAfO3X/CC/uQgH8LL72/tO3nY0nmK
         eH2uRnxFmtnfjqadvHeZDddxpYZh5PkJpd/vvXaHf46joHBI1O867ml6vXu/7K+daZqh
         Sg10xVlzUVvZJ6EUjwtqa0XRNWaA2Ua7F0+RXUVPxTVXC5WgXANt+rL5cudyyvjZ4DX1
         J5Sh97MF0baeHJRSFM5cyCx7NBfUrM0jrDaORHUi8tbSDX/2vcJocI9h16poIzWyPDw/
         ctraDBoLCiZ5bW1PAIkYXSGZqljS1OtIISaRXXnKjrYX1EE+FSbZbuvylLSQp+gFUywT
         km4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808281; x=1766413081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhxFEbi3upUhHH0lvs3ziMzH7rdhLkVDsyriiRkxcyM=;
        b=Vehl3kMwD3HgIazLnItn8BXLZqgpOp5NBVP5T1fwM1C3vN5De5Ln1tS9NdFf8DrG6w
         KqUATb0iREOfePrgcZ9qxPxW3ALjBbAQfPAU0S/QLQvy4prjuEBaXGMFsB0JtifE+R3k
         AMvaZwKsIVtQHPkiL3TIkjKmu4P8X25z/xa5L251/hEse9smgKZe8Mt6hRFf3TQYDaOz
         ITu9h3QhNFwShqYVTgRjsT5evleqN46lUGZ2GIiQbtVNryBIp1BDOtgbUUs4Xw0bu+aQ
         Ok67qv4xVOkzBKQBa1AkoSg0Hdg9KRcS0fdOdm3EdNIG/hynZqrFLwF0XO30MQyAyi3p
         Gdig==
X-Forwarded-Encrypted: i=1; AJvYcCVWJq1/x/Iq9mLsegAxdxwz6tfyvmQTBJlOC3zQ4CTra/tWkmc6Y6SyhHrsnyfdWfavihC8aaQzLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrozotJl0U3lDsXdY67R1m8l/5jvA/jAyDg05gs6Hkv87uKO2
	rlxhoFTEj4sHqEuFfHGtm5K0neRbovpjDX7Vpyg3AuFAzXMmjMYgBsqUR8hFX8a7UEY=
X-Gm-Gg: AY/fxX7dBtwA1F80/hR9wm+kWisp9sP5seRcLI/mYeV7eXiHsaBq4w26+OFQN1Vu1dL
	E+cEy3M4pafv5zDeKmAIu/utQm1RmkVlJHfFhQYzSME1I5FmmGskhHebHXHAMf2adT2T/SkFVqt
	dVnwIdnRHo7w7vvzhY11hIdiABC5+BWNZOLQl/CRO+3DzooFU8aIG6ar5UMTBgmo5ugrocQEFrf
	StWr5XbEq4jSc0bJjnKcn2814SmJsSqblsOyFoZ8IK8ITaWDM3PyYErw/66CdMa6r9Aj4mY1HDX
	HFCXQeF/g3NPRvGiPvvNE9OExCwHy1EzxG43BeWhdEuMHJGljg3RE2XOxJqQw24UP0qXf2BoV8U
	kE8sQNv3UN0An03ktuiyVmwy7YpFTTFdyfM+H089hVqPj2v1dCrBre4korxCoBSejXgWs6agce4
	mfdkSsLULWiWDb6FIU+0L4a9FND1xOqSyidYVsoDNV5t1ZeFwgg57qu5hiaWI5PHV61GRA
X-Google-Smtp-Source: AGHT+IHC8ujpn/jRAp3uyUfhPlLVYnf8gdfe5eEvlFd2Ct3yaq9KShqsTrao9oJk1KAsuZl7TA5Hxw==
X-Received: by 2002:a17:907:7b82:b0:b70:68d7:ac0c with SMTP id a640c23a62f3a-b7d238ddd7emr957125366b.42.1765808281128;
        Mon, 15 Dec 2025 06:18:01 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa57190dsm1442761666b.49.2025.12.15.06.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:18:00 -0800 (PST)
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
Subject: [PATCH v2 15/17] KEYS: trusted: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:45 +0100
Message-ID:  <ad8aaa343c1e8523659259290f63aea8be906977.1765791463.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GGyKb0nPpNUP9YxvKC/UL/zntZq4nlTFqMxQrMaeHc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhwtaw6vWGcyIGKsWICqFr37WWt86tvJxrvx 1eTqfVDJZqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYcAAKCRCPgPtYfRL+ Th3cB/9e3Pv5r3zMgBKsAgjAsHEhpC0EgCY2oqRVfxKl8HHNjl+lB20MGJ2Q8pSnEUNYokQO3QL mOTOzUqSZn9hAaGG/5LKUE70SRu5xo1OgksDBfRcBInzXTVG7RDE0gQMoPbW3O/QimI6W2kQfJx KesCYRfngtF0s9Jq1wiZvB24whWT0ZvkV2bFXypQVF3Ta77WO8PtMmx3Bk+0u+EkLt3e/pfof0U NylFPVRHjBIX4DRRlA9oRL2MT4Npc9hTQBUo9iUHIoOxuI3uaEzDXB/69vwGC5Y1KsCDA+XS5Ma emNcInkIoXdw9B5y8cwnaf8ckyn6/3KiWopHnE+ahW+5sT3k
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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


