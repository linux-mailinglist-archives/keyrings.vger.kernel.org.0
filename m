Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04817A284F
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfH2Unq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:46 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]:42658 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2Unq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:46 -0400
Received: by mail-qk1-f176.google.com with SMTP id f13so4179055qkm.9
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zYRguL71iEpdW6HrFMhIlMzoAwQWtDzgzu5oWuhHEJg=;
        b=Ndn/CKqDFdSVvfzYQRqKqoXgfOcu9hKe++0bNOZ66RrNnDzmSpf9fE/wMeqa0eWtbF
         HT3HU+K+ownTcQB8KR5Gk3XK15vyk1hYJNEY4zO91TtV3xdIvff7NGPY+ulqZmfNPVA5
         m6lHVNSLJvpMVpaCwnOC9qJ54sMedHrZ46uQtdtGLwx01kZAGFB9sM15Fe69MsVXIff8
         rV4M9sgH3jIcbZkjeIG3B9kQWkHrJ4gwDlVRALZVek6ALaFufLdHzE3m6ysG4Wqo9jsx
         95g9gdpLg1MpbyQpa/14A7FT4pD+ehUYko0ZFxdJtQOuG9MqTzJGL5AxoyvUOZu9EN2o
         uoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zYRguL71iEpdW6HrFMhIlMzoAwQWtDzgzu5oWuhHEJg=;
        b=sZqLtZXIk/vAPqX++BBGUOEmmMNoA0uD8oxYIHFxfjTRXIXGiafu1LdoVlMYmKG4kO
         YRq3rTq3cpK7BvMm3ZdHX3KnSQNfnBCuiCkvRTkSRyezNqvT9+K5jYEyOkDDSYEiCdZU
         eIQPlGNH285YEarv4OIln2WYuOGV2lX/uNRbS4O3KmV7Anq3gPYy7/otlQnc0CBqjcpP
         UJpGqEobDg6oBTttsd7iVDqytfYMo7YDw2Qn4ZDGo2hjes3CW3zQ7LhqeV+FpqSV9kAI
         PR9slpQstTdxjEh3UDLQpAHqj66DitVu/TzdNdGeh+IHfMw+/VPYA7QcnSL/RuyYCNuE
         UvTg==
X-Gm-Message-State: APjAAAWn/6RedYTCOgj739IP4Q5U02wX5MAjONFsBGokRsNAe80O83ZI
        YbUJh9xNvb5LP/VGDoq5C1XJbKRw
X-Google-Smtp-Source: APXvYqyLv+4iwRxSUpOcYh2stOVY2I0kUJ5OkObaPOj+uP0elkIFehzvmH9Y6xdkRG9G3hroQWDGjQ==
X-Received: by 2002:a05:620a:110f:: with SMTP id o15mr12270779qkk.202.1567111424985;
        Thu, 29 Aug 2019 13:43:44 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id c13sm1865114qtg.3.2019.08.29.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:44 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 10/13] tests/reading: fix test comment
Date:   Thu, 29 Aug 2019 16:43:18 -0400
Message-Id: <20190829204322.8015-11-mathstuf@gmail.com>
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

