Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B692E022D
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2019 12:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388259AbfJVKfq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Oct 2019 06:35:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25285 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388241AbfJVKfq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Oct 2019 06:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571740544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ULN5eSGY4MtkW08yCSqz0QqvTO9SX1bksmLq7XKOj9M=;
        b=azJ3Q7p1XNV5UDQEiC1Bs8pmqc1ZHXN2sjin3vP+z6G0iu1Tj3KhbEMPsjLanT15sjCL07
        0Y8XPk9F5WMSYLVfp2o0AlqlEQMSgzieHgW5Y9T24qUmzuRYG7btOQOKk3jLRgEkTdbtTu
        ciiPvyHDzKLTvh5NXY/uxE9dpTttBeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-W9eko3ddNJq9PMAOLuqccg-1; Tue, 22 Oct 2019 06:35:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F501800D79;
        Tue, 22 Oct 2019 10:35:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7095DD61;
        Tue, 22 Oct 2019 10:35:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
References: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com> <000000000000830fe50595115344@google.com> <00000000000071e2fc05951229ad@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mimi Zohar <zohar@linux.ibm.com>
Cc:     dhowells@redhat.com,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        aou@eecs.berkeley.edu,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris James Morris <jmorris@namei.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
MIME-Version: 1.0
Content-ID: <11433.1571740533.1@warthog.procyon.org.uk>
Date:   Tue, 22 Oct 2019 11:35:33 +0100
Message-ID: <11434.1571740533@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: W9eko3ddNJq9PMAOLuqccg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > syzbot has bisected this bug to 0570bc8b7c9b ("Merge tag
> >  'riscv/for-v5.3-rc1' ...")
>=20
> Yeah, that looks unlikely. The only non-riscv changes are from
> documentation updates and moving a config variable around.
>=20
> Looks like the crash is quite unlikely, and only happens in one out of
> ten runs for the ones it has happened to.
>=20
> The backtrace looks simple enough, though:
>=20
>   RIP: 0010:refcount_inc_checked+0x2b/0x30 lib/refcount.c:156
>    __key_get include/linux/key.h:281 [inline]
>    find_key_to_update+0x67/0x80 security/keys/keyring.c:1127
>    key_create_or_update+0x4e5/0xb20 security/keys/key.c:905
>    __do_sys_add_key security/keys/keyctl.c:132 [inline]
>    __se_sys_add_key security/keys/keyctl.c:72 [inline]
>    __x64_sys_add_key+0x219/0x3f0 security/keys/keyctl.c:72
>    do_syscall_64+0xd0/0x540 arch/x86/entry/common.c:296
>    entry_SYSCALL_64_after_hwframe+0x49/0xbe
>=20
> which to me implies that there's some locking bug, and somebody
> released the key without holding a lock.

I'm wondering if this is actually a bug in the error handling in the encryp=
ted
key type.  Looking in the syzbot console log, there's a lot of output from
there prior to the crash, of which the following is an excerpt:

[  248.516746][T27381] encrypted_key: key user:syz not found
[  248.524392][T27382] encrypted_key: key user:syz not found
[  248.616141][T27392] encrypted_key: key user:syz not found
[  248.618890][T27393] encrypted_key: key user:syz not found
[  248.690844][T27404] encrypted_key: key user:syz not found
[  248.739405][T27403] encrypted_key: key user:syz not found
[  248.804881][T27417] encrypted_key: key user:syz not found
[  248.828354][T27418] encrypted_key: keyword 'new' not allowed when called=
 from .update method
[  248.925249][T27427] encrypted_key: keyword 'new' not allowed when called=
 from .update method
[  248.928200][T27415] Bad refcount user syz
[  248.934043][T27428] encrypted_key: key user:syz not found
[  248.939502][T27429] encrypted_key: key user:syz not found
[  248.968744][T27434] encrypted_key: key user:syz not found
[  248.982201][T27415] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  248.996072][T27415] BUG: KASAN: use-after-free in refcount_inc_not_zero_=
checked+0x81/0x200

Note that the "Bad refcount user syz" is a bit I patched in to print the ty=
pe
and description of the key that incurred the error.

It's a tad difficult to say exactly what's going on since I've no idea what
the syzbot reproducer is actually doing.

#{"threaded":true,"collide":true,"repeat":true,"procs":6,"sandbox":"namespa=
ce","fault_call":-1,"tun":true,"netdev":true,"resetnet":true,"cgroups":true=
,"binfmt_misc":true,"close_fds":true,"tmpdir":true,"segv":true}
perf_event_open(&(0x7f000001d000)=3D{0x1, 0x70, 0x0, 0x0, 0x0, 0x0, 0x0, 0x=
7f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x7, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0=
x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0=
x0, 0x0, 0x0, 0x0, @perf_config_ext}, 0x0, 0xffffffffffffffff, 0xffffffffff=
ffffff, 0x0)
keyctl$instantiate(0xc, 0x0, &(0x7f0000000100)=3DANY=3D[@ANYBLOB=3D'new def=
ault user:syz 04096'], 0x1, 0x0)
r0 =3D add_key(&(0x7f0000000140)=3D'encrypted\x00', &(0x7f0000000180)=3D{'s=
yz'}, &(0x7f0000000100), 0xca, 0xfffffffffffffffe)
add_key$user(&(0x7f0000000040)=3D'user\x00', &(0x7f0000000000)=3D{'syz'}, &=
(0x7f0000000440)=3D'X', 0x1, 0xfffffffffffffffe)
keyctl$read(0xb, r0, &(0x7f0000000240)=3D""/112, 0x349b7f55)

However, it looks like the encrypted key type is trying to access a user ke=
y,
so maybe there's an overput there?  I'm trying to insert more debugging, bu=
t
the test doesn't always fail.

syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:

> HEAD commit:    bc88f85c kthread: make __kthread_queue_delayed_work stati=
c
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1730584b60000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3De0ac4d9b35046=
343
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D6455648abc28dbd=
d1e7f
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11c8adab600=
000

David

