Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A42DEF5C
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2019 16:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfJUOWL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Oct 2019 10:22:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44503 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728957AbfJUOWL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Oct 2019 10:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571667730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juvjyDj/bXESr8Pj+8TGvYoxpIfnIpsm8+f+H/8UCWM=;
        b=NMIee93n7OvKrV28EcXdtfJ803kvbrRiw8AgiNPwM0LrQtKUXfaHZQJhTRYa1aun6Q9Ocj
        Zz9bsrjHt0gs9ENpCYZOqylKliTT9jYGwcrZ6IJwItA/Ly7srHV28CbQ84mVka6o8vlf3X
        FBnBY8kV2+uQQw3O6ZIBzEeZTFE4jZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-C06jtCk6MO2DbhBQzqUQyw-1; Mon, 21 Oct 2019 10:22:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFB4947B;
        Mon, 21 Oct 2019 14:22:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 39B1E5D717;
        Mon, 21 Oct 2019 14:22:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20191018184030.8407-1-crecklin@redhat.com>
References: <20191018184030.8407-1-crecklin@redhat.com>
To:     Chris von Recklinghausen <crecklin@redhat.com>
Cc:     dhowells@redhat.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] security/keyring: avoid pagefaults in keyring_read_iterator
MIME-Version: 1.0
Content-ID: <30308.1571667719.1@warthog.procyon.org.uk>
Date:   Mon, 21 Oct 2019 15:21:59 +0100
Message-ID: <30309.1571667719@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: C06jtCk6MO2DbhBQzqUQyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Chris von Recklinghausen <crecklin@redhat.com> wrote:

> The put_user call from keyring_read_iterator caused a page fault which
> attempts to lock mm->mmap_sem and type->lock_class (key->sem) in the reve=
rse
> order that keyring_read_iterator did, thus causing the circular locking
> dependency.
>=20
> Remedy this by using access_ok and __put_user instead of put_user so we'l=
l
> return an error instead of faulting in the page.

I wonder if it's better to create a kernel buffer outside of the lock in
keyctl_read_key().  Hmmm...  The reason I didn't want to do that is that
keyrings have don't have limits on the size.  Maybe that's not actually a
problem, since 1MiB would be able to hold a list of a quarter of a million
keys.

David

