Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 175DC7C648
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfGaPWO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:22:14 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34243 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbfGaPVP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:21:15 -0400
Received: by mail-ed1-f68.google.com with SMTP id s49so31236919edb.1
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WTAAjTsK3+3w7eSPHsyJf/zyVQM+N+66EXtK8GvqGh0=;
        b=vHCm2eeuCUQs2yHSeXWs6297E3LD/DJ3yKHjxnQ3uS38oTOhZMWNOL2t2b8qyqezCd
         TSyHJ2nZIkIp+xozfa1fMkbPHgLyD07pzVHXY1r0RJbOqJQjIa59zY+kzkFpFK+i6bAm
         u2IRsUZJ7qr8muyrOi/vvs1sPIHYD5F+Sz93KlJmSVBGUVMoNkaJnWL0flwcUWdk1Rd+
         pJLhMUZ1mXkr512XbgaOmHVFaepWq9DNGGdxUvxD97xw+4EXINwjigBZSkDbyOrFGk9v
         coI9yYfL7DOZadkWb+EyLWXGslgUVJIufSy67o3yRyMY9W/s+uFsbxg0YK6+eu5onsz9
         Qs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WTAAjTsK3+3w7eSPHsyJf/zyVQM+N+66EXtK8GvqGh0=;
        b=oDESD2u8Qd8Rnz0DHqdXljH0OKQo9baXYKs2wWVMG336P5VvQCoJhw1q9A/5UXC+A/
         Hm+Yh6g0PErxHs74LI4nkwAFHM8Is1GfSvwBFME69ntbopmsQXsg5Xp5f/vdo5yvVprk
         e+vqzcECzlv2/Ie0Sh/wRy9uxnEKIJUOArnb4YEUswE/VSwS91GfJpaU6PPFcFzxrvl+
         HMpliBIPDzULhf1GDhGwTgkudhL5+4zqHULf+DVWzrKzlUzW05/E7pMPktrw91QTLCWO
         h0F6fUIbSaJlTashc4Qy1rLY5c3ss/BaDx9gLhYGruB1G/1pMJqGIYxLAAVC0uB6dj0G
         9ThA==
X-Gm-Message-State: APjAAAWNRuyRArNSey7HqNlFtG1L2F/xvx4HP99Vj2einW8PkdIof5Mt
        s9NyRhhSryr7oqeSjJiYbPM=
X-Google-Smtp-Source: APXvYqyDF7Ax4wPwm75VtJQs6n6Sw+upz55I60UXt6jJNg1T+Xcry5rWrrwsNPjn0mCM+yzapDyh9Q==
X-Received: by 2002:a50:9153:: with SMTP id f19mr109455097eda.70.1564586035945;
        Wed, 31 Jul 2019 08:13:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id q56sm17022134eda.28.2019.07.31.08.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:13:53 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id 87A6F1048A9; Wed, 31 Jul 2019 18:08:17 +0300 (+03)
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
Subject: [PATCHv2 57/59] x86/mktme: Document the MKTME Key Service API
Date:   Wed, 31 Jul 2019 18:08:11 +0300
Message-Id: <20190731150813.26289-58-kirill.shutemov@linux.intel.com>
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
 Documentation/x86/mktme/mktme_keys.rst | 61 ++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/x86/mktme/mktme_keys.rst

diff --git a/Documentation/x86/mktme/index.rst b/Documentation/x86/mktme/index.rst
index 0f021cc4a2db..8cf2b7d62091 100644
--- a/Documentation/x86/mktme/index.rst
+++ b/Documentation/x86/mktme/index.rst
@@ -8,3 +8,4 @@ Multi-Key Total Memory Encryption (MKTME)
    mktme_overview
    mktme_mitigations
    mktme_configuration
+   mktme_keys
diff --git a/Documentation/x86/mktme/mktme_keys.rst b/Documentation/x86/mktme/mktme_keys.rst
new file mode 100644
index 000000000000..5d9125eb7950
--- /dev/null
+++ b/Documentation/x86/mktme/mktme_keys.rst
@@ -0,0 +1,61 @@
+MKTME Key Service API
+=====================
+MKTME is a new key service type added to the Linux Kernel Key Service.
+
+The MKTME Key Service type is available when CONFIG_X86_INTEL_MKTME is
+turned on in Intel platforms that support the MKTME feature.
+
+The MKTME Key Service type manages the allocation of hardware encryption
+keys. Users can request an MKTME type key and then use that key to
+encrypt memory with the encrypt_mprotect() system call.
+
+Usage
+-----
+    When using the Kernel Key Service to request an *mktme* key,
+    specify the *payload* as follows:
+
+    type=
+        *cpu*	User requests a CPU generated encryption key.
+                The CPU generates and assigns an ephemeral key.
+
+        *no-encrypt*
+                 User requests that hardware does not encrypt
+                 memory when this key is in use.
+
+    algorithm=
+        When type=cpu the algorithm field must be *aes-xts-128*
+        *aes-xts-128* is the only supported encryption algorithm
+
+        When type=no-encrypt the algorithm field must not be
+        present in the payload.
+
+ERRORS
+------
+    In addition to the Errors returned from the Kernel Key Service,
+    add_key(2) or keyctl(1) commands, the MKTME Key Service type may
+    return the following errors:
+
+    EINVAL for any payload specification that does not match the
+           MKTME type payload as defined above.
+
+    EACCES for access denied. The MKTME key type uses capabilities
+           to restrict the allocation of keys to privileged users.
+           CAP_SYS_RESOURCE is required, but it will accept the
+           broader capability of CAP_SYS_ADMIN. See capabilities(7).
+
+    ENOKEY if a hardware key cannot be allocated. Additional error
+           messages will describe the hardware programming errors.
+
+EXAMPLES
+--------
+    Add a 'cpu' type key::
+
+        char \*options_CPU = "type=cpu algorithm=aes-xts-128";
+
+        key = add_key("mktme", "name", options_CPU, strlen(options_CPU),
+                      KEY_SPEC_THREAD_KEYRING);
+
+    Add a "no-encrypt' type key::
+
+	key = add_key("mktme", "name", "no-encrypt", strlen(options_CPU),
+		      KEY_SPEC_THREAD_KEYRING);
-- 
2.21.0

