Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3989D38C3AD
	for <lists+keyrings@lfdr.de>; Fri, 21 May 2021 11:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237136AbhEUJpH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 May 2021 05:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236992AbhEUJot (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 May 2021 05:44:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D6C06138A;
        Fri, 21 May 2021 02:43:26 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so7045442pjt.1;
        Fri, 21 May 2021 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=VbK2759OZmIs9Uj0BIE0/1K+PyTaHDk8/CI8o3Tw9RUf+sUBvzmx1RoZwmvicUB8w4
         cWUL/ZsVw7vRAmJCvC4VhiNIsSJRQYYsikPH6qbaYHehkr0CRO3OKSWQxKmb6zy+k6jm
         jmZLloCR6zNCS2dzvfta5Jlm3frNi9a9FJnChKYfQXIYxFtdQHOhyNC4W+22ellojM20
         Skq4dskAHXfBTFP6QuWtxAdAZbRnm6c/0uXkqiRgyKhoOkRcQpDO35mGSUT2woUaI93t
         pKaSEnyq6hnVfe6qP/aGIx9o4jpQaixTfGMp/HVZ2jqtXEZsvZeYRLHo+41MajnhD45k
         4Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=Hicv8axTr9OQEE1po/qjDXs/KlQtNCvDljzxgnbxl19mCVKqeMSQPce5A/N69pp+KU
         heLewmoPvbGNfctNc0NCBHUq7RuGjb5l4ioluhOMgbK+/L6k0Z4shiK0c0KM82wBff+E
         GG1LWgiYdSJQR22jdrU7zznUx9mR6IQ7v7Ag5UnXHH8Eg35hXvsOtXqjKFZrlZx7rUal
         0j0gOnO0GBfuJbee25IC6+Q1vZa3sLzBSGRove3aeIysifJNwgXq3YRm6QcQhmAFQpHL
         6SUSjALEuNhY7lCvFveetAl+mBjiIx2z1TDnurQqw8EaaRuOIjNGfPrZFfJbg6AAq6Q/
         sQNg==
X-Gm-Message-State: AOAM530sIFIpxeVUG1J3gymBdiDRfjlKQGRTa0IOBagTSFBrGxpoC5aI
        nd395q21aRcd2wOrVDrToJg=
X-Google-Smtp-Source: ABdhPJwhX4piJdAwEmZ+oCZlh/WxLpDJi8RzJnOuKqFfzfSMTnqDk3lxHJPub4ud5OefoN4ysVgZjw==
X-Received: by 2002:a17:902:a3cd:b029:f3:d14:a17 with SMTP id q13-20020a170902a3cdb02900f30d140a17mr11232820plb.3.1621590205740;
        Fri, 21 May 2021 02:43:25 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id g202sm4091931pfb.54.2021.05.21.02.43.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 02:43:25 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v7,4/4] Documentation/admin-guide/module-signing.rst: add openssl command option example for CodeSign EKU
Date:   Fri, 21 May 2021 17:42:20 +0800
Message-Id: <20210521094220.1238-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210521094220.1238-1-jlee@suse.com>
References: <20210521094220.1238-1-jlee@suse.com>
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

