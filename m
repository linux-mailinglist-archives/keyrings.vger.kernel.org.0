Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771106C3987
	for <lists+keyrings@lfdr.de>; Tue, 21 Mar 2023 19:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjCUStO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Mar 2023 14:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjCUStN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 Mar 2023 14:49:13 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8992D567A4
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 11:48:44 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so16674184eda.0
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 11:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679424515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ckUw7dWkverm2igg++8Ynt0yEw3mz/3PbETIyN2lM=;
        b=Di2jUqCEOGXT2/8qSlSykL4OaWbzXeXDW+dhXax2t69IjC+bQ19Y5ofRz6Ybr3hm1e
         87e1/8AF6mpcneFUowkphtWPTZPkRS7wq/V7roxf+KDE28r+ry7m0qt934JRzR9vp1Sl
         7cWb6PYhbgVCoTT4p5eSL51elmr/DNbCRPU5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679424515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0ckUw7dWkverm2igg++8Ynt0yEw3mz/3PbETIyN2lM=;
        b=R4u/rs6PllAVGelj3UnthRXwUMjtP/rBX7GQoXIT9+FP2kEQK9DfI1t+9b+LPVoVYy
         CivL9ekcBbZUGkuLKzMnCSKYylQk9A4CLZuuruu15eZEDQojDLgkOeKLA5+YT8wZVmCH
         DNxWKuXQYc9uBjo/bMsTFyla1eOm7EwW6SGlqPgd092FZnMGyyZZZ7KYB+QYUdb3aKOv
         YTju2uqsXI1sVlhYIhKclPSKOnpZl+rYHRZULTBpKodhIXD8yyQe4gFso/bKFkRcElRb
         46q6xu+fVHeXV7MLH+fOheFHB0jKl2hIO8sjsq32EoQv/GHBQUQs7oSz8gp5BGa/gJv3
         9oyQ==
X-Gm-Message-State: AO0yUKXAFsYdf3RlR7bhHcpiM6EAndDiCqW1QAu31SDSO27B41FfIpg9
        hq7n49IK0FRADtspSq0cnTf3AtPk76581XkKzLvD7dN3
X-Google-Smtp-Source: AK7set+0ksfbjP940g6L1b5tV2kDAgWgPPXxezAvt37P2SKO5OxwsCyx42TBPhk/PO0D2heoFSJmlA==
X-Received: by 2002:a17:907:397:b0:889:5686:486a with SMTP id ss23-20020a170907039700b008895686486amr4469179ejb.30.1679424515635;
        Tue, 21 Mar 2023 11:48:35 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906670b00b0093a0e5977e2sm1102059ejp.225.2023.03.21.11.48.34
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 11:48:34 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id x3so63511652edb.10
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 11:48:34 -0700 (PDT)
X-Received: by 2002:a17:907:9b03:b0:932:da0d:9375 with SMTP id
 kn3-20020a1709079b0300b00932da0d9375mr2409395ejc.4.1679424514115; Tue, 21 Mar
 2023 11:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <2851036.1679417029@warthog.procyon.org.uk>
In-Reply-To: <2851036.1679417029@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Mar 2023 11:48:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh1b0r+5SnwWedx=J4aZhRif1HLN_moxEG9Jzy23S6QUA@mail.gmail.com>
Message-ID: <CAHk-=wh1b0r+5SnwWedx=J4aZhRif1HLN_moxEG9Jzy23S6QUA@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Miscellaneous fixes/changes
To:     David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        Bharath SM <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>,
        Robbie Harwood <rharwood@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        keyrings@vger.kernel.org, linux-cifs@vger.kernel.org,
        linux-crypto@vger.kernel.org, kexec@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 21, 2023 at 9:43=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
>  (1) Fix request_key() so that it doesn't cache a looked up key on the
>      current thread if that thread is a kernel thread.  The cache is
>      cleared during notify_resume - but that doesn't happen in kernel
>      threads.  This is causing cifs DNS keys to be un-invalidateable.

I've pulled this, but I'd like people to look a bit more at this.

The issue with TIF_NOTIFY_RESUME is that it is only done on return to
user space.

And these days, PF_KTHREAD isn't the only case that never returns to
user space. PF_IO_WORKER has the exact same behaviour.

Now, to counteract this, as of this merge window (and marked for
stable) IO threads do a fake "return to user mode" handling in
io_run_task_work(), and so I think we're all good, but I'd like people
to at least think about this.

              Linus
