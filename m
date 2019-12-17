Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8931122A39
	for <lists+keyrings@lfdr.de>; Tue, 17 Dec 2019 12:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfLQLgx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 17 Dec 2019 06:36:53 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:35358 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726560AbfLQLgx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 17 Dec 2019 06:36:53 -0500
X-Greylist: delayed 1623 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 06:36:52 EST
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihAjU-0004Hm-TF; Tue, 17 Dec 2019 11:09:41 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihAjU-008fzG-HC; Tue, 17 Dec 2019 11:09:40 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: trusted: fix type warnings in ntohl/nthos
Date:   Tue, 17 Dec 2019 11:09:39 +0000
Message-Id: <20191217110939.2067979-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The ntohl takes a __be32 and ntohs takes __be16, so cast to
those types before passing it to the byte swapping functions.

Note, would be32_to_cpu and be16_to_cpu be better here?

security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:201:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:202:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:202:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:202:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:202:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:289:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:290:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:290:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:290:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:290:15: warning: cast to restricted __be16
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:418:21: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:442:19: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:549:24: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:550:23: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:602:17: warning: incorrect type in assignment (different base types)
security/keys/trusted-keys/trusted_tpm1.c:602:17:    expected unsigned int [usertype] ordinal
security/keys/trusted-keys/trusted_tpm1.c:602:17:    got restricted __be32 [usertype]
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32
security/keys/trusted-keys/trusted_tpm1.c:638:20: warning: cast to restricted __be32

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 include/keys/trusted_tpm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/keys/trusted_tpm.h b/include/keys/trusted_tpm.h
index a56d8e1298f2..e080967931d2 100644
--- a/include/keys/trusted_tpm.h
+++ b/include/keys/trusted_tpm.h
@@ -12,9 +12,9 @@
 #define TPM_RETURN_OFFSET		6
 #define TPM_DATA_OFFSET			10
 
-#define LOAD32(buffer, offset)	(ntohl(*(uint32_t *)&buffer[offset]))
+#define LOAD32(buffer, offset)	(ntohl(*(__be32 *)&buffer[offset]))
 #define LOAD32N(buffer, offset)	(*(uint32_t *)&buffer[offset])
-#define LOAD16(buffer, offset)	(ntohs(*(uint16_t *)&buffer[offset]))
+#define LOAD16(buffer, offset)	(ntohs(*(__be16 *)&buffer[offset]))
 
 struct osapsess {
 	uint32_t handle;
-- 
2.24.0

