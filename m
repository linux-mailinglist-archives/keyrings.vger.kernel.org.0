Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C038F387478
	for <lists+keyrings@lfdr.de>; Tue, 18 May 2021 10:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242277AbhERI7V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 May 2021 04:59:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40133 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242135AbhERI7V (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 May 2021 04:59:21 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dimitri.ledkov@canonical.com>)
        id 1livYA-0003zj-7O
        for keyrings@vger.kernel.org; Tue, 18 May 2021 08:58:02 +0000
Received: by mail-wm1-f72.google.com with SMTP id x7-20020a7bc2070000b0290149dcabfd85so202125wmi.8
        for <keyrings@vger.kernel.org>; Tue, 18 May 2021 01:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lh2U8FrwDr6MxMarxfgPX9eu/47a6TaB97JHxOd8BE=;
        b=f1nW/yWXjY2pgXB4Ga4LOFQOpvNZEMf6zZc6BkkjGFjbKBcs67O/sniAJg41GJjPNo
         kIWQj/Lk7bCizOHJg/5hQKaIDort2ncxRp1N7q+Essh11eohVmKM1oZ2bgSr4K3y0maq
         gVg95DaXoet5t4MtxMcb9f0N0qaGxhq6ai82/kcFuNsgNSf7uMy8D2i801260d9KAEI1
         uhGIu7EbiQiOjtukHTSBrVn3QVH04UwUD602hl/01WXXVzZgUai9d/PWfxU4kusAbJ8l
         jnjzyz1csWpZue0yVNnEgthvz8YGUhDf3lR4nvbHMZCClvaBVpDQiEeZbdFwW9FojcEV
         X5TA==
X-Gm-Message-State: AOAM5318TCJOV0ZG6WoVPyMYAPkIpA6jjRI74sFEFwzoLAlTxJSqRwUX
        eUvtoGQY9+xtDF94TnMocLfSPDT6fzgLibwdAWsiLvJ16qvTaf7vc5xVcGALpbARacHseNf21I/
        uYWMtjbbyI/mPZBkQ2vR9Wxozmnx07DvGxWlS
X-Received: by 2002:a5d:6882:: with SMTP id h2mr1562476wru.275.1621328281760;
        Tue, 18 May 2021 01:58:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYULudlQqfl57noIfvG4GevGHJs9v5jYGrt2qdgRQz9ACquEZs3EvjkBa5HTPAdCO3bLjbsg==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr1562452wru.275.1621328281453;
        Tue, 18 May 2021 01:58:01 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:5e37:8c51:f26a:2ada])
        by smtp.gmail.com with ESMTPSA id b81sm2351091wmd.18.2021.05.18.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:58:00 -0700 (PDT)
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
        keyrings@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        David Howells <dhowells@redhat.com>
Subject: [PATCH v2] integrity: add informational messages when revoking certs
Date:   Tue, 18 May 2021 09:57:40 +0100
Message-Id: <20210518085740.129136-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512110302.262104-1-dimitri.ledkov@canonical.com>
References: <20210512110302.262104-1-dimitri.ledkov@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

integrity_load_cert() prints messages of the source and cert details
when adding certs as trusted. Mirror those messages in
uefi_revocation_list_x509() when adding certs as revoked.

Sample dmesg with this change:

    integrity: Platform Keyring initialized
    integrity: Loading X.509 certificate: UEFI:db
    integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
    integrity: Revoking X.509 certificate: UEFI:MokListXRT (MOKvar table)
    blacklist: Revoked X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
    integrity: Loading X.509 certificate: UEFI:MokListRT (MOKvar table)
    integrity: Loaded X.509 cert 'Canonical Ltd. Master Certificate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
cc: keyrings@vger.kernel.org
cc: Eric Snowberg <eric.snowberg@oracle.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: David Woodhouse <dwmw2@infradead.org>
cc: David Howells <dhowells@redhat.com>
---
 Changes since v1:
 - Correct C coding style add {} around second branch.

 certs/blacklist.c                                   | 3 +++
 security/integrity/platform_certs/keyring_handler.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index c9a435b15af4..9e8998868e3e 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -172,6 +172,9 @@ int add_key_to_revocation_list(const char *data, size_t size)
 	if (IS_ERR(key)) {
 		pr_err("Problem with revocation key (%ld)\n", PTR_ERR(key));
 		return PTR_ERR(key);
+	} else {
+		pr_notice("Revoked X.509 cert '%s'\n",
+			  key_ref_to_ptr(key)->description);
 	}
 
 	return 0;
diff --git a/security/integrity/platform_certs/keyring_handler.c b/security/integrity/platform_certs/keyring_handler.c
index 5604bd57c990..9f85626702b2 100644
--- a/security/integrity/platform_certs/keyring_handler.c
+++ b/security/integrity/platform_certs/keyring_handler.c
@@ -61,6 +61,7 @@ static __init void uefi_blacklist_binary(const char *source,
 static __init void uefi_revocation_list_x509(const char *source,
 					     const void *data, size_t len)
 {
+	pr_info("Revoking X.509 certificate: %s\n", source);
 	add_key_to_revocation_list(data, len);
 }
 
-- 
2.27.0

