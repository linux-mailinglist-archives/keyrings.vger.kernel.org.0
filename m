Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A585B6B6EE8
	for <lists+keyrings@lfdr.de>; Mon, 13 Mar 2023 06:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCMFSn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 13 Mar 2023 01:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCMFSn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 13 Mar 2023 01:18:43 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06E5222E3
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 22:18:41 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id h97so3508328ybi.5
        for <keyrings@vger.kernel.org>; Sun, 12 Mar 2023 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678684721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM18ENogSOwMdx1F1lL3fZikDmEYfvMKb3WTrh6+SWg=;
        b=DULxdsaTERuPS8g+/IGA5gk5vY3Ycnfq5hv8ECRl3li3Xobo4GrQhNK/oXN+Qxz/JA
         fCDtYzwFPAWhq9YhG5Z9KasVBpKnmQQOfdAvP0BCiMlnvf7Da0pXw8GQgeigqvd+6kL/
         wlqbbc+ALSG5LZIOQsrwVOwD+z66g5dUCbiBAIvOMLVt1UDjJXnPosZ2MVfQSI9/zzaz
         /Ynxo/xw4pRRTvPJePpi+2sxM71VRfqMV3moKe7FpXXbLoQWAOMx1CR6f5ctorwkLoJy
         j52kWd5/xaPjhwMiRFLiQ4/u/raV6d+9HDz+BYwvtnoHLEgc3wqYV5arNmxJ8qSNtnCe
         xyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678684721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM18ENogSOwMdx1F1lL3fZikDmEYfvMKb3WTrh6+SWg=;
        b=Ywx/HcmfuD2dLCdD4VLx3I2HEfY7vT/zGrntu8GNTeGoviqJ/CIT7JzNdbHVB4CwZc
         DgkNFmawjoa7Gr/wK4EjnJyjE750f5cEKcQ39gUnyOjKckDkk45jQT2cp/pE2wQLsDWZ
         BIzf6j1lDFdVSe/9LNo+HAmMqbypX7BmU72/vMdSI3DdSdYqtezfmUML0H9CGE5F+Ulk
         TR1FKQCUKi1EbiIEuoI4HDw760sfBAiPnLzlSeFSxbfRat8MvRjI4ffzaT7wyaCw9eNv
         1X7/3oiEhAHTFkfs9cm3XAzCAJDlEI8uiGArGV/drrIQkUPkJPmbxMnDUahaPIqV6jq6
         1SSQ==
X-Gm-Message-State: AO0yUKVRph1Yk57szEzMGIRIRywa7RobjArmA2OFmxWUzbbmNYcM9ByA
        LpZqQHbs4MgeAG9EtcnnKi94CKIhjhnvWEsu4as=
X-Google-Smtp-Source: AK7set9lqkcRndCFpw55U9WSyvqfYsxwR4J+YoukkDcUjY//3X8x9KkOnoOFlyJvEah0QL01qzr8eCrpVE4dRSGU8hA=
X-Received: by 2002:a25:fe04:0:b0:b1a:64ba:9c9b with SMTP id
 k4-20020a25fe04000000b00b1a64ba9c9bmr9815612ybe.1.1678684720814; Sun, 12 Mar
 2023 22:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
 <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
In-Reply-To: <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Mon, 13 Mar 2023 10:48:29 +0530
Message-ID: <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Do not cache key in task struct if key is requested
 from kernel thread
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
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

Linux kernel cifs module uses dns_resolver for dns resolution and
dns_resolver will use kernel keys infrastructure for key management.
Cifs module calls dns_query during reconnect for dns resolution, we noticed
an issue with dns resolution requests during reconnect operations from cifs=
.
Where the dns_query was failing by returning EKEYEXPIRED to cifs. And
this issue was
happening only when CONFIG_KEYS_REQUEST_CACHE was enabled.
Further debugging the keys subsystem and discussing with david howells reve=
aled
this issue in keys subsystem.

To reproduce the issue mount a few SMB shares on device with
nosharesock mount option and try disconnecting connections a few times
using "ss -K src dport 445".

