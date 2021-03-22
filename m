Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51D93444F6
	for <lists+keyrings@lfdr.de>; Mon, 22 Mar 2021 14:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhCVNJn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 09:09:43 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:52336 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233743AbhCVNIt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Mar 2021 09:08:49 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0USy8t89_1616418526;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0USy8t89_1616418526)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 22 Mar 2021 21:08:46 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Cc:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: [PATCH] sign-file: Fix confusing error messages
Date:   Mon, 22 Mar 2021 21:08:46 +0800
Message-Id: <20210322130846.117234-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.3.ge56e4f7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When an error occurs, use errx() instead of err() to display the
error message, because openssl has its own error record. When an
error occurs, errno will not be changed, while err() displays the
errno error message. It will cause confusion. For example, when
CMS_add1_signer() fails, the following message will appear:

  sign-file: CMS_add1_signer: Success

errx() ignores errno and does not cause such issue.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 scripts/sign-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f57..37d8760cb0d1 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -107,7 +107,7 @@ static void drain_openssl_errors(void)
 		bool __cond = (cond);			\
 		display_openssl_errors(__LINE__);	\
 		if (__cond) {				\
-			err(1, fmt, ## __VA_ARGS__);	\
+			errx(1, fmt, ## __VA_ARGS__);	\
 		}					\
 	} while(0)
 
-- 
2.19.1.3.ge56e4f7

