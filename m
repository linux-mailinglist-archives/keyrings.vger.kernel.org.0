Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFF922533F
	for <lists+keyrings@lfdr.de>; Sun, 19 Jul 2020 20:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgGSSHn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 19 Jul 2020 14:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgGSSHn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 19 Jul 2020 14:07:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01394C0619D2;
        Sun, 19 Jul 2020 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=LwD3BNTWqy9VVz68hNXVzjmhjKffQZa+hKRUppd1yDw=; b=EVwqtxmvFiYl64oIY8smrDCVX/
        LpvQEQTEHbRQ7rkw2sxnpxDBLmLEkV7g/uhAZByLn+LQCz75IbfjKkwDpNmQAmuAvyvDU5jL/7mxm
        pyNRbycl8HWMtCql4tqykFUkbiSdIQiz1269NznuQiEC+RbxV7VdBI83QUmCb7foli1CLYW7gaaux
        dQyP1XQSP2ZLM8IffXn8lLs/xIK0Vsjbj3uVKE2XxuyZe//ZnjUROcBlCwVaP/gjpoYWc+nz06pEW
        t/VbtjRvmipJshBPviJR9yjApN3Jn+RRvcOix6M7Q7/EFrApq4Jgvf5VWQU7jseQRTY6WhXaIcmFY
        BIjCgixQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jxDit-00068u-1e; Sun, 19 Jul 2020 18:07:40 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH] crypto: asymmetric_keys: fix some comments in pkcs7_parser.h
Date:   Sun, 19 Jul 2020 11:07:34 -0700
Message-Id: <20200719180734.11812-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Drop the doubled word "the" in a comment.
Change "THis" to "This".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
---
 crypto/asymmetric_keys/pkcs7_parser.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-next-20200717.orig/crypto/asymmetric_keys/pkcs7_parser.h
+++ linux-next-20200717/crypto/asymmetric_keys/pkcs7_parser.h
@@ -41,10 +41,9 @@ struct pkcs7_signed_info {
 	 *
 	 * This contains the generated digest of _either_ the Content Data or
 	 * the Authenticated Attributes [RFC2315 9.3].  If the latter, one of
-	 * the attributes contains the digest of the the Content Data within
-	 * it.
+	 * the attributes contains the digest of the Content Data within it.
 	 *
-	 * THis also contains the issuing cert serial number and issuer's name
+	 * This also contains the issuing cert serial number and issuer's name
 	 * [PKCS#7 or CMS ver 1] or issuing cert's SKID [CMS ver 3].
 	 */
 	struct public_key_signature *sig;
