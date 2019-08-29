Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3123A2840
	for <lists+keyrings@lfdr.de>; Thu, 29 Aug 2019 22:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfH2Uni (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Aug 2019 16:43:38 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:34352 "EHLO
        mail-qt1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2Uni (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Aug 2019 16:43:38 -0400
Received: by mail-qt1-f169.google.com with SMTP id a13so5302323qtj.1
        for <keyrings@vger.kernel.org>; Thu, 29 Aug 2019 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Cj5ZHfBeBKDIbucQl84zJEuDAIUN930MUwjSXN5Pic=;
        b=Zdghar/4W8cM9FB6RFPobUav1wccX8eE3WA3RQWRF/zXKGnCjJZFiW2wXBc13MGNqj
         5wBUN7G8tbSUK9QLrN/12foM94wSIpRnrSTVptQ8kODybF58bisKPvo4kSAAMHXN1GwS
         SWPdV+84YMcGGyIHheuO80VMkSo46kVg2zFsuldlAAN1b6jxj+XNB9B7UrVI4GXfwcIE
         f4txAUoeBmFeXLqEEVm/TJI3bQC6BkXXc9qcfzEpc/PYiWX8qEF0XsEcsskUfz35A+uy
         JFnX1u7H4NnfeLpEeXLQmuD9NS0feIzbxj/3GelxjZxDF0sCNZytgTR6bgc4iRFcvu4y
         sT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Cj5ZHfBeBKDIbucQl84zJEuDAIUN930MUwjSXN5Pic=;
        b=bxuqQ74/L2kRk1HnsLhssrtofr3gRS5jRgo8tOwYO6y47J0NqNgVXdDCay4OgHRMqN
         Xo4j2Ws8X/QjQ55fGFq5V2er1pRuO2eFFfgYPBbQcCynuvdmNHu2WC/ZQpEF6OVzhQ5Q
         0x7nmqd/1zk+9bBk2cKo4EuUO7u63SV/UiaVaNV8V3smBS2Tul8GGObqJxvMWFcW5+Lt
         7PeeNiwAkohyDZ03N0hrFUn++6Mllx5NZ5D/ESK0gYWD61tnbrlNrQoYytdXTR1PNfPo
         0uXdeFL1byLDhgr+dji6cQ9QaOA6LggCSSPCq0h/LPKHD7KLH0YkX8kYX2nz+uvoBWuV
         9XhQ==
X-Gm-Message-State: APjAAAWiw5ceXUkC/CsSAqPfqCTE0S6sJLzz3aNuQErFVpj8EXl1S7O6
        b/apJCwdWBbtHA6NQ9kYXI50qtzh
X-Google-Smtp-Source: APXvYqzdljF6ylZulVFNe2x5dNlzTLG4OhXGQJ4MUwGYHBbf/VVTHCbSkbVB4z09gUOGUP7vuJABFA==
X-Received: by 2002:ac8:5354:: with SMTP id d20mr11595139qto.119.1567111417154;
        Thu, 29 Aug 2019 13:43:37 -0700 (PDT)
Received: from localhost (tripoint.kitware.com. [66.194.253.20])
        by smtp.gmail.com with ESMTPSA id e17sm1885772qkn.61.2019.08.29.13.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:43:36 -0700 (PDT)
From:   Ben Boeckel <mathstuf@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     Ben Boeckel <mathstuf@gmail.com>, dhowells@redhat.com
Subject: [PATCH v2 01/13] tests/toolbox: detect endianness with PIE executables
Date:   Thu, 29 Aug 2019 16:43:09 -0400
Message-Id: <20190829204322.8015-2-mathstuf@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829204322.8015-1-mathstuf@gmail.com>
References: <20190829203542.4410-1-mathstuf@gmail.com>
 <20190829204322.8015-1-mathstuf@gmail.com>
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

