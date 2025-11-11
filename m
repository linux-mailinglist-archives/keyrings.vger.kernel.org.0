Return-Path: <keyrings+bounces-3320-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0BC4E240
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 14:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D57188A548
	for <lists+keyrings@lfdr.de>; Tue, 11 Nov 2025 13:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C034250B;
	Tue, 11 Nov 2025 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/eyGGKq"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034A32827A
	for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868206; cv=none; b=uwJ6ExA2ffpbIhgMH0FL96AbVbO3lUwmkdqw2UffsILLpeVVu9wn/39pgRSZedH9suWQ1U8ds9fhDtBaPK7+fSHo/hDtw00I2La/cMNy5GOmJupTggYTfWlJ/Z3TVaNRQZjISxHdtuNA2zVOmX5u84cmIsKVh16f6ff9Ynzqxq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868206; c=relaxed/simple;
	bh=C4jDMoBv98CSnFsm9ZYy/OozYXX7fEl+I/JjNn3CwEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BNqWKK6lViZsP2axvKgA6WgIr/Jp76BScXpkLAE73lNtAHYnB7X/BByIEgyv1sxcBvJwkuXEfWnWgUYENoqgzrAXY6xz4vY1efBTTdvfGbLyvzlnjC3nigKHdjAfjbhlMvjApctB2hfUPpawpSWUd92v7Ub5GOGJ3cGWmscYPJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/eyGGKq; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so2236647a12.0
        for <keyrings@vger.kernel.org>; Tue, 11 Nov 2025 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762868205; x=1763473005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsHsngf+EnNDyi9/PjOxDn0IIEfbCT4oM4rKfdkxmWQ=;
        b=b/eyGGKqcArFnC9KG3KCZ61yAhQNZIFh4UMJ8xtCC7MA5sYbBFJ0YN1Xzorl/OzgKU
         8ewoAcWwTJS9u+o/5eAV4Og/z5m33rOF/RV0F7+uwE1cL/E+GorPP9QTDDHMmufLxuFV
         nYD+zU5dKHH4hKe/bnGdL2ow/b5ZuuN2qYbs8YMCCZBrmcyzT7RKkRBSI4cyWRDyEERz
         iVz77q+FLjAmVBYcnDAV+TUxlyRPFo/qw4ipWjJsQzHbx3x9Y2zAFSc2rhs66qUwR8kL
         kVROH/IhVzJAfJuaRQNHYuanbPFahwY0k0WVZgqYPkoybMi2OdhbzJJoaC/nuxSHe482
         B89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868205; x=1763473005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsHsngf+EnNDyi9/PjOxDn0IIEfbCT4oM4rKfdkxmWQ=;
        b=jj38ojuAGFsqHNEnYDAcxyGjJ2thqT/wyUYQACJMpHhxFqLgoi/fSdl8lDcexZs3YV
         DZ+VDwTzdjlH0kyvj/pMX2OAqluAsXaXfhpaEI0LgKOHGStsZFDgBfm2IzC9kPxPJ3+3
         uFo3dRdghJcvPFotqOZvENWtWeaS8QPboHsYfeAK6rrOFa+sz2vyd86QG46G7pkOKfbi
         UGDCiJ0nxV6cWi43DempH2NMbIODQQdy7m3yW6zDjjaE4HmZw2je3cYPefD8sjdi74m7
         kPBpTisoprXh1hrlPOHwNbqqVlUMbRsOKiqOiB8QGmmp3LoFvHV9qEm67D0UKAaRx/1Z
         BodA==
X-Gm-Message-State: AOJu0Yy5HBjH5cJZGsIRYXkFGKtgfPa0iF5pl1jCqj9qfFAjdRo1VoUa
	B97yuD9ir/i9l8/z7ro+IS+T+2GpC3JisVWvJgPa0hGoYPwsrBfoqb09K1XJ9A==
X-Gm-Gg: ASbGncv8d7Yxg/IYBWRgsm8YDcw3b2op+MwrTkepXiYnn53Fcx7Hi6/YkWNQU1TITKp
	MUxjz5/tuU0pXLd/AKJeGitT9SqyE9FdMYTc/UKOSG+QLKRjWGuu9DsVyTa6l7wMF6Yo67JFRvx
	NHw0Cs1gErtP28wOx77ROwtiP+XyWt0WZuFsedHQEy1VlFHyxJLPjPoRWyIFYTh1P0tOWYjkFg9
	2Oru3lJMV6CGx57nZ6vh2SfFpQXDky2iLNheKoyYftjx6hcb5ES/44sGk1cYIX39+7PgQhoA7vK
	Lvlq3gDX1rV55mJczgHOOKWWFG1k+agk1I9+3tUD695Oh8HqsCTQH9WM+zvW3nX5DL6V94YBf2B
	BJ90dgOmgOUHQ8ovEqLc7gjdLeKo58AA2hOABwOfWOeikbwnQBnoanK0VvkvXgIfwPqrC9pbfjS
	xKP044VymMog==
