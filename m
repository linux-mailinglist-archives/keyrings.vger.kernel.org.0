Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0382B172ED9
	for <lists+keyrings@lfdr.de>; Fri, 28 Feb 2020 03:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgB1CcK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 21:32:10 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:2812 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730439AbgB1CcK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Feb 2020 21:32:10 -0500
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; 
   d="scan'208";a="84605482"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 10:32:05 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
        by cn.fujitsu.com (Postfix) with ESMTP id EA8074CE3A48;
        Fri, 28 Feb 2020 10:22:18 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 10:32:04 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 28 Feb 2020 10:32:05 +0800
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To:     <jarkko.sakkinen@linux.intel.com>
CC:     <keyrings@vger.kernel.org>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        "Eric Biggers" <ebiggers@google.com>
Subject: [PATCH v2] KEYS: reaching the keys quotas(max_bytes) correctly
Date:   Fri, 28 Feb 2020 10:32:57 +0800
Message-ID: <1582857177-29093-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200227162623.GG5140@linux.intel.com>
References: <20200227162623.GG5140@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EA8074CE3A48.AFD28
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Currently, when we add a new user key, the calltrace as below:

add_key()
  key_create_or_update()
    key_alloc()
    __key_instantiate_and_link
      generic_key_instantiate
        key_payload_reserve
          ......

Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
we can reach max bytes/keys in key_alloc, but we forget to remove this
limit when we reserver space for payload in key_payload_reserve. So we
can only reach max keys but not max bytes when having delta between plen
and type->def_datalen. Remove this limit when instantiating the key, so we
can keep consistent with key_alloc.

Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
Cc: Eric Biggers <ebiggers@google.com>
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



