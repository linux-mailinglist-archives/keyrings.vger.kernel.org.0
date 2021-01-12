Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7172F352A
	for <lists+keyrings@lfdr.de>; Tue, 12 Jan 2021 17:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392201AbhALQMu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 Jan 2021 11:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387818AbhALQMu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 Jan 2021 11:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610467884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7GrmVz3g5PnC6MejB1/FJv7gDiKaAZjfigOkKnsP7RY=;
        b=LLN8ZYwXSFayWYvLsqT6Fl+TbNI8NYdcWl0hTMdwZ9zDQrGWTVZYltAKncIyCKpJ13gqaI
        g7qR3HZ93X9RA2bhk3kXKxOj13g4Z0u2oEAw3awJWG7hPHsYmvRvLUl+eRb6nYZTbxd6bU
        LH3T/tnqP/FPFRAqQf+4kRBE1QQDhcU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-YckKDQlYMQifQvXXoU1vaw-1; Tue, 12 Jan 2021 11:11:21 -0500
X-MC-Unique: YckKDQlYMQifQvXXoU1vaw-1
Received: by mail-wr1-f70.google.com with SMTP id z8so1370383wrh.5
        for <keyrings@vger.kernel.org>; Tue, 12 Jan 2021 08:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7GrmVz3g5PnC6MejB1/FJv7gDiKaAZjfigOkKnsP7RY=;
        b=p6vYkQoSXlosLjr4RXYMaDYlhX4rbOKeOe7c9CyQPTN8DhJTc5zfOUy/0LDi2Evs5W
         bYrrKqfO0wZNpvd3ib7Svsmdij09nPnfKo3tkEP4LfLMjZejAZGFZL13N5lWp+hw/fyE
         ekaaXCPr6FTMOkNhneSOSoKGo3ELFp5wbzTKmNV6TtxLLPRf/g0CKUcw3mTtiVErpnD2
         0Fn4dHnt/DoSQAiuY2qFQpLgDJHdckjIoMLAbMkMy5jO0PTvrDlYDAAjytEiHLHTW8n9
         kx8qaLtpMUBCoQeAacB/F5btFjig48FR7bfj/E/9ByHxFC6SabjxJm0+RiNdpqgL8kG0
         F7bg==
X-Gm-Message-State: AOAM530SSUMiw/mwJV2n4OEX132EAfhUWv8kx77pH/mBwYvxS37KgR8S
        V8Q+mZF3SkFFhUYjookSjzrVj9IgUdkvPMjV6+m5d21Bb0paWy5OYuPIPRo28WGgK7RadFBNssb
        Gfu3MVZdBBzAPHrInO2Y=
X-Received: by 2002:a1c:7d94:: with SMTP id y142mr4317088wmc.105.1610467879455;
        Tue, 12 Jan 2021 08:11:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9gtHso6LQWZ01xitLmZ7DVGmvVKcp38eals66lkxaBqWRIlrF6/TqEJ1hfzciMThkNCz2Iw==
X-Received: by 2002:a1c:7d94:: with SMTP id y142mr4317069wmc.105.1610467879236;
        Tue, 12 Jan 2021 08:11:19 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id e15sm5765658wrx.86.2021.01.12.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 08:11:18 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 2A2DF180322; Tue, 12 Jan 2021 17:11:17 +0100 (CET)
From:   =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] crypto: public_key: check that pkey_algo is non-NULL before passing it to strcmp()
Date:   Tue, 12 Jan 2021 17:10:44 +0100
Message-Id: <20210112161044.3101-1-toke@redhat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

When public_key_verify_signature() is called from
asymmetric_key_verify_signature(), the pkey_algo field of struct
public_key_signature will be NULL, which causes a NULL pointer dereference
in the strcmp() check. Fix this by adding a NULL check.

One visible manifestation of this is that userspace programs (such as the
'iwd' WiFi daemon) will be killed when trying to verify a TLS key using the
keyctl(2) interface.

Cc: stable@vger.kernel.org
Fixes: 215525639631 ("X.509: support OSCCA SM2-with-SM3 certificate verification")
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 crypto/asymmetric_keys/public_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 8892908ad58c..35b09e95a870 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -356,7 +356,7 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (ret)
 		goto error_free_key;
 
-	if (strcmp(sig->pkey_algo, "sm2") == 0 && sig->data_size) {
+	if (sig->pkey_algo && strcmp(sig->pkey_algo, "sm2") == 0 && sig->data_size) {
 		ret = cert_sig_digest_update(sig, tfm);
 		if (ret)
 			goto error_free_key;
-- 
2.30.0

