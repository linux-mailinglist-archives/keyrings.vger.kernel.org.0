Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB4524546F
	for <lists+keyrings@lfdr.de>; Sun, 16 Aug 2020 00:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgHOWYH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 15 Aug 2020 18:24:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:37956 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728765AbgHOWXq (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 15 Aug 2020 18:23:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E9063AC50;
        Sat, 15 Aug 2020 12:46:45 +0000 (UTC)
From:   colyli@suse.de
To:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Coly Li <colyli@suse.de>, Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH RESEND] docs: update trusted-encrypted.rst
Date:   Sat, 15 Aug 2020 20:46:14 +0800
Message-Id: <20200815124614.115201-1-colyli@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Coly Li <colyli@suse.de>

The parameters in tmp2 commands are outdated, people are not able to
create trusted key by the example commands.

This patch updates the paramerters of tpm2 commands, they are verified
by tpm2-tools-4.1 with Linux v5.8 kernel.

Signed-off-by: Coly Li <colyli@suse.de>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
---
 Documentation/security/keys/trusted-encrypted.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index 9483a7425ad5..442a2775156e 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -39,10 +39,9 @@ With the IBM TSS 2 stack::
 
 Or with the Intel TSS 2 stack::
 
-  #> tpm2_createprimary --hierarchy o -G rsa2048 -o key.ctxt
+  #> tpm2_createprimary --hierarchy o -G rsa2048 key.ctxt
   [...]
-  handle: 0x800000FF
-  #> tpm2_evictcontrol -c key.ctxt -p 0x81000001
+  #> tpm2_evictcontrol -c key.ctxt 0x81000001
   persistentHandle: 0x81000001
 
 Usage::
@@ -115,7 +114,7 @@ append 'keyhandle=0x81000001' to statements between quotes, such as
 
 ::
 
-    $ keyctl add trusted kmk "new 32" @u
+    $ keyctl add trusted kmk "new 32 keyhandle=0x81000001" @u
     440502848
 
     $ keyctl show
@@ -138,7 +137,7 @@ append 'keyhandle=0x81000001' to statements between quotes, such as
 
 Load a trusted key from the saved blob::
 
-    $ keyctl add trusted kmk "load `cat kmk.blob`" @u
+    $ keyctl add trusted kmk "load `cat kmk.blob` keyhandle=0x81000001" @u
     268728824
 
     $ keyctl print 268728824
-- 
2.26.2

