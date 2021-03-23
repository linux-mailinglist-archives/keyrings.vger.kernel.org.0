Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39B5345682
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 04:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhCWD4e (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 23:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhCWD4D (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Mar 2021 23:56:03 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D9BC061574;
        Mon, 22 Mar 2021 20:56:02 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v186so10383240pgv.7;
        Mon, 22 Mar 2021 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=UXpW9XC2NJqo7rfMeftU26YMoK90BHzqbUDDT4ow5DfNL2VY+06Rp3ATLnompDaf29
         URFgJYp6bGlRdf6keBw/FE901PTen0GhQYjwTk6cy4jhT4xib/LgUOwWieEVhO+sJtL7
         wjcrbxUunWkk7MzMd/JsGvObERbO7waXPGrN2rkh59FTQWf2/q55VYiah2Ck3m0jeLX+
         mWZolC7MH7YNibNKr9zFS745BMoJvI2qHpEcJW0HSpidbJXDE13vn+g9EQ8+HsWFeReh
         VWEuC0VwGiSzjOMRF9Dc/tG5wFBK+tZKtdMiXsLcxP6bMfMKRHZ5W6V54dPVbcvgrxlh
         lsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=hDTDBoVlhOT+p8Kv9G13LcLJwLfgUo33jbbwT42YR1AbyqEUnvvaAJ97zNyF1C5p4o
         tq7P0LXBT//7uPi1T9o9QPWJpbJjaTPAkiSdafhy0mvFfUOC64uAU0WdiEkrpyAzhhur
         b+LDoEogVBLMgzoRbRIDh/ueBtHy2cdzZjOQbhr2sLQqQf3xW/sxFxMV4f6QwPMGHDgd
         b1K3Owxq6OSGOfnae3CVUOp3ii5QggHrQ5ZHQm5Zd4o+vzMkuscCq1mvYwXmnTiE+rH0
         U3WVqirzOoMjXIEGuKWFA5e++jlR6eUNiyvdD9k7QgekVrPbaf5KF6NLi26zLEo3iqja
         OrGA==
X-Gm-Message-State: AOAM531BJ1plwk544CD1S+mtxj68+7JJJNHz//SL/NpvI2hZuirsKkAr
        gKZNLAxze21Gzjz3FTiVPMU=
X-Google-Smtp-Source: ABdhPJydHbGnZnMAt1icAGF5YoesfMt9wBbr8Fj49YkpN2/TMf4kipg460iug9SOSvZFlO4f3LGzeA==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id z16-20020aa799100000b02901f1b41bf95cmr2960636pff.5.1616471762418;
        Mon, 22 Mar 2021 20:56:02 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm14415630pfa.41.2021.03.22.20.56.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 20:56:02 -0700 (PDT)
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
Subject: [PATCH 4/4] Documentation/admin-guide/module-signing.rst: add openssl command option example for CodeSign EKU
Date:   Tue, 23 Mar 2021 11:55:21 +0800
Message-Id: <20210323035521.5843-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210323035521.5843-1-jlee@suse.com>
References: <20210323035521.5843-1-jlee@suse.com>
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

