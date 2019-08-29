Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B761A2824
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2UgB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:36:01 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36413 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfH2UgA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:36:00 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so5270781qtc.3
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kCHhd+ltrGde7KPNF3PaYMfviiyTW97hMS8zoJ+D7yw=;
        b=H1Zy0ecXmYZygXTC6///8FYmYlexlRpq3CS9Ct8PH24HC+l3HfbJFtCulRw3VgkmE+
         lnFCBYOXTOmUfWIy6FOJuz/e3CXQWSbnFEBbIltPMbGz5/9ksvXV6nUxctxxlb1+98sF
         5riu8R7SSGKOwWN2EM8Y2J4YmrU/1ew+e3f9qDJq95mrGhO+PNfmEhGHR9w7o95bROXs
         JmQYZkOZ/NyEtk/WTgrgKnppbu1/8ca5DO5s1uAT6tir9fCaT+6Vsrv+P8KKSRy1Udii
         qh9cbfmI/PoMhESOSusebgH8E7SePsPNZOFw3TtyTVjHDFglgfsBu0m2fSlaaapFi4uc
         QJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kCHhd+ltrGde7KPNF3PaYMfviiyTW97hMS8zoJ+D7yw=;
        b=iI3JrYNTIt6K+OR8xW7PFPtd5puV4Ygtd58diduaTmt42Et79k+P+vo8yUWaKEt+Is
         UK7xU6E7pMPAEJ6t5APN9AJrbXb0Db0b83tVFohqrCbTUPhgZS8L801yLyMOd9cOMi+S
         gNpSd2+h9oWTW8CMPbZwjEkgI7t0gF7Z/4e2G0SuUm0yAr89WjwPwKHwFCebulcj7Fvw
         iXj02bYUpKx23bgAU5xthOfiKCpV8ojMmGw7qLGXUPSDmKDR9FrXhDJEJa/oJzbhJmHe
         IZAfLHuwJafKD0DHjFjPpINEQ1ADPkUM+o+8oMq6wVMB2hwTpVFWHn2PYPvkxeS+rbBa
         KQDQ==
X-Gm-Message-State: APjAAAUF/PzfQ76xnLbeViZP7WMzrpkHQMInKj33w9vQ2tLwnDv6mi79
        Fimfhq/6/HPOda7iEDeRy3Z/GftJ
X-Google-Smtp-Source: APXvYqwKWXqFAdav1m+7A53K0Hj+9rDRvitAawMFk54BX9Sg9oy7pIodOdHde87isHah56tneT3yiA==
X-Received: by 2002:ac8:3a85:: with SMTP id x5mr12248710qte.188.1567110959754;
        Thu, 29 Aug 2019 13:35:59 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id g8sm1693387qti.79.2019.08.29.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:59 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 12/13] tests/search: test searching with a mismatched type
Date:   Thu, 29 Aug 2019 16:35:41 -0400
Message-Id: <20190829203542.4410-19-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This should fail because the actually found key has a type mismatch.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/keyctl/search/valid/runtest.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/keyctl/search/valid/runtest.sh b/tests/keyctl/search/valid/runtest.sh
index d60ea61..a9912ee 100644
--- a/tests/keyctl/search/valid/runtest.sh
+++ b/tests/keyctl/search/valid/runtest.sh
@@ -32,6 +32,11 @@ expect_error ENOKEY
 marker "SEARCH SESSION"
 search_for_key --expect=$keyid @s user lizard
 
+# search the session keyring for the key using the wrong type
+marker "SEARCH SESSION USING WRONG TYPE"
+search_for_key --fail @s keyring lizard $keyring2id
+expect_error ENOKEY
+
 # search the session keyring for the key and attach to second keyring
 marker "SEARCH SESSION AND ATTACH"
 search_for_key --expect=$keyid @s user lizard $keyring2id
-- 
2.21.0

