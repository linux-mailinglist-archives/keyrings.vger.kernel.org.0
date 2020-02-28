Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5781F172FFD
	for <lists+keyrings@lfdr.de>; Fri, 28 Feb 2020 05:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgB1Elv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 23:41:51 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:12969 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726378AbgB1Elv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Feb 2020 23:41:51 -0500
X-IronPort-AV: E=Sophos;i="5.70,493,1574092800"; 
   d="scan'208";a="84636735"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 12:41:26 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
        by cn.fujitsu.com (Postfix) with ESMTP id A6BD3406AB15;
        Fri, 28 Feb 2020 12:31:38 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 12:41:25 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 28 Feb 2020 12:41:28 +0800
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To:     <jarkko.sakkinen@linux.intel.com>
CC:     <keyrings@vger.kernel.org>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
        "Eric Biggers" <ebiggers@google.com>
Subject: [PATCH v3] KEYS: reaching the keys quotas correctly
Date:   Fri, 28 Feb 2020 12:41:51 +0800
Message-ID: <1582864911-30823-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200228033009.GA932@sol.localdomain>
References: <20200228033009.GA932@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A6BD3406AB15.AF463
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

Also, fix the similar problem in keyctl_chown_key().

Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
Cc: Eric Biggers <ebiggers@google.com>
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 security/keys/key.c    | 2 +-
 security/keys/keyctl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 9b898c969558..d1a3dea58dee 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -937,8 +937,8 @@ long keyctl_chown_key(key_serial_t id, uid_t user, gid_t group)
 				key_quota_root_maxbytes : key_quota_maxbytes;
 
 			spin_lock(&newowner->lock);
-			if (newowner->qnkeys + 1 >= maxkeys ||
-			    newowner->qnbytes + key->quotalen >= maxbytes ||
+			if (newowner->qnkeys + 1 > maxkeys ||
+			    newowner->qnbytes + key->quotalen > maxbytes ||
 			    newowner->qnbytes + key->quotalen <
 			    newowner->qnbytes)
 				goto quota_overrun;
-- 
2.18.0



