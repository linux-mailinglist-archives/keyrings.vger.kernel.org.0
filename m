Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603A3A284C
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH2Uno (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:44 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38002 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbfH2Uno (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:44 -0400
Received: by mail-qk1-f196.google.com with SMTP id u190so4262192qkh.5
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gcVsC6OdJ7XxnzplFdWlARKJo9TeKjdXfh8ckVV8esA=;
        b=jxQnhJwjG6CBDJBVEZy8PN2l5XycXlUOjYO4yif/77TsDVHlM1J3qEvSFBCetlH45i
         Hz6tFP5WkAIkMXKMq6YpIUaPCkh94wVMyJMVIxuMkkKyc7p8TAQolz6hHyZ1RwjZXwfJ
         QayODQFd2XymGRSWXZpxzq6qjIFvBJn08OsH6OcpTwfQ5y9fqJPZhCuUMIpSKqHfiy4R
         ZRfffQ2VjUSMAWpqaH94u9yjo9tYTKsRHRUO68FtLmxaqslzM2kEqKp2mD3erkKef/wu
         S1HAdlPM97vCfdyNICoZOLjI4/stKOSr3Ml6vaXwD3QHbxGXM3XC/PZRxBr5QFZjgAzy
         9bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gcVsC6OdJ7XxnzplFdWlARKJo9TeKjdXfh8ckVV8esA=;
        b=ODi5+DH1FB72E+2NQ4tojghNu8fFLBDMZTEoYlMa7P3j882f+km4TYiX6kkWIJa/kL
         HYq3R5xGbHcynd1xVovM8v7s8yalyk/+dBj1FiFrgR4ZDenyIOk5gl2RWYEjHPSwAzYX
         jLyIEELMedagFrN76FZll94bhTzorMj+Ng2kixZ3A7VS5lN2ZpUBzfcbhut7millhBdn
         H4A8kZJ7HxE0xIDKHnJuqyHwjGrizWcMEYLMNU/K+HPJFqkk/azbcsGltl5de10fTnBZ
         HsIWYiXlbfYO8pMWJfpAikABGciEYBTtbCapfDUYMcsYlSChJ/ZcSZ2KjVr2nlM29jrh
         5bqA==
X-Gm-Message-State: APjAAAWOgmlRozE9pj0kezaWe23BQT7wjFLrqFldS6geKCIngOXusrN7
        UuNBqq0WW0tQdJhm9KLg+R31Ttkw
X-Google-Smtp-Source: APXvYqxaFX6iPMSMuXlf9adtNVefLP8ekYVyY8npdqpB0Qog5X+ARxRy54aKFuQjnzH2OJ4mZc6fIg==
X-Received: by 2002:a37:8e41:: with SMTP id q62mr11671007qkd.122.1567111423338;
        Thu, 29 Aug 2019 13:43:43 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id j78sm1823722qke.102.2019.08.29.13.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:43 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 08/13] tests/instantiating: test the unlinked keyid
Date:   Thu, 29 Aug 2019 16:43:16 -0400
Message-Id: <20190829204322.8015-9-mathstuf@gmail.com>
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

