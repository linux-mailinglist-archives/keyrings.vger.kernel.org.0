Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26BD1A16B0
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgDGUWH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:22:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22306 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726719AbgDGUWH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586290926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r8vqiSN09abRSI1hwl8/sl3dADzQpKJS/8XVAle9PuY=;
        b=DHGCk+ybLsU5lRjyi8KzMF4YIrPIjsU7duiBXektme0O0gj0svZfl/pLLDmLNkVkRiwKAd
        9ws9N/x+a0D7CXY/LyDtym6mD8g+WQq6sjJYRBl4TxtAvMaHVtV7e/96I35LaIBe7NOQyn
        CqrjeyNJYlPfkiEd6UVbUkRYv3HCs4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-eD3JK8RXOV290N2tCG19Jw-1; Tue, 07 Apr 2020 16:22:04 -0400
X-MC-Unique: eD3JK8RXOV290N2tCG19Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C732F8017CE;
        Tue,  7 Apr 2020 20:22:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 32CE950C01;
        Tue,  7 Apr 2020 20:21:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <694135.1586290793@warthog.procyon.org.uk>
References: <694135.1586290793@warthog.procyon.org.uk> <20200407200318.11711-1-longman@redhat.com>
Cc:     dhowells@redhat.com, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data objects
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <694339.1586290917.1@warthog.procyon.org.uk>
Date:   Tue, 07 Apr 2020 21:21:57 +0100
Message-ID: <694340.1586290917@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> >  			if (unlikely(key_data))
> > -				__kvzfree(key_data, key_data_len);
> > +				kvfree_sensitive(key_data, key_data_len);
> 
> I think the if-statement is redundant.

Ah - I see that you explicitly wanted to keep it.  There's a good chance it'll
get janitored at some point.

David

