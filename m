Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E6BA2813
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH2Ufr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:35:47 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:42883 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Ufr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:35:47 -0400
Received: by mail-qk1-f182.google.com with SMTP id f13so4157846qkm.9
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Cj5ZHfBeBKDIbucQl84zJEuDAIUN930MUwjSXN5Pic=;
        b=m4XbF55b397qile2JpahXLHeioVWJAQzT9QVa+M9BFZvCjPMSUsUmcolZD19B8+rOC
         uEKHhr4Xn6bmgi/lxHaqyEG7/pVXbWgKcz1DOQCnoPP+TR+7d3xQTM9Ef05lO4ZvSLoE
         Kb755W/aasI8r8fMNn1MFpjKUmohF7tbQcLOXbxFEKLAfou29Ak9ySl4fKCx95KCcvkL
         t4wkHhQT6a+MGWNZ79eCyXUh5nJtvi1r73c8TtbzU9/sL6aqMlSGS8mS44VKFtISBv+C
         iV/5x8wuj2IXxxQ230aWipuO+Cf4dljgqvn3oVgBqM01j+i2TD0KGshedbCt2RJx3wb/
         McNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Cj5ZHfBeBKDIbucQl84zJEuDAIUN930MUwjSXN5Pic=;
        b=oYorUymF+HFPdRu4fJ5qhYeEvey7tP5/+1oB/YW5qp4ErMh3XsNanuNXtZPg3mLBd4
         myVwNMofuKQG/ylrLkShj6+ip6Za5bUie03uM8HZMxmyoYX+tbWHkdXk4QpKdLFzJQcd
         Co0yiYRzfgqB+q3dbUm8Lrsk5Dqlxkg7zBf+0pqdtaYIIW/cl+HqesxREkExoOPSM8wO
         TLbWFIwg/kgs3IsoNZhnTWAUyi5tKXtW07pNwbS4ngjXpz3orkjy3V2BTY1lwW6EiVUI
         0eaRV0pfSwaX07oItly7pSX3VOx95tmStBeLcxwZL3MyUhXoQxIx9nlSVmaM1tjUEDIq
         zujg==
X-Gm-Message-State: APjAAAWDzHa+Gjjcjdk9DXq03OX9RNQ3NQM3kn2vceFYcyCTvN0Bkuvq
        bWeZVkKW9KyUDwrshrgffx3ttQUQ
X-Google-Smtp-Source: APXvYqyjcFxdpQvp+PnwDuH4qUSZ1OY8Me/xCcLnwOFb1an1q6YWpFzpgWRSTYr8hRl2rDnalGrTaQ==
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr11234428qkj.27.1567110946104;
        Thu, 29 Aug 2019 13:35:46 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id f34sm1082670qtc.19.2019.08.29.13.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:35:45 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH 01/13] tests/toolbox: detect endianness with PIE executables
Date:   Thu, 29 Aug 2019 16:35:24 -0400
Message-Id: <20190829203542.4410-2-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829203542.4410-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 tests/toolbox.inc.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 5a6d3f2..9c819e5 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -13,10 +13,10 @@
 echo === $OUTPUTFILE ===
 
 endian=`file -L /proc/$$/exe`
-if expr "$endian" : '.* MSB \+\(executable\|shared object\).*' >&/dev/null
+if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
 then
     endian=BE
-elif expr "$endian" : '.* LSB \+\(executable\|shared object\).*' >&/dev/null
+elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
 then
     endian=LE
 else
-- 
2.21.0

