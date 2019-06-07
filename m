Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E877382EC
	for <lists+keyrings@lfdr.de>; Fri,  7 Jun 2019 04:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfFGCwh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Thu, 6 Jun 2019 22:52:37 -0400
Received: from outbound.smtp.vt.edu ([198.82.183.121]:36852 "EHLO
        omr2.cc.vt.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726173AbfFGCwh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 6 Jun 2019 22:52:37 -0400
Received: from mr5.cc.vt.edu (junk.cc.ipv6.vt.edu [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x572qaZZ005698
        for <keyrings@vger.kernel.org>; Thu, 6 Jun 2019 22:52:36 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x572qV1o021642
        for <keyrings@vger.kernel.org>; Thu, 6 Jun 2019 22:52:36 -0400
Received: by mail-qt1-f197.google.com with SMTP id z16so668593qto.10
        for <keyrings@vger.kernel.org>; Thu, 06 Jun 2019 19:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version
         :content-id:content-transfer-encoding:date:message-id;
        bh=xhOqOPtnIgT5w7V9kBzDfbIhXpePUc/rfvE+YV2lNhA=;
        b=g/PPyXUas/KZ/CqCDQkpigf+2guDFhsDPOPbDMw3xuBceuDFu2zJ17ygndmlzmid19
         IdcS4kVxahQqFPjGil4sZ34k44ZaoQ21OQUjQVDGzyzKtVi7hITd6bAE6m0pVxOcQhdK
         B4axxdrmBR6mKtwVWvxGlarcc0ejbBvax4moPqlXIbP4VbPwHw90meqgLCj/ip6rdG5q
         nqqC5bvIqQj3rEyE9tb75JUonMdq4MnjImWo2Oeg6Ejofj7YnXNSCEECtCGUYvNfl+6S
         tClUInWN6OqislWuW2CqTYr+aKIyC4GcXDBq9+6Eyh2eqYWIHKYYfuKFK8CccNmBmyz8
         r6IA==
X-Gm-Message-State: APjAAAVkifVBIqkrqfyW0UuYAxB2lNv8ZuMcRO0dnPWBcWLltIroacl4
        /nN37PNwwcIa3qVZ1RV2u2UibhiA83qDTeDyZNYYbmZsC/NZP1WDFaEUYDAhF4XozhNpPOJq88J
        9C6a5h4Y4DqV2806S8ko8z+H49zO2/A==
X-Received: by 2002:a0c:add1:: with SMTP id x17mr11556926qvc.81.1559875951307;
        Thu, 06 Jun 2019 19:52:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2fYFAOGQCJq0C1I1vfVboOGbANTSG9489ARoGVT1WYRX4pxoio2wTG7MPs8CHgRktMdk4qw==
X-Received: by 2002:a0c:add1:: with SMTP id x17mr11556922qvc.81.1559875951167;
        Thu, 06 Jun 2019 19:52:31 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:4341::936])
        by smtp.gmail.com with ESMTPSA id k6sm375684qkd.21.2019.06.06.19.52.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 19:52:29 -0700 (PDT)
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] security/keys/request_key.c - fix kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29892.1559875948.1@turing-police>
Content-Transfer-Encoding: 8BIT
Date:   Thu, 06 Jun 2019 22:52:28 -0400
Message-ID: <29893.1559875948@turing-police>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When building with W=1, gcc complains due to a typo in a kerneldoc comment

  CC      security/keys/request_key.o
security/keys/request_key.c:35: warning: Function parameter or member 'authkey' not described in 'complete_request_key'
security/keys/request_key.c:35: warning: Excess function parameter 'auth_key' description in 'complete_request_key'

Fix it up to match the function

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 2f17d84d46f1..2623253ae6c8 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -24,7 +24,7 @@
 
 /**
  * complete_request_key - Complete the construction of a key.
- * @auth_key: The authorisation key.
+ * @authkey: The authorisation key.
  * @error: The success or failute of the construction.
  *
  * Complete the attempt to construct a key.  The key will be negated


