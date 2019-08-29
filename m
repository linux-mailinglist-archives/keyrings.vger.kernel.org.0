Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1CDA284B
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfH2Unn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:43 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39017 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbfH2Unn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:43 -0400
Received: by mail-qk1-f193.google.com with SMTP id 4so4242176qki.6
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P714vqCcZutRxdUjl3+AMHRpDNjWES5msBSg17g0a3E=;
        b=UxUIEbKyz/AFFv1FWM12n/aAsX/aVWmQRe8+AbgyHwB+6NFJ96X35cduNCm96iQRgj
         ofgZzjZ8fwaC6fybuIauPZNRj3Ql/5SrGJ37cQL8YkdsZyWCLoPIpxBrsmMwx8z/Vdgs
         C/NRUvCbEsK3hvRof9TpSYIbXKlPkRr+1A7rLSk1yiWC3syTEuNaZYbSzZYr9ZIFws4D
         r1ojW0qDdA6HLRzw74EFCppIf60XGleLergp2lIn1CiXEQeSY/DcrxxZX7jwnp/ABcBK
         2wMrVbTZg/vuk/xByL2gJnu/0A5HDb9YgwA41tVg+vq+TGl11ZK5oy4U9HpLfdnqQGoH
         3k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P714vqCcZutRxdUjl3+AMHRpDNjWES5msBSg17g0a3E=;
        b=rA8nUusUJxdc0DEyyS7p4ZsaBsjgjOoRWB/qQQ1Y2BJPJ5JtNhWCAxnbL8FdIv7mYD
         P34g1r+dho+NT2+KbHcdAOX9eAyL2qyX4IDaUJ9M3T4RaFvzqSeQXzHf4+qw36je/akw
         BDMRsoBzlPA2OHMqg0kuTABfHbIsKucMKTT7lvy2aUf4ue12Q89Kt+LSaWkN2dTuPDFb
         sxlJQq/r2Nz0pYfk2oM7lI6wkYVf0U6Z4Q6Wu3bF37JXAUvyTiVHx5w+Gno376c5YnlU
         WL2uSJymfKPdkkrL7d30lwESGvCnYh3Fd4gMHGTGnzKioPN2iii+yHaLfpzejabUdSXd
         nNIg==
X-Gm-Message-State: APjAAAU8bZfsJMYgNKivgZh7AY04cIyx6WJ+FDBAmYPCcKSbERhhRENT
        g+CnMlcstkRwnk+WgLi7/h4uVRW+
X-Google-Smtp-Source: APXvYqzVljsIeSRBJXz2oRtkH8A2dS1WTj+ZroPQg2uE5jEgo9R6CcKV6m+yj+ViNdsNlFLa43Nonw==
X-Received: by 2002:a37:4ac8:: with SMTP id x191mr11969266qka.400.1567111422486;
        Thu, 29 Aug 2019 13:43:42 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id b1sm1586180qkk.8.2019.08.29.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:42 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 07/13] tests/timeout: test actions on an expired keyring as well
Date:   Thu, 29 Aug 2019 16:43:15 -0400
Message-Id: <20190829204322.8015-8-mathstuf@gmail.com>
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

