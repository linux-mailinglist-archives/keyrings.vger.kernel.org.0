Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8C3318C0C
	for <lists+keyrings@lfdr.de>; Thu, 11 Feb 2021 14:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBKN3d (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Feb 2021 08:29:33 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54989 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhBKNZs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Feb 2021 08:25:48 -0500
Received: by mail-wm1-f51.google.com with SMTP id w4so5541728wmi.4
        for <keyrings@vger.kernel.org>; Thu, 11 Feb 2021 05:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVOAMLQtHgH63cMZg+F/kTpWBAiKNH2of3Em41CxuKU=;
        b=ir10PXr9PwmBMWKMnf/FxlWha2LCHONMN2uCvaZb+ql85T82wdD4U/9fPtRY65oZHx
         BFjrZj44DSjS/szHgF+uxa7WGXfFHI5RQ9z5CCQwh+oKrAym9uTnXDWDznitqdV8NQay
         kjAvbdjmMtj8xH16WGVHJXCR+FLTvECK8Y0tvx893jf4Tu5kFDM2M3jtzDMQ2BGDNroL
         J99cAeTX4hC5eNVIwMz0c2KzKyD+nUWaHfig4UkY03FsfddlCYWHpj4FB093n9pmTshd
         npvQzro/9U25RooI6zdBuKGjpPk+UuWdH5comqudKmIY4AV/HgHX3J6ICurZiAffrlAi
         2yTg==
X-Gm-Message-State: AOAM532OUGs3fWmSFbybPuQ+gKEDuMGfIfhgmkHQD4YUc/PtDni/9YoR
        8avNzLYoXyYRiT7r2uzKPokUXnlXYvxBXeo6
X-Google-Smtp-Source: ABdhPJye81XaiYaPrp+yoxRuWXdHmOI+9MWJCCMupzNjDIYiQJmBWfOVWzGJhmsXRn+7eRwLuPkBHg==
X-Received: by 2002:a05:600c:1552:: with SMTP id f18mr5173543wmg.46.1613049903907;
        Thu, 11 Feb 2021 05:25:03 -0800 (PST)
Received: from localhost.localdomain ([82.213.213.214])
        by smtp.gmail.com with ESMTPSA id n5sm8558489wmq.7.2021.02.11.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 05:25:03 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH v3 1/2] keys: crypto: Replace BUG_ON() with WARN() in find_asymmetric_key()
Date:   Thu, 11 Feb 2021 14:24:28 +0100
Message-Id: <20210211132429.283122-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Jarkko Sakkinen <jarkko@kernel.org>

BUG_ON() should not be used in the kernel code, unless there are
exceptional reasons to do so. Replace BUG_ON() with WARN() and
return.

Cc: stable@vger.kernel.org
Fixes: b3811d36a3e7 ("KEYS: checking the input id parameters before finding asymmetric key")
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
No changes from original submission by Jarkko.

 crypto/asymmetric_keys/asymmetric_type.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 33e77d846ca..47cc88fa0fa 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -54,7 +54,10 @@ struct key *find_asymmetric_key(struct key *keyring,
 	char *req, *p;
 	int len;
 
-	BUG_ON(!id_0 && !id_1);
+	if (!id_0 && !id_1) {
+		WARN(1, "All ID's are NULL\n");
+		return ERR_PTR(-EINVAL);
+	}
 
 	if (id_0) {
 		lookup = id_0->data;
-- 
2.27.0

