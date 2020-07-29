Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B526A23285F
	for <lists+keyrings@lfdr.de>; Thu, 30 Jul 2020 01:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgG2XuN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 Jul 2020 19:50:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42807 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbgG2XuN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 Jul 2020 19:50:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id df16so2316750edb.9
        for <keyrings@vger.kernel.org>; Wed, 29 Jul 2020 16:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=oswHXA5LhS4DeDN0kPg2Qrvx1OBgp2JqeysIOq6PCjus8FWUYTILmVn0k0ZFV6hwXs
         X+ma/b/2wIyHXyo5r62GrYGwDmbU6TN7rMsnoB49xed+1Lw2zib0wU0eNJjWAPNrgN68
         tVDSPYYvySNAbEib4DecB2fbFyKxwfKzk5PV63bUuSxJhuXDGVJGc7pyj/iAhp77UrXS
         IL5lHspvpVNSNiwiuYVOz1LSWCzT0WPmR+daQe5YHnCLcMJPH6+phxIFuMaeovodaVma
         0m57ZfKm2WgV6X00/XFH7YeTWqBAFQJqw6te2z7thMGACzAid7j/q3w56tVMqZdEFmgu
         SWKg==
X-Gm-Message-State: AOAM532DhYHP2RIH8iCxZiUN4JuqiHJhwTjzjA17V4ber8VDu/oG9wqZ
        U+peHtrc2PVM+I6dysuJvaMuoPRqkmM=
X-Google-Smtp-Source: ABdhPJz2hdgnyJLBJE1iKqtC6tnlNGhyLTwiFpIpwjr37bswqhHi0zc5/T9/3KFjbwPstRtwKTVPbg==
X-Received: by 2002:a05:6402:c81:: with SMTP id cm1mr48751edb.256.1596066611208;
        Wed, 29 Jul 2020 16:50:11 -0700 (PDT)
Received: from localhost.localdomain (83.5.235.18.ipv4.supernova.orange.pl. [83.5.235.18])
        by smtp.gmail.com with ESMTPSA id v9sm3214767ejd.102.2020.07.29.16.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 16:50:10 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Thu, 30 Jul 2020 01:50:00 +0200
Message-Id: <20200729235000.45250-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729235000.45250-1-andrew.zaborowski@intel.com>
References: <20200729235000.45250-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add the bit of information that makes
restrict_link_by_key_or_keyring_chain different from
restrict_link_by_key_or_keyring to the inline docs comment.

Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
---
 crypto/asymmetric_keys/restrict.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 77ebebada29..84cefe3b358 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -244,9 +244,10 @@ int restrict_link_by_key_or_keyring(struct key *dest_keyring,
  * @payload: The payload of the new key.
  * @trusted: A key or ring of keys that can be used to vouch for the new cert.
  *
- * Check the new certificate only against the key or keys passed in the data
- * parameter. If one of those is the signing key and validates the new
- * certificate, then mark the new certificate as being ok to link.
+ * Check the new certificate against the key or keys passed in the data
+ * parameter and against the keys already linked to the destination keyring. If
+ * one of those is the signing key and validates the new certificate, then mark
+ * the new certificate as being ok to link.
  *
  * Returns 0 if the new certificate was accepted, -ENOKEY if we
  * couldn't find a matching parent certificate in the trusted list,
-- 
2.20.1

