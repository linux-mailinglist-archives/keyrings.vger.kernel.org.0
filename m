Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03FC1A2845
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2Unm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:42 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:42148 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbfH2Unm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:42 -0400
Received: by mail-qt1-f181.google.com with SMTP id t12so5249451qtp.9
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FnRArtw8XnMRQK8tYC3iudG6wTbQ4eIhzzE/JDxzF0Q=;
        b=GQ1KrXtw8IxA+H+M2azSuXW2LNIJ6mv1tcmXOCn6MOnSdkpNgpX/U73pOwUNbMDdMl
         1XQanFS+QPYWsliYN2hTfUva4jnN1rKSZecj4OIhoB4pX55Djkn9vrlZN8pk01h01GFW
         KVNMKXvP50KhhMgn7znFHeZvaGVYT7K6hY7PLFJgmLeqqk8veG8XCRwMtXekW0ssKp4Y
         Mh7RhiI7sz6Z2vHSa6xCuu9fjBXCYmiItes0NqYiM/k1TJLrvNf8xtsJ5Q+y/TIonhGe
         MgEW0GNVjdIGGowIrlSd9Zm9iQIWf0+RiSA9pBeFBKiffmSARe+Zm9T+S4mbkaSr7uFY
         YhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnRArtw8XnMRQK8tYC3iudG6wTbQ4eIhzzE/JDxzF0Q=;
        b=Nm52fTbXeXOQA1n8/FCG3CAMjZnP9OgvY+EWNqtuJmmXrO2rcc+M5Ld+YgLHqRQfJi
         UuoAeFcg8Cf/ITQ/98eQU4tZ9pq0sjeKP5P9F1v6snOAlk1PE3ZysxqIXIYH6plEBvIO
         vbY0b0XWMO1TsUFFoRYD6lRfmiQTNjtx7S8+LMehPQ8jJn6G/cSvo6IgEPZHwCBdSY78
         XEWYzVsuxCmKcxlQOD81vN59/cD+WKv/eJpyd6XFOzTbxgVIscKN0D6UxOKVAm8yWaG0
         ZkiuScb+P6aj2gthPnzsitLVG4xbhSiXAW+b5JMl1CQKQe1uhaTLPpf/8DgDp6n8WUiL
         UvAQ==
X-Gm-Message-State: APjAAAU4LBzyl0D2lvmhheLNlgf8nIHLggsBvRAMgMb0uetuitG+Dirf
        ROsigTsvUWSfCpgvQL6TliZ8/tWI
X-Google-Smtp-Source: APXvYqwLMBgPutWbSUKbN9FfqN9WG/aneD4QKB5YgzlgmLZqYMCP/Rns4YsZ6sO8SdjmnEyUeSYdTQ==
X-Received: by 2002:a0c:b44a:: with SMTP id e10mr5129529qvf.172.1567111421517;
        Thu, 29 Aug 2019 13:43:41 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id z33sm1613710qtc.56.2019.08.29.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:41 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 06/13] tests/revoke: test key revokation in the revoke tests
Date:   Thu, 29 Aug 2019 16:43:14 -0400
Message-Id: <20190829204322.8015-7-mathstuf@gmail.com>
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

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/revoke/valid/runtest.sh  | 20 ++++++++++++++++++++
 tests/keyctl/timeout/valid/runtest.sh | 17 -----------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/tests/keyctl/revoke/valid/runtest.sh b/tests/keyctl/revoke/valid/runtest.sh
index b015acc..a499c0b 100644
--- a/tests/keyctl/revoke/valid/runtest.sh
+++ b/tests/keyctl/revoke/valid/runtest.sh
@@ -45,6 +45,16 @@ marker "CHECK NO READ PAYLOAD"
 print_key --fail $keyid
 expect_error EKEYREVOKED
 
+# invalidating the new keyring should also fail
+marker "CHECK NO SET KEY TIMEOUT"
+timeout_key --fail $keyid 20
+expect_error EKEYREVOKED
+
+# invalidating the new keyring should also fail
+marker "CHECK NO INVALIDATE KEY"
+invalidate_key --fail $keyid
+expect_error EKEYREVOKED
+
 # remove the key we added
 marker "UNLINK KEY"
 unlink_key $keyid $keyringid
@@ -63,6 +73,16 @@ marker "CHECK NO VALIDATE KEYRING"
 describe_key --fail $keyringid
 expect_error EKEYREVOKED
 
+# invalidating the new keyring should also fail
+marker "CHECK NO SET KEYRING TIMEOUT"
+timeout_key --fail $keyringid 20
+expect_error EKEYREVOKED
+
+# invalidating the new keyring should also fail
+marker "CHECK NO INVALIDATE KEYRING"
+invalidate_key --fail $keyringid
+expect_error EKEYREVOKED
+
 # remove the keyring we added
 marker "UNLINK KEYRING"
 unlink_key $keyringid @s
diff --git a/tests/keyctl/timeout/valid/runtest.sh b/tests/keyctl/timeout/valid/runtest.sh
index 5f7f2f3..ce27b68 100644
--- a/tests/keyctl/timeout/valid/runtest.sh
+++ b/tests/keyctl/timeout/valid/runtest.sh
@@ -77,23 +77,6 @@ unlink_key $keyid $keyringid
 marker "ADD KEY"
 create_key --new=keyid user lizard gizzard $keyringid
 
-# set a silly timeout on the key
-marker "SET BIG TIMEOUT"
-timeout_key $keyid 10000000
-
-# revoke the key
-marker "REVOKE KEY"
-revoke_key $keyid
-
-# check we can no longer set the key's timeout
-marker "CHECK NO SET KEY TIMEOUT"
-timeout_key --fail $keyid 20
-expect_error EKEYREVOKED
-
-# remove the key we added
-marker "UNLINK KEY"
-unlink_key $keyid $keyringid
-
 # revoke the keyring
 marker "TIMEOUT KEYRING"
 timeout_key $keyringid 1
-- 
2.21.0

