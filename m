Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 751457C5CB
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfGaPKL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:10:11 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35720 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388490AbfGaPIY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:08:24 -0400
Received: by mail-ed1-f66.google.com with SMTP id w20so65995285edd.2
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4ZEjLjovYwhlc3sfcyK0re0l8xj15Oya4gREJZsXus=;
        b=V5rpp3X2+p+VVm7FssSRodlU6DS9SwQLhXjimNRTkFMkTWsFbd7HkizFtVyE1zIrzy
         fPAuOPVVJeqlsLEhPRbCqOeRCbvW4JadhbicVgcow8yaygfiy6y17rqCfH03Rty6YhXj
         6s+mjRzfpE3alGhAXjgL2hhfWjPdDRz/hcRhXF1/iJC59vgvEz7fzn3mLdZt0saq8R+2
         YGro+1SRX76SodqfwZnA/6i9jWHWw9pBsAVy22+H2tRm7Z7bX/jkLZMKy9nrKbtBjbdn
         RE6jWJDgv80mFQO3CN2q3IrNNli2rX+pB/Xw9tJK/WnQpL2UfFVX1jHzcoNvANMfNeEh
         hhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4ZEjLjovYwhlc3sfcyK0re0l8xj15Oya4gREJZsXus=;
        b=CDZQe2BzJFJIkjQ7wtgKyioY8JX+EQQKbaxr7GIyRak6ySHVs/+y77Bz8+Ad4k29bs
         62lsXeKpCAxaTLjepe5GUfi6ntl21jORzzEpg0e9BHcAbZj+wvEOFsVcXO1WxAv18V6Z
         f/Ff/FzJd87C9StRyQePqYUUdN5SnpvD/ma46im0SfSFcaVYKl2KZXVQPrFxQ9cdHwQR
         Zt746b8b7HoxwSkE/eac3IIKLMdnXC03a0n2KU64q9nLlpZSVmnbk5Hsv3FZGZFcHK56
         dBi/VMm6+QgY74DfaWpLwBnnR4TTsOVx//Xc5AxHh3HsBA4UW6hzuvWpciHaNAZsmI7F
         NtxQ==
X-Gm-Message-State: APjAAAV5edF2900f7iMwZEkQhNZUnKphIsvfUKn5oyMakiiDtellcJRm
        y10IH9GDtGJJEJxjmRvUFAA=
X-Google-Smtp-Source: APXvYqxJ9S0tGP2IpyXLxIjktlIQlFGvLsty4aUseBEocKbxQZsdfbX5PxHe1B3ZlzdQoz5XJNRh9g==
X-Received: by 2002:a17:906:4d88:: with SMTP id s8mr92464687eju.225.1564585702235;
        Wed, 31 Jul 2019 08:08:22 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id q11sm268380ejt.74.2019.07.31.08.08.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:08:19 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 2CA2A101320; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
Subject: [PATCHv2 09/59] x86/mm: Store bitmask of the encryption algorithms supported by MKTME
Date:   Wed, 31 Jul 2019 18:07:23 +0300
Message-Id: <20190731150813.26289-10-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
References: <20190731150813.26289-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Store bitmask of the supported encryption algorithms in 'mktme_algs'.
This will be used by key management service.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 arch/x86/include/asm/mktme.h | 2 ++
 arch/x86/kernel/cpu/intel.c  | 6 +++++-
 arch/x86/mm/mktme.c          | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mktme.h b/arch/x86/include/asm/mktme.h
index b9ba2ea5b600..42a3b1b44669 100644
--- a/arch/x86/include/asm/mktme.h
+++ b/arch/x86/include/asm/mktme.h
@@ -10,6 +10,8 @@ extern int __mktme_keyid_shift;
 extern int mktme_keyid_shift(void);
 extern int __mktme_nr_keyids;
 extern int mktme_nr_keyids(void);
+extern unsigned int mktme_algs;
+
 #else
 #define mktme_keyid_mask()	((phys_addr_t)0)
 #define mktme_nr_keyids()	0
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 7ba44825be42..991bdcb2a55a 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -553,6 +553,8 @@ static void detect_vmx_virtcap(struct cpuinfo_x86 *c)
 #define TME_ACTIVATE_CRYPTO_ALGS(x)	((x >> 48) & 0xffff)	/* Bits 63:48 */
 #define TME_ACTIVATE_CRYPTO_AES_XTS_128	1
 
+#define TME_ACTIVATE_CRYPTO_KNOWN_ALGS	TME_ACTIVATE_CRYPTO_AES_XTS_128
+
 /* Values for mktme_status (SW only construct) */
 #define MKTME_ENABLED			0
 #define MKTME_DISABLED			1
@@ -596,7 +598,7 @@ static void detect_tme(struct cpuinfo_x86 *c)
 		pr_warn("x86/tme: Unknown policy is active: %#llx\n", tme_policy);
 
 	tme_crypto_algs = TME_ACTIVATE_CRYPTO_ALGS(tme_activate);
-	if (!(tme_crypto_algs & TME_ACTIVATE_CRYPTO_AES_XTS_128)) {
+	if (!(tme_crypto_algs & TME_ACTIVATE_CRYPTO_KNOWN_ALGS)) {
 		pr_err("x86/mktme: No known encryption algorithm is supported: %#llx\n",
 				tme_crypto_algs);
 		mktme_status = MKTME_DISABLED;
@@ -631,6 +633,8 @@ static void detect_tme(struct cpuinfo_x86 *c)
 		__mktme_keyid_mask = GENMASK_ULL(c->x86_phys_bits - 1, mktme_keyid_shift());
 		physical_mask &= ~mktme_keyid_mask();
 
+		tme_crypto_algs = TME_ACTIVATE_CRYPTO_ALGS(tme_activate);
+		mktme_algs = tme_crypto_algs & TME_ACTIVATE_CRYPTO_KNOWN_ALGS;
 	} else {
 		/*
 		 * Reset __PHYSICAL_MASK.
diff --git a/arch/x86/mm/mktme.c b/arch/x86/mm/mktme.c
index 0f48ef2720cc..755afc6935b5 100644
--- a/arch/x86/mm/mktme.c
+++ b/arch/x86/mm/mktme.c
@@ -25,3 +25,5 @@ int mktme_nr_keyids(void)
 {
 	return __mktme_nr_keyids;
 }
+
+unsigned int mktme_algs;
-- 
2.21.0

