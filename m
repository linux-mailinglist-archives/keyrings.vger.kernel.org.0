Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB9619F986
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgDFQAx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:00:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28653 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728701AbgDFQAx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586188852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q6kZ7ASO5bOsyaLXnJ3Ux1/QL48SgEahPH8hNJMUrGo=;
        b=EQwILJKu2Dk5vYvkAF9TO3q1V6lPfPbANAymKHYtdfg0kjglyB1+TqfcxrsNyRSLkQULge
        CDqV5Aq/WiO59tlQc+xuGoXQCad7N7B+tjZpuSyDfQOTj2f72CGKKPbXJeBmVKukOlgoIL
        K/eyLdnL3/RzjbRi1n0ic8olFAUWSd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-IZyOAiQXMpmCLJhwlRYpoA-1; Mon, 06 Apr 2020 12:00:48 -0400
X-MC-Unique: IZyOAiQXMpmCLJhwlRYpoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118828017F3;
        Mon,  6 Apr 2020 16:00:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com [10.10.112.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE3A5118F46;
        Mon,  6 Apr 2020 16:00:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com> <20200406023700.1367-1-longman@redhat.com>
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
Content-ID: <319764.1586188840.1@warthog.procyon.org.uk>
Date:   Mon, 06 Apr 2020 17:00:40 +0100
Message-ID: <319765.1586188840@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Joe Perches <joe@perches.com> wrote:

> > This patch introduces a new kvfree_sensitive() for freeing those
> > sensitive data objects allocated by kvmalloc(). The relevnat places
> > where kvfree_sensitive() can be used are modified to use it.
> 
> Why isn't this called kvzfree like the existing kzfree?

To quote Linus:

	We have a function for clearing sensitive information: it's called
	"memclear_explicit()", and it's about forced (explicit) clearing even
	if the data might look dead afterwards.

	The other problem with that function is the name: "__kvzfree()" is not
	a useful name for this function. We use the "__" format for internal
	low-level helpers, and it generally means that it does *less* than the
	full function. This does more, not less, and "__" is not following any
	sane naming model.

	So the name should probably be something like "kvfree_sensitive()" or
	similar. Or maybe it could go even further, and talk about _why_ it's
	sensitive, and call it "kvfree_cleartext()" or something like that.

	Because the clearing is really not what even matters. It might choose
	other patterns to overwrite things with, but it might do other things
	too, like putting special barriers for data leakage (or flags to tell
	return-to-user-mode to do so).

	And yes, kzfree() isn't a good name either, and had that same
	memset(), but at least it doesn't do the dual-underscore mistake.

	Including some kzfree()/crypto people explicitly - I hope we can get
	away from this incorrect and actively wrong pattern of thinking that
	"sensitive data should be memset(), and then we should add a random
	'z' in the name somewhere to 'document' that".

David

