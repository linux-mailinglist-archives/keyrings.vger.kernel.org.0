Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5BAE04B2
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2019 15:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389223AbfJVNRs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Oct 2019 09:17:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42222 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389221AbfJVNRs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Oct 2019 09:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571750266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=efljvJ2w2MdjEO93WQa9AoZJv0D+nIyDWGfcRPbJ1Lo=;
        b=I46S3I2Kg8s9JJT5urqKeI/DLMb1CaIVpy4w1dn6sabF8+A6ey4wpiJAcva95x1QDPqORq
        WCiSDzKeEtp3/0m2/YqCCDUPKAmH5pfJ50X5OnLVmLkwL7EzRlbHWnjozhVltKa4Y7RXr2
        F5fTLGerNX6moC9ki7HD8uPJ2TqRBIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-HLyXQWEwMU2neTojI_a1xg-1; Tue, 22 Oct 2019 09:17:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38012800D4E;
        Tue, 22 Oct 2019 13:17:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-40.rdu2.redhat.com [10.10.121.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CAEDD1001B20;
        Tue, 22 Oct 2019 13:17:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <11434.1571740533@warthog.procyon.org.uk>
References: <11434.1571740533@warthog.procyon.org.uk> <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com> <000000000000830fe50595115344@google.com> <00000000000071e2fc05951229ad@google.com>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     dhowells@redhat.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
Content-ID: <24776.1571750256.1@warthog.procyon.org.uk>
Date:   Tue, 22 Oct 2019 14:17:36 +0100
Message-ID: <24777.1571750256@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: HLyXQWEwMU2neTojI_a1xg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Okay, I managed to catch a backtrace for this line:

=09encrypted_key: key user:syz not found (-126)

looking like:

=09CPU: 0 PID: 8878 Comm: syz-executor.0 Not tainted 5.4.0-rc3+ #0
=09Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS =
Google 01/01/2011
=09Call Trace:
=09 dump_stack+0x172/0x1f0
=09 request_master_key.isra.0.cold+0x62/0xc3
=09 encrypted_read+0x221/0x830
=09 ? get_derived_key+0xf0/0xf0
=09 ? keyctl_read_key+0x1c2/0x2b0
=09 ? __kasan_check_write+0x14/0x20
=09 ? down_read+0x109/0x430
=09 ? security_key_permission+0x8d/0xc0
=09 ? down_read_killable+0x490/0x490
=09 ? key_task_permission+0x1b5/0x3a0
=09 keyctl_read_key+0x231/0x2b0
=09 __x64_sys_keyctl+0x171/0x470
=09 do_syscall_64+0xfa/0x760
=09entry_SYSCALL_64_after_hwframe+0x49/0xbe

So something somewhere is calling keyctl_read() in userspace on the encrypt=
ed
key and that is then referring across to the user key added.

Also, the encrypted key is being given the following payload:

=09ENCRYPTED: 'new default user:syz 04096'

in at least one of the cases that encrypted_update() being called.

David

