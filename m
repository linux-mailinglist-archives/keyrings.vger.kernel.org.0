Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE5436E5F9
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 09:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239669AbhD2Haf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 03:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239619AbhD2Hac (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 03:30:32 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB13C06138F;
        Thu, 29 Apr 2021 00:29:20 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id y32so46515348pga.11;
        Thu, 29 Apr 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=SvIl2khDaQcTuHQkoVsAATEn5pLt+XBnr0bcOoaUjgxmQRXU/iplohhBCzy+xdZ1ky
         PKR1NhKxMRlbfPt4P513OPvI8kqMszch8h+ynisM3AlwuZIACCE0yzJwSUOUSlJUjnOU
         pYA3yEeWb84iTZM8wchDqJ856RoCcQZ8IlIaNL84/Y/VNAoOTIyJ/DPVXCOHsFKg72F6
         Q5WVBZBS7Tr0rWWON/V4JvpqFuCKvAtW8NI2aYVRYNngiOAPt2A6utiym4xTmgJf6kHo
         i0yxmrQo3X6dHVC6ud8aSpqLCoyjl49apIzyVQ1GU2coTdhpTY+C9MLiTMVytNAXUj3O
         WmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=P8jHv8lDDSlOJPbx7fNZIx+adHeyhsYeHv4j4NnccnsjuvtuB1JD89wuBJCw+KOpnk
         MOuI5r+PISvZzX70YdhjD6MDgHD2PSc7pMZ1XpE3xMOP/nKrXDIiBvNf4N6bM4dci2tc
         BAoOP7uI+TA8iE1Tw7gOFmklBBGY6/1VH0c23ZfkkgkIGCJ8NScATPsYmRhXZTJD4lYK
         TZiXi+lgJqysnSbv4P4UXIo2q/dwUOlMYGIuiYGfhHeowjgwVry16MbQOW/NUOqiBQzk
         42avYi/jx8J9FIeEw2kpnjNl+ohSpKbSBOwv1qNbMxX1fUknBBBqnPmdPTU02SjicF4t
         roqg==
X-Gm-Message-State: AOAM530jivCpUwlgzyQ4KiBIUHTKgkSUnDicwHz6f01qOZCpbyoga8Gz
        v20pTOodMHlxaQezawrdqwU=
X-Google-Smtp-Source: ABdhPJxvVTG9anmUznLA/rhG0NrTR7JrLQ1MAoG/XEBDThWnMq11qkjQx8ECp60+lW1TUYW8mN0uKA==
X-Received: by 2002:a63:cd02:: with SMTP id i2mr7119281pgg.320.1619681359898;
        Thu, 29 Apr 2021 00:29:19 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z29sm1632085pga.52.2021.04.29.00.29.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 00:29:19 -0700 (PDT)
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
Subject: [PATCH v6,4/4] Documentation/admin-guide/module-signing.rst: add openssl command option example for CodeSign EKU
Date:   Thu, 29 Apr 2021 15:28:51 +0800
Message-Id: <20210429072851.24057-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210429072851.24057-1-jlee@suse.com>
References: <20210429072851.24057-1-jlee@suse.com>
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

