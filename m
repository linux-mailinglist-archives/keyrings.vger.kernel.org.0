Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE834A284D
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfH2Unp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:45 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:33435 "EHLO
        mail-qt1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2Unp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:45 -0400
Received: by mail-qt1-f169.google.com with SMTP id r5so20043qtd.0
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QEdqwHTDVsLafb/VJ1T/8JgLVRLexWKSmUrEuEFPGZU=;
        b=jwe7g9Ox9i3z1qeUmDljLtTRDiEhTA5Pbo1zFoGdmN9umVBIqOBpziLTVgNSBKRMN2
         Vgz/qwSikc/C7G2pkCXGd9PRAQ/Z30iwKKeR40HaxBUzbuHehck6INCo9rjykLYQgjhp
         pSZjo5NRkf1H2RMWDUY4YWbsafNGnNYeqGaAaPUuVAPFKbalvDLg9lE1G13H8irKg7lg
         CTjZL7PkW3XESksoO2FaVkPQDON44QJ8aRC7+lyyGPD4J7qLnrEXAbhIPgfPls0STfzz
         3y3H2JPPwEzM/qJpl+6jC+MqmjpjZD2cl35fJDRWathf7gppk7Rf9TyNH7fsJQ7O6o+y
         bm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QEdqwHTDVsLafb/VJ1T/8JgLVRLexWKSmUrEuEFPGZU=;
        b=fH+SoOA1+GAnuBNd6CVKhQL/wuQ2kMOGoxcLWEW84U1CceFBw+EGaaLqcxqmX7RlH9
         H+DTjBpAL5J+5mD4c7QtG2eh3B4/e6VUBJefeJN2MfslpQ2RxlT/fH5Z6u5op9wNMMJO
         lB0G3AgO4cAn/A9Pfj97CMiF22gmFe1QHPs1nPVcuOBnkmoTvM676PlTarICHaHBP9U0
         cT6UR9T5CNuUtLIUzbAxk/75F4Zsvx9ftxeWjgA0xegZ2QLHy9PybmTmSrydH59vxI7I
         oZrD7CGBTcsndfcj9sC+BU8MhcBO4ZLPgUeCe6xKrE06p+WZzBlyruHVnbqmrw92nnb5
         dDeA==
X-Gm-Message-State: APjAAAV8ptKBsLkzJ4CLbAnZcH6sXta3XZZy8+2DNSBUF8sZUaYJJLrc
        FWqaAYBWEw99Zf/n7m1PlIy7cL9T
X-Google-Smtp-Source: APXvYqxL3t3I2RHnoMrNMTnUzKnAXviohg5OUWoGX+PPA4FtwIbHUrq9uWK79A/VpPIbTHizT9CiAA==
X-Received: by 2002:ac8:124b:: with SMTP id g11mr2252095qtj.232.1567111424155;
        Thu, 29 Aug 2019 13:43:44 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id c5sm1786858qtc.90.2019.08.29.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:43 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 09/13] test/instantiating: test bad arguments for `keyctl reject`
Date:   Thu, 29 Aug 2019 16:43:17 -0400
Message-Id: <20190829204322.8015-10-mathstuf@gmail.com>
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
 .../keyctl/instantiating/bad-args/runtest.sh  | 14 ++++++++++++
 tests/toolbox.inc.sh                          | 22 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tests/keyctl/instantiating/bad-args/runtest.sh b/tests/keyctl/instantiating/bad-args/runtest.sh
index d611fb9..21bbf10 100644
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
@@ -28,9 +30,19 @@ instantiate_key --fail $keyid a @p
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
@@ -45,6 +57,8 @@ instantiate_key --fail $keyid a @p
 expect_error EPERM
 pinstantiate_key --fail a $keyid @p
 expect_error EPERM
+reject_key --fail $keyid 10 rejected @p
+expect_error EPERM
 negate_key --fail $keyid 10 @p
 expect_error EPERM
 
diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 9c819e5..b8c27c2 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -1626,6 +1626,28 @@ function pinstantiate_key ()
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

