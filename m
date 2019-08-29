Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB68BA2822
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfH2Uf7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:59 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:37648 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2Uf7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:59 -0400
Received: by mail-qt1-f176.google.com with SMTP id y26so5260918qto.4
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zYRguL71iEpdW6HrFMhIlMzoAwQWtDzgzu5oWuhHEJg=;
        b=bgNF8n0BJ2ZXPGjLc1btHrICzOpakkL/wwAxz8hcSIVRk6FKuYDQ/hIw8dDkumKpa6
         rNtIY0tH3vhFTTYm+X85yJZ7cPRgqPnvLK/MXubYg6yMP8AfLicanrgJzOqoVKGCXKLY
         E1FR7qx6Glkd1oJxIHsdnJ8f4eXGSiEiXvv/MIztBlQ13Au6AG3B31H0i2Ey7lJS5gBu
         cJE8z1TWYYb3WHD6sBE5KgAtMUBaHBCxVlGXu5ZtmvCMRgnX6fWNtwycVXsslg9SEKSy
         fiW3KSX37HSYlgm8TASIl5A0tSDVPD+wz9IrUoicC4rcKFsaEXicprgYpwGkqiBq3rnR
         lzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zYRguL71iEpdW6HrFMhIlMzoAwQWtDzgzu5oWuhHEJg=;
        b=ZRAJXzv7lJW2Z25PhJkqpaGmnD+sKHrKvZ4GHExYWJjI77mPXyEMkyE8tc89aoxBiW
         lFEExWuojUyKH59AvxTT5Rex4Bwdtlq2FJUxoF5T20IZBpT2azzbOt+o9r9cx8VmVvHc
         kNIw67NkaWLh25CdbR432vf7aGN4l/f0eMrjF2gKHPFTVZpJ3PyWt/nuuYOWFGqxWqmJ
         4cvFgXklULoMOUTt0S3Vc7eHnVhie2no7nw/ZRPtoyjU5P0obQ0xpuN2eYwe93QqxhJX
         QTc2DbTb/vQcR32pIAr3aOOVs+Yp5Okp9qyImzOuE80f31iR0ZILmhRUv9yXoXGNZgb2
         c0pw==
X-Gm-Message-State: APjAAAXkAUM5iKJ313jBWHSiU6W1VFgubgMt80Iq1aAGsIznaySaBOob
        xhzrngIyERpEY+e5gfidsIc5IEqZ
X-Google-Smtp-Source: APXvYqzGO9mHuyuBErY18ppEo6X+JwoFwwNQ9aoQURIHtlKESJa78uzRzM9hTL6giawz4vrG/77M5A==
X-Received: by 2002:ac8:2955:: with SMTP id z21mr11996346qtz.204.1567110958113;
        Thu, 29 Aug 2019 13:35:58 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id o124sm1363678qke.66.2019.08.29.13.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:57 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 10/13] tests/reading: fix test comment
Date:   Thu, 29 Aug 2019 16:35:39 -0400
Message-Id: <20190829203542.4410-17-mathstuf@gmail.com>
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
index a40ccaf..2fb88b9 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -57,7 +57,7 @@ print_key $keyid
 expect_payload payload "gizzard"
 
 # remove search permission from the key as well
-# - we should still have read permission because it's searchable in our
+# - we do not have read permission because it's no longer searchable in our
 #   keyrings
 marker "REMOVE SEARCH PERM"
 set_key_perm $keyid 0x350000
-- 
2.21.0

