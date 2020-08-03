Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68923A26C
	for <lists+keyrings@lfdr.de>; Mon,  3 Aug 2020 12:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgHCKCe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Aug 2020 06:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHCKCb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Aug 2020 06:02:31 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978C8C06174A
        for <keyrings@vger.kernel.org>; Mon,  3 Aug 2020 03:02:30 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a21so37976514ejj.10
        for <keyrings@vger.kernel.org>; Mon, 03 Aug 2020 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vsw86Ioh4FX2LjY9IRNgVl3ySN874HqeJp7Mv8isep4=;
        b=RpfQtFsHlbz8r366bIDazEG7v/rOLrIkoCqHg8rE2DUKq52Z8mwzP137tJ/5s7tPUj
         VLb1iezTLNPzIJG1c0Pkm89UBzyKPJeX6JGIivqYWsnaSCB6ZaglPy5t0gDZQCPFTCU7
         8llZA5AlGWWNzDr8tBx5EpJDGB/QTw7bpfPc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vsw86Ioh4FX2LjY9IRNgVl3ySN874HqeJp7Mv8isep4=;
        b=RaQ8D16o87U1PAam1Y8MLuwGYvPn6EUmSHsx+ZAGgAv4WmID+Goa0dCU7M+1m1lhVw
         U6kMNZb73rlafDbVHXzaWHQ5qpF5rK0aVRhx4MJfECI2ooS+3mb2MWRrxO/X+xfWxnqR
         Wgy45uzmgzdHMg/SCo6Z9J/6DUCFEFtpuiIeuU4g3SIY+jMS3mc5UtCmyPIEJPISL6bT
         4c6xDSXeeuDUPU1OUAtnbuX5svUriMvSUG2J14TkhzQZVX9pnM9vTtZCerCqJRTE7zO2
         mAMtG1KFJc9YSJC8u1xIaJ9UviKRgxy9SS+Rj1Xc+muP4tg/Ekn0I0OnoMtOSU4oUUr7
         6BuA==
X-Gm-Message-State: AOAM533kZlGavJS/kZq0EfSRXFAErCQDM19HxrU3wtj+SmunEWcd/tWK
        ja743Sz4QgqUEmCt7QyE2OKgaQEaFbtP7rWbpqLk3Q==
X-Google-Smtp-Source: ABdhPJyBZEAYQ6WLR1Z0AfPVD+Khagrgtzu1YRtwovnq6WreKbtRGY02vgjzms1nTRrPans2kaPI2wtS5NWP0loHJ+k=
X-Received: by 2002:a17:906:4c46:: with SMTP id d6mr16814326ejw.14.1596448949388;
 Mon, 03 Aug 2020 03:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1293241.1595501326@warthog.procyon.org.uk> <CAJfpegspWA6oUtdcYvYF=3fij=Bnq03b8VMbU9RNMKc+zzjbag@mail.gmail.com>
 <158454378820.2863966.10496767254293183123.stgit@warthog.procyon.org.uk>
 <158454391302.2863966.1884682840541676280.stgit@warthog.procyon.org.uk>
 <2003787.1595585999@warthog.procyon.org.uk> <865566fb800a014868a9a7e36a00a14430efb11e.camel@themaw.net>
 <2023286.1595590563@warthog.procyon.org.uk>
In-Reply-To: <2023286.1595590563@warthog.procyon.org.uk>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 3 Aug 2020 12:02:18 +0200
Message-ID: <CAJfpegsT_3YqHPWCZGX7Lr+sE0NVmczWz5L6cN8CzsVz4YKLCQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] watch_queue: Implement mount topology and attribute
 change notifications [ver #5]
To:     David Howells <dhowells@redhat.com>
Cc:     Ian Kent <raven@themaw.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Christian Brauner <christian@brauner.io>, andres@anarazel.de,
        Jeff Layton <jlayton@redhat.com>, dray@redhat.com,
        Karel Zak <kzak@redhat.com>, keyrings@vger.kernel.org,
        Linux API <linux-api@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        LSM <linux-security-module@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Jul 24, 2020 at 1:36 PM David Howells <dhowells@redhat.com> wrote:
>
> Ian Kent <raven@themaw.net> wrote:
>
> > I was wondering about id re-use.
> >
> > Assuming that ids that are returned to the idr db are re-used
> > what would the chance that a recently used id would end up
> > being used?
> >
> > Would that chance increase as ids are consumed and freed over
> > time?
>
> I've added something to deal with that in the fsinfo branch.  I've given each
> mount object and superblock a supplementary 64-bit unique ID that's not likely
> to repeat before we're no longer around to have to worry about it.
>
> fsinfo() then allows you to retrieve them by path or by mount ID.

Shouldn't the notification interface provide the unique ID?

Thanks,
Miklos

>
> So, yes, mnt_id and s_dev are not unique and may be reused very quickly, but
> I'm also providing uniquifiers that you can check.
>
> David
>
