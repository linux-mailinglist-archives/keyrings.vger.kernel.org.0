Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7199A2818
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfH2Ufv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:51 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:47075 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfH2Ufv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:51 -0400
Received: by mail-qk1-f179.google.com with SMTP id p13so4177572qkg.13
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ford1KP9TjvIzVTuKBfH9wuCZDxkarWcRT3lzExBoNs=;
        b=d4Y5lPdEd9EmxGvMZpvxDoGJMo9YlfL6zEnPBOdJAj6abvbN3FJwmnCf3wtn5hDPGn
         DDWQVaig1Lemxr+8F3LqNJox3bRNx8jSmiQfpKk8NE7mAYGwl1+WE1tHzwhMRZ1CoA87
         uz5JVamFDzJc8rj9cV5i22B1iqd6ff+YaWYOi9UuOb/bkMhME5XI0TgvfOESRQQx21qR
         oPi5JMEa4oaPIadogwYGpeDK30yYQ1bRxTizdeuMtaaExd6Qb9ir839Y82HCdl4Ok7Yr
         bsuvXKpnILEhJiEp07/Hm7XGkhBsqqNS7QuLkcu/3KTEbSDY+kL44F2/FiFK89NK9+EE
         V61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ford1KP9TjvIzVTuKBfH9wuCZDxkarWcRT3lzExBoNs=;
        b=uflGPrTk3BUVUrKOnlMcujC7Ep5WkzSdlJ92a2jiWt9Vj6PxpBgLVhchd8mmLIWSEW
         Pmps/mOPBtTNX8OSepn/IdQB9i3ZqKSGAfZXfzqXtfE/gNnwTvFhbLQ+MrIkkNIccT0E
         VbjRyX4QIYGNiQo4VMQxGGueNq0dDTHHMRrTMml+w/MlSm1eqyzHXMBoYEe2mXg7cr3W
         a0tq2FILHSYRV4+PRzFoL3lUZXDN5PVTLiJV/h9LHMFltQnqwWi9BazOIDegJuJuwtuu
         JznLeBSk29rsWyRqwoandz2U+uyMmYDTwKM0KcKcE4cAW4STpud5RD2fKe/RrahShywj
         VE+w==
X-Gm-Message-State: APjAAAXQEcGyBoRvTXmstzKkddEWH+80MnqQDWM9XG/49IfT3yluKjzU
        MYB3fM4O4yWAKaGnoZheUHMgRuJj
X-Google-Smtp-Source: APXvYqzIPOt655YLUl5xJvl4byZRk0MiaeUHYFm5vvxBDNxIQqcyeFb/zBwuXsAkZ2cdIK6kOZgrXA==
X-Received: by 2002:a37:9e05:: with SMTP id h5mr11603174qke.331.1567110950153;
        Thu, 29 Aug 2019 13:35:50 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id q123sm1656620qkf.52.2019.08.29.13.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:49 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 05/13] tests: fix typos in test comments
Date:   Thu, 29 Aug 2019 16:35:29 -0400
Message-Id: <20190829203542.4410-7-mathstuf@gmail.com>
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
 tests/keyctl/add/bad-args/runtest.sh        | 2 +-
 tests/keyctl/link/recursion/runtest.sh      | 2 +-
 tests/keyctl/newring/bad-args/runtest.sh    | 2 +-
 tests/keyctl/padd/bad-args/runtest.sh       | 2 +-
 tests/keyctl/requesting/bad-args/runtest.sh | 2 +-
 tests/keyctl/requesting/piped/runtest.sh    | 4 ++--
 tests/keyctl/requesting/valid/runtest.sh    | 4 ++--
 tests/keyctl/search/bad-args/runtest.sh     | 2 +-
 tests/keyctl/session/bad-args/runtest.sh    | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/keyctl/add/bad-args/runtest.sh b/tests/keyctl/add/bad-args/runtest.sh
index 270ee0a..69121b2 100644
--- a/tests/keyctl/add/bad-args/runtest.sh
+++ b/tests/keyctl/add/bad-args/runtest.sh
@@ -51,7 +51,7 @@ else
     expect_error EDQUOT
 fi
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
diff --git a/tests/keyctl/link/recursion/runtest.sh b/tests/keyctl/link/recursion/runtest.sh
index 65abd9c..d258c83 100644
--- a/tests/keyctl/link/recursion/runtest.sh
+++ b/tests/keyctl/link/recursion/runtest.sh
@@ -79,7 +79,7 @@ marker "RECURSE 7"
 link_key --fail $keyringid $keyring7id
 expect_error EDEADLK
 
-# create an eigth keyring in the seventh
+# create an eighth keyring in the seventh
 marker "CREATE KEYRING 8"
 create_keyring --new=keyring8id "eighth" @s
 set_key_perm $keyring8id 0x3f3f0000
