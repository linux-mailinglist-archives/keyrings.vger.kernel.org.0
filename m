Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF7BA2852
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH2Uns (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:48 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46561 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfH2Uns (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:48 -0400
Received: by mail-qt1-f195.google.com with SMTP id j15so5209143qtl.13
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kCHhd+ltrGde7KPNF3PaYMfviiyTW97hMS8zoJ+D7yw=;
        b=XmhizEscVsrj95Uqe/9uHp8NW1vQBc6tNACs8oY3+NFcCmyM2+7kOgP0pom8wNu6Wl
         buYf40/CkkMR6uuCBgyFEv8P5Q7yguQFsfvcamA5sHIYT9tlovkmwcMN0qN8ZWobr3VS
         Q5VvHncNXK266p8dOFl7m7rqPUMAAHv1ytslMVNJDkdK6Ow4tS+2Erio1VlfQYEzQHmL
         YvoqttR/1oKZzDzTXPoy/H0HzjKnyaDbrwsJMmvbmKYzw2R/DvVppwH0yWSlux/YMNHH
         K1jRbisCzpIZ5ph6SZKiZSmPepXGC4aN/JynshyJTawzSJi5A5GeeK98ZErMIpMvPpDk
         0ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kCHhd+ltrGde7KPNF3PaYMfviiyTW97hMS8zoJ+D7yw=;
        b=dkJrZtDKKCRIA0J3HUnUcJzk4ZRK1QH3XF1IVaRE4msod+8ZKfIIOzAdqUxqK9QfJL
         ZdmnkhtvJseqSym7TBLzjysZ5DmWiL2H71AmMNWMNFhJWGeYlUA6lAKsxXmM21BAaAp5
         slQF/PkV6eLrucHQNRIvXg3L0fujh9/5/y0jt5L+Ny34IWaRcS5O+RWuuHpyUz2DdVLD
         sOjpyywCAXe70094hQpIYaAF1qxr5E1erbQYqX9O/hH5ybtR1wcwkqwt5HODwuKYNnSw
         +6W13qy6RhHd8AVlCZqjYr3/uKDvnQO/YxE29Dn/iWPFRY0BAzzr0n9lE9fUwV9dQ6ch
         RlOQ==
X-Gm-Message-State: APjAAAXfvliYh6NOokqkTxqJ89savu24bMY6J4Ifx7EnAvKMpcE6o2hS
        mlv1s1rs/JaxZ35CpR/wnXFzQ4RN
X-Google-Smtp-Source: APXvYqxVfNG3N8rbPfQzzhKcdGNAnmKOnHV2iC5+3VOrjeRx2WKbXCg2jrJ5QYXhIdjw7+uEiYp08g==
X-Received: by 2002:a0c:fd23:: with SMTP id i3mr7819931qvs.12.1567111427418;
        Thu, 29 Aug 2019 13:43:47 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id q28sm1932517qtk.34.2019.08.29.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:47 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 12/13] tests/search: test searching with a mismatched type
Date:   Thu, 29 Aug 2019 16:43:21 -0400
Message-Id: <20190829204322.8015-14-mathstuf@gmail.com>
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

