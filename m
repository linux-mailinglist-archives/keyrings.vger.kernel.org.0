Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49374248C51
	for <lists+keyrings@lfdr.de>; Tue, 18 Aug 2020 19:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgHRRAg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Aug 2020 13:00:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:44284 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726930AbgHRRAe (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 18 Aug 2020 13:00:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 89043AC83;
        Tue, 18 Aug 2020 17:00:58 +0000 (UTC)
From:   Coly Li <colyli@suse.de>
To:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Coly Li <colyli@suse.de>, Dan Williams <dan.j.williams@intel.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v3] docs: trusted-encrypted.rst: update parameters for command examples
Date:   Wed, 19 Aug 2020 01:00:02 +0800
Message-Id: <20200818170002.38145-1-colyli@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The parameters in command examples for tpm2_createprimary and
tpm2_evictcontrol are outdated, people (like me) are not able to create
trusted key by these command examples.

This patch updates the parameters of command example tpm2_createprimary
and tpm2_evictcontrol in trusted-encrypted.rst. With Linux kernel v5.8
and tpm2-tools-4.1, people can create a trusted key by following the
examples in this document.

Signed-off-by: Coly Li <colyli@suse.de>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
---
Changelog:
v3: update commit log with review comments from Jarkko Sakkinen. 
v2: remove the change of trusted key related operation.
v1: initial version.

 Documentation/security/keys/trusted-encrypted.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index 9483a7425ad5..1da879a68640 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -39,10 +39,9 @@ With the IBM TSS 2 stack::
 
 Or with the Intel TSS 2 stack::
 
-  #> tpm2_createprimary --hierarchy o -G rsa2048 -o key.ctxt
+  #> tpm2_createprimary --hierarchy o -G rsa2048 -c key.ctxt
   [...]
-  handle: 0x800000FF
-  #> tpm2_evictcontrol -c key.ctxt -p 0x81000001
+  #> tpm2_evictcontrol -c key.ctxt 0x81000001
   persistentHandle: 0x81000001
 
 Usage::
-- 
2.26.2

