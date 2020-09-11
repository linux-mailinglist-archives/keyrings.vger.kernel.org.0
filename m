Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347422662F8
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgIKQIR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgIKQIF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 12:08:05 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC10C061573;
        Fri, 11 Sep 2020 09:08:05 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id b79so5290440wmb.4;
        Fri, 11 Sep 2020 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7fDMMpZTmG7XBqh6MqKeeHMVBXF8pHyCf9SNZYBIJY=;
        b=B3yxJ73UCdHVqqdn451ZNKbdUCTuIhk1iSVZ9zrrYO0RrlVj0PSj74Z2u1MulOWVeK
         cdqp5f5KxklBhb88gRzDV2if5qK5yCgQ0R2B9/I3DBpaYtjqFhcrgdlhHcHe6cTG6Zg6
         ZYBdt7WayUHpuciaLy21viNJc8dKUc8lStJmoZpp6ZMEV34MxLLOmx2l4w8OPhS5aXdA
         rg66Gzcrm1l+HtLqR9Tl8ltOtdSbvxjqizp/0r0Wg81aExd2CIplOpoYwgu4Zq18A0P5
         HJgACObZ54Gczh4DhBJdURwPYt1XlpKBnwL1IT0cLd4WIGtYEhSt8ocQETVXVnY8x0Ie
         1rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7fDMMpZTmG7XBqh6MqKeeHMVBXF8pHyCf9SNZYBIJY=;
        b=bCS3otxayKYkKhOg0vimDcB0fb709ZL2Zua0LiLN4vM0sdekd9UI5vMNJ3J8qKLq+v
         sWg4QrN8MiCdKZvHv2Yh8V6o+dNdxrq8wuQ2qEvMtWezc21Iw2BdxOfVXeAYlHdg08Sr
         Jbhi5Sk029/6+wKPwmlecC0keLc2hMdPfvtReDOHTo4Mk4BLqPHa4MIWM1nAqMOO2MZh
         11yihcqOzlB6m+Tko94XrA/ezL05TAhjDQw70d3NJHmUd2UQelPrG8ZgMJVCLuLZQH94
         ws+ZASNaL/scafC7Gr9oH6xoaCYPgXaN62oCKUteDa5hMMKdM0zea/B/a7JJMITPiGQ9
         xDHQ==
X-Gm-Message-State: AOAM532LGo/DeJorKv1/BSuRJ/i1qjEMuMxilHkPlAhXU/VYU9cQQmLD
        GKENA+IvT+5fK/PcUNrFKao=
X-Google-Smtp-Source: ABdhPJzWFMFCNBa91w1CayAVeB17mBHueMRgD3X6E/Xo3Q69yThrCysEgTnScVfosZUKluqsrw2ADQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr2892715wmh.74.1599840483798;
        Fri, 11 Sep 2020 09:08:03 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id n4sm5434213wmd.26.2020.09.11.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 09:08:03 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] security: keys: Use kvfree_sensitive in a few places
Date:   Fri, 11 Sep 2020 17:06:50 +0100
Message-Id: <20200911160649.20164-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911160009.n2drvcjpzrsloxcj@lenovo-laptop>
References: <20200911160009.n2drvcjpzrsloxcj@lenovo-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In big_key.c, there are a few places where memzero_explicit + kvfree is
used. Replace these with a single call to kvfree_sensitive, to make the
code more readable.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
v2 - Update commit message as per James Bottomley's suggestion

 security/keys/big_key.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 691347dea3c1..d17e5f09eeb8 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -121,8 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 		*path = file->f_path;
 		path_get(path);
 		fput(file);
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		/* Just store the data in a buffer */
 		void *data = kmalloc(datalen, GFP_KERNEL);
@@ -140,8 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 err_enckey:
 	kfree_sensitive(enckey);
 error:
-	memzero_explicit(buf, enclen);
-	kvfree(buf);
+	kvfree_sensitive(buf, enclen);
 	return ret;
 }
 
@@ -273,8 +271,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
 err_fput:
 		fput(file);
 error:
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		ret = datalen;
 		memcpy(buffer, key->payload.data[big_key_data], datalen);
-- 
2.28.0

