Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42BE01A174F
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 23:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgDGVOX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 17:14:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30952 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726393AbgDGVOX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 17:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586294062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JDR/Ja/MXRViYxacEiXghWWXRn30qULV8zNLAxslGog=;
        b=Hbak8jfxFrUX3zgjjidCy4zjiBzh+4SoCK5PO+TawDqFD8qE9qaJCKOHknvZs5ys5i2YqM
        V5Gz72IIZRSX5f3vbnF01XDvFxTlYwFjYq7IrzvpEJluP9j1SzQLp1chnC9MZ3DQ6YRvqE
        TOjuZn0zLKEUW5d3jGoCYlbxteK7JBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-8Woi6jfnOlGwnE-45vTsXw-1; Tue, 07 Apr 2020 17:14:20 -0400
X-MC-Unique: 8Woi6jfnOlGwnE-45vTsXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74658017CE;
        Tue,  7 Apr 2020 21:14:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A2CD09B912;
        Tue,  7 Apr 2020 21:14:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com>
References: <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com> <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com> <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dhowells@redhat.com, Joe Perches <joe@perches.com>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linux-MM <linux-mm@kvack.org>, keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data objects
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <699291.1586294051.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 07 Apr 2020 22:14:11 +0100
Message-ID: <699292.1586294051@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> So the _real_ prototype for 'free()'-like operations should be something=
 like
> =

>     void free(const volatile killed void *ptr);
> =

> where that "killed" also tells the compiler that the pointer lifetime
> is dead, so that using it afterwards is invalid. So that the compiler
> could warn us about some of the most trivial use-after-free cases.

It might be worth asking the compiler folks to give us an __attribute__ fo=
r
that - even if they don't do anything with it immediately.  So we might ha=
ve
something like:

	void free(const volatile void *ptr) __attribute__((free(1)));

There are some for allocation functions, some of which we use, though I'm =
not
sure we do so as consistently as we should (should inline functions like
kcalloc() have them, for example?).

David

