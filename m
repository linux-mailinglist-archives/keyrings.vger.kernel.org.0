Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E5135B995
	for <lists+keyrings@lfdr.de>; Mon, 12 Apr 2021 06:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhDLEsB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Apr 2021 00:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhDLEry (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Apr 2021 00:47:54 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192D6C06138E;
        Sun, 11 Apr 2021 21:47:32 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id s14so1142366pjl.5;
        Sun, 11 Apr 2021 21:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=eEhL3hkNO0dsytCFG6zTFp3q3lxZbPWEmVGMllP6dUV8HcqGx/OWRVTRxyHRwyV4BN
         +rBgX6ATm6BkVrGXBa6YeEjNfxIETKD5dNXmZmrVu98cteQzzZ0YA9IQi1x9IaAZn6c+
         3NvmBn7vnteCNIl5cwubSYUc8042QxymMCErGiDZxxZZ/7TjyFd14OM01FTlwLqzIBbh
         U0YVkcIwSt6W6GznUNU54V37nv8565TDGykCtzth4G2vUKRs8dOmXJw5lPQCVB+6AOtL
         grcPM9qiYtIF8PSn717XJ8PnVX6VWJSxUNIO9TYgSxBQFC++pWs4Khw9TPKR26rxLqp2
         CDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=ALlgI/7UDIomOYKUx744rlPLSPOYMlkbiGCKeDqSmjlAVIWL5o6gZiG0Kzm//6YBGX
         4+VjjEQ1zy1feQFmwRNtQS3yhi0EcwqaPaawTsD/LCwtZ2p8Z6ddA/A5dmQILWeBVwfG
         8rnQlWxR9n79V9LeFtT6CtjZbLXn+EIEOUJMFthvRnSRwTS5aeQwMqcwxrvYNZj11Ppv
         wpzJY+YlH3PhTPoItr96adrlV+kC4PJ9UPmNNDuaoAW/ZsDvIH32/nTB90h5gIvONYEk
         8waC+gFSRMCgdw27fA6zR74BjMXbSs2c0AGyvS9BIklB0qxnTConxc56SGOiwDOlCN8g
         IjFg==
X-Gm-Message-State: AOAM533rxUHBMRBvpUwDEyhynCnXf0qKLi/FDcsQJONhIfOvEfQFhB2Q
        Hb9NgX7N1N3TdZXQ3y+NuWU=
X-Google-Smtp-Source: ABdhPJx+ejPnjpbm12qIZRhqEXS0YzVZ4ga5UBZTMoWcrmY01h3TJRr3cysHuvF0uzK2msXo8dHVvg==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id h9-20020a170902ac89b02900e6d19929acmr24507684plr.46.1618202851663;
        Sun, 11 Apr 2021 21:47:31 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id w16sm8514851pfj.87.2021.04.11.21.47.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Apr 2021 21:47:31 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v5,4/4] Documentation/admin-guide/module-signing.rst: add openssl command option example for CodeSign EKU
Date:   Mon, 12 Apr 2021 12:47:00 +0800
Message-Id: <20210412044700.31639-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210412044700.31639-1-jlee@suse.com>
References: <20210412044700.31639-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add an openssl command option example for generating CodeSign extended
key usage in X.509 when CONFIG_CHECK_CODESIGN_EKU is enabled.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 Documentation/admin-guide/module-signing.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 7d7c7c8a545c..ca3b8f19466c 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -170,6 +170,12 @@ generate the public/private key files::
 	   -config x509.genkey -outform PEM -out kernel_key.pem \
 	   -keyout kernel_key.pem
 
+When ``CONFIG_CHECK_CODESIGN_EKU`` option is enabled, the following openssl
+command option should be added where for generating CodeSign extended key usage
+in X.509::
+
+        -addext "extendedKeyUsage=codeSigning"
+
 The full pathname for the resulting kernel_key.pem file can then be specified
 in the ``CONFIG_MODULE_SIG_KEY`` option, and the certificate and key therein will
 be used instead of an autogenerated keypair.
-- 
2.16.4

