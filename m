Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701F9A2850
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfH2Unr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:47 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33982 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfH2Unq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:46 -0400
Received: by mail-qk1-f194.google.com with SMTP id m10so4282179qkk.1
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=ruJ1nzRhuDL71+r2gDHfS+rTkgfcicvePywYwnEGwXPebGEMSFnvwBE4n1t2DFyZlj
         QMuzw56M4k0PxKCiie1u9hfVBAZ7fbz60iT07/dwkAYujqW/CV5m5lOqSdMUaV8HbYlt
         iFUunn/eBq0GrgLqFjMxQEbVKWdInxLut627xJvUKOG8ip5XXUKCcqd5k7kWjG6zasQc
         +8wuNlojz8PNs7KPRBi0v+N21U0Tfty0it4W4GTAiDXjVmP/WqBn2xyWOBjRsepzTbx5
         8dnD6rkZ0jEVYXmcj3V0YIxtB/BAV1I1TC93ObAMZqUa9O6lqX7wUDEGpq6YdDQm7Y5P
         QhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=eVhLjIp4RwM2k7p1u0GmHu5bpAAZxEekmv8Z4/57+RB+r16Qkwu8JZmdw4zZE3Aiqu
         /89AJYqxZqPjTeejJXKPX8HB+kibHr6tPmm1J/92FUcvu3eyBssd8wCWaHwGGJ8gbiCN
         tSv22AIzeNxKNy4wbmQCjE8ncjQ1hrARAAYL8KOWl4U2ikrwukIOcY/CXAGKH9TLVtkB
         /Dxb6Ligi2AgSMuCOAuUNJnQAf5hpw6uREB6YKHUh37SoQkRGOPQMTpU+e7vb1Bz9O8r
         t1/MN1xyReQlqulg8YUCgHpJlwHxiW0mLKeRI4ICBfkSrIixGsNliKKnzC82fV3lKXbX
         MDkg==
X-Gm-Message-State: APjAAAUUoxCv2Wl+OuIc64JrgAOjJMXOaxq8qsXIgSpauTLszQ+Lnmk5
        ODMVhvDLQ5SbUofxke49bSH9qzoa
X-Google-Smtp-Source: APXvYqz2Wj1TisNaoUrJ+m7ZGB6mjM2eixSTcAz2fe7YqVQj/+aTYhuHCBgLPMbgjMX7nHlWW0jAqA==
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr11376208qka.195.1567111425803;
        Thu, 29 Aug 2019 13:43:45 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id y188sm1986344qkc.29.2019.08.29.13.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:45 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 11/13] tests/reading: remove revokation test
Date:   Thu, 29 Aug 2019 16:43:19 -0400
Message-Id: <20190829204322.8015-12-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829204322.8015-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
 <20190829204322.8015-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is already tested in the revokation test script.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/reading/valid/runtest.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
index 2fb88b9..9a533ef 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -78,12 +78,6 @@ set_key_perm $keyid 0x370000
 print_key $keyid
 expect_payload payload "gizzard"
 
-# revoke the key
-marker "REVOKE KEY"
-revoke_key $keyid
-print_key --fail $keyid
-expect_error EKEYREVOKED
-
 # remove the keyring we added
 marker "UNLINK KEYRING"
 unlink_key $keyringid @s
-- 
2.21.0

