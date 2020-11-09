Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15282ABDF2
	for <lists+keyrings@lfdr.de>; Mon,  9 Nov 2020 14:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKIN5G (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 9 Nov 2020 08:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgKIN5G (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 9 Nov 2020 08:57:06 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9E4C0613CF;
        Mon,  9 Nov 2020 05:57:06 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id h6so7221878pgk.4;
        Mon, 09 Nov 2020 05:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2rHmBfp4UJJgsx0SpTO4LT/XHGEr6OIj/CtIKO7hEw=;
        b=taWHgWmWuTburqWSv9/sfo4twY8VRLjWPrV+Szo1cm890NyBVg7bcBJBPfOmy4nrBD
         KTFtVadJsVGeRBQ1DZpsL3SJkpGGfPt5WK/+IMi0Tdux1olCbthUTJe4aC2G0A1jjHAl
         2VIaddeeHqdYYytI7BqhKb7Rt13RPpzCtmMBmR0aWmc6UC376Nau90ongdT31LTWWxsa
         Zn9w9s6avUDiJAqi++7jM6oLPG6L5kyEaqG+906W//xmEL1k1tyZE8bnlLnrIKxaGaWz
         SVMhNRpnEuhGO8HFyPU0nUr0F8uT9XpdGcCksrwN/ynldQVt6K2sNC8KwaB3IYAQUKk+
         SpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2rHmBfp4UJJgsx0SpTO4LT/XHGEr6OIj/CtIKO7hEw=;
        b=FJjADQ+qdvbEdMLPOPlX7S+RxttGTLmMUtNYgpxvJxR/YWwpkHUVIjuOP1JS/OHM16
         xpf/9f5JrN8vj2kUQnMZeGWe/l8Hak3AyELnctSTTaA1/Y04S0PnujdD2l/emSFmHQTi
         CTS7LfqLYc3qf+f9R9TJuCwC765pqIQHe5mg5O1wE/PXSaFrzcHarYmQGiDVU0j+HXPa
         pfpV6wa78Ay3f2XncK/eO8ZbcYfA+yyTwHQMFvagTcw8dbpvES8IlaceP5yK2bkk5UK9
         P42QIfVocvo1A2CKC5/3wb0clhpBde+F3mae9sorIqn88B/voLog/F2lfN7gPMfmeaKS
         GhCQ==
X-Gm-Message-State: AOAM533oaEzL/dcodnr2f8SwORw2L6wELFXLC3N0d6HQndR/r6/uwTMd
        lxT6Pw0wTPzZDFpB9KKMu6rVKQmgA1A=
X-Google-Smtp-Source: ABdhPJxQ3LpaB0xCE/9fy+VG3o1Z5OvvZWDwKLK9SUtH44/KFRDgteMSfdQy1xQvuMuF65fpCWSpeQ==
X-Received: by 2002:aa7:86d8:0:b029:18b:585b:3b16 with SMTP id h24-20020aa786d80000b029018b585b3b16mr13335987pfo.72.1604930226165;
        Mon, 09 Nov 2020 05:57:06 -0800 (PST)
Received: from localhost.localdomain (ec2-54-250-46-57.ap-northeast-1.compute.amazonaws.com. [54.250.46.57])
        by smtp.gmail.com with ESMTPSA id ck4sm12821376pjb.50.2020.11.09.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:57:05 -0800 (PST)
From:   Dawning <dawning.pang@gmail.com>
To:     dhowells@redhat.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, tianjia.zhang@linux.alibaba.com
Cc:     gilad@benyossef.com, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        dawning.pang@gmail.com
Subject: [PATCH v1] include: crypto - remove the unused include
Date:   Mon,  9 Nov 2020 21:56:50 +0800
Message-Id: <20201109135650.31831-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In the public_key.h file, the #include <crypto/akcipher.h> is not necessary

Fixes: 215525639631a("X.509: support OSCCA SM2-with-SM3 certificate verification")
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Signed-off-by: Dawning <dawning.pang@gmail.com>
---
 include/crypto/public_key.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 948c5203ca9c..47accec68cb0 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -12,7 +12,6 @@
 
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
-#include <crypto/akcipher.h>
 
 /*
  * Cryptographic data for the public-key subtype of the asymmetric key type.
-- 
2.25.1

