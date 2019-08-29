Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B57DEA281C
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfH2Ufy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:54 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]:38224 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Ufy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:54 -0400
Received: by mail-qt1-f175.google.com with SMTP id b2so1763712qtq.5
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pNEdtKAJ4S9J2yWKs3Cc422XMVZW9X0+QAAoDqXPIM=;
        b=IJXYvRt13s/g/jOHnsG1uM6WE4Y9Wd2t4qO36J3/b4kBf/BTd1Ec5OUufCeronIml2
         jWz37BjLbgbPWdY+N6u5+0Hu6yZNyX1sr5l2g77jzilW83q9IfooGfL0Rm1tDI+NUqT8
         4kAG8cG3fkG0esHOJ7rIMS85hmN9tPAv3UTjIY69o+Tr2rEW/TE8Q2LGonkk4y/u2wWv
         kJ6RqFZuiGhNsSgJ34Xdd8ZPHFYjp5RWvj3aumZQLWFjKbJmB7ct54TnGlvN4NmpmSgD
         Jf6B5LHJeBhwlAPuLRAtzpiYtsgSZeOkrqUSYaION1G45kJ9DgGM9ino53/WqJgNfZ6c
         rVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pNEdtKAJ4S9J2yWKs3Cc422XMVZW9X0+QAAoDqXPIM=;
        b=IxrUplgSkXKw744/8WSyxZZ+Dj6eDozJQ5x26/lzEa0NSYRVP1PE6RCGr1Afpzwvs1
         /69rFURddzOzUOojVhtYyGF4A2CCJZJU0Wihm36rJ6Yc86OxdJ/Jtlh97dW4T3a3ggjy
         GJiSPdU2RHOsEdrt8a13yrOMXoY1/gTBwgtx0QwTM0rPbWp2hc4HJLWSb9ZYObjnC/vs
         hf/uZPK5dOy6/bwBc50wPS8gA8GeR/XgYrnBiLmXlyJXD8VvDmxE1k8PtSqtjtLhkeMk
         mWWZf1HqVNnY9lm6rU7K3yQkXl1JD1rRIpCOoxGOIRUIET3txZUDzZQ2ohQI4B4m1feF
         LZ3g==
X-Gm-Message-State: APjAAAWTFqtPxWYd/iaZIuRdkiGuKi2XG9cNufNU0/vUYqDxGWMHHbd5
        1Empvdhct5ydBUf9pzPm0apKP0C6
X-Google-Smtp-Source: APXvYqy68dZRX6ZjCFaLk3zNKSWaHoInoVBHyjoSeuc25ZFOyFzmYYeIsjBG7hOnFeKck+xi68Bcgg==
X-Received: by 2002:ac8:6919:: with SMTP id e25mr11500775qtr.317.1567110953265;
        Thu, 29 Aug 2019 13:35:53 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id v13sm1650602qkj.109.2019.08.29.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:52 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 7/9] test/instantiating: test bad arguments for `keyctl reject`
Date:   Thu, 29 Aug 2019 16:35:33 -0400
Message-Id: <20190829203542.4410-11-mathstuf@gmail.com>
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
 .../keyctl/instantiating/bad-args/runtest.sh  | 14 ++++++++++++
 tests/toolbox.inc.sh                          | 22 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tests/keyctl/instantiating/bad-args/runtest.sh b/tests/keyctl/instantiating/bad-args/runtest.sh
index a585e20..52fa45c 100644
--- a/tests/keyctl/instantiating/bad-args/runtest.sh
+++ b/tests/keyctl/instantiating/bad-args/runtest.sh
@@ -17,6 +17,8 @@ pinstantiate_key --fail a 0 @p
 expect_error EPERM
 negate_key --fail 0 10 @p
 expect_error EPERM
+reject_key --fail 0 10 rejected @p
+expect_error EPERM
 
 # create a non-keyring
 marker "CREATE KEY"
@@ -29,9 +31,19 @@ instantiate_key --fail $keyid a @p
 expect_error EPERM
 pinstantiate_key --fail a $keyid @p
 expect_error EPERM
+reject_key --fail $keyid 10 rejected @p
+expect_error EPERM
 negate_key --fail $keyid 10 @p
 expect_error EPERM
 
+# check reject key timeout must be a number
+marker "CHECK REJECT TIMEOUT"
+expect_args_error keyctl reject $keyid aa rejected @p
+
+# check reject key timeout must be a number
+marker "CHECK REJECT ERRORS"
+expect_args_error keyctl reject $keyid 10 notanerror @p
+
 # check negative key timeout must be a number
 marker "CHECK NEGATE TIMEOUT"
 expect_args_error keyctl negate $keyid aa @p
@@ -46,6 +58,8 @@ instantiate_key --fail $keyid a @p
 expect_error EPERM
 pinstantiate_key --fail a $keyid @p
 expect_error EPERM
+reject_key --fail $keyid 10 rejected @p
+expect_error EPERM
 negate_key --fail $keyid 10 @p
 expect_error EPERM
 
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 9ba7e4f..8d37d13 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -1047,6 +1047,28 @@ function pinstantiate_key ()
     fi
 }
 
+###############################################################################
+#
+# reject a key
+#
+###############################################################################
+function reject_key ()
+{
+    my_exitval=0
+    if [ "x$1" = "x--fail" ]
+    then
+	my_exitval=1
+	shift
+    fi
+
+    echo keyctl reject "$@" >>$OUTPUTFILE
+    keyctl reject "$@" >>$OUTPUTFILE 2>&1
+    if [ $? != $my_exitval ]
+    then
+	failed
+    fi
+}
+
 ###############################################################################
 #
 # negate a key
-- 
2.21.0

