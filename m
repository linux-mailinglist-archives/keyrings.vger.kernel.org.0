Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E02231808
	for <lists+keyrings@lfdr.de>; Wed, 29 Jul 2020 05:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgG2DX7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Jul 2020 23:23:59 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:63058 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgG2DX7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 28 Jul 2020 23:23:59 -0400
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-09.nifty.com with ESMTP id 06T3JUrR017274
        for <keyrings@vger.kernel.org>; Wed, 29 Jul 2020 12:19:30 +0900
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 06T3In2l014195;
        Wed, 29 Jul 2020 12:18:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 06T3In2l014195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595992730;
        bh=Aqvte3DD/AyUCy7Xdqzd/obevCR0/al1WB3hYmo2NQY=;
        h=From:To:Cc:Subject:Date:From;
        b=y1DJo4oQH5A1nPsfamA7v4G2OFAZ5qcbBRco+DkEzPxJ+hEMkJXtX3i8WCo+PjU6J
         dVm44M0iMSf+KAgVW0c08NUwhszSEPkvx4JrBsdIoGxlEuqNjCENdUitvtaoHNUt3t
         h0PPu6lXqy+RsZ/IHRI1TT9zVK1GLPva47m/VDxGZ+8qOCTbMZ97+vH6c43QklYG2n
         mwrZYGDZZ0d45MdNQLak5v+QALWFkafD76h8IK8T3jNHVPvr+k7MnLNzZyVp5Dki/o
         lJMcZfr1jgb6U+IME5Juesj1n5cYMPFvr2s2jHliQcKJbFVQ/3deT9r4NEqIkb7nnd
         rPdkMuUquU6Sw==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] extract-cert: add static to local data
Date:   Wed, 29 Jul 2020 12:18:45 +0900
Message-Id: <20200729031845.38333-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix the following warning from sparse:

  scripts/extract-cert.c:74:5: warning: symbol 'kbuild_verbose' was not declared. Should it be static?

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/extract-cert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/extract-cert.c b/scripts/extract-cert.c
index b071bf476fea..3bc48c726c41 100644
--- a/scripts/extract-cert.c
+++ b/scripts/extract-cert.c
@@ -71,7 +71,7 @@ static void drain_openssl_errors(void)
 static const char *key_pass;
 static BIO *wb;
 static char *cert_dst;
-int kbuild_verbose;
+static int kbuild_verbose;
 
 static void write_cert(X509 *x509)
 {
-- 
2.25.1

