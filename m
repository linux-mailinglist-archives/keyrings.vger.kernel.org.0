Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B04DB190
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2019 17:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731326AbfJQPx1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 17 Oct 2019 11:53:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46775 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392967AbfJQPx0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 17 Oct 2019 11:53:26 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so3072859ljl.13
        for <keyrings@vger.kernel.org>; Thu, 17 Oct 2019 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIzDy9DTfDNRhN7LSYB97ye4DVyGrDXll/MmImkgT6U=;
        b=BVpF6LyRGlHDFAruswmAHbv0+pLGUbDhV9wcN5xE8WS8g+zUh4x5jXcUYAsmzaIB6g
         YMEX8gjoO+3WdmFLQuP7Ko+nM3JcFnx6Odu1iLGo112V8bGqq9akNkXniU0XB2vYqP2h
         zo3E/L5G8PzgPvTprfyPmfiSP4luH/eHr1DuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIzDy9DTfDNRhN7LSYB97ye4DVyGrDXll/MmImkgT6U=;
        b=kM/uQUl7gO8iJA7E1AAyX2x4YdHltmtJ0xIJBfhXmc1pg9fxNBSx2wJf2B/D2heQ26
         wTpLqIsGG6oF+tY5/KVTpQg59DWNETxWvNvo9z6OpMu+jllqu3+2RrApl1oY/0U7WmxE
         5zTy+e/hG8SoiFXEeVl2cijnmhzSr1NBkOM8+Epj1VAxx0qiVWuxzSllRilE4g7wqlSZ
         6d3m71P4OiNybsTg9hg8gOCNbVTFnEwe+pP25R4an0Tt7oqcOX6Ad1PboGSAZjvrkrmR
         EgzDRsZsytL1zwV5GJ3YkcDEbH9eXOI/qD27Ba93ITYxeDHFatFWtlxjiMivuDqtJ2GK
         dp7w==
X-Gm-Message-State: APjAAAVWQFVsAf62l3sy+HWoabsCZr6kxvrERhRe68dkSDhEWjmwfrsx
        TIXjaLMfQrvUSps10KCR/dZ9l2vvx7c=
X-Google-Smtp-Source: APXvYqyxY0A0lLHYCQYBf9QK6getUS6TC/kSm5+mnVqzLkpD3WMjK2nmzNY4purLa95+ZO0+/ggxVQ==
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr3002279ljh.2.1571327604368;
        Thu, 17 Oct 2019 08:53:24 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id j84sm1345517ljb.91.2019.10.17.08.53.23
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 08:53:23 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id r22so2320621lfm.1
        for <keyrings@vger.kernel.org>; Thu, 17 Oct 2019 08:53:23 -0700 (PDT)
X-Received: by 2002:a19:5504:: with SMTP id n4mr2890741lfe.106.1571327602667;
 Thu, 17 Oct 2019 08:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000830fe50595115344@google.com> <00000000000071e2fc05951229ad@google.com>
In-Reply-To: <00000000000071e2fc05951229ad@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Oct 2019 08:53:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
Message-ID: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
To:     syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
Cc:     aou@eecs.berkeley.edu, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris James Morris <jmorris@namei.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Oct 16, 2019 at 7:42 PM syzbot
<syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to 0570bc8b7c9b ("Merge tag
>  'riscv/for-v5.3-rc1' ...")

Yeah, that looks unlikely. The only non-riscv changes are from
documentation updates and moving a config variable around.

Looks like the crash is quite unlikely, and only happens in one out of
ten runs for the ones it has happened to.

The backtrace looks simple enough, though:

  RIP: 0010:refcount_inc_checked+0x2b/0x30 lib/refcount.c:156
   __key_get include/linux/key.h:281 [inline]
   find_key_to_update+0x67/0x80 security/keys/keyring.c:1127
   key_create_or_update+0x4e5/0xb20 security/keys/key.c:905
   __do_sys_add_key security/keys/keyctl.c:132 [inline]
   __se_sys_add_key security/keys/keyctl.c:72 [inline]
   __x64_sys_add_key+0x219/0x3f0 security/keys/keyctl.c:72
   do_syscall_64+0xd0/0x540 arch/x86/entry/common.c:296
   entry_SYSCALL_64_after_hwframe+0x49/0xbe

which to me implies that there's some locking bug, and somebody
released the key without holding a lock.

That code looks a bit confused to me. Releasing a key without holding
a lock looks permitted, but if that's the case then __key_get() is
complete garbage. It would need to use 'refcount_inc_not_zero()' and
failure would require failing the caller.

But I haven't followed the key locking rules, so who knows. That "put
without lock" scenario would explain the crash, though.

David?

              Linus
