Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE4F6C3A51
	for <lists+keyrings@lfdr.de>; Tue, 21 Mar 2023 20:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjCUTWU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Mar 2023 15:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjCUTWQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 Mar 2023 15:22:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B81DA5EC
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 12:22:14 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o12so63904809edb.9
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679426532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHtgR0XvPydSJ2xRHzSM20hkxNSVo2TSBRlBp9YTFyU=;
        b=KmDXelWzwks1nQPoqr13pMfnkAeJPlI5I87zd6sk3jWexgoUltTzps7nAnLUWDBxrt
         RcJTL9schkxn8BPHGqO+k2sSwBNFSyewigW2qtZ2GTbMK34tDm7z9BbVnBckaR8Sk0xQ
         7DS3Ne4gSlU+Nye5NqrnhBdAHKIwj3vmt4JOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHtgR0XvPydSJ2xRHzSM20hkxNSVo2TSBRlBp9YTFyU=;
        b=ZFkD/pOO1JN03ufewqVgSQ4Say9hx78JzMnSimODcaVeLyw4N0LhDI91ifB6FDTZz/
         vvgqRuR0/A1UMYI1+N650w6Hqo9rax3s4Cq8wNTlUdMAQ8+inIOWWELY1IGKqp8I7lta
         c8ksaSaZQIe351Vfo6HJs5jQAb+K+bF3T9LwN8Cq4Ew4jx8RP/TT1EpM8zzBA9Ve3iv4
         QUuq5B9VS3jG9/10fXuUbXTywihI8o+xLztZ/QBPmgq7Ic2Yn7tYb0YZWqKHEM3reXbj
         5je/It+aAAWaGuLuJ6mjUuhEW4eW9MEJtv36sX7I/a7YLqmHGygXAU8OyAUDFLmKa5XA
         Ey7g==
X-Gm-Message-State: AO0yUKWU9DrnFLazYXc2z7R1xDqysLv40W3Lf6pWxkV1wQi9I3TPhLof
        76KYS0UqkMP9+k2yUIrwG0suKVXt071owBiJilpWDbdr
X-Google-Smtp-Source: AK7set9u7TnwdsZbi0xc981ZO1nFvPVYsLIZdwNThdoasVuAzRipp9EVewS5njpXMbNiV7FR3VEgWg==
X-Received: by 2002:a17:906:150c:b0:931:df8d:113 with SMTP id b12-20020a170906150c00b00931df8d0113mr5164229ejd.26.1679426532534;
        Tue, 21 Mar 2023 12:22:12 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906310c00b00926d614b890sm6079191ejx.204.2023.03.21.12.22.11
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 12:22:11 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id r11so63948623edd.5
        for <keyrings@vger.kernel.org>; Tue, 21 Mar 2023 12:22:11 -0700 (PDT)
X-Received: by 2002:a50:9e6f:0:b0:4fb:482b:f93d with SMTP id
 z102-20020a509e6f000000b004fb482bf93dmr2321260ede.2.1679426530851; Tue, 21
 Mar 2023 12:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <2851036.1679417029@warthog.procyon.org.uk> <CAHk-=wh1b0r+5SnwWedx=J4aZhRif1HLN_moxEG9Jzy23S6QUA@mail.gmail.com>
 <8d532de2-bf3a-dee4-1cad-e11714e914d0@kernel.dk>
In-Reply-To: <8d532de2-bf3a-dee4-1cad-e11714e914d0@kernel.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Mar 2023 12:21:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2yeuwCxvB18=AWG+YKnMgd28WGkHFMqTyMA=59cw3rg@mail.gmail.com>
Message-ID: <CAHk-=wi2yeuwCxvB18=AWG+YKnMgd28WGkHFMqTyMA=59cw3rg@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Miscellaneous fixes/changes
To:     Jens Axboe <axboe@kernel.dk>
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
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

On Tue, Mar 21, 2023 at 12:16=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote=
:
>
> I haven't seen the patch yet as it hasn't been pushed,

Well, it went out a couple of minutes before your email, so it's out now.

> It may make sense to add some debug check for
> PF_KTHREAD having TIF_NOTIFY_RESUME set, or task_work pending for that
> matter, as that is generally not workable without doing something to
> handle it explicitly.

Yeah, I guess we could have some generic check for that. I'm not sure
where it would be. Scheduler?

               Linus
