Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86591A2815
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2Uft (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:49 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:40241 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Uft (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:49 -0400
Received: by mail-qk1-f179.google.com with SMTP id f10so4230665qkg.7
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3MnLs0Uc4m9leTVuxahxwVbUqWQVyz0O9dI36hMGzM=;
        b=ZFGbAaRplz98ADrOXZmvm7mzdFxWvw6MxEziJkq6ZI7TzEswRWYWUatodBiYMzjrd0
         i1mrYdH0AFy7OAOuqN+yt/G3b//yGc6AmkzqKt6eoYbsGym+9IcK7Fjmze2Tmywzu4tk
         ZEi6/4aMgHY+Ju0Va+eN5deLdzD5Zr8I6X3yWMvBC4X30i+gh8jf/PZ9N/5f37gTF6V3
         Npe5hJl5Zlc4zyod1owQq9ywfal95Nl6VzSmjY5q4rKXVVAVoILePYzpeX+Xcd/oOqzA
         XgUEs74YnALexEEWzYGZhgB6TRmIa4JZi5mLB9ECzglqgSOFgViptBfFEi3KcyARQM0/
         rbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3MnLs0Uc4m9leTVuxahxwVbUqWQVyz0O9dI36hMGzM=;
        b=Ux2hksR9tDY/23ZbaFEKXMUNQYolmVZAtJ4ikmng2bR97NI4q26XvuuIpLnkOhjN3Y
         yf8BV8AoG3Ce5NnhfBe+yJkeMZEECzm8PgpYaZ6CXsljI9rjhgjMAGz3ifXynXuyvl/q
         /JTdemXxDhDTYvkSmbhd9b2CoBU8KlRiZbNDfMYAI7h5UsVbABSrqfgX6gruUaU0h88p
         dbeybsvn6ABbRlvh45oQbRFA36oSzOU8KzwxqsvWoHPov+Dm0Ewz0xuZmRbdXwdInBi0
         1GQ6PwWynn7PJFNTMbGXJwMrPDxPcdyTKupMqn+bboJaE0VbT9XUCHHsUpeI3Dwy/Apm
         f5tg==
X-Gm-Message-State: APjAAAWEnbfZWRRMl8gp1hQmslJAQ5xtkPPwwI4C5bSGnGistGpFgoTM
        gal04I06AG3BTkIIK4X40f1mbX5c
X-Google-Smtp-Source: APXvYqz7ObH6Tms6lt4Z8kY3nYG2PZ9AkbOSdf5uBipEKbH0IBvmgH2A/y6f3cxnLI/dr49wa2jGKA==
X-Received: by 2002:a05:620a:10b9:: with SMTP id h25mr11871323qkk.33.1567110947723;
        Thu, 29 Aug 2019 13:35:47 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id p186sm1809970qkc.65.2019.08.29.13.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:47 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 03/13] tests: remove some trailing whitespace
Date:   Thu, 29 Aug 2019 16:35:26 -0400
Message-Id: <20190829203542.4410-4-mathstuf@gmail.com>
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
 tests/keyctl/dh_compute/bad-args/runtest.sh |  2 +-
 tests/keyctl/pupdate/userupdate/runtest.sh  | 10 +++++-----
 tests/keyctl/unlink/all/runtest.sh          |  2 +-
 tests/keyctl/unlink/valid/runtest.sh        |  4 ++--
 tests/keyctl/update/userupdate/runtest.sh   | 14 +++++++-------
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/keyctl/dh_compute/bad-args/runtest.sh b/tests/keyctl/dh_compute/bad-args/runtest.sh
index d9f7792..ef05592 100644
--- a/tests/keyctl/dh_compute/bad-args/runtest.sh
+++ b/tests/keyctl/dh_compute/bad-args/runtest.sh
@@ -70,7 +70,7 @@ then
     expect_error EOPNOTSUPP
 else
     expect_error ENOKEY
-fi    
+fi
 dh_compute --fail $privateid $primeid @s
 expect_error EOPNOTSUPP
 
diff --git a/tests/keyctl/pupdate/userupdate/runtest.sh b/tests/keyctl/pupdate/userupdate/runtest.sh
index 30aba54..81db4f9 100644
--- a/tests/keyctl/pupdate/userupdate/runtest.sh
+++ b/tests/keyctl/pupdate/userupdate/runtest.sh
@@ -10,25 +10,25 @@ result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
 # check that we can add a user key to the session keyring
-marker "ADD USER KEY" 
+marker "ADD USER KEY"
 create_key --new=keyid user wibble stuff @s
 
 # read back what we put in it
-marker "PRINT PAYLOAD" 
+marker "PRINT PAYLOAD"
 print_key $keyid
 expect_payload payload "stuff"
 
 # check that we can update a user key
-marker "PUPDATE USER KEY" 
+marker "PUPDATE USER KEY"
 echo -n "lizard" | pupdate_key $keyid
 
 # read back what we changed it to
-marker "PRINT UPDATED PAYLOAD" 
+marker "PRINT UPDATED PAYLOAD"
 print_key $keyid
 expect_payload payload "lizard"
 
 # remove the key we added
-marker "UNLINK KEY" 
+marker "UNLINK KEY"
 unlink_key $keyid @s
 
 echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE
diff --git a/tests/keyctl/unlink/all/runtest.sh b/tests/keyctl/unlink/all/runtest.sh
index 3f12a42..9215a0e 100644
--- a/tests/keyctl/unlink/all/runtest.sh
+++ b/tests/keyctl/unlink/all/runtest.sh
@@ -34,7 +34,7 @@ then
     unlink_key $keyid
     expect_unlink_count n_unlinked 0
 
-    # check that the keyring is now empty 
+    # check that the keyring is now empty
     marker "LIST KEYRING"
     list_keyring $keyringid
     expect_keyring_rlist rlist empty
diff --git a/tests/keyctl/unlink/valid/runtest.sh b/tests/keyctl/unlink/valid/runtest.sh
index 8cfbe47..c5a15df 100644
--- a/tests/keyctl/unlink/valid/runtest.sh
+++ b/tests/keyctl/unlink/valid/runtest.sh
@@ -31,7 +31,7 @@ marker "CHECK NO UNLINK KEY FROM KEYRING"
 unlink_key --fail $keyid $keyringid
 expect_error ENOKEY
 
-# check that the keyring is now empty 
+# check that the keyring is now empty
 marker "LIST KEYRING"
 list_keyring $keyringid
 expect_keyring_rlist rlist empty
@@ -80,7 +80,7 @@ done
 
 keyctl show
 
-# check that it's now empty 
+# check that it's now empty
 marker "LIST KEYRING"
 list_keyring $keyringid
 expect_keyring_rlist rlist empty
diff --git a/tests/keyctl/update/userupdate/runtest.sh b/tests/keyctl/update/userupdate/runtest.sh
index e7df452..320f9ce 100644
--- a/tests/keyctl/update/userupdate/runtest.sh
+++ b/tests/keyctl/update/userupdate/runtest.sh
@@ -10,34 +10,34 @@ result=PASS
 echo "++++ BEGINNING TEST" >$OUTPUTFILE
 
 # check that we can add a user key to the session keyring
-marker "ADD USER KEY" 
+marker "ADD USER KEY"
 create_key --new=keyid user wibble stuff @s
 
 # read back what we put in it
-marker "PRINT PAYLOAD" 
+marker "PRINT PAYLOAD"
 print_key $keyid
 expect_payload payload "stuff"
 
 # check that we can update a user key
-marker "UPDATE USER KEY" 
+marker "UPDATE USER KEY"
 update_key $keyid "lizard"
 
 # read back what we changed it to
-marker "PRINT UPDATED PAYLOAD" 
+marker "PRINT UPDATED PAYLOAD"
 print_key $keyid
 expect_payload payload "lizard"
 
 # check that we can update a user key with hex-encoded data
-marker "UPDATE USER KEY HEX" 
+marker "UPDATE USER KEY HEX"
 update_key -x $keyid "  6c 697a  6172 64  78  "
 
 # read back what we changed it to
-marker "PRINT UPDATED PAYLOAD" 
+marker "PRINT UPDATED PAYLOAD"
 print_key $keyid
 expect_payload payload "lizardx"
 
 # remove the key we added
-marker "UNLINK KEY" 
+marker "UNLINK KEY"
 unlink_key $keyid @s
 
 echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE
-- 
2.21.0

