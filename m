Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B11CA2851
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfH2Uns (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:48 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40160 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfH2Unr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:47 -0400
Received: by mail-qt1-f193.google.com with SMTP id g4so5258415qtq.7
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=leAPX3PxirVKaonLdRHHgkSghgNIHW25bFR97P+BnMPqW3amHCx5n9lHpdwaS+urTi
         0pJvcckNlqzyaprqnVgjeqy6VHIS4OvWJmP4koR0MbohYTiEUG5bN+1GLD0/Fz5jTWQa
         4eQDBBymD+Gaygx034PWbTWAfsnvCESn0ZCHuEQdUj/F+/b0qKGNwVcTZ1iPTDBbgrVk
         uLX3eqgL1CbxdhQexOTDB6YUjO78ksTUZsvQ46BqBevGK76LpjiwzFDc77Hy9aT4FTEN
         zm+a3ws6/D5qgnHxoLwT83OX3jpQg05+4Fxt+neJI+GjHzZZJE2I5OMft4ccOuuXbOQW
         nGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=qICecMpC5oDP/BjCIPR3C+r1mBjmnGymA3gDmJfWA5xz2ZLkUJuhgR+UXZKj95tEx/
         gq4iqWGnNbnN+Xrez5cyjIUbwHnoz5XSFsXh9XuDeIlZ59RMhwfpNfcxsMQetvPX/4X7
         1NcVsoWqxWx4Ra22Ep9n1+UpGmUNo68zpw2kJNTn6JbjL5AaAuZ/wl7ZDPwQXts4IhQh
         Poat5A2JvtzHzgW3jbgDBg5y0S4tM4W0RCrzkD1kr6bSf1Mqxf0/71FzQgrBGAQlA3sZ
         mHyQ+Rhsdumn8xSn+RjT+xsMeHJ0PPGdjd+xFM1IoKYveVBgcEK6AvYcgeQdEIbxrgBi
         bIjw==
X-Gm-Message-State: APjAAAXqS9xKLUTtYF+Ree2wpMkQD/RMhhKuAjgTUZaYUbmQsjlgSQ0J
        qYA+GcDddzbalRlVbB8PQXHHUbdm
X-Google-Smtp-Source: APXvYqzJRHSaSrf0oABj3OH4BjN5CxD8Dl+oWaSjRO63GXjn1c6u4BnMZ3RoWUQd0Wokuw0awEUW1g==
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr12085604qtn.176.1567111426610;
        Thu, 29 Aug 2019 13:43:46 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id s3sm2146847qkc.57.2019.08.29.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:46 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 11/13] tests/readming: remove revokation test
Date:   Thu, 29 Aug 2019 16:43:20 -0400
Message-Id: <20190829204322.8015-13-mathstuf@gmail.com>
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

This is already tested in the revokation test script.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/reading/valid/runtest.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/keyctl/reading/valid/runtest.sh b/tests/keyctl/reading/valid/runtest.sh
index 2fb88b9..9a533ef 100644
--- a/tests/keyctl/reading/valid/runtest.sh
+++ b/tests/keyctl/reading/valid/runtest.sh
@@ -78,12 +78,6 @@ set_key_perm $keyid 0x370000
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

