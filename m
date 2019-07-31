Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66AD07C656
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfGaPXt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:23:49 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:37812 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbfGaPXt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:23:49 -0400
Received: by mail-ed1-f43.google.com with SMTP id w13so66106975eds.4
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpVydprU+qUIbG2ieS0/pcejmTH1ILSgd/PE5xIU2l8=;
        b=DRp4/04Ql9tuwZ8HmklcrVGbpbwpqyiHWrb5OFmDW/SEC8peDq2WPBaUHFkAudB5fO
         O6QRunFSo/ysHy81uSqyDDbaDB0RbNas5DoSFJjERVndASSmEQlNkxI6m4UzvLb1lYXe
         HR9PxFKm/WpkDGRuHh7/II3kWjLslUMYjW15KfsW1uUXxZKw3qH1ykdFZqetYNR65uFr
         gcHNHUE6tyTdsEhVT4TE8EFJvr35k771sHCQxS/OJ1ZA0dTfkaCGA+sR1YMCZ/ySG35J
         zgO0k7b/GKJH49Q3m+NOFpVJ9izt7DqzZczYOnuYmoEesdA/OGp8B5vhT4m926rqes+k
         RWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpVydprU+qUIbG2ieS0/pcejmTH1ILSgd/PE5xIU2l8=;
        b=WFk+4MxzF/YR1lqNv78fwO3ChDf1DRJELMV9zseJ6PabbF8FR2T8Ntf76Gfy+8S3NH
         Nrp4J6dRoEuwV9HqYoYLiUT5SSSkKV28UKB5mtGn0BkUyrPQPNcQxnmYZljYoXxBybYa
         eyZR2MY6NMbZ1vviuhOn7AoddBaajivUjPxYkLTYfVo1VaUuxDQACVS3r9yNjoVLQQGD
         fTq9kv5F95EDOXV/DEiYhPTqrtoWOYhj91oNeBPtZse7zMGQcHi8rdZ5ESsJkHanK2y1
         VtwMB4PGyfA4cLwLDlrScXMUoTzTT/LlN7usSg4VXZnaD0T954muFocs3+7j7KD3OB9K
         G54A==
X-Gm-Message-State: APjAAAVWNDeNvcp9691dskiUAALn1mpkowNk09nRCSy4J8/l47Yd7iUU
        SJ/oVVdgVnerBM1NNg/EoI8=
X-Google-Smtp-Source: APXvYqzHNAWdNlgTeKpfoNbFrJilyAoYtl9yAfdpOnAx37mkMd2b2DlC485Nke0u/zSmR8xGQJj0mw==
X-Received: by 2002:aa7:ca45:: with SMTP id j5mr106898585edt.217.1564586627658;
        Wed, 31 Jul 2019 08:23:47 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id j12sm12429043ejd.30.2019.07.31.08.23.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:23:47 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 957D31048AB; Wed, 31 Jul 2019 18:08:17 +0300 (+03)
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
Subject: [PATCHv2 59/59] x86/mktme: Demonstration program using the MKTME APIs
Date:   Wed, 31 Jul 2019 18:08:13 +0300
Message-Id: <20190731150813.26289-60-kirill.shutemov@linux.intel.com>
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

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 Documentation/x86/mktme/index.rst      |  1 +
 Documentation/x86/mktme/mktme_demo.rst | 53 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/x86/mktme/mktme_demo.rst

diff --git a/Documentation/x86/mktme/index.rst b/Documentation/x86/mktme/index.rst
index ca3c76adc596..3af322d13225 100644
--- a/Documentation/x86/mktme/index.rst
+++ b/Documentation/x86/mktme/index.rst
@@ -10,3 +10,4 @@ Multi-Key Total Memory Encryption (MKTME)
    mktme_configuration
    mktme_keys
    mktme_encrypt
+   mktme_demo
diff --git a/Documentation/x86/mktme/mktme_demo.rst b/Documentation/x86/mktme/mktme_demo.rst
new file mode 100644
index 000000000000..5af78617f887
--- /dev/null
+++ b/Documentation/x86/mktme/mktme_demo.rst
@@ -0,0 +1,53 @@
+Demonstration Program using MKTME API's
+=======================================
+
+/* Compile with the keyutils library: cc -o mdemo mdemo.c -lkeyutils */
+
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <keyutils.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#define PAGE_SIZE sysconf(_SC_PAGE_SIZE)
+#define sys_encrypt_mprotect 434
+
+void main(void)
+{
+	char *options_CPU = "algorithm=aes-xts-128 type=cpu";
+	long size = PAGE_SIZE;
+        key_serial_t key;
+	void *ptra;
+	int ret;
+
+        /* Allocate an MKTME Key */
+	key = add_key("mktme", "testkey", options_CPU, strlen(options_CPU),
+                      KEY_SPEC_THREAD_KEYRING);
+
+	if (key == -1) {
+		printf("addkey FAILED\n");
+		return;
+	}
+        /* Map a page of ANONYMOUS memory */
+	ptra = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+	if (!ptra) {
+		printf("failed to mmap");
+		goto inval_key;
+	}
+        /* Encrypt that page of memory with the MKTME Key */
+	ret = syscall(sys_encrypt_mprotect, ptra, size, PROT_NONE, key);
+	if (ret)
+		printf("mprotect error [%d]\n", ret);
+
+        /* Enjoy that page of encrypted memory */
+
+        /* Free the memory */
+	ret = munmap(ptra, size);
+
+inval_key:
+        /* Free the Key */
+	if (keyctl(KEYCTL_INVALIDATE, key) == -1)
+		printf("invalidate failed on key [%d]\n", key);
+}
-- 
2.21.0

