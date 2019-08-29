Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3AFA2825
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfH2UgC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:36:02 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36316 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfH2UgC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:36:02 -0400
Received: by mail-qk1-f194.google.com with SMTP id d23so4242937qko.3
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6TM9c1l6tgwtavINbA1/5w4JlwDAt2gG6hfJPscEQc=;
        b=m13OOCHtnD6LTe8jurFTeSEDKS99tY3xhYl5c0uxGjk2UkZRSY6iRW8kD1XwDQrqj3
         OuB6/J4VSWni5Gm+xV6EI4zVkjkQedz9ACFBUbp4An6P7LDeTCo9vh1hHx28C2hW+DvP
         KNTDaCqR2vphaBD8PwBVJO/8TZrnVMPJg5BdFnKFggQ7CiPNE9vJ5FxyZOz/Ehs08mrK
         0CHK7r6Mt5ItWBJHxhWAZRhnAmJViC5LWx0R5K1YaiSWk3oGae18bok/TyrdGKGd8gf/
         EGeQtwmzUlCbfNWVovOknXLSNzSyD8AFNolT26o95rhUL+LW+Z/H66bKXlyUK0xAZ4r5
         MaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6TM9c1l6tgwtavINbA1/5w4JlwDAt2gG6hfJPscEQc=;
        b=CY+OUyHHpxzAKML81+yCmWOxQvRnG5E9NYK4IBbNegXqtiRxDHBnJro3T189AguV/F
         inOIRc5uGBETI9t7jc4nYJu3a9e40F9lz2h1x73PFDRWJRfq/nNut/N5wEAZBWMUeMtP
         qpzBzValNi6FXX3NydP8VjCWENYsFY6woIFULJQDpZZEy2WdcXd2vVJxNWTO2A3BFlLL
         IGTFcj9qo3r+cVMntjZYmmM3tUwttJWVQnEIs7VegyiFsjE7PRQY3SmktODjgM10fxsB
         +1r7B9EKvb0pGwiyyooVMR/14JP+dEuvB1Adoe2k6hLYHY3wdQnCsLP8sTNZ3u3NtfT7
         zKVA==
X-Gm-Message-State: APjAAAV9eTZgf2e4+glYMjZb+ujTkS8D9rQNWhqUPm204V6K8dnOQU5C
        yC6nOYBiNVPV/ePzy7aK7J6kBkUG
X-Google-Smtp-Source: APXvYqzvFndmZBMGszuXWLXOFx5/hMcVzLftwIvijCy7FVSOBBNM8ClTPJ/zCpkU4HvpofyJkLUsOw==
X-Received: by 2002:a05:620a:10ae:: with SMTP id h14mr12051587qkk.40.1567110960650;
        Thu, 29 Aug 2019 13:36:00 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id f2sm1624360qkj.58.2019.08.29.13.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:36:00 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 13/13] tests/search: test a found key without search permissions
Date:   Thu, 29 Aug 2019 16:35:42 -0400
Message-Id: <20190829203542.4410-20-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

These stanzas were essentially duplicates of the previous blocks.
Instead, test removing the search permission from the target key and
that EACCES is returned when this happens.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/search/valid/runtest.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/keyctl/search/valid/runtest.sh b/tests/keyctl/search/valid/runtest.sh
index a9912ee..e597170 100644
--- a/tests/keyctl/search/valid/runtest.sh
+++ b/tests/keyctl/search/valid/runtest.sh
@@ -135,14 +135,14 @@ set_key_perm $keyring2id 0x3f0000
 search_for_key --expect=$keyid2 $keyringid user lizard
 
 # removing search permission on the second key should hide the key
-marker "SEARCH WITH NO-SEARCH KEYRING2"
-set_key_perm $keyring2id 0x370000
+marker "SEARCH WITH NO-SEARCH KEY2"
+set_key_perm $keyid2 0x370000
 search_for_key --fail $keyringid user lizard
-expect_error ENOKEY
+expect_error EACCES
 
 # putting search permission on the second key back again should make it
 # available again
-set_key_perm $keyring2id 0x3f0000
+set_key_perm $keyid2 0x3f0000
 search_for_key --expect=$keyid2 $keyringid user lizard
 
 # revoking the key should make the key unavailable
-- 
2.21.0

