Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9061A1865
	for <lists+keyrings@lfdr.de>; Wed,  8 Apr 2020 00:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDGWy2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 18:54:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56486 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726386AbgDGWy2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 18:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586300066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZDDid3a3ePfhLodTyOmZRjnrTotcjxlg26rXizPwJc=;
        b=ObfqlF+qr4JzEZfMc1rh6YNj/qk9jWVGcJbMwmyVPo9oqFOhTYBdXnsJGUx3Jk6zCjOl2Z
        stUNY3gX0QRSSyhL8YaHdDfhC7AxUYWjL7TjQjpUCJfoESIBTz8eM8QoJXB6901KYyc5Wr
        q6P/xqlY6MOf541foeWRhA4d1MotEdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-VXoG6dq-MCGFzhVdysVHAQ-1; Tue, 07 Apr 2020 18:54:19 -0400
X-MC-Unique: VXoG6dq-MCGFzhVdysVHAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 061BE13F9;
        Tue,  7 Apr 2020 22:54:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 428C55DA60;
        Tue,  7 Apr 2020 22:54:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whwaNvyd1q=h0nUQio9byojpxufGkOiVfAh10woRs8KSA@mail.gmail.com>
References: <CAHk-=whwaNvyd1q=h0nUQio9byojpxufGkOiVfAh10woRs8KSA@mail.gmail.com> <20200406185827.22249-1-longman@redhat.com> <c2c8adf48be7cb18bbdf0aef7d21e2defe3d2183.camel@perches.com> <CAHk-=wg_mkSc-pH8ntGHR=no9DOLRQyxdtU20p55DrM1su6QzA@mail.gmail.com> <CAHk-=wg2Vsb0JETo24=Tc-T2drwMopMRfKnc__r5SZ6tEnbwcA@mail.gmail.com> <699292.1586294051@warthog.procyon.org.uk>
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
        David Rientjes <rientjes@google.com>, law@redhat.com
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data objects
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <749734.1586300050.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 07 Apr 2020 23:54:10 +0100
Message-ID: <749735.1586300050@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > It might be worth asking the compiler folks to give us an __attribute_=
_ for
> > that - even if they don't do anything with it immediately.  So we migh=
t have
> > something like:
> >
> >         void free(const volatile void *ptr) __attribute__((free(1)));
> =

> Yeah, that sounds sane.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D94527

> Even if it wasn't initially used for anything it wouldn't hurt, and mayb=
e
> some day it would improve warnings (and allow the compiler to do the dea=
d
> store elimination that started this whole long set of threads in the fir=
st
> place..)

With regard to this, I've got back "not sure what Linus was talking about =
WRT
DSE, if he's got examples he could pass along, they'd be appreciated"

David

