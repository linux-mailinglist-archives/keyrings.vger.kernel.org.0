Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2CBA2844
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfH2Unm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:42 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:36235 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfH2Unm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:42 -0400
Received: by mail-qk1-f182.google.com with SMTP id d23so4263745qko.3
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ford1KP9TjvIzVTuKBfH9wuCZDxkarWcRT3lzExBoNs=;
        b=E+kOTb9g3Zx1MtgII3YPh3XYcazBkrVGE1m22t5lta4ozJAjCieE9Q/gRLPjznNrG2
         eJmhRMslsYlD9Vn8bg+qYFQRa5Y5MWTyFfCrYAdMLpsgLomU7tt5UmcNcrg+O0vb/G+l
         oPbPwngnjzPwoV4k8HeLFZe7gdE14JHABVBNPvWLk/HY8tfQdiJF+3dmgfrFqzDumv1q
         SYICrRbWpYl6CSSpqvDeVH17DTWRK82YCSFlhkpQokKk518ysRe0qhqYOgoptzfXDbMn
         gGRKqFxP11cUVbVkO6i52vBkiUF/MgCLiAfZhJ03BwRMoDgb43oYz190o40jb4w2Z8sg
         LNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ford1KP9TjvIzVTuKBfH9wuCZDxkarWcRT3lzExBoNs=;
        b=O48MNX6TbvTNxJgQCW8hLtVbKrVnfrjse4eum8NN3i6J5kYvKhs8gT2r7NN2eJ2bOC
         NbIJfs4a02x3JhoOZh1/8PfWrqpRtan7Qrmrfj+HP90QXqs7V4m7T31aPVuZgdWk/v7P
         43kIHfexfAgL0gE8pSmQ0njHHhn7nhCJ4WfjtuuhVsjD8tRjILLJIzHo/Yn/x81MrZEZ
         ZMjZC8yFjI8vtFY9wXPATttX6piO/FeflmumUhnKFVt50VQLwEDq2G+UWcZs4yxLyq0U
         yHHfHbclYCaH7H0kKFiqdZXQZmo24SN5NdiqGE6U9TfP7ATKCEnmqYZgPSdhtLNsz6KW
         OCiQ==
X-Gm-Message-State: APjAAAVzsz9rAT/6gsoUY68PY6E4WUJiJJl9GK5YqSKINoSNjufwh57j
        b70CEalgkrv2gcXp19bBXtgshw3C
X-Google-Smtp-Source: APXvYqwNccGj9NB1Wute5kd2akMwmSPWFR2aGvn7tkJoy1rOYcYZZw8SxQp6PA+ipc050T8oCDyeaA==
X-Received: by 2002:a37:4cd5:: with SMTP id z204mr11526999qka.67.1567111420650;
        Thu, 29 Aug 2019 13:43:40 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id b21sm1601528qtp.25.2019.08.29.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:40 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 05/13] tests: fix typos in test comments
Date:   Thu, 29 Aug 2019 16:43:13 -0400
Message-Id: <20190829204322.8015-6-mathstuf@gmail.com>
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

