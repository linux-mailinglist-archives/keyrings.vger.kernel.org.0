Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4B5589965
	for <lists+keyrings@lfdr.de>; Thu,  4 Aug 2022 10:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbiHDIlK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Aug 2022 04:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239210AbiHDIkw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Aug 2022 04:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 06BBE5FAE8
        for <keyrings@vger.kernel.org>; Thu,  4 Aug 2022 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659602449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=W3oflKZ7g4iM+N4+kxgav6X7gDZ8PgCWL94kRakC7bM=;
        b=TgTn6oyH1Xea+9shmTeKwd7MYspWJTazf52Acj/XKfd2sns1CeYsErpCszwlwLhSaWACxO
        6RxO9/Fn/H+w/FUdN8vepPWJTw/P+rljU/ACEjsqFZLXr4B3+le+UjKDp+xVCVo9uIJXpR
        NSfi8MsYMFCDsDcsBmtlKyucjArLiAY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-fv9GVdLrOsmdq-Ham2l8NA-1; Thu, 04 Aug 2022 04:40:47 -0400
X-MC-Unique: fv9GVdLrOsmdq-Ham2l8NA-1
Received: by mail-yb1-f199.google.com with SMTP id s14-20020a5b044e000000b00672caf96368so15406248ybp.21
        for <keyrings@vger.kernel.org>; Thu, 04 Aug 2022 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=W3oflKZ7g4iM+N4+kxgav6X7gDZ8PgCWL94kRakC7bM=;
        b=MsBc0/K+oZwCkQdpdq4xVGT1cKK2LUBtUQvuM1hr2qLmV+7SCpZCLfyabRbrcVLV5d
         soOq7tkZUlWkKfJ23ROn7ZGeNApwJvuKdUm6zPOx9XGVYSf04ZncHTcYfTWgWt+AnkZO
         ok9fZ9xTgL5h03NafAjomS7aNshiDnlwySareWgYOBz0FP0kGOSzTVqKdfJLV4M9JSGk
         yJ43pHo8D4B9urFAVK44ErkwZ6OqmuOuCtpqWmThDO/mrjZxm30bdwc6teLGsd5vKRBp
         MDpKGmGkbKJ/kOZtXXb4QQzsGo50evAbgOqf5qkoMqZsWDn+ItQC6l/p4cYaNgfsJWT7
         PXmA==
X-Gm-Message-State: ACgBeo2sg5g9y7/KteHg6fYF+PenBRcI1DFnXlj3puAwM/pw/SIbq6um
        LJ6BlAwuPbxWOR8fdcK7nCTG0PdpiHj09XkkKh0ZvlWRMr7iwzfqlchxEnbyFzrct/w/S1go47L
        FG0mIfWO7ClVGNuCtZSy4cQfQxpxx3pm5drA=
X-Received: by 2002:a81:7c03:0:b0:328:25ee:40d with SMTP id x3-20020a817c03000000b0032825ee040dmr772944ywc.12.1659602446568;
        Thu, 04 Aug 2022 01:40:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7fJPHYOm6mQ0iaP+t9lkWuo9d4kCbFvcMsT6xSOPGMlLHLE0dIlFmyYiKvxL5Yjqv125SXMhI0twSJXUsquEU=
X-Received: by 2002:a81:7c03:0:b0:328:25ee:40d with SMTP id
 x3-20020a817c03000000b0032825ee040dmr772931ywc.12.1659602446379; Thu, 04 Aug
 2022 01:40:46 -0700 (PDT)
MIME-Version: 1.0
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Thu, 4 Aug 2022 10:40:35 +0200
Message-ID: <CAFqZXNtBouZcXOpfs7agZU8xsW4VcEoHqdTAX9No0uCWrU613g@mail.gmail.com>
Subject: [BUG] watch_queue resource accounting seems broken
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000004938b705e5664e03"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--0000000000004938b705e5664e03
Content-Type: text/plain; charset="UTF-8"

Hi,

It seems there is something wrong with resource accounting for
watch_queues. When a watch_queue is created, its size is set, and then
both ends are closed, it seems the resource usage increment is not
released as it should be and repeated creations of watch_queues
eventually (and quite fast!) exhaust the per-user pipe limit. I tested
this only on kernels 5.19 and 5.17.5, but I suspect the bug has been
there since the watch_queue introduction.

The issue can be reproduced by the attached C program. When it is run
by an unprivileged user (or by root with cap_sys_admin and
cap_sys_resource dropped), the pipe allocation/size setting starts to
fail after a few iterations.

I found this bug thanks to selinux-testuite's [1] watchkey test, which
started repeatably failing after I ran it a couple times in a row.

I'm not very familiar with this code area, so I'm hoping that someone
who understands the inner workings of watch_queue will be able and
willing to look into it and fix it.

Thanks,

[1] https://github.com/SELinuxProject/selinux-testsuite/

--
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

--0000000000004938b705e5664e03
Content-Type: text/x-c-code; charset="US-ASCII"; name="watch_queue_bug.c"
Content-Disposition: attachment; filename="watch_queue_bug.c"
Content-Transfer-Encoding: base64
Content-ID: <f_l6dplwvp0>
X-Attachment-Id: f_l6dplwvp0

I2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdGRpby5o
PgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGVycm5v
Lmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPGxpbnV4L3dhdGNoX3F1ZXVlLmg+
CgojZGVmaW5lIEJVRl9TSVpFIDI1NgoKaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQp7
CiAgICBpbnQgaSwgcGlwZWZkWzJdLCByZXN1bHQ7CgogICAgZm9yIChpID0gMDsgaSA8IDEwMDA7
IGkrKykgewogICAgICAgIGZwcmludGYoc3RkZXJyLCAiJWRcbiIsIGkpOwogICAgICAgIHJlc3Vs
dCA9IHBpcGUyKHBpcGVmZCwgT19OT1RJRklDQVRJT05fUElQRSk7CiAgICAgICAgaWYgKHJlc3Vs
dCA8IDApIHsKICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJGYWlsZWQgdG8gY3JlYXRlIHBp
cGUyKDIpOiAlc1xuIiwKICAgICAgICAgICAgICAgICAgICBzdHJlcnJvcihlcnJubykpOwogICAg
ICAgICAgICByZXR1cm4gZXJybm87CiAgICAgICAgfQoKICAgICAgICByZXN1bHQgPSBpb2N0bChw
aXBlZmRbMF0sIElPQ19XQVRDSF9RVUVVRV9TRVRfU0laRSwgQlVGX1NJWkUpOwogICAgICAgIGlm
IChyZXN1bHQgPCAwKSB7CiAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIHNl
dCB3YXRjaF9xdWV1ZSBzaXplOiAlc1xuIiwKICAgICAgICAgICAgICAgICAgICBzdHJlcnJvcihl
cnJubykpOwogICAgICAgICAgICByZXR1cm4gZXJybm87CiAgICAgICAgfQoKICAgICAgICBjbG9z
ZShwaXBlZmRbMF0pOwogICAgICAgIGNsb3NlKHBpcGVmZFsxXSk7CiAgICB9CiAgICByZXR1cm4g
MDsKfQo=
--0000000000004938b705e5664e03--

