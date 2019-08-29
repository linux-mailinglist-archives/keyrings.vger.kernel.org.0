Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 862A7A281E
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfH2Uf4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:56 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45365 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Uf4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:56 -0400
Received: by mail-qt1-f195.google.com with SMTP id k13so5201065qtm.12
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gcVsC6OdJ7XxnzplFdWlARKJo9TeKjdXfh8ckVV8esA=;
        b=NCx1jsi6k3lsOy8nrASnIzDE2SFmqfExnt0ZOQ+ki1pHCF7C6vo2wNeLgyaqcDbybZ
         d3EvGE47iRGukPvJxGyrP9iKa0Qn+pner2tgsRVaQKZLaCCNv+jxi+vr2enmg7l/kXjb
         SQtfhcJfI9rqHwhILIkkcOhgHF63ORt6Fku1YNILztqsbHZmGryOD6RtZ57F4lUFS7vs
         g5tFm9jCHM9OUEc5OSDwyvRsUH1gPLPkVcPAp4QJ5y/wvcrmS4Ut7We+WR0E1GNEoHad
         YbXYdkzIHxakg3zFJURxkMXP4/xYywI/EoWFpa/bKbGDenm+y1XR3PczSnCNl4Z92ASp
         aS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gcVsC6OdJ7XxnzplFdWlARKJo9TeKjdXfh8ckVV8esA=;
        b=BtH27gr9osxRXoYv+ljEB8ZcK6wx/YadT90rtU97krB+QCZ86Kcm9BFTilTCgY8zI1
         m2krBWPZVSMP+wZjQzvtSwQB0R5SAX58SRNhrPL42AAYxHA3qSd2Um6GxLLjrw6GUvEW
         VamfBoLJ+0KK9CaVGLOMk4F9U01o/YptV9QbQtCagHGOdfajzls2c6q2THEa88l25TK2
         bfBSRqWK8NsFDMkyeWlZ/gPd3v4T8JZb+wmWmYeE1f6/opEJYt0+mvNRq9cDcy2sjoNa
         Bxys0ouzdHQiB+72Aee7+W8gEiJghw9dcAqR3MkmjNPdpqe5W0lTzGABuVsGD3j3BG5p
         oc/g==
X-Gm-Message-State: APjAAAW5qYnBNHyU2RszcCEhuiirHt0tnT7Cpl3lejHFj9pikSbAi39X
        QrfDam1H8lMX42Ee16VETf3cB8mK
X-Google-Smtp-Source: APXvYqxRequvPbq89Gf60x1WMhT/CJ92IANcNpx4MpPC6mdZ0VimE46hHWydJfvdpOVUPYRE43RbPQ==
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr8481019qtm.250.1567110954961;
        Thu, 29 Aug 2019 13:35:54 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id e11sm1252042qkl.111.2019.08.29.13.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:54 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 08/13] tests/instantiating: test the unlinked keyid
Date:   Thu, 29 Aug 2019 16:35:35 -0400
Message-Id: <20190829203542.4410-13-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Testing the `0` ID just repeats the "BAD KEY" tests at the beginning of
the file.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/instantiating/bad-args/runtest.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/keyctl/instantiating/bad-args/runtest.sh b/tests/keyctl/instantiating/bad-args/runtest.sh
index 0b01395..d611fb9 100644
--- a/tests/keyctl/instantiating/bad-args/runtest.sh
+++ b/tests/keyctl/instantiating/bad-args/runtest.sh
@@ -41,11 +41,11 @@ unlink_key --wait $keyid @s
 
 # check that a non-existent key ID fails correctly
 marker "CHECK NON-EXISTENT KEY ID"
-instantiate_key --fail 0 a @p
+instantiate_key --fail $keyid a @p
 expect_error EPERM
-pinstantiate_key --fail a 0 @p
+pinstantiate_key --fail a $keyid @p
 expect_error EPERM
-negate_key --fail 0 10 @p
+negate_key --fail $keyid 10 @p
 expect_error EPERM
 
 echo "++++ FINISHED TEST: $result" >>$OUTPUTFILE
-- 
2.21.0

