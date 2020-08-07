Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78A823F183
	for <lists+keyrings@lfdr.de>; Fri,  7 Aug 2020 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgHGQvb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 7 Aug 2020 12:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGQv3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 7 Aug 2020 12:51:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE97C061756;
        Fri,  7 Aug 2020 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=WT4EsZ09q5GDbk6mx7GEfLZNbwgMgcuPWWQjqxXHSqU=; b=BW1BD/fNefW124izLPKM56T4x5
        LKR4bsXz2ixqJGw6OTNhjw0/pB/EDzQdMN0wmgjEGYWKTVfvohcBEoEqnaIqW5irmI9jGhQfToxQk
        4s0jN0qcf7kXyZAvrh6zV90cIrBPvA4sYu9naJ6y9tHaMjxvKoZ9PpJI8EKtbdtxarJX/eRESYmLc
        hE5oSwFi3I9gZWDpbSfFORpI4yAEl0Jo1ylODA1wqBdq3jr9dF6+Wf5XaXSfEvRO3JxsndVPvuhFq
        K+V6yafqdk40XdPF6a57UdTeESI6Q5qvf7WT8koFeg6xMothZtxl7xb+1kxlS/LzSTNzaMIa8a/ws
        RN4Agaig==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k45aY-0004FW-K9; Fri, 07 Aug 2020 16:51:27 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org
Subject: [PATCH] security: keys: delete repeated words in comments
Date:   Fri,  7 Aug 2020 09:51:23 -0700
Message-Id: <20200807165123.3863-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Drop repeated words in comments.
{to, will, the}

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: keyrings@vger.kernel.org
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org
---
 security/keys/keyctl.c  |    2 +-
 security/keys/keyring.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20200731.orig/security/keys/keyctl.c
+++ linux-next-20200731/security/keys/keyctl.c
@@ -506,7 +506,7 @@ error:
  * keyring, otherwise replace the link to the matching key with a link to the
  * new key.
  *
- * The key must grant the caller Link permission and the the keyring must grant
+ * The key must grant the caller Link permission and the keyring must grant
  * the caller Write permission.  Furthermore, if an additional link is created,
  * the keyring's quota will be extended.
  *
--- linux-next-20200731.orig/security/keys/keyring.c
+++ linux-next-20200731/security/keys/keyring.c
@@ -881,7 +881,7 @@ found:
  *
  * Keys are matched to the type provided and are then filtered by the match
  * function, which is given the description to use in any way it sees fit.  The
- * match function may use any attributes of a key that it wishes to to
+ * match function may use any attributes of a key that it wishes to
  * determine the match.  Normally the match function from the key type would be
  * used.
  *
@@ -1204,7 +1204,7 @@ static int keyring_detect_cycle_iterator
 }
 
 /*
- * See if a cycle will will be created by inserting acyclic tree B in acyclic
+ * See if a cycle will be created by inserting acyclic tree B in acyclic
  * tree A at the topmost level (ie: as a direct child of A).
  *
  * Since we are adding B to A at the top level, checking for cycles should just
