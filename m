Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BBD25232B
	for <lists+keyrings@lfdr.de>; Tue, 25 Aug 2020 23:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHYVx2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 25 Aug 2020 17:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYVx1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 25 Aug 2020 17:53:27 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676DDC061574
        for <keyrings@vger.kernel.org>; Tue, 25 Aug 2020 14:53:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m8so8400785pfh.3
        for <keyrings@vger.kernel.org>; Tue, 25 Aug 2020 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4McPRWpAxlU32y8XaPFygwH2nMSoezEC1RLLmc+VFM0=;
        b=g37z0Jr/wdFePaRL0zdXJrrXbY8NEX+7j3InqpskyIVkwBi2JxNuJV/aDWKxsirUOy
         nBEYt3RVtDW1X99iGJS/JT/SCU4ZkT9zaBrjtFE4t4abQFquuHVmMcJlOqTu4m2BaH5a
         0sjTIDYJZVTKI0kcgQWrvORN4hgP1vfawB8bTnqkomtHhiNXOnWHt9GW3RTepLLYjNTx
         8yFzpEByDy57rNhl8oGzMaimTF5v/2aWFyi5ti60KNMp9MNogVHoSJLcZD+IfgLpMir1
         8Bdj1FXWIL+Akl2sXSmhYXKrXCemckOw8HDdoZ+sEEY5WiogEel4I3aWODAx7MANvvPl
         Uzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4McPRWpAxlU32y8XaPFygwH2nMSoezEC1RLLmc+VFM0=;
        b=mFgkpM3WdXeIIwNqn2XsvT+oBqSE+JcxsAh9VxHtPjG9Yv4pF22AKnuBwOMgvAh3ih
         gEM+NOuA8GPocRV5aHKQM5biRlG4NHGUcxNjqInL+kWsj2PQ6qt6lExZC3ZaQGz9qX3t
         nTs2/wtOXp1oPo2pcQPGDLSzMaWDF01QFLE9AmPKzNpeIQbE7ixFcXVqEYu8OywGngZJ
         5E9PkfwPmr3tX4YqX5UzJQ78MRkS7klI/2weyKVVkGg8lUPDEAAlJMjyBkgHelmZAP9l
         0ySGGOH4fTHivQpZBMXIRHpxo/A466qKqX/30fAmnjK46/sadXPJxFtq4348U0haBEQq
         kkyg==
X-Gm-Message-State: AOAM530fPEsGemVIATaTGD/EnurpJFRU4TvqMLdvtuIyXQVMPoLcFm6q
        dPVMh5UeKevDw11+DABv99Y=
X-Google-Smtp-Source: ABdhPJyLXUqfq+zQQ1JdNtQ43ntUmU9NeouX0BioZWi8fOUp0DkiTEzH447lwdAHlYQQz9McEMvRlQ==
X-Received: by 2002:a63:5459:: with SMTP id e25mr5539454pgm.155.1598392406701;
        Tue, 25 Aug 2020 14:53:26 -0700 (PDT)
Received: from wolf.lan ([8.25.195.25])
        by smtp.gmail.com with ESMTPSA id e124sm219983pfa.87.2020.08.25.14.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:53:26 -0700 (PDT)
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
To:     zohar@linux.ibm.com, keyrings@vger.kernel.org
Cc:     Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: [PATCH] docs: crypto: Fix parameters order for keyctl()
Date:   Tue, 25 Aug 2020 14:53:23 -0700
Message-Id: <20200825215323.309899-1-anatol.pomozov@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

key is the second parameter, keyring is the third one.

Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
---
 Documentation/security/keys/core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index aa0081685ee1..59f752bdfc47 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -604,7 +604,7 @@ The keyctl syscall functions are:
 
   *  Unlink a key or keyring from another keyring::
 
-	long keyctl(KEYCTL_UNLINK, key_serial_t keyring, key_serial_t key);
+	long keyctl(KEYCTL_UNLINK, key_serial_t key, key_serial_t keyring);
 
      This function looks through the keyring for the first link to the
      specified key, and removes it if found. Subsequent links to that key are
-- 
2.28.0

