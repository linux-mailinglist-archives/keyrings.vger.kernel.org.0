Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC1B6B6A5B
	for <lists+keyrings@lfdr.de>; Sun, 12 Mar 2023 19:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjCLSyE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 12 Mar 2023 14:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjCLSyD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 12 Mar 2023 14:54:03 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63699298EC
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 11:54:01 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id t4so9687390ybg.11
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 11:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678647240;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3l6t0Znro/9+vrRpNpwrA7Rn99FRsWDKBN3vHrvB2A=;
        b=jD0o5wJz6AqsPDY9r4RNpZ7hU0oAu/t0sTC9L/MoI+y/+A5f6wyNe5X3N9c/jTIiyg
         tU0kERpzWtLLZ56mUPyrxRd+wevKxyx4L9bt9xAlhRPkOUIasGXPntr1eay3yiVFUV8+
         CMmPFjcKNw4sLhqNpSgdkVFWqBwpUp8qAifOq/9dXseJVvpHHvOdKJCtRcQGmj9dcbAk
         ptsTeVi0pOF5SlaVxgHKSwjlQLnCtn44GdM5z7c9UcIJ29dUaVoApwCbgRbSfDxr4XIH
         4+3oP2doAfumB+g7Fc/rE+nJjCf+PfRG9GQBibatqdMNU1hrQeSjPok5DsgT8rsi/N/U
         43ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678647240;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3l6t0Znro/9+vrRpNpwrA7Rn99FRsWDKBN3vHrvB2A=;
        b=ruTkYePQoKuRHasr7vhLuW4n4/Md5lyHZwE9Zg4zaSSirtrGd8WvTTz7O1vnJEuYqS
         sM0NH6KPQ33HPytIWpaG5mVC+2xYVBptLD3Ysahm/AwAcpuMBJy9dvsRk/nATjpx3O9a
         EREoSCRwkglHnpT92ZrLb5P8ciR+4UHqpwmwo9IX/0+88laqNSEEhcZbm7syn4JOBMmX
         AkkgNdbCO2xMl3QLE5B+/JD9NvJpSL0ombAnVSF7KQsnCTLJmIoICZgumlZRzhGnIFXa
         mvHwOrKxWJESQEUjwo5+jImryiK+m7ruDzExizkZ9CWQi4L8EbqoCeBHLjxJiIE7R2CG
         3mVA==
X-Gm-Message-State: AO0yUKUD+g0MiZrjkdH48DMFHqZHgPKQibwgYmgosRmcJDUrdRASatZn
        mJ2RkJHjnU7wL14WrR2Me2/TIEjpyzIrn2w+AZAjA7RJgwLwNQ==
X-Google-Smtp-Source: AK7set8vPfXs/tT++jvqu48CXGcdg9kg/AMAeI1YPhhDhNUVcbyM57oXFt+vUQKzF3+rZYQpZ/znC13iHuq5E4tg3YY=
X-Received: by 2002:a25:e406:0:b0:8ed:3426:8a69 with SMTP id
 b6-20020a25e406000000b008ed34268a69mr5596073ybh.1.1678647240517; Sun, 12 Mar
 2023 11:54:00 -0700 (PDT)
MIME-Version: 1.0
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Mon, 13 Mar 2023 00:23:49 +0530
Message-ID: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
Subject: [PATCH] KEYS: Do not cache key in task struct if key is requested
 from kernel thread
To:     David Howells <dhowells@redhat.com>, jarkko@kernel.org,
        keyrings@vger.kernel.org
Cc:     Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The key which gets cached in task structure from a kernel thread does not
get invalidated even after expiry. Due to which, a new key request from
kernel thread will be served with the cached key if it's present in task
struct irrespective of the key validity.
The change is to not cache key in task_struct when key requested from kernel
thread so that kernel thread gets a valid key on every key request.

Signed-off-by: Bharath SM <bharathsm@microsoft.com>
---
 security/keys/request_key.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 2da4404276f0..07a0ef2baacd 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -38,9 +38,12 @@ static void cache_requested_key(struct key *key)
 #ifdef CONFIG_KEYS_REQUEST_CACHE
        struct task_struct *t = current;

-       key_put(t->cached_requested_key);
-       t->cached_requested_key = key_get(key);
-       set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
+       /* Do not cache key if it is a kernel thread */
+       if (!(t->flags & PF_KTHREAD)) {
+               key_put(t->cached_requested_key);
+               t->cached_requested_key = key_get(key);
+               set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
+       }
 #endif
 }

--
2.25.1
