Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E02519F118
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 09:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDFHo0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 03:44:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57612 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726475AbgDFHoZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 03:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586159064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=68gqJZ8Lxjhiyta4L8ElEw989A5CNfIKH8Ml7LMQaIg=;
        b=boQSnqAnTV/x2zl7C6n+WxlH+cjEYLhaiyPcRBnzWyCTzxPp3s5X0nM0KnWS7uiFwg9Gy2
        T9vC8deJE3Uayh/Ckrnwtob5TabJJUbGPs6h5D6l7wmzeb6eHxOCYxyKtF3d9BidiqaQw1
        1awYbxRYIsJRZ1W5XQjgRiTWp4rzVWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-C1LSPbCDOCa3rPHQcbS7vQ-1; Mon, 06 Apr 2020 03:44:20 -0400
X-MC-Unique: C1LSPbCDOCa3rPHQcbS7vQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E058017F3;
        Mon,  6 Apr 2020 07:44:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 24D025DA7B;
        Mon,  6 Apr 2020 07:44:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <alpine.DEB.2.21.2004052119530.243304@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.2004052119530.243304@chino.kir.corp.google.com> <20200406023700.1367-1-longman@redhat.com>
To:     David Rientjes <rientjes@google.com>
Cc:     dhowells@redhat.com, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6503.1586159053.1@warthog.procyon.org.uk>
Date:   Mon, 06 Apr 2020 08:44:13 +0100
Message-ID: <6504.1586159053@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Rientjes <rientjes@google.com> wrote:

> > +static inline void kvfree_sensitive(const void *addr, size_t len)
> > +{
> > +	if (addr) {
> 
> Shouldn't this be if (unlikely(ZERO_OR_NULL_PTR(addr))?

You've reversed the logic - it needs a '!' there.

David

