Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36D6A281D
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2Ufz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:55 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33955 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Ufz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:55 -0400
Received: by mail-qk1-f195.google.com with SMTP id m10so4260923qkk.1
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P714vqCcZutRxdUjl3+AMHRpDNjWES5msBSg17g0a3E=;
        b=paEjqBav+OnxrTIAluDrMw+LjzIexaDaYJ+zIPmQjnO1gMBRmVL48pJnJr24CZG5ZL
         y/RfFTpwDihzmVXH/CF4Ruh3m6Wjsx5MvGx+8Rib0p6VqwdwkBObXLrwjptPI0HggyaK
         gDCiPwF8XND2s77UN2/Rci5QVtv8U6tqmyqjIjER1OoOq01EDghKDUQzYYn+O/PDQKIJ
         Erz3alOlxYNr1kb061VMwiVBSR/wdw83eWqA0qse623IYaFNjMCZOe4GhetRek3nK73R
         evWsiywxcSO7vkFnjcvbwI1fMzH9KcwwAJGz95mvjcawccLV4GOYLWf1xQD5VrUTaoqm
         0bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P714vqCcZutRxdUjl3+AMHRpDNjWES5msBSg17g0a3E=;
        b=mmkd422K9kBWglVr4VVbbn1iW5hmNylVixY2T2bct4zUTKoX/7Va/UqKrT21VB7K3w
         s4b3PCsi2g5aWIHOmDnnRLC6YA/eAX1ibsTCRwlvqVBMs4BCB+nNdDBmR2hklvo4+c63
         hzRbJfiNbRC8lzGKbD4TBzDhQMwqHjGptBcMBlQcdKvJWRRrwCw9M3EBhKqNYjAshP2P
         VdkXUG1jZ/M4FZFC+wUk6M16bvjKIZIso/VZehpiY8oDtyuyvV70hKIFs9RnIEnmpuwr
         b0okGgUSrpUy27KjYoOc7RnrUxjdv9iRoiVjBDP50KzZ/EQV8jJkLdg4Fi5Duv40GysQ
         kS+Q==
X-Gm-Message-State: APjAAAUzrgbinSoJ7bNSHAsWk7ukKemMBzMZr2DX+TIXCcTODQpB/XNQ
        ydu5Ot9LxRdn2+AK53XWqx3IKF6A
X-Google-Smtp-Source: APXvYqzTHmlx3CJAMrdLa133sHJ8bOJz8J41h1MyGln8Mu9uaM28c/POZq+UFvLpAjFkoxCBUzrnCQ==
X-Received: by 2002:a37:a7d6:: with SMTP id q205mr11731413qke.44.1567110954109;
        Thu, 29 Aug 2019 13:35:54 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id v26sm1847623qkj.96.2019.08.29.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:53 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 07/13] tests/timeout: test actions on an expired keyring as well
Date:   Thu, 29 Aug 2019 16:35:34 -0400
Message-Id: <20190829203542.4410-12-mathstuf@gmail.com>
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
index ce27b68..ee20179 100644
--- a/tests/keyctl/timeout/valid/runtest.sh
+++ b/tests/keyctl/timeout/valid/runtest.sh
@@ -100,6 +100,21 @@ marker "CHECK NO VALIDATE KEYRING"
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

