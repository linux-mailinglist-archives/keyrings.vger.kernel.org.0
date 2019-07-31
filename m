Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAA77C644
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbfGaPWN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:22:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40678 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730148AbfGaPVP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:21:15 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so66037307eds.7
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qu4eqa88cl7hA3fQdb28KWqV5w4hCLiKuLbYR7iJuDE=;
        b=EapzB6nV2zuG3XXqORhtOg865rDFWXiiuUO8FpJLb/h1WDao3VpOzWeFDmaFbxm/XL
         47TBQ8nUUTf9qkmZiYlrYuMBsFG5TIn6RKRtGHhdoEi679Dd/WD/MF4HtnmQP59r+ZVS
         lWZPfIfuMFEgQo4Y3mbUEU6Vw4ZKVnL+c9FxScjZKMpMrPiR+cuZijKKGYKRXfElKJqa
         Xlf/ibW3jXNNJBvLlFTHpGgT5lOrKP+W2Zir2emFXNHQgTL1ugZEAXaNqYvDXjvvf1sY
         eVxqaYVdOcCPAQPOF9hrrzA0BOHPgcYf40DmCzESR4BUuRMyXnjNV9lnjdj/b1tOOPp+
         BzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qu4eqa88cl7hA3fQdb28KWqV5w4hCLiKuLbYR7iJuDE=;
        b=cy4WLpFRC2PJjBavzSsmQ0jQZsG5AJCkfkwDUe6feJJoiDMRuscclxab7X0Gtypisi
         T1lJwDSQA1I/USduQxbkyOW+wHQ47reqEG5brrOBoAfVZzVGRJMk7WOuR+kkhb2HIKv3
         GWlZgqWM3gTmmn5FEC67PuyoKkdDtsy7B33uLttn/bVm77gHVNNlE8EAcBqheDcrYlED
         BMRMEOtlQ42Bb6vkM5WRWFeBlh9Yi0fGFeDUeuHete/VSBRpuod9qbz/anBVSFtiXM61
         qZrieL/yYcsl2lTkCkDdcW/qmTJTEKCAd7/Y1+iObqio/Bxz9NnCLSMyt8gM2TsNDQbB
         Hkkg==
X-Gm-Message-State: APjAAAWsSrHy2b9933XSThVLPjXHRVsdRrEun0cWE6un7v+XdoXxJ4P7
        xPpGEx9PB9UiLvbn3jZ1Ds8=
X-Google-Smtp-Source: APXvYqx2zTJL6YB+Gc6tZHir/y3NwypWB6AAdiaRHKrntm3SVSrSWzIlrCWGYk+WyVgbmkUaGcUHkg==
X-Received: by 2002:a50:acc6:: with SMTP id x64mr110288029edc.100.1564586034088;
        Wed, 31 Jul 2019 08:13:54 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id oe21sm11729742ejb.44.2019.07.31.08.13.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:13:52 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 172081045FF; Wed, 31 Jul 2019 18:08:17 +0300 (+03)
To:     Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@amacapital.net>,
        David Howells <dhowells@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai Huang <kai.huang@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Alison Schofield <alison.schofield@intel.com>,
        linux-mm@kvack.org, kvm@vger.kernel.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 41/59] mm: Generalize the mprotect implementation to support extensions
Date:   Wed, 31 Jul 2019 18:07:55 +0300
Message-Id: <20190731150813.26289-42-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
References: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Alison Schofield <alison.schofield@intel.com>

Today mprotect is implemented to support legacy mprotect behavior
plus an extension for memory protection keys. Make it more generic
so that it can support additional extensions in the future.

This is done is preparation for adding a new system call for memory
encyption keys. The intent is that the new encrypted mprotect will be
another extension to legacy mprotect.

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 mm/mprotect.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 82d7b194a918..4d55725228e3 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -35,6 +35,8 @@
 
 #include "internal.h"
 
+#define NO_KEY	-1
+
 static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long addr, unsigned long end, pgprot_t newprot,
 		int dirty_accountable, int prot_numa)
@@ -453,9 +455,9 @@ mprotect_fixup(struct vm_area_struct *vma, struct vm_area_struct **pprev,
 }
 
 /*
- * pkey==-1 when doing a legacy mprotect()
+ * When pkey==NO_KEY we get legacy mprotect behavior here.
  */
-static int do_mprotect_pkey(unsigned long start, size_t len,
+static int do_mprotect_ext(unsigned long start, size_t len,
 		unsigned long prot, int pkey)
 {
 	unsigned long nstart, end, tmp, reqprot;
@@ -579,7 +581,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
 SYSCALL_DEFINE3(mprotect, unsigned long, start, size_t, len,
 		unsigned long, prot)
 {
-	return do_mprotect_pkey(start, len, prot, -1);
+	return do_mprotect_ext(start, len, prot, NO_KEY);
 }
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
@@ -587,7 +589,7 @@ SYSCALL_DEFINE3(mprotect, unsigned long, start, size_t, len,
 SYSCALL_DEFINE4(pkey_mprotect, unsigned long, start, size_t, len,
 		unsigned long, prot, int, pkey)
 {
-	return do_mprotect_pkey(start, len, prot, pkey);
+	return do_mprotect_ext(start, len, prot, pkey);
 }
 
 SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, unsigned long, init_val)
-- 
2.21.0

