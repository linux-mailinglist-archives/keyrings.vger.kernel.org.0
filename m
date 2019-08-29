Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B06E9A2823
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfH2UgA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:36:00 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:43421 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbfH2UgA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:36:00 -0400
Received: by mail-qk1-f178.google.com with SMTP id m2so4191682qkd.10
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=Lq+8FX3l3aUg5pGIBW856VdBW0x8Lql/XYwfFIYuVDyAWLkMbIPIbh/0CMGRnnMkA5
         TAn9W9gu9nbM27sgi6jhn7K5JICm+s4qTMcWf6gDo8+fVuu8vLwHFOVbE0bBLWlAk9w7
         xfblc5SaaunXcIEzeh0toacqq9iTKrvRJvgXxkSJwOdrec18cV8Kql/IMEbLTApLxytn
         oy6qO3ihxua2kjxngfENEKv2ZvPEVS2S64znQAqLc7xrFzRS90ibz8+6W83OBNdUitca
         KJ2DXAdEtT0GnhUvlACdFJFVeexBSdl9U3nzKpktfiU20/2D9cmvOu2ga+HY4knhcZ7h
         mA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Utx2Qs6MT/hfI9wk7gvJPrysZkKWMPYKawrcOIG698s=;
        b=c8PVClSNjkkO1tb3ZBbEtFiifz/ON+TQkuAo/o1o3SFHoLRDCjd4j2WIUqUNMmYWWP
         pV6WMMnqTw6dumUQ3ueARIEJGOxb7/xEQD7rs6E/qD6GyVQ8zyeuA57jCHtUfPTLApde
         orRUg6QMh6QgYAYTHaU6L1NPkWRWj1IM3E+su151NVGZYN5C3ZkTEiscQDe/hBqaidjL
         qdJgXfbgQWtwcltHvDyklQV7DtSoB9umTwQHIQbYlOmUcOBkZAmRpdmJhgaXypMc1ExA
         7+mHmgShe1RVeaRUzuOwRTWo1suuIRqJ5gHlLgV3ifgQUrii7Rq1yAvm7Hap+bjTxzfu
         e0Gg==
X-Gm-Message-State: APjAAAUoNbb7XDA3LyPHLF1GaBTjUr7AJ78RArtCTDhD5vqP2eIQQzyL
        24WdY4r+AqL8dRuoHM5Av0HvzBS2
X-Google-Smtp-Source: APXvYqzmgrx1Vs3XhLE8ca6ar2uNieqIKedRbB/15L6+ISAXD42ihqLHzNqDNgh24oyVrWd6AQUUpQ==
X-Received: by 2002:a05:620a:1445:: with SMTP id i5mr5862012qkl.261.1567110958962;
        Thu, 29 Aug 2019 13:35:58 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id h52sm2221543qte.73.2019.08.29.13.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:58 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 11/13] tests/readming: remove revokation test
Date:   Thu, 29 Aug 2019 16:35:40 -0400
Message-Id: <20190829203542.4410-18-mathstuf@gmail.com>
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

