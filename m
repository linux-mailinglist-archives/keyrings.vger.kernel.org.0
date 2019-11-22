Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB04105F35
	for <lists+keyrings@lfdr.de>; Fri, 22 Nov 2019 05:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfKVE0L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 21 Nov 2019 23:26:11 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:46344 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfKVE0L (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 21 Nov 2019 23:26:11 -0500
Received: by mail-qk1-f180.google.com with SMTP id h15so5125528qka.13;
        Thu, 21 Nov 2019 20:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHG8+AxgBFSWa8fV+NFUGm+PfxGngjUbTez74iu0nRg=;
        b=tI9ZcU4Xe1MKGicL93WBj6TscKcqAOuxBlMzSP/FS2W2Pv4T2F1rHrN+Aepi6pF2NL
         Ym2EkT5lcpeqUFQfNfIitYYxY69axKaYRavmuTDa0YsvoFpuzMVmMl+uKNsD4Z9OptCS
         +RW20STVgsxUffNkF56iNWvWeuMaaZUXbChfa9gVcu4vhDVNvQNkc/45ou7xLo/XbMO7
         NeTCb8AlptxmP8eMKnkfEFRW0owhazbJZlYdEj0ZpkJlG0VpTwhqcSk8NW27Gzlliqz4
         xDQDroUim2xPx7F8BNkXJBGEjrMX+m4EOKXWTZul9cV1ONthw+PqfHg4nQF02M7XtRGt
         QWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mHG8+AxgBFSWa8fV+NFUGm+PfxGngjUbTez74iu0nRg=;
        b=GxzMmdfojenwTOvaE9xiAFAGX68gDgB/Lzl561B4vvAwhlrdAjFwLrGGIP5WDKa1K/
         RzzOpE1B4szno97Px1qQObho0r8c4wVwTLee6pIykeQn1AS5FM869O6/lEvln/zcwjcO
         hK9ZP5/mOUON/G8L9pBLGG3AaEa0PA9ePrnUkVwSr2qxSesDtUH/0ralxFo2CiEEreDi
         3uwQnia0UXkqUcOhQl6UTTSmZ1+Ose7le+KKs9Fp1YyYBQjHgZHIDNE032zZ2HxFUWyG
         sjUccy2EG3JsUkZWyePvrayVGgSNthskWMeH+pNrmU1ICSmI7Qhx3/rSKueuzlIKdYwv
         qkwQ==
X-Gm-Message-State: APjAAAWW0v3oHwOwtc2Fuzp0D+qT4KRJkDPS+Zs5n4GqEjk0sZE3rqve
        5q3P4CnFd1YG2/yFOQxoggKB/Hx7z3hcVQ==
X-Google-Smtp-Source: APXvYqyW5aL2g8rbYlgvhpyY3kUxtcidGpbW8mDaqNBNfOBUXyy8NsIxoXl2GcFRM2QkICe6U0DT8Q==
X-Received: by 2002:a37:508b:: with SMTP id e133mr11084096qkb.21.1574396770124;
        Thu, 21 Nov 2019 20:26:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id b6sm2748821qtp.5.2019.11.21.20.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 20:26:09 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        corbet@lwn.net
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Documentation: security: core.rst: fix warnings
Date:   Fri, 22 Nov 2019 01:18:06 -0300
Message-Id: <20191122041806.68650-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix warnings due to missing markup, no change in content otherwise.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/security/keys/core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index d6d8b0b756b6..d9b0b859018b 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1102,7 +1102,7 @@ payload contents" for more information.
     See also Documentation/security/keys/request-key.rst.
 
 
- *  To search for a key in a specific domain, call:
+ *  To search for a key in a specific domain, call::
 
 	struct key *request_key_tag(const struct key_type *type,
 				    const char *description,
-- 
2.24.0

