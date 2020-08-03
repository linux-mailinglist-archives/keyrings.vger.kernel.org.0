Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7F123A2AA
	for <lists+keyrings@lfdr.de>; Mon,  3 Aug 2020 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHCKSV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Aug 2020 06:18:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24124 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726321AbgHCKSU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Aug 2020 06:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596449899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bfXMCNI/Os0PHSTlvW49y4Nr2+FnMZYDapmptaEW04U=;
        b=VBEL9t0Tt4gA/grwTrDZ2wi4qyr/OqEpSfoE2D9y2Kriajvba9USa8C5AAl9BQWE9skC1z
        8wwB+lHyKNKam+MzzSWaq50JzNYlxr1bEOnvOOmda5QqAf+bJHzv2HsIy2/do6YFeNJa8y
        3CA8uOkWlP19XIBMVYNOe0HuD7R+YXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-K_5LoHEKMdSlR3ZUeqZ2fw-1; Mon, 03 Aug 2020 06:18:16 -0400
X-MC-Unique: K_5LoHEKMdSlR3ZUeqZ2fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 449B81005504;
        Mon,  3 Aug 2020 10:18:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-32.rdu2.redhat.com [10.10.112.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17FC888F20;
        Mon,  3 Aug 2020 10:18:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAJfpegsT_3YqHPWCZGX7Lr+sE0NVmczWz5L6cN8CzsVz4YKLCQ@mail.gmail.com>
References: <CAJfpegsT_3YqHPWCZGX7Lr+sE0NVmczWz5L6cN8CzsVz4YKLCQ@mail.gmail.com> <1293241.1595501326@warthog.procyon.org.uk> <CAJfpegspWA6oUtdcYvYF=3fij=Bnq03b8VMbU9RNMKc+zzjbag@mail.gmail.com> <158454378820.2863966.10496767254293183123.stgit@warthog.procyon.org.uk> <158454391302.2863966.1884682840541676280.stgit@warthog.procyon.org.uk> <2003787.1595585999@warthog.procyon.org.uk> <865566fb800a014868a9a7e36a00a14430efb11e.camel@themaw.net> <2023286.1595590563@warthog.procyon.org.uk>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     dhowells@redhat.com, Ian Kent <raven@themaw.net>,
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
Subject: Re: [PATCH 13/17] watch_queue: Implement mount topology and attribute change notifications [ver #5]
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1283474.1596449889.1@warthog.procyon.org.uk>
Date:   Mon, 03 Aug 2020 11:18:09 +0100
Message-ID: <1283475.1596449889@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Miklos Szeredi <miklos@szeredi.hu> wrote:

> > fsinfo() then allows you to retrieve them by path or by mount ID.
> 
> Shouldn't the notification interface provide the unique ID?

Hmmm...  If I'm going to do that, I have to put the fsinfo-core branch first
otherwise you can't actually retrieve the unique ID - and thus won't be able
to make sense of the notification record.  Such a rearrangement might make
sense anyway since Ian and Karel have been primarily concentrating on fsinfo
and only more recently started adding notification support.

David

