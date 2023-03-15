Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFA76BB742
	for <lists+keyrings@lfdr.de>; Wed, 15 Mar 2023 16:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbjCOPNy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 15 Mar 2023 11:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbjCOPNt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 15 Mar 2023 11:13:49 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6272A23858
        for <keyrings@vger.kernel.org>; Wed, 15 Mar 2023 08:13:47 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id z83so15776533ybb.2
        for <keyrings@vger.kernel.org>; Wed, 15 Mar 2023 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678893226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULPns7mVxwkti4qzP+6SVI6SgsLpk0xz2l8u4fqigsY=;
        b=peQEAs1N+e3KIlcmUXEa5nLmXMgToIUgIrHo/7gUc9MBwxMyMaMwositkaF8MKHqrv
         WNIwkyp1A+7KV5ugjSsxMIqSKLCcIBkjpSCWkfoQ8EhKS1NOt9VW9MVE4rr59f3vMkNB
         KGNnJHZwZ//LgLTjS9XU36whSpfuacKHRzCF/x4a4KeKF7EA+yqsCJllIaVyYR72aoBp
         aTt2VjcRsQUI8OXmgXOM+g2DrGvVoeogYuOLVzJP47n/6MQwJaB5MElsWbSVIMWwcFWO
         f957ToWOLLDPW8beBjV7tfMOSlT5ylGF4hLTwJqz5v2i9Hm/kXOWR21YkAIDoolA/GRS
         yuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678893226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULPns7mVxwkti4qzP+6SVI6SgsLpk0xz2l8u4fqigsY=;
        b=mWeahz0jdDtj5gDPm/fxWdBMwTnIHH/tBYn+UxjPCiXsMp/V+hsLFbpKd9q7VfP0zQ
         nkZ2VJa2ZPKVphkqZ60R0s+yFUL5srGYJgv+CsZ1GUTno2SiO3mFr/f4jFThUzRKfukO
         AUGLjX09Y/DCL+8yQnsR0+22JV+uBjH6hJt2yP/3McukXXLpV5gNP0rMdeZJCF6mYzeT
         s+B5VVE62EOqtyc4qlk74PlT6mnL15rtFnGJKqvKaIczyjHm1xeRm1Cq+EbakJ57/cQM
         TSVRHtOy5RT6VSZbxWFK5medgOlC46Y8/P7p+TkBae2X6qNoSOZSemK01o1WYioUZK4A
         +qNQ==
X-Gm-Message-State: AO0yUKX0/Ko/uVCaX40ZI5f1ns2VAVG+QqRrAfsIYNGOwI74WQeoVZT8
        r9M8ZAzCueWXkLGUAPvSipmAClpLfEJ7z9VtFbQ=
X-Google-Smtp-Source: AK7set9S+1s3gZ0kVBpbR/0OTM1sLJUw8n5Fp71m0X1zAWxt/IyjkiT6yH5VtLs5LZ9KE6CLcD59cf+9X3TLC+TZyzg=
X-Received: by 2002:a5b:347:0:b0:a06:538f:24b2 with SMTP id
 q7-20020a5b0347000000b00a06538f24b2mr20712514ybp.2.1678893226520; Wed, 15 Mar
 2023 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
 <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
 <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
 <ZBBVYX7O7QV8TFL7@kernel.org> <3711676.1678807652@warthog.procyon.org.uk>
In-Reply-To: <3711676.1678807652@warthog.procyon.org.uk>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Wed, 15 Mar 2023 20:43:35 +0530
Message-ID: <CAGypqWwqqWV-2WkTKXYb5tgWNJbh7_TNpOLy0=dGOYjsy6RSsw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is requested
 from kernel thread
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 14, 2023 at 8:58=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
>
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> > Please summarize this to the commit message it is useful stuff. With
> > this report included the patch could should also have a fixes tag.
>
> I've expanded the commit message to:
>
>     keys: Do not cache key in task struct if key is requested from kernel=
 thread
>
>     The key which gets cached in task structure from a kernel thread does=
 not
>     get invalidated even after expiry.  Due to which, a new key request f=
rom
>     kernel thread will be served with the cached key if it's present in t=
ask
>     struct irrespective of the key validity.  The change is to not cache =
key in
>     task_struct when key requested from kernel thread so that kernel thre=
ad
>     gets a valid key on every key request.
>
>     The problem has been seen with the cifs module doing DNS lookups from=
 a
>     kernel thread and the results getting pinned by being attached to tha=
t
>     kernel thread's cache - and thus not something that can be easily got=
 rid
>     of.  The cache would ordinarily be cleared by notify-resume, but kern=
el
>     threads don't do that.
>
>     This isn't seen with AFS because AFS is doing request_key() within th=
e
>     kernel half of a user thread - which will do notify-resume.
>
>     Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>     Signed-off-by: David Howells <dhowells@redhat.com>
>     cc: Jarkko Sakkinen <jarkko@kernel.org>
>     cc: Shyam Prasad N <nspmangalore@gmail.com>
>     cc: Steve French <smfrench@gmail.com>
>     cc: keyrings@vger.kernel.org
>     cc: linux-cifs@vger.kernel.org
>     cc: linux-fsdevel@vger.kernel.org
>
> David

Your expanded commit message looks fine. Can we please mark this
commit for a stable kernel since it fixes some serious reconnect
problem.?
