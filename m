Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC2BA2842
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfH2Unk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:40 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:32948 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Unk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:40 -0400
Received: by mail-qk1-f171.google.com with SMTP id w18so4290019qki.0
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3MnLs0Uc4m9leTVuxahxwVbUqWQVyz0O9dI36hMGzM=;
        b=MGtErVDzkPUxnHlYHJoi+vXJzszt1pPoNFivjnu7FMScnb2eaPrbBPesyHxKSJMxI7
         RoXy6du8LRpcAPXzo1rZXyghSHjt0vjZ7zjixnxtiwPv+aCI3Ky6MzA/w/E58B2TM6pl
         TglE/uqbjwqP/Q0o9A2H0Xdfuek5sNBO/34QX8PvogJAsE8BDl8b6v4ZFTWVaNVeC0rW
         IeVzvOXKaDogPje6j46WT4UrMbegKFzF5LoZKNOfDivg41T6ECvwTVdp7Pqb3lE5lfU/
         /8sPR8URAbB2wt8Y3WHB+J7VbKBr58CCiKjFDqd9qawyjhV1IlvPffB4Mb1RDzafwEEb
         xxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3MnLs0Uc4m9leTVuxahxwVbUqWQVyz0O9dI36hMGzM=;
        b=P9/xcR1PMpfkwBZifuyCf58RGzkKLFCEhtrP4dtAAAKKevap8BfeuXVEQlMpfnd/Ll
         ksKf7XZW4PHcLy7q1fAnasMrgiYHe3ArwWI1mq3OWxD8zWLwWhDjF1l6tQem3Vt+0hEC
         hyrPMJ6yYgcWQllKqN7fgpxNBr3T8SgVKJuKLAEPPJO6AsMOtoKALK4Cj2mTdfLTu28Z
         8hz2ILTVFt91SAma72ppYAS/2VJogIQBEJyl8FCyrTZDxV0aMlKv73zW7BWq8Yi09cFH
         vyD0sU+llSvflgKKkcBcwdwNcFE0ycFPFhcITca8DkYMEyO+Gytuc80oY3bjOxAoOKZb
         ITIg==
X-Gm-Message-State: APjAAAWtH/P2qi5t5oxXFabbAE9iG5nPv9E37i0w8lUBDZyYg1zZQGyM
        u9dq3emhW1zv2Mf7y4Nd5w5p0dez
X-Google-Smtp-Source: APXvYqz6HjkMZHo890241BFvYZB1x1AQyUzpJ307gBezEUfr9vxPuLvTu+AO1Y4u65i7UWgrK5+0rA==
X-Received: by 2002:a37:a5c1:: with SMTP id o184mr11213741qke.365.1567111418962;
        Thu, 29 Aug 2019 13:43:38 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id x28sm1961820qtk.8.2019.08.29.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:38 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 03/13] tests: remove some trailing whitespace
Date:   Thu, 29 Aug 2019 16:43:11 -0400
Message-Id: <20190829204322.8015-4-mathstuf@gmail.com>
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

