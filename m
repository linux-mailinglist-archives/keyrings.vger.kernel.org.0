Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233537C583
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388465AbfGaPIV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:08:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35908 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388442AbfGaPIU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:08:20 -0400
Received: by mail-ed1-f66.google.com with SMTP id k21so66032705edq.3
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uRHR4JyNhqg33njeUSvVGNylXkFyo7B3QnIKSQpCDwk=;
        b=Adcw5GPsJkn83YXVJKj7Wqwm6NwWDC1hAYaUolv28wXp+8oH0VtnaENGQuZ/0K5+Nb
         4ttVuTcBuWW62tdKiOabj/bghgVhdlTVmNRPbQ83nxcV2pN29l6uGQo0wyZ/lAlhkLv5
         uu88EBPXw3XRRpwEaUjPB0g7WmxNmdd7QzlE0G/0MbaOwDTTzRhC9WWYSRAeSeO7X5bx
         QFUzmQ84OBFGl0JYzwuDQQLD8dx+iNms4LZ5CMlKmpkkFg5rsp7bDTsd+CepoXc38t5t
         U6hOGTcOi/3klKmjqufRITIY89IhP2ybvsPkGFX/lxa/yb3zD0rrCBZO9eKTlKALJ6M+
         k80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRHR4JyNhqg33njeUSvVGNylXkFyo7B3QnIKSQpCDwk=;
        b=sP2z13A9AgxUWi8Xr7x8bQOHc3tWsVy45cDiTiCELIrzspMB9HWlL4HKrMviqAkD3e
         tyY/5XMVHQ/YfioWebax30DE02GbJ0Jnc/LfXPToMEkeoLwMUda5mLxoVkiMSBu9Wdqm
         lO9LZrQm1MtdW5JTLU13JAuRUUmc2X/Bjtpl/4dA2daAfZCknYbVc1TCB+LyMLBdOY9Z
         UaUdPuy+r/+f/K7n3QAUEIz+YVthMSNr6Nv9DQtE5I0z5owtD4jkNUKc3nxD9Lr0Tg2S
         gDC+iP4FeZOMdxxsjbV8XUMbVCfjOb3VeD9GbOhVn+PcdvegkiyPw4Ah3fPo56Fvd6+s
         YR8w==
X-Gm-Message-State: APjAAAVFbJYrOWKrDqM+wiEZB2TdPTDI1R66Yr5mg/OBW2Gs5fVqwfxj
        1gPnehSiqRn9feKECQE3sSA=
X-Google-Smtp-Source: APXvYqwgh75LQw16lfxHmAAueOtxiQIAT7Hemys++oZtGs9IrW8hC3dJ4CKW+gKV4lDeffYtzg8cig==
X-Received: by 2002:a17:906:6a87:: with SMTP id p7mr23487746ejr.277.1564585698812;
        Wed, 31 Jul 2019 08:08:18 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id o22sm17282769edc.37.2019.07.31.08.08.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:08:15 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 03F8F10131A; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 03/59] mm/ksm: Do not merge pages with different KeyIDs
Date:   Wed, 31 Jul 2019 18:07:17 +0300
Message-Id: <20190731150813.26289-4-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
References: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

KSM compares plain text.  It might try to merge two pages that have the
same plain text but different ciphertext and possibly different
encryption keys.  When the kernel encrypted the page, it promised that
it would keep it encrypted with _that_ key.  That makes it impossible to
merge two pages encrypted with different keys.

Never merge encrypted pages with different KeyIDs.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 include/linux/mm.h |  7 +++++++
 mm/ksm.c           | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5bfd3dd121c1..af1a56ff6764 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1644,6 +1644,13 @@ static inline int vma_keyid(struct vm_area_struct *vma)
 }
 #endif
 
+#ifndef page_keyid
+static inline int page_keyid(struct page *page)
+{
+	return 0;
+}
+#endif
+
 extern unsigned long move_page_tables(struct vm_area_struct *vma,
 		unsigned long old_addr, struct vm_area_struct *new_vma,
 		unsigned long new_addr, unsigned long len,
diff --git a/mm/ksm.c b/mm/ksm.c
index 3dc4346411e4..7d4ef634f38e 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1228,6 +1228,23 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
 	if (!PageAnon(page))
 		goto out;
 
+	/*
+	 * KeyID indicates what key to use to encrypt and decrypt page's
+	 * content.
+	 *
+	 * KSM compares plain text instead (transparently to KSM code).
+	 *
+	 * But we still need to make sure that pages with identical plain
+	 * text will not be merged together if they are encrypted with
+	 * different keys.
+	 *
+	 * To make it work kernel only allows merging pages with the same KeyID.
+	 * The approach guarantees that the merged page can be read by all
+	 * users.
+	 */
+	if (kpage && page_keyid(page) != page_keyid(kpage))
+		goto out;
+
 	/*
 	 * We need the page lock to read a stable PageSwapCache in
 	 * write_protect_page().  We use trylock_page() instead of
-- 
2.21.0

