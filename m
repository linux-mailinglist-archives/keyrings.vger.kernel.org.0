Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D747C66C
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbfGaPYe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:24:34 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34594 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfGaPXv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:23:51 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so31244915edb.1
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4nUUGiekxDXyLHELJNk1/crPjGXFhQCWsxTcExxSHys=;
        b=IOKuLaqnLIIvDxh8sGiA5Ti1EgZD/pb+tvmY2A/5Qcpvrnrj/8Q6+39fm9WysKchIW
         hxGKfQI/tErC99xqo32YRJXMLxuXvw7D5FxRJcrBpR8LO7tBGljabTEW8R9zvaZ7Gtu/
         5JhEe4A5G3i8YpbuhOwyBAKNi3WqHjxlhczPzXXfzxS1YgpNI6CrX/YkA/t7pf+O56zg
         jZvbsgItFZICFlQrj2qkMS9K0sSkOv6pJAFh7XH0Y/DNZ6ULvgHOHCZfkaErZTNsmjQb
         h2tqUsjMeDmKdo4PyoPbBB79hWABkWEqSQS6tHXaEaeEcq0q3LGFncuHeCOpiPphT7io
         M6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nUUGiekxDXyLHELJNk1/crPjGXFhQCWsxTcExxSHys=;
        b=DPtj9t8X4JRUDOJFcT+8jhYYLgJqs8R0kblx05FZT7xgpeR8iSUAoEV/ybqEDKdkWu
         NqVepyoo55+SzJpYmyq9P8AzyNERDtoaWjbS7BddwoqYUvG9F74MSaAocggvKcSE0g17
         SAeA7i6sLXzwMuEbJ1w0yKbCg3gA4thnw0J2gfsoWm4AdCoYDeugF/lEtZOf9bZV9vre
         CPdV8W0LaC0HSjNvKv1FUTXOHVEIF2Y2kccflomUYyMTuDn23+g71gq+Aa0iF1Hnh5iE
         2Cly3JNbSyheXbn8M1x6Ftu0LcCjIf5vyCf8avlnIQTJbxBM2ly6AyGZxLtl3RCIDkPV
         8zAg==
X-Gm-Message-State: APjAAAUlDc40L0YnpoEseLIHw9NWXtgpZxJYhZeHvQJbCVQquV1m6LPt
        4du22AjRLIuvpBYC9A7x3/E=
X-Google-Smtp-Source: APXvYqyocU9LaLEieM1frl2MdSDXaIV0gvyho3ioPkKIqAAuamyJHGIwJo2jc8AHxo4CrQ5fTnM4cQ==
X-Received: by 2002:a17:906:9711:: with SMTP id k17mr96659095ejx.298.1564586629507;
        Wed, 31 Jul 2019 08:23:49 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id 9sm8073168ejw.63.2019.07.31.08.23.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:23:47 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id CD18F1044A7; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
Subject: [PATCHv2 32/59] keys/mktme: Clear the key programming from the MKTME hardware
Date:   Wed, 31 Jul 2019 18:07:46 +0300
Message-Id: <20190731150813.26289-33-kirill.shutemov@linux.intel.com>
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

Send a request to the MKTME hardware to clear a previously
programmed key. This will be used when userspace keys are
destroyed and the key slot is no longer in use. No longer
in use means that the reference has been released, and its
usage count has returned to zero.

This clear command is not offered as an option to userspace,
since the key service can execute it automatically, and at
the right time, safely.

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 security/keys/mktme_keys.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/security/keys/mktme_keys.c b/security/keys/mktme_keys.c
index 18cb57be5193..1e2afcce7d85 100644
--- a/security/keys/mktme_keys.c
+++ b/security/keys/mktme_keys.c
@@ -72,6 +72,9 @@ int mktme_keyid_from_key(struct key *key)
 	return 0;
 }
 
+static void mktme_clear_hardware_keyid(struct work_struct *work);
+static DECLARE_WORK(mktme_clear_work, mktme_clear_hardware_keyid);
+
 struct percpu_ref *encrypt_count;
 void mktme_percpu_ref_release(struct percpu_ref *ref)
 {
@@ -88,8 +91,9 @@ void mktme_percpu_ref_release(struct percpu_ref *ref)
 	}
 	percpu_ref_exit(ref);
 	spin_lock_irqsave(&mktme_lock, flags);
-	mktme_release_keyid(keyid);
+	mktme_map[keyid].state = KEYID_REF_RELEASED;
 	spin_unlock_irqrestore(&mktme_lock, flags);
+	schedule_work(&mktme_clear_work);
 }
 
 enum mktme_opt_id {
@@ -213,6 +217,27 @@ static int mktme_program_keyid(int keyid, u32 payload)
 	return ret;
 }
 
+static void mktme_clear_hardware_keyid(struct work_struct *work)
+{
+	u32 clear_payload = MKTME_KEYID_CLEAR_KEY;
+	unsigned long flags;
+	int keyid, ret;
+
+	for (keyid = 1; keyid <= mktme_nr_keyids(); keyid++) {
+		if (mktme_map[keyid].state != KEYID_REF_RELEASED)
+			continue;
+
+		ret = mktme_program_keyid(keyid, clear_payload);
+		if (ret != MKTME_PROG_SUCCESS)
+			pr_debug("mktme: clear key failed [%s]\n",
+				 mktme_error[ret].msg);
+
+		spin_lock_irqsave(&mktme_lock, flags);
+		mktme_release_keyid(keyid);
+		spin_unlock_irqrestore(&mktme_lock, flags);
+	}
+}
+
 /* Key Service Method called when a Userspace Key is garbage collected. */
 static void mktme_destroy_key(struct key *key)
 {
-- 
2.21.0

