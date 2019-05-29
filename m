Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401E32E942
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 01:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfE2XZm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 19:25:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49102 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfE2XYA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 May 2019 19:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uax00MhLlFpYA5SZzOVY82diwalzYA3SNqGmlnWlanE=; b=kTZaNgY8IS2WUGMaubq5OAkUu/
        X0J9LlW6SLqlGP2ppYMrJxEGCMkUD/nt6WP/QhcunA8ADrNtE0lcMI6SITWRC3ogZqToggXLlBy9z
        AiTp9S29KGtIWe3NwmcexCP6szLGKWKmXN+GkkxGPB9Ki/JrbNrA10MmmfupUVg/2D77YciHxMQlp
        9gPMsmaiUNK5MnqU5Ng96bAC+kSKHv9cEJFafbS4XlbWdIGpAKN2oygtRtqFj6079B3COGE5wON7y
        vYuwxFVip49GBfSN3bkieTRn3vHGg31CFPmMmZXZDn29QavKd3fGsoeoLECGxCcHOOP/U2dfUSKjn
        wYnsj8XA==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hW7vL-0005Rr-BP; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hW7vI-0007xz-Vg; Wed, 29 May 2019 20:23:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH 19/22] docs: security: core.rst: Fix several warnings
Date:   Wed, 29 May 2019 20:23:50 -0300
Message-Id: <6543f70a5b8d53ef59614a42ef09b0b3d85ba4f7.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Multi-line literal markups only work when they're idented at the
same level, with is not the case here:

   Documentation/security/keys/core.rst:1597: WARNING: Inline literal start-string without end-string.
   Documentation/security/keys/core.rst:1597: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1597: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1598: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1598: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1600: WARNING: Inline literal start-string without end-string.
   Documentation/security/keys/core.rst:1600: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1600: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1600: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1600: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1666: WARNING: Inline literal start-string without end-string.
   Documentation/security/keys/core.rst:1666: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1666: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1666: WARNING: Inline emphasis start-string without end-string.

Fix it by using a code-block instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/security/keys/core.rst | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 9521c4207f01..3fd60dcb2dc6 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1594,10 +1594,12 @@ The structure has a number of fields, some of which are mandatory:
      attempted key link operation. If there is no match, -EINVAL is returned.
 
 
-  *  ``int (*asym_eds_op)(struct kernel_pkey_params *params,
-			  const void *in, void *out);``
-     ``int (*asym_verify_signature)(struct kernel_pkey_params *params,
-				    const void *in, const void *in2);``
+  *  ``asym_eds_op`` and ``asym_verify_signature``::
+
+       int (*asym_eds_op)(struct kernel_pkey_params *params,
+			  const void *in, void *out);
+       int (*asym_verify_signature)(struct kernel_pkey_params *params,
+				    const void *in, const void *in2);
 
      These methods are optional.  If provided the first allows a key to be
      used to encrypt, decrypt or sign a blob of data, and the second allows a
@@ -1662,8 +1664,10 @@ The structure has a number of fields, some of which are mandatory:
      required crypto isn't available.
 
 
-  *  ``int (*asym_query)(const struct kernel_pkey_params *params,
-			 struct kernel_pkey_query *info);``
+  *  ``asym_query``::
+
+       int (*asym_query)(const struct kernel_pkey_params *params,
+			 struct kernel_pkey_query *info);
 
      This method is optional.  If provided it allows information about the
      public or asymmetric key held in the key to be determined.
-- 
2.21.0

