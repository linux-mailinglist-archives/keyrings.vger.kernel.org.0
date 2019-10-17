Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FABDA3F3
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2019 04:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392149AbfJQCmB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Oct 2019 22:42:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:37443 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbfJQCmB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 16 Oct 2019 22:42:01 -0400
Received: by mail-io1-f69.google.com with SMTP id u18so1232726ioc.4
        for <keyrings@vger.kernel.org>; Wed, 16 Oct 2019 19:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7h0gQqNrYRzsWj9R4CAYCu9XOxzaPAZTOTXlm38+fvI=;
        b=P3Nxu+OnPoXFsOYwskId+esKh185iyu8WzTLumEBtXND3Anc5+8zkvuMsYXDkfEv+N
         Gr5lnPTyDUE0fyut557iN8/v2iv7Y2SZnkA7XzZtcYmyjqJayAU3lygMKArgFwpe4YfY
         ML9Ui/92CMelbCnUIUQvp2S2E9K9aJmlSflOhY7rGU0YupCRBQ865iebJy0IN9urut+s
         8ZvABodmV8kMUD8ACwD5pKPNdGjgUbSsHzxKomxC5UPFLcC/1dbVF9559E9Ra7RR+Kek
         UDhH+a7pwUIT/JmeGeq3Cmk1/Pt2ke8JCLwJcF2lLa87qkiTsMn8iw2ZqXjd1OT8t0Z8
         vwkw==
X-Gm-Message-State: APjAAAU0dZgnzsIzmWmUc8ntj0KJSDkRxR+fdLtZ4u29x8FebxIecAR3
        6xsn75qHw64kzLkxqKQq9iOsYrTohCZ0I0okAp+8CRYI/O+B
X-Google-Smtp-Source: APXvYqxm/PZKRcr2VOn2bSEPROOTxJZd4s/gFYz6yxRyhamcXwHcbHmC0uB12SwLAgbX/bUP1WUzw8YXMpgkcwGIQdZ6LiO9FDXe
MIME-Version: 1.0
X-Received: by 2002:a92:3b8b:: with SMTP id n11mr1162464ilh.135.1571280120830;
 Wed, 16 Oct 2019 19:42:00 -0700 (PDT)
Date:   Wed, 16 Oct 2019 19:42:00 -0700
In-Reply-To: <000000000000830fe50595115344@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000071e2fc05951229ad@google.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
From:   syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
To:     aou@eecs.berkeley.edu, dhowells@redhat.com,
        jarkko.sakkinen@linux.intel.com, jmorris@namei.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        linux-security-module@vger.kernel.org, palmer@sifive.com,
        serge@hallyn.com, syzkaller-bugs@googlegroups.com,
        torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

syzbot has bisected this bug to:

commit 0570bc8b7c9b41deba6f61ac218922e7168ad648
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 18 19:26:59 2019 +0000

     Merge tag 'riscv/for-v5.3-rc1' of  
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11b6e2bb600000
start commit:   bc88f85c kthread: make __kthread_queue_delayed_work static
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=13b6e2bb600000
console output: https://syzkaller.appspot.com/x/log.txt?x=15b6e2bb600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0ac4d9b35046343
dashboard link: https://syzkaller.appspot.com/bug?extid=6455648abc28dbdd1e7f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c8adab600000

Reported-by: syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com
Fixes: 0570bc8b7c9b ("Merge tag 'riscv/for-v5.3-rc1' of  
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
