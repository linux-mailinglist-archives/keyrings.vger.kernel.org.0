Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F9A229986
	for <lists+keyrings@lfdr.de>; Wed, 22 Jul 2020 15:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732646AbgGVNqV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 Jul 2020 09:46:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46884 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732162AbgGVNqT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 22 Jul 2020 09:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595425578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=LoVB2XkV/JmhdiMIi0eaHtAvVvJ9iBBJWs8+jEnq95c=;
        b=jMGXyv4/6IXJXi/7NP7nYKOneM1QmkbP6mpTmDfHNZk8Au1KYNoLM5kCUIhgBmHyHPBZRx
        I0qdNvoqyKlkco0xELAKEiqQSPVMpm0PiUb7EqOUaVMg6YUcUceHwpZzbUIUNnJjNtLqt8
        xFyumzCKnqIc/aLHIZd43sN5j6ovawk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-ZHLLyDROMLyEpsB-M3Xaxw-1; Wed, 22 Jul 2020 09:46:16 -0400
X-MC-Unique: ZHLLyDROMLyEpsB-M3Xaxw-1
Received: by mail-qk1-f197.google.com with SMTP id i3so1459183qkf.0
        for <keyrings@vger.kernel.org>; Wed, 22 Jul 2020 06:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LoVB2XkV/JmhdiMIi0eaHtAvVvJ9iBBJWs8+jEnq95c=;
        b=tl1kYvQX10tce37L0hw7GPLTLRLY5b5xB6Z7uQQjT7HlBY6yazjL7pXhKZB80dB2Y2
         AcfhKHXIF5YmTgC6uHOmHsRvFHDl1ucLvXwWWqSMMvZZESzSrMYCWI0RsYaKNL9vP7kQ
         8hTP8cuwlTLGSDbwJBGQmrqLv20/17A0JmLW7yzT9YBkIwp24JmObL611H+1BgKIV83l
         rXYdqKv4KhO0DA9WCgu2A/VHkWTg/FSsq7y5cvCmeufkOZTXOLriKbyzaBp46X5OZOvn
         UoxJ+mkdBu/8hcj4J1rqpl3EDbLr/xr5LUwJPNb0kCQ6Jcli2ldqud9qq9bSv+C6pib9
         /qNQ==
X-Gm-Message-State: AOAM530yyER20q2QpiN0GfJBCD4jnyaAL1u/S7fM9cHH/5HVLN/bypn+
        jCVQEMujFB0NzRaFWSiScHKmYNkf9+WdCtOIwzTLNUrOaT+JmOi4SyqU3Ye//AlKjf0A7oxqsk0
        2UIisvGoQzH3mXGZRcXs=
X-Received: by 2002:ac8:32b8:: with SMTP id z53mr33969612qta.273.1595425576162;
        Wed, 22 Jul 2020 06:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfMEnBBaM6DsbbxBJ4uPRNyr603IgCTG7siQlW6XbNWY2+gJiK+tOAp3D+vg0UJYKefzEXRQ==
X-Received: by 2002:ac8:32b8:: with SMTP id z53mr33969597qta.273.1595425575967;
        Wed, 22 Jul 2020 06:46:15 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id w28sm4803247qkw.92.2020.07.22.06.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 06:46:15 -0700 (PDT)
From:   trix@redhat.com
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, serge@hallyn.com, denkenz@gmail.com,
        marcel@holtmann.org
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] KEYS: remove redundant memset
Date:   Wed, 22 Jul 2020 06:46:10 -0700
Message-Id: <20200722134610.31947-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Reviewing use of memset in keyctrl_pkey.c

keyctl_pkey_params_get prologue code to set params up

	memset(params, 0, sizeof(*params));
	params->encoding = "raw";

keyctl_pkey_query has the same prologue
and calls keyctl_pkey_params_get.

So remove the prologue.

Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")

Signed-off-by: Tom Rix <trix@redhat.com>
---
v1: remove change to keyctl_pkey_params_get_2

 security/keys/keyctl_pkey.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 931d8dfb4a7f..5de0d599a274 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -166,8 +166,6 @@ long keyctl_pkey_query(key_serial_t id,
 	struct kernel_pkey_query res;
 	long ret;
 
-	memset(&params, 0, sizeof(params));
-
 	ret = keyctl_pkey_params_get(id, _info, &params);
 	if (ret < 0)
 		goto error;
-- 
2.18.1

