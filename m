Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E13253F21
	for <lists+keyrings@lfdr.de>; Thu, 27 Aug 2020 09:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgH0H3j (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Aug 2020 03:29:39 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41238 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgH0H3j (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 27 Aug 2020 03:29:39 -0400
Received: by mail-lj1-f193.google.com with SMTP id f26so5260811ljc.8;
        Thu, 27 Aug 2020 00:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mi5B+pEaQqn6pQw0ZtzMwgBCvwV3kCOCPtMygdOsJBE=;
        b=ZqIdGucKIQNbUlibmv6J2iC/5brpw9BrQnfLyjIaMsqv03qewVtIEAU0wGnmpXMLkR
         rVZdnWYRFU6i2gNAfdopfAHJX7mbFkQ4YrDW3jOyvQIGVS9Hsn8P7VAWjYvgCUz6BUf/
         j6RcGXay0+zaP7rKVsOQTxNo0Aw/hSSBkRgh4AAvijGSEjdadmqbVeF5vSEZzeNzyHWb
         yXB4UtN47smYjKiYB1s2qOREEXn4BCOXGpj1HpQknW4/1RURV5aj+wiL+zVSSRHP1hhj
         yW6MpUjkIdSlgqDk1NclQGJm/M9z6ku+6/2w5Y6ujcCDI/U49fKPg5liZfRckZpEuk7C
         XIfQ==
X-Gm-Message-State: AOAM530QubuNGkBu8LQ5DFiCyv8Bs4yDHPjebvBgn6W24x5EVvCuydKK
        IDjtjI7f147SvuVXdoR6CPGmsj/I6CM=
X-Google-Smtp-Source: ABdhPJxdibxvNaWK3AH/SUvgZdJ/g/29tgk1jocDnAWkojyr2dHo2SJMjA3D0C6AlWYKP3guwKTLYQ==
X-Received: by 2002:a2e:9c86:: with SMTP id x6mr8751433lji.346.1598513376601;
        Thu, 27 Aug 2020 00:29:36 -0700 (PDT)
Received: from localhost.localdomain ([213.87.147.111])
        by smtp.googlemail.com with ESMTPSA id m25sm282937ljg.79.2020.08.27.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 00:29:36 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] security/keys: use kvfree_sensitive()
Date:   Thu, 27 Aug 2020 10:29:23 +0300
Message-Id: <20200827072923.14718-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Use kvfree_sensitive() instead of open-coding it.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 security/keys/big_key.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/security/keys/big_key.c b/security/keys/big_key.c
index 691347dea3c1..d17e5f09eeb8 100644
--- a/security/keys/big_key.c
+++ b/security/keys/big_key.c
@@ -121,8 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 		*path = file->f_path;
 		path_get(path);
 		fput(file);
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		/* Just store the data in a buffer */
 		void *data = kmalloc(datalen, GFP_KERNEL);
@@ -140,8 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
 err_enckey:
 	kfree_sensitive(enckey);
 error:
-	memzero_explicit(buf, enclen);
-	kvfree(buf);
+	kvfree_sensitive(buf, enclen);
 	return ret;
 }
 
@@ -273,8 +271,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
 err_fput:
 		fput(file);
 error:
-		memzero_explicit(buf, enclen);
-		kvfree(buf);
+		kvfree_sensitive(buf, enclen);
 	} else {
 		ret = datalen;
 		memcpy(buffer, key->payload.data[big_key_data], datalen);
-- 
2.26.2

