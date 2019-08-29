Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E625CA2820
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfH2Uf5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:57 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:35399 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2Uf5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:57 -0400
Received: by mail-qt1-f173.google.com with SMTP id u34so5268230qte.2
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QEdqwHTDVsLafb/VJ1T/8JgLVRLexWKSmUrEuEFPGZU=;
        b=qCXg+BoUeyBI0HA70Zj21VSV7yVDFmaOMfV5bu6e4d4+CmQsX+lFKtFF3bFRrNsBBA
         PJ1tHgEHbNwcLHxR8F7gJqcWb1WIHEGJrJMNUQ08Gi47dn/DuX/etM/sGd+lG+eWVZij
         bZ3yb5RmkBIvM2NqsdHzhYCCjC2ZZAQm0Xc56M39j/qFq+nX7R7Tqu2Er+z0zzoq6jrj
         6w69bZEtnGOYqAZvQZPB7q+vXO5/OgicWRLVg5duCmPWo1AOpkRnWU0gSAj94k9vG2Sb
         IhT2JyrVUxM/SK6bBVzWaKDjiGEtyeRQsM2aeYnfi6oeL9Tdy5jWpNt3UKr01oJSQk+Z
         kZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QEdqwHTDVsLafb/VJ1T/8JgLVRLexWKSmUrEuEFPGZU=;
        b=n9mvZU9D0vnFISLjSt2H2WommiaDnJaqhClIRHRs0MibZnAPzu9+pTEIjsiqEMv+jt
         C6GKCwaz3ijteYhauDjdi/4JM1n6OcecZJ5jK7DovfAt6B1CdlENa7aoWMw8UmUKZeLn
         mFAhXTiSNJ6QFpTuJAUMZ+sdipFiWHeJZnhdv5Qn/rM012b3Sd9dEbBFul3iz1Jaqtga
         ytjCFnoAAlHGaseC6Jelfy/LSYu98Lot3nJKfe0KUF2u1H+Tk5J1/qgey4jGfmtzAjhG
         HN+5G8uJY99OxJemvQeOZiVKI+5IxwoCB0C60M0k0idrpVTIvrqc9V3qImyEcj1oZidF
         gBYw==
X-Gm-Message-State: APjAAAUYocKjSxm74Nsvrz7shWGIuX3wjRmDL/o9pwNRra7Oh6PilByW
        iRPATzpI67TNPMzOOLfhm3tnMTjA
X-Google-Smtp-Source: APXvYqyjkQDLzJJkfjmFhg/tEeXnF1fGemDu0dVHl6azAkYLVDzdAs6l9hHQW5qkvP1MXqYat3r8NQ==
X-Received: by 2002:a0c:8809:: with SMTP id 9mr8100124qvl.141.1567110956516;
        Thu, 29 Aug 2019 13:35:56 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id 131sm1777602qkg.1.2019.08.29.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:56 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 09/13] test/instantiating: test bad arguments for `keyctl reject`
Date:   Thu, 29 Aug 2019 16:35:37 -0400
Message-Id: <20190829203542.4410-15-mathstuf@gmail.com>
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

