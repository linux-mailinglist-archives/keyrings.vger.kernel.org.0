Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA53323A32F
	for <lists+keyrings@lfdr.de>; Mon,  3 Aug 2020 13:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHCLRV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Aug 2020 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgHCLRU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Aug 2020 07:17:20 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E8DC061757
        for <keyrings@vger.kernel.org>; Mon,  3 Aug 2020 04:17:19 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so21072869edx.8
        for <keyrings@vger.kernel.org>; Mon, 03 Aug 2020 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=phUao9tXf/t4b/68S+2rq16ySbBLGNbfI2sRyl9fmdU=;
        b=eoVrCN0PZZ1JS+F3fakDr2Ij8wISyKSGPN0lWQaGRrdbv1WtI1HXeY2zQorKnB7Bi0
         VRrysLvCQG2nw4yx00kjhBBvbRQCdLC+pMBHaFd4x+oUq5/iuV61KNUXUtmKl/01yaYQ
         K72k3pKjdfjjKvewHfPgkAHJIvr563YyPdSN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=phUao9tXf/t4b/68S+2rq16ySbBLGNbfI2sRyl9fmdU=;
        b=RQGJd4sNcMi51ToIa32iItYy5Iqhl0cLz0r+T+nLsoeeWmbYkj4C/XYKKlWeiTKMzx
         m2isPntWE9hbUMxUd8p6UDAb2fz2dCNODf37XTbDv8GflP9aCpZG+tDhxH2C6GPiGsTb
         aWoqcCoaGoQla//XAi+ttUYOjbE4+aMeCWVSHiq7dh0/IPnWaART1QDmsCyTfIO/SNxU
         UF4/N0A0VQHp7RlxT8xv/1hG6bxctnfPqlCh943P5AyWgRO8RgaD4pGV1V59THarQ4fx
         Yu9tUlkVCr2pab+6GDP2KVV1yfn1CGC9GeT7N546VNfhWyJSNGEXvKIaQbAVXtMHElNg
         52Ug==
X-Gm-Message-State: AOAM531AQpAW9WlAE2uC7ueoyZEsRr2L7w87cknLZ0jQQbyjAsbHjNIX
        D7SiKcZyHfYNgktzYmsabIudBuPVYNJXNigBxobFHA==
X-Google-Smtp-Source: ABdhPJzYkpExpfofwOysvG0SUfDHJUUcNoJnQSIchQHGMGBM9qKDjKahkgN9Xb26C1GwbhowgmIILXMGk8ZjU9gsAgI=
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr303427edx.161.1596453438170;
 Mon, 03 Aug 2020 04:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <1293241.1595501326@warthog.procyon.org.uk> <CAJfpegspWA6oUtdcYvYF=3fij=Bnq03b8VMbU9RNMKc+zzjbag@mail.gmail.com>
 <158454378820.2863966.10496767254293183123.stgit@warthog.procyon.org.uk>
 <158454391302.2863966.1884682840541676280.stgit@warthog.procyon.org.uk>
 <2003787.1595585999@warthog.procyon.org.uk> <865566fb800a014868a9a7e36a00a14430efb11e.camel@themaw.net>
 <2023286.1595590563@warthog.procyon.org.uk> <CAJfpegsT_3YqHPWCZGX7Lr+sE0NVmczWz5L6cN8CzsVz4YKLCQ@mail.gmail.com>
 <1283475.1596449889@warthog.procyon.org.uk>
In-Reply-To: <1283475.1596449889@warthog.procyon.org.uk>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 3 Aug 2020 13:17:06 +0200
Message-ID: <CAJfpeguO8Qwkzx9zfGVT7W+pT5p6fgj-_8oJqJbXX_KQBpLLEQ@mail.gmail.com>
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

On Mon, Aug 3, 2020 at 12:18 PM David Howells <dhowells@redhat.com> wrote:
>
> Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> > > fsinfo() then allows you to retrieve them by path or by mount ID.
> >
> > Shouldn't the notification interface provide the unique ID?
>
> Hmmm...  If I'm going to do that, I have to put the fsinfo-core branch first
> otherwise you can't actually retrieve the unique ID - and thus won't be able
> to make sense of the notification record.  Such a rearrangement might make
> sense anyway since Ian and Karel have been primarily concentrating on fsinfo
> and only more recently started adding notification support.

OTOH mount notification is way smaller and IMO a more mature
interface.  So just picking the unique ID patch into this set might
make sense.

Thanks,
Miklos
