Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E7BDCBC9
	for <lists+keyrings@lfdr.de>; Fri, 18 Oct 2019 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409080AbfJRQpq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Oct 2019 12:45:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43684 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbfJRQpq (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 18 Oct 2019 12:45:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 175921017C10;
        Fri, 18 Oct 2019 16:45:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-84.rdu2.redhat.com [10.10.121.84])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9BF8A5D70E;
        Fri, 18 Oct 2019 16:45:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <b211005b-75de-7936-c97a-817f7100415a@I-love.SAKURA.ne.jp>
References: <b211005b-75de-7936-c97a-817f7100415a@I-love.SAKURA.ne.jp> <000000000000830fe50595115344@google.com> <00000000000071e2fc05951229ad@google.com> <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com> <20191017160028.GA726@sol.localdomain>
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc:     dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31945.1571417141.1@warthog.procyon.org.uk>
Date:   Fri, 18 Oct 2019 17:45:41 +0100
Message-ID: <31946.1571417141@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 16:45:46 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:

> I don't know about keys, but I rather suspect lack of serialization locks
> between "looking up for checking existing keys" versus "looking up for
> garbage collection".

The garbage collector holds key_serial_lock when walking key_serial_tree
looking for keys to destroy.

As the gc is the *only* thing that is permitted to remove a key from
key_serial_tree, it can safely keep a cursor pointer to the node it was
looking at when it drops the lock - and then resume scanning once it has taken
the lock again.

When find_key_to_update() is looking for a key that might be updated, the
caller *must* be holding the destination keyring lock and every key in the
keyring should have at least one ref on it held by the keyring - so none of
them should get destroyed by the garbage collector.

David
