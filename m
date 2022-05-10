Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D3A521319
	for <lists+keyrings@lfdr.de>; Tue, 10 May 2022 13:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiEJLJB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 10 May 2022 07:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbiEJLJA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 10 May 2022 07:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7873298382
        for <keyrings@vger.kernel.org>; Tue, 10 May 2022 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652180702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iOkpzVwdzc0gzt+27fkc92K59poCEndTKCiLu+Tbxmc=;
        b=M77pVbH3p1NFg6ivS/mcTn4/7TslNteVPX0WAbv84fTXynbdCOwgAG5OWiItDfTgZUYeTx
        V8FlS5tquR3IfzRs9jP1Y7bYKmz7eDSiM+30nP0EzABzGoJPwtcGXjfXBNWlNGKFJotDWl
        gkCa4XkHpPYfqqsEUdXystQ2hBvTrY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-g5J18bbINFGgM_I_PdahVA-1; Tue, 10 May 2022 07:05:01 -0400
X-MC-Unique: g5J18bbINFGgM_I_PdahVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3907185A7A4
        for <keyrings@vger.kernel.org>; Tue, 10 May 2022 11:05:00 +0000 (UTC)
Received: from rules.brq.redhat.com (unknown [10.43.17.131])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 51C0814A59A1;
        Tue, 10 May 2022 11:05:00 +0000 (UTC)
From:   Vladis Dronov <vdronov@redhat.com>
To:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Cc:     vdronov@redhat.com
Subject: [PATCH] man: fix a formatting on the keyctl.1 man page
Date:   Tue, 10 May 2022 13:04:44 +0200
Message-Id: <20220510110444.14192-1-vdronov@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix a formatting and a command output on
the keyctl.1 man page in a couple of places.

Signed-off-by: Vladis Dronov <vdronov@redhat.com>
---

Hi,

This is a fix to userspace keyutils utilities, not to a kernel
security/keys/ code:

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/

Best regards,
Vladis

---
 man/keyctl.1 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man/keyctl.1 b/man/keyctl.1
index 2343762..c1d067f 100644
--- a/man/keyctl.1
+++ b/man/keyctl.1
@@ -302,7 +302,7 @@ The \fBpadd\fR variant of the command reads the data from stdin rather than
 taking it from the command line:
 
 .RS
-.fi
+.nf
 $ echo \-n stuff | keyctl padd user mykey @u
 26
 .fi
@@ -499,6 +499,7 @@ reject all links.
 .RS
 .nf
 $ keyctl restrict_keyring $1 asymmetric builtin_trusted
+.fi
 .RE
 .SS Read a key
 \fBkeyctl read\fR <key>
@@ -522,7 +523,7 @@ $ keyctl read 26
 $ keyctl print 26
 b
 $ keyctl pipe 26
-$
+b$
 .fi
 .RE
 .SS List a keyring
-- 
2.35.1

