Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F089175701
	for <lists+keyrings@lfdr.de>; Mon,  2 Mar 2020 10:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgCBJ11 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Mar 2020 04:27:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35266 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726956AbgCBJ11 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 2 Mar 2020 04:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583141246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e7SwlGV6SzZARN8z/sqcSHNyyZ6d+Qw/y79yqdRaRMQ=;
        b=NECMRAeDUr5uOnHiiG2oh4QPd8KN8iGL8nGvdTo6wXujV+Ac8a1BeYO5kQaOnft12dJaRU
        hjKEEwh0X5lluPO/Ee42AHcXyzm1hk3A9Qj3pDT+buhAlsefcxlSB6yKEaJzg0nNX9Ii/9
        pUZr1z6msDAynX0bnvAYH8bVZ2WVzqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-_U5IG59xP6KG5tsyynbpGw-1; Mon, 02 Mar 2020 04:27:24 -0500
X-MC-Unique: _U5IG59xP6KG5tsyynbpGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC6BDB61;
        Mon,  2 Mar 2020 09:27:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com [10.10.120.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 324FE100194E;
        Mon,  2 Mar 2020 09:27:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <538780.1583137732@warthog.procyon.org.uk>
References: <538780.1583137732@warthog.procyon.org.uk> <20200218211259.GA19673@linux.intel.com> <000000000000f4bf93059db8b081@google.com>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com
Subject: Re: kernel BUG at lib/assoc_array.c:LINE!
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <686377.1583141241.1@warthog.procyon.org.uk>
Date:   Mon, 02 Mar 2020 09:27:21 +0000
Message-ID: <686378.1583141241@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

David Howells <dhowells@redhat.com> wrote:

> [  621.627412][ T6728] kAFS: unable to lookup cell '?T]??J??n/P4?['
> 
> This is a bit odd, since the version allegedly being tested includes a patch
> to prohibit AFS cell names that contain unprintable chars.  It should error
> out in afs_alloc_cell(), way before it tries to do a DNS lookup.

Ah, no, that's okay.  This error message is printed in afs_parse_source() on
the way out after afs_lookup_cell() fails (presumably due to afs_alloc_cell()
failing).

It seems unlikely that the dead process is actually anything to do with the
mount that more or less immediately preceded it in the log.  It mount should
have failed without creating a cell record - which then precludes affecting
afs_manage_cell().  However, a previously created cell with a valid name can
feasibly be driving afs_manage_cell() and causing the problem.

David

