Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB427C5C0
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfGaPJd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:09:33 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33634 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388590AbfGaPI3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:08:29 -0400
Received: by mail-ed1-f68.google.com with SMTP id i11so2524832edq.0
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h0//8b8JhmDYiWR+Ncdp81M8YpF3RR/HYJneA6rLbBE=;
        b=kpoM7/czG2vuCwsXq98nirdJYBOwr8KtzxM9+afNHenqhKIfVEFjDG3vbbM89v9hU6
         YMAzAAX30FdCqCWqUZzuyEQfYHEZ5SGXYXGaTc/RfM7vFtD/yULcwWNLageDoX/8krFH
         n4QKoyHVqCbs14roQ7VJaujfaJiV2Mk09sz0OeErJzlvISCfVQW2kNTXy8w9Gxm3/IwU
         dcejxnmJWBrLcdeNajBBaL1AUmO1liY5yMiINB1/ytr9VKZzK36rf3vWWCycIhQ15tIE
         DSLnTwriWXZKdOs1A4sQUyGiM4P5PvUWt23VhEqgSeYDF0Ha/yNAfcCo2u0r6R6Yiip8
         wAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h0//8b8JhmDYiWR+Ncdp81M8YpF3RR/HYJneA6rLbBE=;
        b=ISa1o9z52YYgBlSzSwoEe6pn0pTjo0C+xHWO4rBXFY1e9gk70aZU2aznDUtbA7D6wt
         sWfePstUe24+By9JgC1MGuPv3r16dcnCITUdvB2Hw4kUgePwcVR2S8QKl+SAaq/XKa2l
         Q2wgGjf/ZzWUT5fbA2tM75I+HITUI2uVYwlBjdCljUBgyA+W3jteWW/gfcw7zQ7Nmh5G
         FJWxpJ/Ag4Y7t7NKdyXtXQMWnJQESsVrUh6E0zXw1YuQSkwdIMWtz9bUCkGMnlsxKuNr
         f8Z5/NQqM+AcTdtb+wa7I9Q+k/rjNuADzePoBSkbtuWD4tB6iD9ovIF9Nkkw/5j2+QPa
         uMFA==
X-Gm-Message-State: APjAAAWubmzhjc1rU1r6Xhffu7w9HgSO1KHAgbXhV2M5pejO4u6OyrDh
        XTX31ldvOY1Fpzor0ALY0f4=
X-Google-Smtp-Source: APXvYqxzkJr6sogcwi+BoQU+16q789SLZB/aHhQhjukCfnhAW3wOEpwRSp2oNCYJ50Xj+teIukdhFg==
X-Received: by 2002:a17:906:c315:: with SMTP id s21mr93121050ejz.238.1564585708018;
        Wed, 31 Jul 2019 08:08:28 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id q56sm17019541eda.28.2019.07.31.08.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:08:22 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 5DF9E102772; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
Subject: [PATCHv2 16/59] x86/mm: Rename CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING
Date:   Wed, 31 Jul 2019 18:07:30 +0300
Message-Id: <20190731150813.26289-17-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
References: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Rename the option to CONFIG_MEMORY_PHYSICAL_PADDING. It will be used
not only for KASLR.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/Kconfig    | 2 +-
 arch/x86/mm/kaslr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 222855cc0158..2eb2867db5fa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2214,7 +2214,7 @@ config RANDOMIZE_MEMORY
 
 	   If unsure, say Y.
 
-config RANDOMIZE_MEMORY_PHYSICAL_PADDING
+config MEMORY_PHYSICAL_PADDING
 	hex "Physical memory mapping padding" if EXPERT
 	depends on RANDOMIZE_MEMORY
 	default "0xa" if MEMORY_HOTPLUG
diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index dc6182eecefa..580b82c2621b 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -104,7 +104,7 @@ void __init kernel_randomize_memory(void)
 	 */
 	BUG_ON(kaslr_regions[0].base != &page_offset_base);
 	memory_tb = DIV_ROUND_UP(max_pfn << PAGE_SHIFT, 1UL << TB_SHIFT) +
-		CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING;
+		CONFIG_MEMORY_PHYSICAL_PADDING;
 
 	/* Adapt phyiscal memory region size based on available memory */
 	if (memory_tb < kaslr_regions[0].size_tb)
-- 
2.21.0

