Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8B223C71A
	for <lists+keyrings@lfdr.de>; Wed,  5 Aug 2020 09:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgHEHny (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 5 Aug 2020 03:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHEHnv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 5 Aug 2020 03:43:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5DCC06179F
        for <keyrings@vger.kernel.org>; Wed,  5 Aug 2020 00:43:50 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id c15so22121561edj.3
        for <keyrings@vger.kernel.org>; Wed, 05 Aug 2020 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c7MS/sDmqsu2UeEHE/y1WIBOLGRyoL/hTSKDaerW230=;
        b=G2U85/Sh33+IcIW0dxhFoe+oW0YUFI67TOMZGh5yXHDRtVNTTIES6+/5ghbYizPlrA
         NxqWRNYE+WiZQ5x/6V5NBGxTNuIsiyaYdE1+DK4um+EutgPdxUhLgshYgl+AqycDH9vs
         4dvJRUCTUHLDjtWW+GCIgH/TbkBbaYm/yDD6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c7MS/sDmqsu2UeEHE/y1WIBOLGRyoL/hTSKDaerW230=;
        b=AwJlg8NWtUwr9NjoYwotw+My89jPzjdoW7KVeklOqubUzq7H3WalM+xvAvfwTV6/sA
         5odWNHZu08enYd3CXr4nsKeTjA/Bd26DOqvrui64qIJmfp7konP3bniyuIw1Aocvj/4B
         Lq03RZYX8JHRLzxGTtZFzduLL2HiaMxZg18q1MNag3nCg1u5D5LDOFrfw+BB79VpORJk
         q+TdIODZzCFyHBbF0sZDnvFq9Qt3L25EPtjHu1FkK2T4rBYvLXn557D5bi3Ir7bjdKvw
         LH9ipz0qtRsnwnaNqONlcBGD3z6+SEJA9y6FWLsKVqIZFCgcuNXrAIOmCxENj1F3Rn4/
         7Aew==
X-Gm-Message-State: AOAM530OwA4oW116LLLDVmf8UOEph++orF+LFCRI+Y82GZLMv/By4xfb
        7wKoQ0cuABy1A6rYw0FsS4yn/VjPXeKvamh64Zj15Q==
X-Google-Smtp-Source: ABdhPJxB/evMZ5+0ZnmBx4YzSXoXDzPSNs9Cjc++wXkfuUDJKvalsR0eiNz5UMmlIUDOEP5Cy96B5iGq/jW2A8IePJ4=
X-Received: by 2002:a50:fb10:: with SMTP id d16mr1638111edq.134.1596613429317;
 Wed, 05 Aug 2020 00:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <158454378820.2863966.10496767254293183123.stgit@warthog.procyon.org.uk>
 <158454391302.2863966.1884682840541676280.stgit@warthog.procyon.org.uk>
 <CAJfpegspWA6oUtdcYvYF=3fij=Bnq03b8VMbU9RNMKc+zzjbag@mail.gmail.com>
 <1293241.1595501326@warthog.procyon.org.uk> <CAJfpeguvLMCw1H8+DPsfZE_k0sEiRtA17pD9HjnceSsAvqqAZw@mail.gmail.com>
 <43c061d26ddef2aa3ca1ac726da7db9ab461e7be.camel@themaw.net>
 <CAJfpeguFkDDhz7+70pSUv_j=xY5L08ESpaE+jER9vE5p+ZmfFw@mail.gmail.com> <c558fc4af785f62a2751be3b297d1ccbbfcfa969.camel@themaw.net>
In-Reply-To: <c558fc4af785f62a2751be3b297d1ccbbfcfa969.camel@themaw.net>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 5 Aug 2020 09:43:38 +0200
Message-ID: <CAJfpegvxKTy+4Zk6banvxQ83PeFV7Xnt2Qv=kkOg57rxFKqVEg@mail.gmail.com>
Subject: Re: [PATCH 13/17] watch_queue: Implement mount topology and attribute
 change notifications [ver #5]
To:     Ian Kent <raven@themaw.net>
Cc:     David Howells <dhowells@redhat.com>,
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

On Wed, Aug 5, 2020 at 3:54 AM Ian Kent <raven@themaw.net> wrote:
>

> > > It's way more useful to have these in the notification than
> > > obtainable
> > > via fsinfo() IMHO.
> >
> > What is it useful for?
>
> Only to verify that you have seen all the notifications.
>
> If you have to grab that info with a separate call then the count
> isn't necessarily consistent because other notifications can occur
> while you grab it.

No, no no.   The watch queue will signal an overflow, without any
additional overhead for the normal case.  If you think of this as a
protocol stack, then the overflow detection happens on the transport
layer, instead of the application layer.  The application layer is
responsible for restoring state in case of a transport layer error,
but detection of that error is not the responsibility of the
application layer.


Thanks,
Miklos