diff --git a/tests/keyctl/newring/bad-args/runtest.sh b/tests/keyctl/newring/bad-args/runtest.sh
index 734b44e..f35c4c6 100644
--- a/tests/keyctl/newring/bad-args/runtest.sh
+++ b/tests/keyctl/newring/bad-args/runtest.sh
@@ -21,7 +21,7 @@ else
     expect_error EDQUOT
 fi
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
diff --git a/tests/keyctl/padd/bad-args/runtest.sh b/tests/keyctl/padd/bad-args/runtest.sh
index 291584e..c59393c 100644
--- a/tests/keyctl/padd/bad-args/runtest.sh
+++ b/tests/keyctl/padd/bad-args/runtest.sh
@@ -51,7 +51,7 @@ else
     expect_error EDQUOT
 fi
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
diff --git a/tests/keyctl/requesting/bad-args/runtest.sh b/tests/keyctl/requesting/bad-args/runtest.sh
index 83c114f..cf822e2 100644
--- a/tests/keyctl/requesting/bad-args/runtest.sh
+++ b/tests/keyctl/requesting/bad-args/runtest.sh
@@ -90,7 +90,7 @@ marker "CHECK MAXLEN DESC"
 request_key --fail user $maxdesc
 expect_error ENOKEY
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
diff --git a/tests/keyctl/requesting/piped/runtest.sh b/tests/keyctl/requesting/piped/runtest.sh
index 010af33..1496d06 100644
--- a/tests/keyctl/requesting/piped/runtest.sh
+++ b/tests/keyctl/requesting/piped/runtest.sh
@@ -49,7 +49,7 @@ marker "CHECK ATTACHMENT TO SESSION KEYRING"
 list_keyring @s
 expect_keyring_rlist rlist $keyid
 
-# rerequesting should pick up that key again
+# re-requesting should pick up that key again
 marker "REDO PIPED CALL OUT REQUEST KEY TO SESSION"
 prequest_key_callout --old=$keyid gizzard user debug:lizard
 
@@ -76,7 +76,7 @@ marker "CHECK ATTACHMENT TO SESSION"
 list_keyring @s
 expect_keyring_rlist rlist $keyid
 
-# rerequesting should pick up that key again
+# re-requesting should pick up that key again
 marker "REDO PIPED CALL OUT REQUEST KEY TO KEYRING"
 prequest_key_callout --old=$keyid gizzard user debug:lizard $keyringid
 
diff --git a/tests/keyctl/requesting/valid/runtest.sh b/tests/keyctl/requesting/valid/runtest.sh
index 824b700..06834c2 100644
--- a/tests/keyctl/requesting/valid/runtest.sh
+++ b/tests/keyctl/requesting/valid/runtest.sh
@@ -49,7 +49,7 @@ marker "CHECK ATTACHMENT TO SESSION KEYRING"
 list_keyring @s
 expect_keyring_rlist rlist $keyid
 
-# rerequesting should pick up that key again
+# re-requesting should pick up that key again
 marker "REDO CALL OUT REQUEST KEY TO SESSION"
 request_key_callout --old=$keyid user debug:lizard gizzard
 
@@ -77,7 +77,7 @@ marker "CHECK ATTACHMENT TO SESSION"
 list_keyring @s
 expect_keyring_rlist rlist $keyid
 
-# rerequesting should pick up that key again
+# re-requesting should pick up that key again
 marker "REDO CALL OUT REQUEST KEY TO KEYRING"
 request_key_callout --old=$keyid user debug:lizard gizzard $keyringid
 
diff --git a/tests/keyctl/search/bad-args/runtest.sh b/tests/keyctl/search/bad-args/runtest.sh
index 2128790..8650ae5 100644
--- a/tests/keyctl/search/bad-args/runtest.sh
+++ b/tests/keyctl/search/bad-args/runtest.sh
@@ -45,7 +45,7 @@ expect_error ENOKEY
 search_for_key --fail @s user $maxdesc @p
 expect_error ENOKEY
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
diff --git a/tests/keyctl/session/bad-args/runtest.sh b/tests/keyctl/session/bad-args/runtest.sh
index 8bae0d4..45a9984 100644
--- a/tests/keyctl/session/bad-args/runtest.sh
+++ b/tests/keyctl/session/bad-args/runtest.sh
@@ -14,7 +14,7 @@ marker "SESSION WITH EMPTY KEYRING NAME"
 new_session --fail ""
 expect_error EINVAL
 
-# This doesn't work on MIPS earler than 3.19 because of a kernel bug
+# This doesn't work on MIPS earlier than 3.19 because of a kernel bug
 kver=`uname -r`
 kmch=`uname -m`
 if kernel_at_or_later_than 3.19 ||
-- 
2.21.0

