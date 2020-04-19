Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE14A1AF8CA
	for <lists+keyrings@lfdr.de>; Sun, 19 Apr 2020 10:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgDSIh7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 19 Apr 2020 04:37:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51902 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725905AbgDSIh7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 19 Apr 2020 04:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587285478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gtE/RAI8Ll8mxlz3GjJNNnyp/GGzHjOzYL41aghGZqo=;
        b=XYDfh/nYwENIGUeOsYY5RwG1SvGWbgt3S4F1BW+bqX4QLsQIsi+5gWL9xIjBYDAf6+tKGy
        YsAg2QV79CH+WCWVJV1gx293E/g4TEtG1SsCPU1Vhs1xtcqxgwLqbBdJqMuigs3z++OhHw
        cghdzzTWnL1Hu6NCEXaSQpl8wBYnR/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-LHnNx2NRM0CC-We1R3FlPQ-1; Sun, 19 Apr 2020 04:37:56 -0400
X-MC-Unique: LHnNx2NRM0CC-We1R3FlPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D694318C35A0;
        Sun, 19 Apr 2020 08:37:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com [10.10.113.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB8FA1056;
        Sun, 19 Apr 2020 08:37:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
References: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com> <3865908.1586874010@warthog.procyon.org.uk>
To:     Steve French <smfrench@gmail.com>
Cc:     dhowells@redhat.com, linux-nfs <linux-nfs@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>, linux-afs@lists.infradead.org,
        ceph-devel@vger.kernel.org, keyrings@vger.kernel.org,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, fweimer@redhat.com
Subject: Re: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <927452.1587285472.1@warthog.procyon.org.uk>
Date:   Sun, 19 Apr 2020 09:37:52 +0100
Message-ID: <927453.1587285472@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Steve French <smfrench@gmail.com> wrote:

> For SMB3/CIFS mounts, Paulo added support last year for automatic
> reconnect if the IP address of the server changes.  It also is helpful
> when DFS (global name space) addresses change.

What happens if the IP address the superblock is going to changes, then
another mount is made back to the original IP address?  Does the second mount
just pick the original superblock?

David

