Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EAAA281F
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH2Uf5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:57 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:34507 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Uf4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:56 -0400
Received: by mail-qt1-f181.google.com with SMTP id a13so5277699qtj.1
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHKx7DRb00r5t0WEmDLKkhfNcTVonEXGTyrLPteqrfA=;
        b=fMp4iIci/S5qIIXaCRCStByMI1tqDNSFckOEiASAEk0eW9e0KpJJGEjXO872tHUkCo
         IINHnn5adF4Ni2NfRDTgy5UTU/ioSfZ5M/hRS7j3JAzmgUz0mTwnYWOpb+/kjzt/Hu7W
         YYNmYJTpeP0E9X2gxldIn29jId6Z0N+Kp8dM/3xlyS/fyg10mchdWBePNquuQxf+JFZM
         3POsul8xkPPkDJ5+wpm7LciTl7qB0Mf4e98b7CfIwvqqq3REg7cE6H10RQAiAlCvYsyn
         zBAMeyS6zHqsv1NdvUptCPA4nRfxDJ3jDjGHW273b6xui2Lm52O3Rhq+VikqTe01tqaq
         uxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHKx7DRb00r5t0WEmDLKkhfNcTVonEXGTyrLPteqrfA=;
        b=dLIZgnk1d00J1kq+rSmfLfY4iU89vTIqwPRx9j9TuDvgiKK3LluQfmEvn8Vim4r2Eh
         Xtn8JXAFJ8UebePTTOBTcoY/S8wmGhddZmmK25arPn98z1pK7aAqjZFk3w2cQHVnZoh9
         tlZREJG1Rnn1beku1f6M5CqsN5rqUqmLtNj0FkZfj3h449AGwvbz0/kAofRw6MqjXgne
         ohRUsVXXdPjqyBoF89D6Cg3s0wC8Bg9PkWdmNsyRZNjM04dlrH540wNDXgEEW44GFdUW
         JzlQGwV2R0gHa2ANvsTHtJFfAqcA3E5iqjoXWHy2l1yf/eqwRHtyGORlBQX43MvazyAl
         hxrA==
X-Gm-Message-State: APjAAAUlMdlIe/DTW5kwAqUTFogSR0C2G9eHTqvj0AO+ohJiuN4oVrAD
        xUmBX7HezMbyn4CiPZny02+gckIt
X-Google-Smtp-Source: APXvYqzuDe+VWlphqDVQzP17z+cQEDxf6Y4SMTnB0mHbQj4G7U0QWm469fNn5gXJyXYa1zCu3QkAsg==
X-Received: by 2002:a05:6214:1086:: with SMTP id o6mr8012148qvr.107.1567110955682;
        Thu, 29 Aug 2019 13:35:55 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id f133sm1966420qke.62.2019.08.29.13.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:55 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 8/9] tests/reading: fix test comment
Date:   Thu, 29 Aug 2019 16:35:36 -0400
Message-Id: <20190829203542.4410-14-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This comment was copied from another test. This one actually fails
because search permissions were also removed.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/reading/valid/runtest.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
index 8e4d864..c5a4e3f 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -59,7 +59,7 @@ print_key $keyid
 expect_payload payload "gizzard"
 
 # remove search permission from the key as well
-# - we should still have read permission because it's searchable in our
+# - we do not have read permission because it's no longer searchable in our
 #   keyrings
 marker "REMOVE SEARCH PERM"
 set_key_perm $keyid 0x350000
-- 
2.21.0

