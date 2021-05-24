Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891D638DF29
	for <lists+keyrings@lfdr.de>; Mon, 24 May 2021 04:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhEXCSU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 23 May 2021 22:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbhEXCSS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 23 May 2021 22:18:18 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228D4C06138A;
        Sun, 23 May 2021 19:16:51 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id v14so16252360pgi.6;
        Sun, 23 May 2021 19:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=cSDpuKDMyT8z0ju0o2rO6qkPyzkFBJTWUNHR0ITwX+tv4e57LFAYbwpKiBzQN15nQd
         z0oy3wjedU/TJqeK/gQrBeUGom0xPVkw9LL8jo3IHllS04LrALKAtGG//TUNXHUD/LFb
         3OIgQzFyEISouaifCGLNE4fxfn9PsyZCaou+7F/5x7tAU9RQCCtLX/vpCv89aGi43TxQ
         1Tzuse0OnKOx8GbOPrfoZxFwz9MnsVGXS0h0awi+l3iZCbnJ915uqadN9b1oStwyGoXN
         41tDeHmXMX2tjo9Vtlz3NbOdTwQtmS8s9nAL1r1DXkOD92MrFl9akw11vcUSRgpGj55T
         3cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=RmQpW+Ch6QRroHYxp+OhV9sDKoURdGQVeZQkFEPWhipx4OkrMNCV4epuc+V/ZjjhYn
         vTeOBFujz2fWr0teUvv5g6lFXmDeYi+oFd/rM9qFw+/0jo3WCKv9Hw7sFPc7QpkKou/N
         Y1rbcw0pPISvy8exqR4Q13NhNuE7jEDNgG4iWg7B0DAS0H4vSqx1zICzEcjDXqi/usf8
         NSgE7EQr/7VYo3TTzMjeFPjargLTlSxb104naxh9IPY5kJKk8mwyYql85Q8rnFkoQ0x9
         V0vk9x7fbNXc92dsHFCrs5cVzY3eushDprFiiABaFWPMEodhzYvNyBVEENnHOSkxOcVG
         LHTg==
X-Gm-Message-State: AOAM530VhY25l1IJ2kUGC21LkaUjfi/x2cbm7glJcPSMyztx8NXDgR5y
        cffDCMrqVxVa3D+G77xgXj0=
X-Google-Smtp-Source: ABdhPJwejrj/eHiZMZfHhuHqKsMJoLaJ7eqvWpYxGs6BJWkzowOCykhS1Bz2NadhFlOl1zAozIEeBQ==
X-Received: by 2002:a63:5504:: with SMTP id j4mr11186091pgb.238.1621822610732;
        Sun, 23 May 2021 19:16:50 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id h1sm9474960pfh.72.2021.05.23.19.16.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 May 2021 19:16:50 -0700 (PDT)
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
Subject: [PATCH v8,4/4] Documentation/admin-guide/module-signing.rst: add openssl command option example for CodeSign EKU
Date:   Mon, 24 May 2021 10:15:40 +0800
Message-Id: <20210524021540.18736-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210524021540.18736-1-jlee@suse.com>
References: <20210524021540.18736-1-jlee@suse.com>
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

