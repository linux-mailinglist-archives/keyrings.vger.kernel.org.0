Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8632819FA17
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbgDFQ0k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:26:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55060 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729015AbgDFQ0k (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586190399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=17nCtfeqSi71cffLAAYudEczCAwQpV2MoZnlr3dlA0o=;
        b=Ciqg4fCPRqOPrFgk4fmc9G9z6S2TJMXyyHII+7hz+xZ6R4vZKmv7gFX1etqki5/HyW7LhR
        e1t7vz+3I8BnAzfGzdERNnZ+g8YH78dYc4nypYkMD03G7wxusKIicbKwVVSWQ7HOA7jYVo
        pSjfJxpHJ79torz+1UbGBhyAujT5/l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49--c7y-mZpOL2UaIH_H3hUiA-1; Mon, 06 Apr 2020 12:26:37 -0400
X-MC-Unique: -c7y-mZpOL2UaIH_H3hUiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC571007269;
        Mon,  6 Apr 2020 16:26:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2325A1001DF0;
        Mon,  6 Apr 2020 16:26:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
References: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com> <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com> <20200406023700.1367-1-longman@redhat.com> <319765.1586188840@warthog.procyon.org.uk>
To:     Joe Perches <joe@perches.com>
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
Content-ID: <334932.1586190389.1@warthog.procyon.org.uk>
Date:   Mon, 06 Apr 2020 17:26:29 +0100
Message-ID: <334933.1586190389@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Joe Perches <joe@perches.com> wrote:

> While I agree with Linus about the __ prefix,
> the z is pretty common and symmetric to all
> the <foo>zalloc uses.
> 
> And if _sensitive is actually used, it'd be
> good to do a s/kzfree/kfree_sensitive/ one day
> sooner than later.

How much overhead would it be to always use kvfree_sensitive() and never have
a kfree_sensitive()?

David

