Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A80EDA2853
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfH2Unt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:49 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33220 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfH2Unt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:49 -0400
Received: by mail-qk1-f195.google.com with SMTP id w18so4290421qki.0
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6TM9c1l6tgwtavINbA1/5w4JlwDAt2gG6hfJPscEQc=;
        b=GX2fUoA0vVKu4fEBlN6I6ymoTIFUq58Z/kGJMDGibwaGVMo1H9vwNJoxPgdxpZpAs1
         UaxmqQLoyasEdb/MgRy9XJvXcfPdznnA4TOK7cg29y+PQn2II67ImEHZVoYTq2XV1QTB
         PIDPkdvezfCiRpNRCfo0Z+52vVKbR6RKjsY+je175SW5cu17P/HBuIi7ChULCqCuKF6n
         qtY8sNN4AjI6Tnd+P2LL6lSSfZAP+V2H40oXOQpOt8bK22vej4OKsXHmEfvuY5SIUZMT
         LoWA8DKSUGWhgHES3HV7u+X6snPgtm864q9IukH46MQbntC/y280h6V5WnAzaswWHgjl
         0+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6TM9c1l6tgwtavINbA1/5w4JlwDAt2gG6hfJPscEQc=;
        b=IOxpzkwJLle6ECTaIyQE8xm5OB9o0jiDChoW8INn7EaXL3LtZg8n0+7nZVU+1Ea3Bd
         y9PalzEOoAI3V479YiuK2MCuVAQZPY65A1TRizq2+wSiDxOoPirZWqIm6hIB1QDGdC3b
         6j04lGVpdhSnxjwE/4/on0y5XIkJkOpBvkaMztIW3P5ZyhTUCKPy+dBLp5x9eajliMF0
         uTmVUkKBFtR8P2z7uV8s6pCiHUFs489Jes16f8cEE6sC7soTyra9eau2j+HsyEsnyynE
         ZSwtxdj8sLNU7DKImXBnL3kF3EMDG1TlRnEABl//zJMxqTGRwi6v5iJMRcHruHAPol9D
         O+0A==
X-Gm-Message-State: APjAAAXyM1ftVv5m0BC/6o+xORlgLyYySKaymNZv4JFC8q5UKwdaEKq7
        XXUqcXY6wwXUSpv3EogPCX6m691s
X-Google-Smtp-Source: APXvYqzVRZ06B5CceUGaRvwlkan9vpxJZUjfenYyMG/kKXGa8y75wj7gkm7Ro+v1M9V4mCToKHQ+GA==
X-Received: by 2002:a05:620a:1181:: with SMTP id b1mr8796779qkk.390.1567111428336;
        Thu, 29 Aug 2019 13:43:48 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id j1sm50070qki.5.2019.08.29.13.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:47 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 13/13] tests/search: test a found key without search permissions
Date:   Thu, 29 Aug 2019 16:43:22 -0400
Message-Id: <20190829204322.8015-15-mathstuf@gmail.com>
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

