Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DAD6BB7F4
	for <lists+keyrings@lfdr.de>; Wed, 15 Mar 2023 16:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbjCOPf1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 15 Mar 2023 11:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbjCOPey (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 15 Mar 2023 11:34:54 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7C912F33
        for <keyrings@vger.kernel.org>; Wed, 15 Mar 2023 08:34:52 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5445009c26bso150055377b3.8
        for <keyrings@vger.kernel.org>; Wed, 15 Mar 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678894492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Jh0Dqm/4b/lv3i1cs2E3xIzjlCrwVH4ttJagPXm47k=;
        b=j3euDPMopzpVsoj6sOB1JYWY8We320L5CfWKZkP3BpGwLd8f4ovc03bUYqAvjg0GJT
         wj39542ZUERI1o3u8bJVqoYjU+JEayNrFC+iAqFcPQ0K4g7SsQt06EtBo+yaqVs92S4W
         XXHZSv7HMWOczPSE5zPBnOmx8oVqsVc8zOvpWpaj2zf3F2BCDycvRcd/8Yts8Vwf2te3
         27p0k/SLgTQDQ/g6G+c7tAirjciWB2R3dupEoaGjP72T4aViDXKyZ9BRx1gLkL1/ZORV
         pY4Rm65NMnSF04+s1e9t4Q4by/dopKnRjzICFS7AnjQEjmhxSmg5/orUhNk62rX3O9oa
         mwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jh0Dqm/4b/lv3i1cs2E3xIzjlCrwVH4ttJagPXm47k=;
        b=G8jY8TjH4K8NM4aiv1B7Lsys7+GKvYev9fwfRuac62PQmlEajP99JvT8WDsnw+//Fi
         Z9mx/77cN5FrAz5kxFApRhPWg+Z3M2waiyJ8QgIbZDAqBbo+Es+Ug6lhT/2nvKY9ptaC
         4yFv0UsxNYhwZvDdIvFq6bYhNpVBEhpLwbNEN+a+H3B3El5IrYTuLpOnYTwT01NjNR7U
         SMl52SXA5QVsNCTNlf7StlJbDfCPL4ref8sEyjlXybW2LNjP0mJOYAK+8MN7etlpVyWY
         4xlQwb02hfHesZIUZV88mUPXVdsX09Dq5QoM0EFQoYxrSic4YHSNKNWUISAD6wVeJ8aE
         Dg4Q==
X-Gm-Message-State: AO0yUKUOzp8QI50u3yqshHHuXZINOgsuG1XiFOC8TbQs6xDPxPJKPG49
        v/K46tOnJOyad0RKVvjJL4OIW1cScF9Fom/ptIA=
X-Google-Smtp-Source: AK7set9lw7u9Dj0QHTkPvYxuxoXsNWVPHPX8ZABNcBs4Zm2+ML9YoY6S8EPFCmknoU7guZ7iBIqXKg2cdIubYPjD5pw=
X-Received: by 2002:a81:e803:0:b0:541:7f49:adac with SMTP id
 a3-20020a81e803000000b005417f49adacmr181825ywm.8.1678894492077; Wed, 15 Mar
 2023 08:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGypqWw951d=zYRbdgNR4snUDvJhWL=q3=WOyh7HhSJupjz2vA@mail.gmail.com>
 <c0530ea97166463bd2129da160c3ef0e6c72a8fb.camel@kernel.org>
 <CAGypqWwhTDX2F5m4o-og40j5ddJrM2MWiheDMjbB07Qqb3NuEw@mail.gmail.com>
 <ZBBVYX7O7QV8TFL7@kernel.org> <3711676.1678807652@warthog.procyon.org.uk> <CAGypqWwqqWV-2WkTKXYb5tgWNJbh7_TNpOLy0=dGOYjsy6RSsw@mail.gmail.com>
In-Reply-To: <CAGypqWwqqWV-2WkTKXYb5tgWNJbh7_TNpOLy0=dGOYjsy6RSsw@mail.gmail.com>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Wed, 15 Mar 2023 21:04:41 +0530
Message-ID: <CAGypqWz0vFSaZQOijN3BoWk0HUb8siuZifUtv16S0WmsL6tuEw@mail.gmail.com>
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

On Wed, Mar 15, 2023 at 8:43=E2=80=AFPM Bharath SM <bharathsm.hsk@gmail.com=
> wrote:
>
> On Tue, Mar 14, 2023 at 8:58=E2=80=AFPM David Howells <dhowells@redhat.co=
m> wrote:
> >
> > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > > Please summarize this to the commit message it is useful stuff. With
> > > this report included the patch could should also have a fixes tag.
> >
> > I've expanded the commit message to:
> >
> >     keys: Do not cache key in task struct if key is requested from kern=
el thread
> >
> >     The key which gets cached in task structure from a kernel thread do=
es not
> >     get invalidated even after expiry.  Due to which, a new key request=
 from
> >     kernel thread will be served with the cached key if it's present in=
 task
> >     struct irrespective of the key validity.  The change is to not cach=
e key in
> >     task_struct when key requested from kernel thread so that kernel th=
read
> >     gets a valid key on every key request.
> >
> >     The problem has been seen with the cifs module doing DNS lookups fr=
om a
> >     kernel thread and the results getting pinned by being attached to t=
hat
> >     kernel thread's cache - and thus not something that can be easily g=
ot rid
> >     of.  The cache would ordinarily be cleared by notify-resume, but ke=
rnel
> >     threads don't do that.
> >
> >     This isn't seen with AFS because AFS is doing request_key() within =
the
> >     kernel half of a user thread - which will do notify-resume.
> >
> >     Signed-off-by: Bharath SM <bharathsm@microsoft.com>
> >     Signed-off-by: David Howells <dhowells@redhat.com>
> >     cc: Jarkko Sakkinen <jarkko@kernel.org>
> >     cc: Shyam Prasad N <nspmangalore@gmail.com>
> >     cc: Steve French <smfrench@gmail.com>
> >     cc: keyrings@vger.kernel.org
> >     cc: linux-cifs@vger.kernel.org
> >     cc: linux-fsdevel@vger.kernel.org
> >
> > David
>
> Your expanded commit message looks fine. Can we please mark this
> commit for a stable kernel since it fixes some serious reconnect
> problem.?

Adding Fixes tag:
Fixes: 7743c48e54ee ("keys: Cache result of request_key*() temporarily
in task_struct")