X-Google-Smtp-Source: AGHT+IGiHOIAjf30lk+UFmNrFQaWvBdKfD8cfNSSkXgEJsYVgGWHQ+DWs0KkzZMegs6oZI7jmZ85kQ==
X-Received: by 2002:a17:902:fc8f:b0:295:7804:13b7 with SMTP id d9443c01a7336-297e53f8126mr144158995ad.10.1762868204702;
        Tue, 11 Nov 2025 05:36:44 -0800 (PST)
Received: from aheev.home ([2401:4900:8fcc:9f81:b4f9:45ad:465b:1f4a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17ad4asm15405645b3a.37.2025.11.11.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 05:36:44 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Tue, 11 Nov 2025 19:06:29 +0530
Subject: [PATCH v2] crypto: asymmetric_keys: fix uninitialized pointers
 with free attribute
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-aheev-uninitialized-free-attr-crypto-v2-1-33699a37a3ed@gmail.com>
X-B4-Tracking: v=1; b=H4sIANw7E2kC/5XNQQ6CMBCF4auQrh3DFEjQlfcwLEo7wCTQkrY2I
 uHuVm7g8n+L9+0ikGcK4l7swlPiwM7mkJdC6EnZkYBNbiFL2SCWDaiJKMHLsuXIauYPGRg8Eag
 YPWi/rdFBr281aeylbCqRr1ZPA79P5tnlnjhE57dTTfhb/wQSAkJbGYWEJbW6foyL4vmq3SK64
 zi+7FeCA9gAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-crypto-bc94ec1b2253
To: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
 Ignat Korchagin <ignat@cloudflare.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=C4jDMoBv98CSnFsm9ZYy/OozYXX7fEl+I/JjNn3CwEM=;
 b=kA0DAAoWlj2i1D/XexwByyZiAGkTO+Kh2b6RqD7EGmO/BCI/q1zMuOv1Th2Kz5mOb/1thRizI
 Ih1BAAWCgAdFiEEARUaTi6yGpBew2L2lj2i1D/XexwFAmkTO+IACgkQlj2i1D/Xexyo6AEA3d1+
 BqJbTn/YkvKO/IkOQ28XtN83T+r08K3xzqHaQEsA/1lPQwd07Lp4NP1oGLvR7m2Otvo6xT3FMTY
 JxZW1PMkB
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Uninitialized pointers with `__free` attribute can cause undefined
behavior as the memory assigned randomly to the pointer is freed
automatically when the pointer goes out of scope.

crypto/asymmetric_keys doesn't have any bugs related to this as of now,
but, it is better to initialize and assign pointers with `__free`
attribute in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Changes in v2:
- moved declarations to the top and initialized them with NULL
- Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-crypto-v1-1-83da1e10e8c4@gmail.com
---
 crypto/asymmetric_keys/x509_cert_parser.c | 2 +-
 crypto/asymmetric_keys/x509_public_key.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 8df3fa60a44f80fbd71af17faeca2e92b6cc03ce..b37cae914987b69c996d6559058c00f13c92b5b9 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -60,7 +60,7 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
  */
 struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 {
-	struct x509_certificate *cert __free(x509_free_certificate);
+	struct x509_certificate *cert __free(x509_free_certificate) = NULL;
 	struct x509_parse_context *ctx __free(kfree) = NULL;
 	struct asymmetric_key_id *kid;
 	long ret;
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 8409d7d36cb4f3582e15f9ee4d25f302b3b29358..12e3341e806b8db93803325a96a3821fd5d0a9f0 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -148,7 +148,7 @@ int x509_check_for_self_signed(struct x509_certificate *cert)
  */
 static int x509_key_preparse(struct key_preparsed_payload *prep)
 {
-	struct x509_certificate *cert __free(x509_free_certificate);
+	struct x509_certificate *cert __free(x509_free_certificate) = NULL;
 	struct asymmetric_key_ids *kids __free(kfree) = NULL;
 	char *p, *desc __free(kfree) = NULL;
 	const char *q;

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-crypto-bc94ec1b2253

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


