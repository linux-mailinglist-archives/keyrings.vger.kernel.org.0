Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60BB51714E8
	for <lists+keyrings@lfdr.de>; Thu, 27 Feb 2020 11:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgB0KY7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 05:24:59 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:14033 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728680AbgB0KY7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Feb 2020 05:24:59 -0500
X-IronPort-AV: E=Sophos;i="5.70,491,1574092800"; 
   d="scan'208";a="84501822"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 18:24:55 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
        by cn.fujitsu.com (Postfix) with ESMTP id 0814B50A9978;
        Thu, 27 Feb 2020 18:15:10 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 18:24:54 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 27 Feb 2020 18:24:55 +0800
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To:     <dhowells@redhat.com>
CC:     <keyrings@vger.kernel.org>, <xuyang_jy_0410@163.com>,
        Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Subject: [PATCH] KEYS: reaching the keys quotas correctly when instanttiating
Date:   Thu, 27 Feb 2020 18:25:45 +0800
Message-ID: <1582799145-16073-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0814B50A9978.ACD0B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

I wrote a regression test[1]to test commit a08bf91ce28ed
("KEYS: allow reaching the keys quotas exactly"), but it
failed even I used lastest kernel. It looks like the previous
patch doesn't remove "=" when we instantiate the key.

[1]http://lists.linux.it/pipermail/ltp/2020-February/015331.html

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 security/keys/key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index 718bf7217420..e959b3c96b48 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -382,7 +382,7 @@ int key_payload_reserve(struct key *key, size_t datalen)
 		spin_lock(&key->user->lock);
 
 		if (delta > 0 &&
-		    (key->user->qnbytes + delta >= maxbytes ||
+		    (key->user->qnbytes + delta > maxbytes ||
 		     key->user->qnbytes + delta < key->user->qnbytes)) {
 			ret = -EDQUOT;
 		}
-- 
2.18.0