Logs from dns_resolver:
Notice that 2nd time, we can see dns_query returning -127(EKEYEXPIRED)

Disconnected first time and got right response for dns_query:

[Mon Mar 13 05:05:23 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Mon Mar 13 05:05:23 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Mon Mar 13 05:05:23 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Mon Mar 13 05:05:23 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Mon Mar 13 05:05:23 2023] [cifsd ] =3D=3D>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.fi=
le.core.windows.net)
[Mon Mar 13 05:05:23 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
[Mon Mar 13 05:05:23 2023] [key.dn] =3D=3D> dns_resolver_preparse('
20.150.20.136',14)
[Mon Mar 13 05:05:23 2023] [key.dn] no options
[Mon Mar 13 05:05:23 2023] [key.dn] store result
[Mon Mar 13 05:05:23 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
[Mon Mar 13 05:05:23 2023] [cifsd ] <=3D=3D dns_query() =3D 13
[Mon Mar 13 05:05:23 2023] [cifsd ] <=3D=3D dns_query() =3D 13

Disconnected second time, but this time we can see one of the
dns_query request is failing with -127

[Mon Mar 13 05:05:30 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Mon Mar 13 05:05:30 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Mon Mar 13 05:05:30 2023] [cifsd ] =3D=3D>
dns_query((null),storagesouthcus1.file.core.windows.net,38,(null))
[Mon Mar 13 05:05:30 2023] [cifsd ] call
request_key(,storagesouthcus1.file.core.windows.net,)
[Mon Mar 13 05:05:30 2023] [cifsd ] =3D=3D>
dns_resolver_cmp(storagesouthcus1.file.core.windows.net,storagesouthcus1.fi=
le.core.windows.net)
[Mon Mar 13 05:05:30 2023] [cifsd ] <=3D=3D dns_resolver_cmp() =3D 1
[Mon Mar 13 05:05:30 2023] [cifsd ] <=3D=3D dns_query() =3D -127
[Mon Mar 13 05:05:30 2023] [key.dn] =3D=3D> dns_resolver_preparse('
20.150.20.136',14)
[Mon Mar 13 05:05:30 2023] [key.dn] no options
[Mon Mar 13 05:05:30 2023] [key.dn] store result
[Mon Mar 13 05:05:30 2023] [key.dn] <=3D=3D dns_resolver_preparse() =3D 0
[Mon Mar 13 05:05:30 2023] [cifsd ] <=3D=3D dns_query() =3D 13

On Mon, Mar 13, 2023 at 3:07=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Mon, 2023-03-13 at 00:23 +0530, Bharath SM wrote:
> > The key which gets cached in task structure from a kernel thread does n=
ot
> > get invalidated even after expiry. Due to which, a new key request from
> > kernel thread will be served with the cached key if it's present in tas=
k
> > struct irrespective of the key validity.
> > The change is to not cache key in task_struct when key requested from k=
ernel
> > thread so that kernel thread gets a valid key on every key request.
> >
> > Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>
> What is the context where you bumped into this?
>
> > ---
> >  security/keys/request_key.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/security/keys/request_key.c b/security/keys/request_key.c
> > index 2da4404276f0..07a0ef2baacd 100644
> > --- a/security/keys/request_key.c
> > +++ b/security/keys/request_key.c
> > @@ -38,9 +38,12 @@ static void cache_requested_key(struct key *key)
> >  #ifdef CONFIG_KEYS_REQUEST_CACHE
> >         struct task_struct *t =3D current;
> >
> > -       key_put(t->cached_requested_key);
> > -       t->cached_requested_key =3D key_get(key);
> > -       set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
> > +       /* Do not cache key if it is a kernel thread */
> > +       if (!(t->flags & PF_KTHREAD)) {
> > +               key_put(t->cached_requested_key);
> > +               t->cached_requested_key =3D key_get(key);
> > +               set_tsk_thread_flag(t, TIF_NOTIFY_RESUME);
> > +       }
> >  #endif
> >  }
> >
> > --
> > 2.25.1
>
> BR, Jarkko
