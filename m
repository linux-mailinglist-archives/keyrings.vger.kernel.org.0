Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0054EA281B
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH2Ufx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:53 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:37843 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Ufx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:53 -0400
Received: by mail-qk1-f174.google.com with SMTP id s14so4246170qkm.4
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FnRArtw8XnMRQK8tYC3iudG6wTbQ4eIhzzE/JDxzF0Q=;
        b=YLVwwG6P6SkujFUuHj7HYcCfLG27vn0HrrNgZIOA/uh5sKP6ZhiF+dZt2WF5ztMhVi
         CGiWaG9g/YQ/A4fOcfV29n3WicCKa3ch1uWO3SaaoAI7thy2FEKn85EDFuriNJvfWXnW
         VNwE70MHEOYvhwflADyrF7TmlEanHNpx/6D6HSbhXPUwJmR1GuwuJPY+/xPMnuknVrWG
         6rb4xu6jfnD28Bzp+DbrliZ0mARHlpApgPEutTJ9Rn32XCMe3L0vnp4n+f0RJAliz3Vi
         HsRc+ZSp1Y8sM0jMjq+DBPNKPwOA4CsRs3AFGtn1yL5z8PIIvqIpoPumf+yimow3WFSJ
         JOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnRArtw8XnMRQK8tYC3iudG6wTbQ4eIhzzE/JDxzF0Q=;
        b=NrjxITCwRll+MK5Zn/DkNks3t0kJbjrhv8pUdVBFvuJls0aHaudc9YBLgxzWPqeKZD
         xIjnsZLU33eTEoBFisrgTX0NbeQC+gXq/o/NVLT4Xls4Y0O4k0r+fElvmt2vYJRX/GtU
         gZ5OlgFKEvi1Nntik94egcIJVCAMOKjlZ4LkUtU7oD7DQCSOWFEJR/pL68J9fnt4FjNj
         XMAANAEJfUJnu2ZuWLetJXbmV+X+DesNaZxiwKjrBJ3d82HiPOeWUaHYU9Ie06piz2eX
         ajIUo7PALhHA3yvgRmv0yhcyUNSUClXKFBbpOVe40FpufRkffe8vrNTt6/Mm7J3/lX8H
         JNpQ==
X-Gm-Message-State: APjAAAUYIe41Zbegtzu+wdplBK39UuNNAX2z3cE46s2nx/ctzmTNVKlM
        lZobzkywFCybwq4e48/fUUXB6mdh
X-Google-Smtp-Source: APXvYqz4On9iZ7BQSPFZLp2jewAwkCZ5RXOKkstX3upT5xWDiIibLZBTbunoBahMrbKxSrgNksWeZA==
X-Received: by 2002:a05:620a:14a1:: with SMTP id x1mr6239623qkj.373.1567110952455;
        Thu, 29 Aug 2019 13:35:52 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id a11sm1234594qkc.123.2019.08.29.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:52 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 06/13] tests/revoke: test key revokation in the revoke tests
Date:   Thu, 29 Aug 2019 16:35:32 -0400
Message-Id: <20190829203542.4410-10-mathstuf@gmail.com>
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

