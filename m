Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22698A2841
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2Unj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:39 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:45159 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Unj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:39 -0400
Received: by mail-qk1-f195.google.com with SMTP id m2so4202261qki.12
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TU+lIjBox9rtfZXjNx/hSbUDALTwf8QVza3me/tiGkg=;
        b=Qpq1nA78TOtSTVaWQiqVKWZg8p2Yy7ZuuHED1px1Jju63DFbz+y3qPYgHH5+gMw0GM
         HzucxH8Jo2uks3+PVKqFU5RqLalCS6TQhDEF236OdAG7HzRRLwLzw7M3hthNamD3khSC
         pM+dqzMQCiKvHR0fx8cWuDpjoJrDBgcNClBd5O3uUDtJ05qg24KXB0q2Nh9cuNgWdjta
         PZckcCyqOHzLyTHA8Vsw3K9sxuou0c8gZ4KGefGtAh8HYecOvVU2QHxvBW+iGE2g0f+b
         LL9ZU2TMs2Iu4yCpGopScMltK2cjbW2pOMwVHZ/ueBo326jMPdQK6yRa1QwxsCziB0IN
         FsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TU+lIjBox9rtfZXjNx/hSbUDALTwf8QVza3me/tiGkg=;
        b=S2epG0WoWrmU0KMRV4YXLjdMeuWuFcpSjyWmvYlbqkyPA5PTxCnfmOHWWCJpwszrSJ
         aefG1zimoe2UXFxnIdso/wAqT+KfTbWoDNU9arqpfdZxq+2DU2EtsSJC6YZZfZLrf8kS
         lMjdTMvwMyTUR6hBI1aCt9ZIL36Wvy97A2zMlCVV8YYYFV+hPY2dTYVwUVYAUs6FR15L
         wWrKBFBIsKIvH29huL2Noyrri+o05ruJHSlRNEfwLIor8BiF4+KYKhGLGnDXtb9HrsC2
         4mYtMPlUl9fNeamY+1OEgBCp3PDdH3yAqq3JfWqD61rOXN4HSGgWIm3k2DNFUYcwJXwy
         R3ow==
X-Gm-Message-State: APjAAAWnVxPck/qQ1zkmxUNWGh5JRyY8XLyzLruDRQ2SS7BZbGBp41up
        PoDbdNpCqo2gGQZSxyyUfpyKkykf
X-Google-Smtp-Source: APXvYqzHvnCXykdGWtfqTlUjiv7J8FSutvGlg9D1PxAgs4vlxwxe5cv0k5QV7KJbrXVqFFd5R090eQ==
X-Received: by 2002:a37:4d90:: with SMTP id a138mr11726772qkb.128.1567111418115;
        Thu, 29 Aug 2019 13:43:38 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id 22sm1876860qkc.90.2019.08.29.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:37 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 02/13] tests: fix some typos in marker lines
Date:   Thu, 29 Aug 2019 16:43:10 -0400
Message-Id: <20190829204322.8015-3-mathstuf@gmail.com>
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
 tests/keyctl/clear/valid/runtest.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/keyctl/clear/valid/runtest.sh b/tests/keyctl/clear/valid/runtest.sh
index bdefa46..e162bdd 100644
--- a/tests/keyctl/clear/valid/runtest.sh
+++ b/tests/keyctl/clear/valid/runtest.sh
@@ -75,7 +75,7 @@ then
 fi
 
 # clear the keyring
-marker "CLEAR KEYRING WITH ONE"
+marker "CLEAR KEYRING WITH MANY"
 clear_keyring $keyringid
 
 # check that it's now empty yet again
-- 
2.21.0

