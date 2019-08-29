Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBAEA2821
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfH2Uf6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:58 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:43419 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2Uf6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:58 -0400
Received: by mail-qk1-f179.google.com with SMTP id m2so4191615qkd.10
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eKeAJxwvjeNHSo6hS/lKurj8Kej2qKZxcbQtkzc9j58=;
        b=JE5A3CH0XixxwzrOJalCfjACCt5Ok61M7qj4N5Voj6tUMGn8A+fVrg9OmV+X22/g2s
         70RHYTQXMev8vx6DkqbRqnU612Jv48haSosQ7h9+9bWlyCVd5Db7nzbeaw2fKXDuIYmK
         9gUKobWaQSH3vKGpZWIzJgYhGSDwKRV/cf1+0q+SuZ7Is0pELO2UsvkFahl8KLg3Ii6C
         wK/aG4YdcbkxVacjihBCcmFuS1hzpsnrYssjjB8XLsrV6FcRxankfVUFYL2w4LSiGjGe
         lcNDSCJ1eGmZg5QRA7q84e3CnubhaDPCILVYiQJt3X9xvWmDMMCNnZnZ0xCHVlmqhg7F
         eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eKeAJxwvjeNHSo6hS/lKurj8Kej2qKZxcbQtkzc9j58=;
        b=qTHWfUoqyNLXnYTFN9cC0dikdJ/hJ+VLEjNzXs+IZYQx9hlZ87aEyr1QlbYoJlDdGt
         HrprPHSi5muisKfviL9yierLM7uUv5QN6/ZN9Z44w3vmXKbTHn8FtDWNKkoFGUlqpN9P
         tLjPKHwOGnSoT2PqcykBhQ/H6uWPJ0iV5B/KF7Qnavb663voMpqo9mxPhSL6qy3i5lfy
         4eS5EhrbHR+GLzFgcM57Y3aBOiiF/LEkq3JehCc6MdTMN7AbZvv4dQD9FMWQV2JQyV4F
         h0/NE3/QVB0xvsPmuHWi6+MWUrg47k79T0MZMoaRsuMmVfTa+8wFUQVF4spn5OoRrndc
         TXhg==
X-Gm-Message-State: APjAAAUZTt0vDFOMO4GwNHWT+quVxHZqbcSL0bmh/NgPaPA4dif2lR2n
        bCqzavMCwGccgFwjJvyHGvzJC0qM
X-Google-Smtp-Source: APXvYqyN+LPabvWcUOKVBLy6is4Oz4Cai+6SGaDHOSySjlIqBUzXIaq6u3ikMUVySO83Oid+nNp2wQ==
X-Received: by 2002:a37:7404:: with SMTP id p4mr11738101qkc.476.1567110957321;
        Thu, 29 Aug 2019 13:35:57 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id e2sm1641830qkg.38.2019.08.29.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:56 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 9/9] tests/reading: remove revokation test
Date:   Thu, 29 Aug 2019 16:35:38 -0400
Message-Id: <20190829203542.4410-16-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is already tested in the revokation test script.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/reading/valid/runtest.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
index c5a4e3f..a3ac773 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -80,12 +80,6 @@ set_key_perm $keyid 0x370000
 print_key $keyid
 expect_payload payload "gizzard"
 
-# revoke the key
-marker "REVOKE KEY"
-revoke_key $keyid
-print_key --fail $keyid
-expect_error EKEYREVOKED
-
 # remove the keyring we added
 marker "UNLINK KEYRING"
 unlink_key $keyringid @s
-- 
2.21.0

