Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95F9394B4
	for <lists+keyrings@lfdr.de>; Fri,  7 Jun 2019 20:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732077AbfFGSyk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 7 Jun 2019 14:54:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42262 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728736AbfFGSyk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 7 Jun 2019 14:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uax00MhLlFpYA5SZzOVY82diwalzYA3SNqGmlnWlanE=; b=OhL+52KyDBrHUieW2mIeoW0YJn
        3JtcLkEizrq9O1igz+VxMEaMffmJkQpN5Lj5FAZzJ14g/KGgwLPNDPFjO8mjw6ZGLSAPpxAkJL2YP
        TTWsASrZeOqC83qtbUA1VzvrJKiHnKJ2u+RjHkWodKTAxQZcetk/eAq2Yq9ViOft9IA2c4vrENqNW
        hBBgzy6F7VMqGwNtTDEmoQeA+I6CzjBjOi0JftPJ5sVrArXthGMIWPCDNcewjz5/vEmS5XXLTMn9N
        12S1smNQMWvnMFqLrd8i1ZMcGL8/iWAmto/v4NdV/uLEZ8/IILCXL7B0W1tNUPWGNI18MoZT7+ZrW
        DaB/++lw==;
Received: from [179.181.119.115] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hZK0d-0005sb-JE; Fri, 07 Jun 2019 18:54:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hZK0b-0007FA-Ge; Fri, 07 Jun 2019 15:54:37 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH v3 12/20] docs: security: core.rst: Fix several warnings
Date:   Fri,  7 Jun 2019 15:54:28 -0300
Message-Id: <8fb1ec1bbe34b0f5924b75204c26ba7f96f9e663.1559933665.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
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

