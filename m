Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7967BA2814
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2Ufs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:48 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39977 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Ufs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:48 -0400
Received: by mail-qk1-f193.google.com with SMTP id f10so4230627qkg.7
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TU+lIjBox9rtfZXjNx/hSbUDALTwf8QVza3me/tiGkg=;
        b=sJQWW2t7y3hx/KkBfQOZH4itwEALmiOCixZX4xJKJvpj3ULD77sFm+DAsCh9bK8uWC
         F+aCiV5kBskwuT03BkR/wjWn7qMaKeznZMa+hWQCKVB5i+YrgXXZFaPXD9dECCGgUSYx
         uAOvToinAArI0iSJLBnjeVUY9etru+ehaYBbGuO67Lwgnz1tsqTA3SmffXAibCVPJHF6
         9IqOsB52DIWthRUu08W3XWz2WBDWBvLrPFaNRsja/yxa0dNHkALX6uPItazzDwa/Q8PZ
         OSlKpoggHtunw5tBbEWan/gV701p9YcluyxRLakSBQi/P1tdw65isliNZFAPTodcZLjM
         awfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TU+lIjBox9rtfZXjNx/hSbUDALTwf8QVza3me/tiGkg=;
        b=iGpJz3518PAILYb/EN31G4r3W7GeUUSg/jhTVbhD4YnUYCHZxZKynqvwCm2HUAc19z
         pwPLEIuLV7db1acLT7uo203J58KCOarv7lgCV7NALWJgFCG7exJAasfCd9n+IzbGYEUZ
         +P7uJjTNU9+nSePo/xgPYfVD+9FqPcEvgRTRzBZWyUPYz2YHijmKxieWj3M0tLRMr8Fw
         1L/NKXzWrNULdOvlV/YOlaypmpTLCyML5gl9aPgyAOJg2kPVu/U8oc1C5W6UruCL3iX8
         5ns7FcPApAjy++TSHn4zj+fQCOdsnzyQ89V7IFvFMjmSgAbdEXZIc+6q1rA2WzsnJIAj
         PKzQ==
X-Gm-Message-State: APjAAAUoQJQDcB0G9/yW46yYjJjVmstzk7P2dR84WZZZ+95DpmEE4V1D
        AktgeUmh2W+vm/OkTINAB30+YfHj
X-Google-Smtp-Source: APXvYqycumGmfIGALtIatkIbZw7ARCHpB4VGzvjT1LS3pbg3LccVtHMMJSFg8ndF1sMoO5Bm6OhKaQ==
X-Received: by 2002:a05:620a:1471:: with SMTP id j17mr11353083qkl.484.1567110946902;
        Thu, 29 Aug 2019 13:35:46 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id t185sm1695535qkb.15.2019.08.29.13.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:46 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 02/13] tests: fix some typos in marker lines
Date:   Thu, 29 Aug 2019 16:35:25 -0400
Message-Id: <20190829203542.4410-3-mathstuf@gmail.com>
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

