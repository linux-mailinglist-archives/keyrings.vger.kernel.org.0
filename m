Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902651A16A7
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgDGUUH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:20:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41235 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726436AbgDGUUG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586290805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fxjovPJT9PYi/Q+kEbBArk5+VXRyPgnAFih7tcezt4E=;
        b=IDZsQvqav+X+l+JvItZubCbEqNTMNL9Pxy4QPRXimgmyYWsfYoCj7ZrZI8dZG8b6bYsObO
        Xnz+u6ycHhJlMvoK7FY2fKGHJVsypO/p/HUSQYt8MKyIYiE8YfXHb4S5QLtHw7FnDU4bxP
        GwjInbILfbqqBDVVUZWF8HgLV+ZOcLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-p-0hpW6bOWi0jatDbwjKWA-1; Tue, 07 Apr 2020 16:20:01 -0400
X-MC-Unique: p-0hpW6bOWi0jatDbwjKWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CEF8017F3;
        Tue,  7 Apr 2020 20:19:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5F9CC60BEC;
        Tue,  7 Apr 2020 20:19:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200407200318.11711-1-longman@redhat.com>
References: <20200407200318.11711-1-longman@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
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
Content-ID: <694134.1586290793.1@warthog.procyon.org.uk>
Date:   Tue, 07 Apr 2020 21:19:53 +0100
Message-ID: <694135.1586290793@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Waiman Long <longman@redhat.com> wrote:

> sensitive data objects allocated by kvmalloc(). The relevnat places

"relevant".

>  			if (unlikely(key_data))
> -				__kvzfree(key_data, key_data_len);
> +				kvfree_sensitive(key_data, key_data_len);

I think the if-statement is redundant.

David

