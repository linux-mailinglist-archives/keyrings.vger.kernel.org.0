Return-Path: <keyrings+bounces-1849-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF09453EA
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 23:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4E81C22C85
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 21:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5042C14B943;
	Thu,  1 Aug 2024 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=kev009.com header.i=@kev009.com header.b="GeiNHcFe"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E4140E22
	for <keyrings@vger.kernel.org>; Thu,  1 Aug 2024 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722546130; cv=none; b=HEPBffQvEGG1ky53cXgYs6YHOGpWfQL6b7KPpxBpmASb1K3N120G75hv0p6z9RPIJh7asemxsGD0HcSBamvnmJwbH2RMId87L40gqy0Rzf8i5uU1ahYbliQF1cY58z7x8H8cQ1X70utIzPhFGHMErAgOagccTzWQHH6YMFU6dhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722546130; c=relaxed/simple;
	bh=ouaxn2NcW67BXplYvI5175YWP+upBfvE611Qk+dIGbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADSpZyOagb9T9xA64h0p7W7Jlx9mOYTua7ggkvc+fs9MR5EmjQFj5GjNBRFPZ854ilAOylKPuYdUCWXuRKhDkO18t+YHhW9fkylch6kj0ViFx4kfa4XnM2OOoen+SeGM+PfRfXu0c5SmRbY7nDtKtVTGu86MCPZxu9aWpvpBUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com; spf=pass smtp.mailfrom=kev009.com; dkim=fail (0-bit key) header.d=kev009.com header.i=@kev009.com header.b=GeiNHcFe reason="key not found in DNS"; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kev009.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7a10b293432so4709245a12.0
        for <keyrings@vger.kernel.org>; Thu, 01 Aug 2024 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kev009.com; s=google; t=1722546127; x=1723150927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZBa5hQNDCUK8nFbEn3l9dAtyANR0fie1mHylb7O+/8=;
        b=GeiNHcFeROPukD5j3SjcMXRvMufh0nBm7JmJUWL16/lr2akegQz5qWdlHuAkW+gh+7
         wElgwcbOw0JA3tcp7qXSxo/77lu6kFDHyBttbXg1BVarcUpOTKzeLIGVwnitTKhh8fhZ
         k0qQHb0pGzP7JFqzySW3FUFrPIzsNpzKafsro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722546127; x=1723150927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZBa5hQNDCUK8nFbEn3l9dAtyANR0fie1mHylb7O+/8=;
        b=A8pDcMlg1OFsx4fwLjz9Y33ZAZ5+CBGe7xCI4GrrIAuRAWZk01X1dFOcj88bxRIKf2
         ZYEvhWSsNtgqLXhXkfoTKvBiZip0cr7v15WCIQr6knlmoBvrdYTeUKolb3jGtuBrjJi3
         5tn+IeSUQMrTJ7V4ThtqQzzipiKLRXOecfViV6WjlZOidL038J/ClSGSbwrEtRoyA+eA
         ulQm54dPz3wR7Ntbg5xE1+C+ZJBUlv7EC+6rdgkjT9w7OR4tff9TT3GLOBbzPqo3XLrx
         wZ+ZadTkCTfpXI9SGwNVcbS54LMnx9TV1k3K5uXwDtL7JShmIfZz06Api02+dIsmvMYT
         EA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVj/549yhFT9Kw9sLcdfUJ3NEP5e7rOdNGQrkL2XUDdVlT63gxAUx1m3LoZg5Oq+XtNwz7BSJdcFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL7w9zEd5j8W01zcBjTMbM+2IURI6ytGg3ch94cDoYw4LNz3vd
	Ws1qoNc6cWpA7Pc5FcIzRqEVh/XiOzDMwJjtNkXPZFa1YCcPxLH7qjh3fktzsA==
X-Google-Smtp-Source: AGHT+IFTkoLsxIFBjWusXPyAlMPN2id+iqTdsbfgYbH/nzk9F1qJtDu3RaYTbE6JaEP5B5bJ7nGZjA==
X-Received: by 2002:a17:90b:1a87:b0:2cd:2f63:a447 with SMTP id 98e67ed59e1d1-2cff95696cbmr1704521a91.36.1722546127047;
        Thu, 01 Aug 2024 14:02:07 -0700 (PDT)
Received: from kev-ws-aurora.cv0.bbox.io ([38.196.160.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc45c3afsm3837085a91.33.2024.08.01.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 14:02:06 -0700 (PDT)
From: Kevin Bowling <kevin.bowling@kev009.com>
To: dhowells@redhat.com,
	keyrings@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Bowling <kevin.bowling@kev009.com>,
	stable@vger.kernel.org
Subject: [PATCH] KEYS: Print digitalSignature and CA link errors
Date: Thu,  1 Aug 2024 14:01:55 -0700
Message-ID: <20240801210155.89097-1-kevin.bowling@kev009.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ENOKEY is overloaded for several different failure types in these link
functions.  In addition, by the time we are consuming the return several
other methods can return ENOKEY.  Add some error prints to help diagnose
fundamental certificate issues.

Cc: stable@vger.kernel.org
Signed-off-by: Kevin Bowling <kevin.bowling@kev009.com>
---
 crypto/asymmetric_keys/restrict.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index afcd4d101ac5..472561e451b3 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -140,14 +140,20 @@ int restrict_link_by_ca(struct key *dest_keyring,
 	pkey = payload->data[asym_crypto];
 	if (!pkey)
 		return -ENOPKG;
-	if (!test_bit(KEY_EFLAG_CA, &pkey->key_eflags))
+	if (!test_bit(KEY_EFLAG_CA, &pkey->key_eflags)) {
+		pr_err("Missing CA usage bit\n");
 		return -ENOKEY;
-	if (!test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags))
+	}
+	if (!test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags)) {
+		pr_err("Missing keyCertSign usage bit\n");
 		return -ENOKEY;
+	}
 	if (!IS_ENABLED(CONFIG_INTEGRITY_CA_MACHINE_KEYRING_MAX))
 		return 0;
-	if (test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags))
+	if (test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags)) {
+		pr_err("Unexpected digitalSignature usage bit\n");
 		return -ENOKEY;
+	}
 
 	return 0;
 }
@@ -183,14 +189,20 @@ int restrict_link_by_digsig(struct key *dest_keyring,
 	if (!pkey)
 		return -ENOPKG;
 
-	if (!test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags))
+	if (!test_bit(KEY_EFLAG_DIGITALSIG, &pkey->key_eflags)) {
+		pr_err("Missing digitalSignature usage bit\n");
 		return -ENOKEY;
+	}
 
-	if (test_bit(KEY_EFLAG_CA, &pkey->key_eflags))
+	if (test_bit(KEY_EFLAG_CA, &pkey->key_eflags)) {
+		pr_err("Unexpected CA usage bit\n");
 		return -ENOKEY;
+	}
 
-	if (test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags))
+	if (test_bit(KEY_EFLAG_KEYCERTSIGN, &pkey->key_eflags)) {
+		pr_err("Unexpected keyCertSign usage bit\n");
 		return -ENOKEY;
+	}
 
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  trust_keyring);
-- 
2.46.0


