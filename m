Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB782C72F6
	for <lists+keyrings@lfdr.de>; Sat, 28 Nov 2020 23:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389754AbgK1VuF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 28 Nov 2020 16:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20980 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730597AbgK0TwG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 27 Nov 2020 14:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606506722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=d6G2nIxqhehmcqneDPM87NHHHaegmMSyQEpv2XH/rd0=;
        b=AHjfxDZvswEhfXFCFTrIKnbkBR01ls22Un7eTJk5MBJHjxs+4K6WredZs4nRPKlNtyZ9H4
        b7kaySKfjUATkpp1PB2Gh5qLIF/fGnwLZIoFu05ZfdFZYO4dqje1EKhth/iJcSuvr5f3tO
        KRC/VqR75HXHQtM67lzvBPUshTY5iac=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Ep1eWM52Ow2v9nwaDIi-aQ-1; Fri, 27 Nov 2020 14:15:48 -0500
X-MC-Unique: Ep1eWM52Ow2v9nwaDIi-aQ-1
Received: by mail-qk1-f198.google.com with SMTP id o190so4231780qkf.15
        for <keyrings@vger.kernel.org>; Fri, 27 Nov 2020 11:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d6G2nIxqhehmcqneDPM87NHHHaegmMSyQEpv2XH/rd0=;
        b=FQfMEie+cxQ9v5/XuT4zQYxcpKWQ1EYKzY9ogVICB8yUi1j8tfsN2LPbZG14oxQFsi
         vC6uMoteSHbu1h7MKYCmF/K8/hmLVfn+X50aqnuGwWgHGz00qBp0czBXIBkRkQfzBtOw
         qyKf4VUhNIO5J99h8iNJq433GHrctBzWXa5yBPaSY/J5cHpcG6w1m5kaERP2i+m8oJDp
         l3SZ64Lgsm/so9r/hza3vgWH1rPqpJN8WO15WJmrHVS61Kztq6zhW9PD3Lf/OlOKVfnY
         +C+g2S5LDDNC8u+bMWSnFbWcnihNR/Cs6B7XQjosCSd9F5OQ93jsDGF3MvJp0EcOFnWh
         iDlg==
X-Gm-Message-State: AOAM532pxhzL6e5wIkZkPhsHsmpD6FLAhHEYuOubkmruFIK/mXTS/HmI
        Fe5wNXh3JrAMHlgHu1PdeO8YfkAlL/rb9ABiwDi5Q2qebn6B7Jon4VjiE4f63C/dvGbzQeYox2F
        EhisfH9rGgqjfnQ+k08o=
X-Received: by 2002:a05:6214:190f:: with SMTP id er15mr7930539qvb.33.1606504548340;
        Fri, 27 Nov 2020 11:15:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLfzJKgPIayT6gRKsye8GTE3djuTXJDuAjxD/1iyv8tQ8iZ40gPZ9Bl4CSLya6Ta2xQATbGg==
X-Received: by 2002:a05:6214:190f:: with SMTP id er15mr7930523qvb.33.1606504548133;
        Fri, 27 Nov 2020 11:15:48 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id p62sm7033652qkf.50.2020.11.27.11.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 11:15:47 -0800 (PST)
From:   trix@redhat.com
To:     dhowells@redhat.com, jarkko@kernel.org
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] keys: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 11:15:43 -0800
Message-Id: <20201127191543.2854306-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/linux/key.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index 0f2e24f13c2b..1b0837c975b9 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -360,7 +360,7 @@ static inline struct key *request_key(struct key_type *type,
  * completion of keys undergoing construction with a non-interruptible wait.
  */
 #define request_key_net(type, description, net, callout_info) \
-	request_key_tag(type, description, net->key_domain, callout_info);
+	request_key_tag(type, description, net->key_domain, callout_info)
 
 /**
  * request_key_net_rcu - Request a key for a net namespace under RCU conditions
@@ -372,7 +372,7 @@ static inline struct key *request_key(struct key_type *type,
  * network namespace are used.
  */
 #define request_key_net_rcu(type, description, net) \
-	request_key_rcu(type, description, net->key_domain);
+	request_key_rcu(type, description, net->key_domain)
 #endif /* CONFIG_NET */
 
 extern int wait_for_key_construction(struct key *key, bool intr);
-- 
2.18.4

