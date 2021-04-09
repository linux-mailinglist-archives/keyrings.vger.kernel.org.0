Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637BF35922F
	for <lists+keyrings@lfdr.de>; Fri,  9 Apr 2021 04:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhDICsC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 22:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbhDICsB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 22:48:01 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE6AC061760;
        Thu,  8 Apr 2021 19:47:49 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id g10so2017678plt.8;
        Thu, 08 Apr 2021 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=m6llg1wz1AbvRLP0qKhVjJidA0yD+i4LsoBJ6TfkuD9vnR6jyqNnTzfVsq6VPlkZrm
         DQP64fvm6kJQkRWdrQptJbTtjnBz/4aL8GYABAvauNucff1sUg6/oS7Ya3O86ZmwpZkQ
         L1FBYM1A5reg1N0LbpjR13lI9uRIP6GrAXUjn4uWDEoac/5VuOUzgDbqwyE9FqxijXqp
         6oiKv/s+v/xpPdivKYc38MX9O6CV6uq+44JjDRAkf0sWEsJ+DDPiY7HwYyO6t6Ke9JoM
         lhVh2OPTIVD3qEb+p5b/krUgqsPC2chn3LzRVYumb/lW60UFU319y21iTyORgVW4p1AK
         ErCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wB1I6Nqq7AfdRuGhioLL2RWvT/EvSUrtBmeOoGNpC4c=;
        b=tTWT50owUosFLFQMY0jyabGt1nBmTOoiQSuWF3ZQpsmCVrhbXhn8ny33P5F7ck/ymN
         wF3pLp8S+TzyXrXS0iiBsJD57avghmTTiVA1hN24ZzhapSkzF3yEDz8bnjzD9JwpwPYf
         eNaMVxW/nLjcUUTr/5XHIIpxVwtIRrtlkbbit7hqSQQxxRqSh232wkgtaqWG/mG/t0Db
         yR//s1fSTMxb6MYNzrIpJQOwnI56D4JxEzbaWL2Kg7F3oVXlI9mSDVESedseYYTMbHrp
         xZKEQQ93fmggNqtWYRMnMv+0rTuuleKFt1ylMyKLnAsvlg36gfCcJ2W5w2DgBiOGZ2YK
         Ag0g==
X-Gm-Message-State: AOAM531htF8ui6ot2nkRO/gxDAQGmMGChEJ5W7z1VNqjJKuPbIKg4PRI
        LzmADTfjEKvj1YjZA/rZdOk=
X-Google-Smtp-Source: ABdhPJxUYDPGfXbWq6ZhgcPjptCXqH2cmifLVZBYRe/Vs49P/0+eEQ4Hxh/QRFDGUb/2TZdNZVPTvA==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id t16-20020a170902b210b02900e633b4cd9emr10575859plr.67.1617936469326;
        Thu, 08 Apr 2021 19:47:49 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id d26sm665525pfo.162.2021.04.08.19.47.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 19:47:49 -0700 (PDT)
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
Date:   Fri,  9 Apr 2021 10:46:56 +0800
Message-Id: <20210409024656.8083-5-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210409024656.8083-1-jlee@suse.com>
References: <20210409024656.8083-1-jlee@suse.com>
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

