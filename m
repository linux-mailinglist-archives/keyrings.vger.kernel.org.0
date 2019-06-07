Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFF238791
	for <lists+keyrings@lfdr.de>; Fri,  7 Jun 2019 12:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFGKCK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 7 Jun 2019 06:02:10 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38593 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbfFGKCK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 7 Jun 2019 06:02:10 -0400
Received: by mail-ed1-f65.google.com with SMTP id g13so2201621edu.5
        for <keyrings@vger.kernel.org>; Fri, 07 Jun 2019 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXyEZfaRxhxI3NSPrB/TqD2t0A44u2oE17hiVcSU1U0=;
        b=soAL5O7ymo02xXOCZ5PKP9Zw2fJ808JQko9VgtDhZjdTeJqmDrAs+Tul0JU9Sc0f+a
         Do/js4/fPJyWEZjlP5TrnPFP9XHGwQqftv4jRA0Nj2pFKIVaXbAkIQ6Cle9fgksllRQl
         aOFYCBrZtV2RwVhhtILqJ1LnIqUgPdLcS+xUGGW7C9N/4bvzyl0N3IwiLMg8Ltaq3V5k
         pMCcRBagzxV8o/TKz2ZEiDAseoNK4xffE6k7k9AbXP2Gm06vwQpVqsIysqOL4VIRhWvm
         oRclqVNq5uC4joZbnqMag/YFYib+ff3eKF9THNrxbm7YCO1534H5KKWGfxJVlOMHS01C
         xgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXyEZfaRxhxI3NSPrB/TqD2t0A44u2oE17hiVcSU1U0=;
        b=iIlcCFPzeX5qe6nBtiDaWtLMhh0yUYAC01OfdkdLnXJWnvqochrLROOkkGqquT2XnM
         dLZvkNaz+eB8JJtamK8ADieBt7bfex1SEJN9uAU89OOrSHetLPOYzpyFXTspBlgMVcxY
         r6hleOLf5ulCH+RzyHbCxWjCMn0vQD/4Vuh6PVuvLeKTvxhEkF708zknY3w80ifZ5DDZ
         j4/F4iD1X5EvdJI0EckFDFvWmEGar+TPv4OQi9oEHtFxB5VXn3g6KF13m8ThiEQUXc7U
         gbXune1x7Lf+ESvxttrWHx6nAhCtD4iluaWRrz45uaY2Jsdolk5VptPB5e9w9Db+Ph2t
         dTSA==
X-Gm-Message-State: APjAAAWIHWjMkI4T7rRBklmJV+rzB4LZc4XUW/dfyucFZ/LIGyZhJnCs
        4R7kCsHLqoEEF0yyZoCJ3DKgkw==
X-Google-Smtp-Source: APXvYqyrTksYbCUkr+KYuYdizYwXxf4iLx9T2LKBImGzAAE0qjG6f0JVOufvqSMuanJj+Y9mJ2f2gQ==
X-Received: by 2002:aa7:dd92:: with SMTP id g18mr634651edv.194.1559901728656;
        Fri, 07 Jun 2019 03:02:08 -0700 (PDT)
Received: from localhost.localdomain (ipv6-4a2c18cf8e0655e9.west.clients.hamburg.freifunk.net. [2a03:2267:2:0:4a2c:18cf:8e06:55e9])
        by smtp.gmail.com with ESMTPSA id hk1sm290066ejb.36.2019.06.07.03.02.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 07 Jun 2019 03:02:08 -0700 (PDT)
From:   Jelle van der Waa <jelle@vdwaa.nl>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>
Subject: [PATCH] Make keyutils reproducible
Date:   Fri,  7 Jun 2019 12:01:56 +0200
Message-Id: <20190607100156.19477-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Adhere to the SOURCE_DATE_EPOCH standard and use it's date when set
otherwise fall back to the default behaviour.

Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 33a451e..9066d5d 100644
--- a/Makefile
+++ b/Makefile
@@ -108,7 +108,7 @@ all: keyctl request-key key.dns_resolver
 ###############################################################################
 #RPATH = -Wl,-rpath,$(LIBDIR)
 
-VCPPFLAGS	:= -DPKGBUILD="\"$(shell date -u +%F)\""
+VCPPFLAGS	:= -DPKGBUILD="\"$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%F)\""
 VCPPFLAGS	+= -DPKGVERSION="\"keyutils-$(VERSION)\""
 VCPPFLAGS	+= -DAPIVERSION="\"libkeyutils-$(APIVERSION)\""
 
-- 
2.21.0

