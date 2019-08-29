Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E33AAA2817
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH2Ufu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:50 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:45314 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfH2Ufu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:50 -0400
Received: by mail-qk1-f169.google.com with SMTP id m2so4182029qki.12
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oLVvlqarfNnEaWHjSCK5XXPlW0GYZ5GzQ0LWoExBWMk=;
        b=ksoCEujm0cyXUMNg5KQarX2tIbHEz+vN4/iJ/BvhvoC/ZKEDxVshABcS0uvurssGKv
         asGwFI2cu1o2n//6DYjdKwAkBt8OSNWpHOaIaf4fY1YyHvT9UtUFe1PJn3PPd3fPqGs8
         MU3/4sA8l1qASni+N1TJ89wmU8z1UxwjYrdOOxWtZ2AGfbzNVO+QjzNn0Z5bm5PZ0Yks
         VWUdtKZY+80D8MWiw6s9g71SUCCT+U6YseznxEYtOytMeIcF6DkYVt8jPX5l4ic9px9i
         75/wwj0p2RUCFENf20elS6J8KDdx6SZ2glzOp6YJFgbPETwyarof48lso08juEwXh7dY
         pq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oLVvlqarfNnEaWHjSCK5XXPlW0GYZ5GzQ0LWoExBWMk=;
        b=h7/32KE6OiJZuWTysmy2OkRKzSUAcTkKdTkPQKYqfBQTEFTATcYCpYBIOW+m7Um3OE
         Xmi62joDuf4lq0jVjvP519wn5Fbhko2JJZAYqUrY8fV+FkpXwmDRLxcWkf0omLwYL7nI
         zpr/uwP71/TdbKZhlIt2OV2DoCyvHbyIO4lxiRLJIU0/lbew2ZQFQ2NOXlcZdDL+wmx9
         hMTTjhfrV/cA7F3er26XIYbnbPtGub4K4tD+sFkNAVpvCcV9lZJx41460P5SJca8LRiy
         ufdBXgjCmpT2NsthvUAFejL1jepwwmPQPlYsUdxqv50aAUht4wEVnWuSe5tUBgb/lMIP
         OtfA==
X-Gm-Message-State: APjAAAXbNeu5XznzoI4pApF3J+CifUEnayRfczCkAa6ZVJ1+Co3YBZ3H
        h8XMQm+DB//gCKO7xjswoQ8j8hn8
X-Google-Smtp-Source: APXvYqyEvEQM1CgrwRhINPO3aKJPbcHGrCDv7qlTGipalLI4ImNLYOi368nZxDORjXnz70fQfua8/A==
X-Received: by 2002:a37:4ed3:: with SMTP id c202mr11656379qkb.457.1567110949330;
        Thu, 29 Aug 2019 13:35:49 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id n15sm1696269qkn.2.2019.08.29.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:48 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 4/9] tests/revoke: test key revokation in the revoke tests
Date:   Thu, 29 Aug 2019 16:35:28 -0400
Message-Id: <20190829203542.4410-6-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
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
index 55bbbdf..fc2b928 100644
--- a/tests/keyctl/revoke/valid/runtest.sh
+++ b/tests/keyctl/revoke/valid/runtest.sh
@@ -47,6 +47,16 @@ marker "CHECK NO READ PAYLOAD"
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
@@ -65,6 +75,16 @@ marker "CHECK NO VALIDATE KEYRING"
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
index 4d772bb..01dc48f 100644
--- a/tests/keyctl/timeout/valid/runtest.sh
+++ b/tests/keyctl/timeout/valid/runtest.sh
@@ -80,23 +80,6 @@ marker "ADD KEY"
 create_key user lizard gizzard $keyringid
 expect_keyid keyid
 
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

