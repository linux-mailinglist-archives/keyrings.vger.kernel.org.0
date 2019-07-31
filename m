Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33FA7C62E
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2019 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfGaPVT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Jul 2019 11:21:19 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41896 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfGaPVT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 31 Jul 2019 11:21:19 -0400
Received: by mail-ed1-f65.google.com with SMTP id p15so66016978eds.8
        for <keyrings@vger.kernel.org>; Wed, 31 Jul 2019 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c5WMXVoIZssEiK4OS2ZsI14EAD5bwwEyXB7tLs9S9Os=;
        b=GgMDYljgt69NuT2KJuOpsbtMf2bZflY04jkdcsb64J58gp3TxiHEEkOrT1ozLhakGl
         94A0Aqkr8JolguUGlRobFPi57btYrwT3g8MYH4q5fgBYWQAov6IpM5yec8GdWQhRD5tC
         0Ax6JsB0ooIwmT4n5nblwvmWo7thAMBxnFrHSP9RfZBW9LLERr65CaaolDQ48tv/CAKX
         l2OBdufhK2nJeUB9MMPZPdYfYOqpvH6oRpIZCUxqhsrsgYyEegj1/UXzCzFcS0ucxo4Z
         EdcRyeDiAndnOaS1LNOs83hgApICxD3lTMqnXM53LXOsfL7gbP+s6/BUFBXV4t3iCpQw
         uzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5WMXVoIZssEiK4OS2ZsI14EAD5bwwEyXB7tLs9S9Os=;
        b=DFN8xogMgXepaGJj2TclOGBstaS9l0F7Wd0FB8OzYtJQSZNCiguYz7+IHffvNbkU5i
         RlJPB9/42egqVLVO2gOeosgifXwS2enseHp0kU9aWnGGsphA4SHSvUigAMY6CQN7nEEm
         /cVnopRsxoh5Hx/dBVNCAo6GAGFkPFhYPdmThbyGZcOLYJ5V3Ntp+5GQjUsHj4a3KkLV
         b2Xr/gC+1psS9RMAVllfKROlEfxczts2pNbVRKRcvWe9VzJ8Lt7vdBlGDyF+WTFYfK85
         qbA6yhxc78ppkCuCz08DyGVQDmw8iRw7bicORLJ+SIIb8PXE7wAdAhaQLwEMIMICNWLG
         0HTA==
X-Gm-Message-State: APjAAAWDSAPZQu6VoqJbT1ZLQ5xeZ1e9w4Mpx2ftENBAm2yEeNOac1Ki
        NBKpwHHxvsrkZKYlw+hBiCc=
X-Google-Smtp-Source: APXvYqwYMqulY0Xx64lB5aqfOhV4++kQN1Oobfks3JeYhOF1doEtw6JzyLb48pAr8c5dYOSv/qswsA==
X-Received: by 2002:a17:906:e204:: with SMTP id gf4mr92542915ejb.302.1564586036461;
        Wed, 31 Jul 2019 08:13:56 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id d7sm16507912edr.39.2019.07.31.08.13.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:13:53 -0700 (PDT)
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
X-Google-Original-From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Received: by box.localdomain (Postfix, from userid 1000)
        id AA55A1030C2; Wed, 31 Jul 2019 18:08:16 +0300 (+03)
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
Subject: [PATCHv2 27/59] keys/mktme: Destroy MKTME keys
Date:   Wed, 31 Jul 2019 18:07:41 +0300
Message-Id: <20190731150813.26289-28-kirill.shutemov@linux.intel.com>
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

Destroy is a method invoked by the kernel key service when a
userspace key is being removed. (invalidate, revoke, timeout).

During destroy, MKTME wil returned the hardware KeyID to the pool
of available keyids.

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 security/keys/mktme_keys.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/security/keys/mktme_keys.c b/security/keys/mktme_keys.c
index beca852db01a..10fcdbf5a08f 100644
--- a/security/keys/mktme_keys.c
+++ b/security/keys/mktme_keys.c
@@ -50,6 +50,23 @@ int mktme_reserve_keyid(struct key *key)
 	return 0;
 }
 
+static void mktme_release_keyid(int keyid)
+{
+	 mktme_map[keyid].state = KEYID_AVAILABLE;
+	 mktme_available_keyids++;
+}
+
+int mktme_keyid_from_key(struct key *key)
+{
+	int i;
+
+	for (i = 1; i <= mktme_nr_keyids(); i++) {
+		if (mktme_map[i].key == key)
+			return i;
+	}
+	return 0;
+}
+
 enum mktme_opt_id {
 	OPT_ERROR,
 	OPT_TYPE,
@@ -62,6 +79,17 @@ static const match_table_t mktme_token = {
 	{OPT_ERROR, NULL}
 };
 
+/* Key Service Method called when a Userspace Key is garbage collected. */
+static void mktme_destroy_key(struct key *key)
+{
+	int keyid = mktme_keyid_from_key(key);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mktme_lock, flags);
+	mktme_release_keyid(keyid);
+	spin_unlock_irqrestore(&mktme_lock, flags);
+}
+
 /* Key Service Method to create a new key. Payload is preparsed. */
 int mktme_instantiate_key(struct key *key, struct key_preparsed_payload *prep)
 {
@@ -198,6 +226,7 @@ struct key_type key_type_mktme = {
 	.free_preparse	= mktme_free_preparsed_payload,
 	.instantiate	= mktme_instantiate_key,
 	.describe	= user_describe,
+	.destroy	= mktme_destroy_key,
 };
 
 static int __init init_mktme(void)
-- 
2.21.0

