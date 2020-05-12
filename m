Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC961D0183
	for <lists+keyrings@lfdr.de>; Wed, 13 May 2020 00:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731552AbgELWDf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 12 May 2020 18:03:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56678 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728313AbgELWDe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 12 May 2020 18:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589321013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ns5UOQMLizpSxZdFpRK9TbCkGBwHVENlcHczF4G1fL8=;
        b=EYcW5rGWWIgsmSaDRNG+L3S+WST2fWSrvESu4rVnHvda62r7oXqRR86GjrAeSuu5ZFBfzO
        VU4hmjbwaWDsMJrDy2yuwCBGCEoN0lNQuAfbe98PVaLO3ZrcBv+UwPj+DhthhupcJzH5Ba
        OAwPccVs2Emgm5VjKxdCIiqaonyA0dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-0MUo9GkKPLKCnl2yk28XwQ-1; Tue, 12 May 2020 18:03:28 -0400
X-MC-Unique: 0MUo9GkKPLKCnl2yk28XwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F194473;
        Tue, 12 May 2020 22:03:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 29D2953E3B;
        Tue, 12 May 2020 22:03:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHmME9q-TxHo5o63rxHzKwV_kWV9u+MoxBQM5Yz3hODGCj7RhQ@mail.gmail.com>
References: <CAHmME9q-TxHo5o63rxHzKwV_kWV9u+MoxBQM5Yz3hODGCj7RhQ@mail.gmail.com> <CAHmME9oXiTmVuOYmG=K3ijWK+zP2yB9a2CFjbLx_5fkDiH30Tg@mail.gmail.com> <20200511215101.302530-1-Jason@zx2c4.com> <2620780.1589289425@warthog.procyon.org.uk>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-hardening@lists.openwall.com,
        Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v3] security/keys: rewrite big_key crypto to use library interface
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2858488.1589321003.1@warthog.procyon.org.uk>
Date:   Tue, 12 May 2020 23:03:23 +0100
Message-ID: <2858489.1589321003@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> So long as that ->update function:
> 1. Deletes the old on-disk data.
> 2. Deletes the old key from the inode.
> 3. Generates a new key using get_random_bytes.
> 4. Stores that new key in the inode.
> 5. Encrypts the updated data afresh with the new key.
> 6. Puts the updated data onto disk,
> 
> then this is fine with me, and feel free to have my Acked-by if you
> want. But if it doesn't do that -- i.e. if it tries to reuse the old
> key or similar -- then this isn't fine. But it sounds like from what
> you've described that things are actually fine, in which case, I guess
> it makes sense to apply your patch ontop of mine and commit these.

Yep.  It calls big_key_destroy(), which clears away the old stuff just as when
a key is being destroyed, then generic_key_instantiate() just as when a key is
being set up.

The key ID and the key metadata (ownership, perms, expiry) are maintained, but
the payload is just completely replaced.

David

