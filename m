Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261227C5F8
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfGaPTZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:19:25 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:40516 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729469AbfGaPTW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:19:22 -0400
Received: by mail-ed1-f50.google.com with SMTP id k8so66031441eds.7
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I5PL3KEd8NdLoJF+LQ8UkD4dkMItZA8rJO7OBoBpg0o=;
        b=tW+zNphqnZbkGHkrMBxx1TXe9FglfbohupscPg50rqzrfHLWW9Hl0Z+CMMOXjE/R2+
         NcyfhCCsOWXcuwckjmfDmtUusVsnWuowFpyaegX4gCHmyqrGBy+MQMUADGcZpvVKZ512
         11xIjMWWAyW63Hda6ArgtSMycjMggoGiwik1SYPbJausNlmbXMmpld6k3+d5JCJ4LZJP
         gwHYjVnbIrQYu9TGb2+5XJG8HpaJESPi+R23zoUlviPx31pjGUmVrMYLiGF/H3Dcw0QM
         E2t8w4UFu33JUkrOE5ctmB9g/FhPzqGB/iO94n+xj19M9EujxQQ7zv77d7Yw2DGds/F/
         6oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I5PL3KEd8NdLoJF+LQ8UkD4dkMItZA8rJO7OBoBpg0o=;
        b=AFu58YIEPijya4tqC3NPkiAgqwZYPYHNhD0fHXuP5NZwGaU8yRnGmzk5mio4S7GXG0
         Q5pKK7oSnO4IF1QqCvaXxA5KPCj7haLa9cGbfyqs6OZQaPoOeM4DJZlCWkBaK0uFuY8W
         jkKL6EL61yBXnBQ+GPuoHHNdyJm+qk025doVeZyGlkY18jmluZ4bfDc7vf7yILsv2Yg9
         3eh9lX9S9r+HYmrInBTb3BEzAMROTs1L7WamEuMUxHg5mkoEFcFSc+YUKKh+5i5WMkD+
         0cWAni3ydKhi8dWL0ij8armiJo4JCG2c9ERsnyVmS4pi2w5R3wVpoytjm1pabl05sqVK
         zVwA==
X-Gm-Message-State: APjAAAUMT4FUgTTNvhvEju17LFQ8LnCFxFEN9RuvjMwdRC8xlyhDfX8h
        kRJx5y17ww3CKnVu7QoKH/E=
X-Google-Smtp-Source: APXvYqzcY0rGlEFl7gKQAV09OPdwNja6Zvxs45AN38Cu6T9Con7khC9d8WVErECQGCkC99X7sSihKQ==
X-Received: by 2002:a17:906:2557:: with SMTP id j23mr93846289ejb.228.1564586035522;
        Wed, 31 Jul 2019 08:13:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id p43sm17365793edc.3.2019.07.31.08.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:13:53 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 809A21048A8; Wed, 31 Jul 2019 18:08:17 +0300 (+03)
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
Subject: [PATCHv2 56/59] x86/mktme: Document the MKTME kernel configuration requirements
Date:   Wed, 31 Jul 2019 18:08:10 +0300
Message-Id: <20190731150813.26289-57-kirill.shutemov@linux.intel.com>
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
 Documentation/x86/mktme/index.rst               | 1 +
 Documentation/x86/mktme/mktme_configuration.rst | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 Documentation/x86/mktme/mktme_configuration.rst

diff --git a/Documentation/x86/mktme/index.rst b/Documentation/x86/mktme/index.rst
index a3a29577b013..0f021cc4a2db 100644
--- a/Documentation/x86/mktme/index.rst
+++ b/Documentation/x86/mktme/index.rst
@@ -7,3 +7,4 @@ Multi-Key Total Memory Encryption (MKTME)
 
    mktme_overview
    mktme_mitigations
+   mktme_configuration
diff --git a/Documentation/x86/mktme/mktme_configuration.rst b/Documentation/x86/mktme/mktme_configuration.rst
new file mode 100644
index 000000000000..7d56596360cb
--- /dev/null
+++ b/Documentation/x86/mktme/mktme_configuration.rst
@@ -0,0 +1,6 @@
+MKTME Configuration
+===================
+
+CONFIG_X86_INTEL_MKTME
+        MKTME is enabled by selecting CONFIG_X86_INTEL_MKTME on Intel
+        platforms supporting the MKTME feature.
-- 
2.21.0

