Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 568E37C611
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfGaPUT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:20:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36505 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfGaPUP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:20:15 -0400
Received: by mail-ed1-f67.google.com with SMTP id k21so66068688edq.3
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EvEqqoCYvSiaJViGsfZgvE8wYjGeg4BQWYRIZAIdYOQ=;
        b=bZcGmOHwm0gi6j5t/BbUGsKtOCIZr4doGxyXBg+bAsntyv91YXoAwS8iK8gYH/2Rhd
         EZoLChmRluivD3XLirlmMT5W1vFicn0Th6yRJbjlvSCthP29u5r3kvQbgKOL0NnWdm5O
         z6WKnsGxsng9YOVJ6s+hk1x3ysUEVhPOmeDyo07xX324wqjHjFQ9yfcsBJPs6sEkZfG/
         j1P95OYBR2KAtJYWJH/9fdcbulUD7i7ZdBv1U7AlRZ5qi7KMU65oMM+umaihE2hREq1N
         HFgl1iVKn4xa5Uwqe5PFQO1apPGzMbp3tx+aOQoTXOpVFI0CqNnOhoaQyl+Z3LmysdM7
         SIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EvEqqoCYvSiaJViGsfZgvE8wYjGeg4BQWYRIZAIdYOQ=;
        b=dzpSPmSkdlbKR6UYRccATs0C84etVeUwgdTO1NNNufGJ3yXVJEThxUj538W7WRKIYO
         7itOMMEt2ZXV+4uOtWY+pkoKdXPt0NYJ1ZkYd24zosFiPaaZjlslRTyjd9R5fYeBoAqX
         4D+6uZvxp39LC9dQyKZ6svIX+MyENJEYg/IvgzuXJ893mPFjuXuCoa4ADxMvUMD7U+Vs
         HajAQBLmJFqQZARMbJ4yfrsXKa3KX7NDu1P43G99ICJ/4DncKE71HXRAMIL0x8rqTC75
         cMZfa0Sw9S7ByxqyW+ZOGMObEh5xgRCwhpNrNPSpiO+Ax6aK7apzYsSPeQ2JdKM5g5Kv
         5N7g==
X-Gm-Message-State: APjAAAUYr96bARaTGpqv6yzRRx/1tb7InsVqc2TCaVTgSVXkGnQKokML
        GfTDnH9mtNVRLwPKRIMHDf4=
X-Google-Smtp-Source: APXvYqze/zmPMD1Bsfoldl9kgWqcWF2ltGwH8c0r7lo9vR1AXcu6XddkT5YuYdRgsgxlZcifb+OJkw==
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr94272907eju.125.1564586035045;
        Wed, 31 Jul 2019 08:13:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id g7sm16945101eda.52.2019.07.31.08.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:13:53 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 874211030BD; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
Subject: [PATCHv2 22/59] mm/rmap: Clear vma->anon_vma on unlink_anon_vmas()
Date:   Wed, 31 Jul 2019 18:07:36 +0300
Message-Id: <20190731150813.26289-23-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
References: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

If all pages in the VMA got unmapped there's no reason to link it into
original anon VMA hierarchy: it cannot possibly share any pages with
other VMA.

Set vma->anon_vma to NULL on unlink_anon_vmas(). With the change VMA
can be reused. The new anon VMA will be allocated on the first fault.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 mm/rmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index e5dfe2ae6b0d..911367b5fb40 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -400,8 +400,10 @@ void unlink_anon_vmas(struct vm_area_struct *vma)
 		list_del(&avc->same_vma);
 		anon_vma_chain_free(avc);
 	}
-	if (vma->anon_vma)
+	if (vma->anon_vma) {
 		vma->anon_vma->degree--;
+		vma->anon_vma = NULL;
+	}
 	unlock_anon_vma_root(root);
 
 	/*
-- 
2.21.0

