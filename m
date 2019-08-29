Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA99A2819
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2Ufw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:52 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45138 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfH2Ufw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:52 -0400
Received: by mail-qk1-f196.google.com with SMTP id m2so4182101qki.12
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKhni0CCfr+g+qXeiK9eZN8C67PyXgx5NaIyNtp34SE=;
        b=KESHjKM/+s4wsINlQY0/MFyulQY4vrCCCCIirMrwRSlq8V0iXZktvIE0kQga3ZALHF
         Tpu38obeHXi07U8gkWBlfDu95+lr51QQsByhWgd326aHaJjOStGstG5RoZBBXxEtopNH
         0d0BYM6IgJl8iD5pbt8bAX+x6EyX26U3qSXBojwOX/dZkM63CA38838OdbuksM/ev4NQ
         9QDAEthjb1WALLH2oyE86+w9nncAHN3yJHt0YQi6r+GAhTyiDQwF54dITQEBvwiPH/a3
         8u8Xo/4QS5B7YRJVjpEso+mOQKmoYZ+R/n5MM2hDU18/QgByP9LHWvlUIbNi6kBEEapz
         XtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKhni0CCfr+g+qXeiK9eZN8C67PyXgx5NaIyNtp34SE=;
        b=W8csoE4s+sUkMx3j7Tv6YAHyt6aieglJI20KUcErLQ7JvSOtcB+W95nMB5NQ/DqJgK
         VxieRgFTYYxAzZOawCCx5VddPCGL2kVBxyoJ8ExkEtHiEPsJ4NP2iPlKFcPzYm03Gstv
         6F5rqWUnsUG9cNW7o3ai4vB9gdS4Ict85Shyg7q2BPXmO6HfDz6B0hw5uOoELCphh1p1
         JSpdfs8ZbIEbbIbwkpIFpTdJLn5tyHKckZVLPTBH/Hqg5rotxF9+BJI13FDBpqKbIQu8
         UjtwPQi2M7zNbcC/nsDzGYvo6DuIQNKKAoZ0hIC3pmY5yByNZaw2n1lP+GXNk0JMuxYW
         3BDg==
X-Gm-Message-State: APjAAAVJXBjCSQcUyiFu2vD04CbDuW4M9lv7/ofq2F9KSBJXiCifKyWq
        ShqvLBoFjblFxQZQBdAHz12NpjzA
X-Google-Smtp-Source: APXvYqwFW4dJ/khddTjU+0d94IGjITnki2F0R+xrC0Y92jThXSkFBfbxwTCaCNB35J8TyC7KIDg8DQ==
X-Received: by 2002:a37:a603:: with SMTP id p3mr11764662qke.297.1567110950958;
        Thu, 29 Aug 2019 13:35:50 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id d45sm1838702qtk.57.2019.08.29.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:50 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 5/9] tests/timeout: test actions on an expired keyring as well
Date:   Thu, 29 Aug 2019 16:35:30 -0400
Message-Id: <20190829203542.4410-8-mathstuf@gmail.com>
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
 tests/keyctl/timeout/valid/runtest.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/keyctl/timeout/valid/runtest.sh b/tests/keyctl/timeout/valid/runtest.sh
index 01dc48f..9c98309 100644
--- a/tests/keyctl/timeout/valid/runtest.sh
+++ b/tests/keyctl/timeout/valid/runtest.sh
@@ -103,6 +103,21 @@ marker "CHECK NO VALIDATE KEYRING"
 describe_key --fail $keyringid
 expect_error EKEYEXPIRED
 
+# validating the new keyring's name and type should also fail
+marker "CHECK NO SET KEYRING TIMEOUT"
+timeout_key --fail $keyringid 20
+expect_error EKEYEXPIRED
+
+# validating the new keyring's name and type should also fail
+marker "CHECK NO INVALIDATE KEYRING"
+invalidate_key --fail $keyringid
+expect_error EKEYEXPIRED
+
+# validating the new keyring's name and type should also fail
+marker "CHECK NO REVOKE KEYRING"
+revoke_key --fail $keyringid
+expect_error EKEYEXPIRED
+
 # remove the keyring we added
 marker "UNLINK KEYRING"
 unlink_key $keyringid @s
-- 
2.21.0

