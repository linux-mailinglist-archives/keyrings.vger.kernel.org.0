Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EF119FC0B
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgDFRvv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:51:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54098 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726520AbgDFRvv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586195510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AjnKQhZRrlXMg/3NDwu03y4zJEpSBlgOKpKNn5skTkQ=;
        b=FgzF7E28mvSHveH165I66+ZIXQv9hUE2HNnLXFf4plR2FM53rgRWQ4QraHRcLDEduZsugM
        X6s99LbSTw1gtRfi8ZVZKluXHAuQ25dROoeCobMknL6Bf+0U9SrKrCwA/iGDYY571ZFQw6
        kdNgX3MR2l/oq4E9nI8qrSkLLnctYtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-zg1BvAKROxCedjT3i4NrUQ-1; Mon, 06 Apr 2020 13:51:46 -0400
X-MC-Unique: zg1BvAKROxCedjT3i4NrUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 470A08017CE;
        Mon,  6 Apr 2020 17:51:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D334118F3F;
        Mon,  6 Apr 2020 17:51:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wiPHA4XbL-CVTDBwjYzUJwaGYriGD44uvOaqQai+zOw6A@mail.gmail.com>
References: <CAHk-=wiPHA4XbL-CVTDBwjYzUJwaGYriGD44uvOaqQai+zOw6A@mail.gmail.com> <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com> <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com> <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk> <334933.1586190389@warthog.procyon.org.uk> <dbfcbbd55c63fc87bfb31af3cae1b15e04d8a821.camel@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dhowells@redhat.com, Joe Perches <joe@perches.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <354823.1586195497.1@warthog.procyon.org.uk>
Date:   Mon, 06 Apr 2020 18:51:37 +0100
Message-ID: <354824.1586195497@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Add yet another alloc flag like __GFP_SENSITIVE
> > and have kfree operate on that and not have a
> > kfree_sensitive at all.
> 
> That sounds potentially sensible. Maybe even a SLAB_SENSITIVE to mark
> a whole slab cache sensitive for kmem_cache_create().

The allocation might be by vmalloc rather than kmalloc.  I'm not sure if that
makes things more difficult.

David

