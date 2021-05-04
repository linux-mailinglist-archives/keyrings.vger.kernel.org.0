Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83C4372E5D
	for <lists+keyrings@lfdr.de>; Tue,  4 May 2021 19:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhEDRCv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 4 May 2021 13:02:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231773AbhEDRCu (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 4 May 2021 13:02:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AE786101D;
        Tue,  4 May 2021 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620147715;
        bh=f5jEOgnbHsOfDlpo88Jj2D5L5O3g0o4OFA7mG7XvBKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VXNMBP6b2+7Yp0/mUNXRSqDbMGvmGY5Jp27WbJvhrjGZpfkgCJHgatjyaNRRSRPto
         LxfXdXHQYJBrxoTPQEmrX/lOQkUSgVj7CojPqKA5ry5B2sxWElUVvKo2HYKgXl45RD
         sEAVszs/3OC3WUs9XXiYSkHRexEzigEAdrJenR7VPlfF9Vd3OXt6ZWKjAM8PabyBDd
         9KRYJ0bHfp0sIa+tFzDajPDDkX0FNOMmVA4kPPQVWxU3QgA+hfPOaqBZoB+0L6YJDL
         C2voEXXa8rf8OCPagPFTQyGDUB6ZXTG6ZtV1BHK+TKaVcErcyIWF1eUUIpLFbrjn0n
         v+DF+xJvGX0nw==
Date:   Tue, 4 May 2021 10:01:54 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     syzbot <syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com>,
        David Howells <dhowells@redhat.com>, jarkko@kernel.org,
        jmorris@namei.org, keyrings@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] KCSAN: data-race in assoc_array_apply_edit /
 search_nested_keyrings
Message-ID: <YJF+AiEM3K8VRkk3@gmail.com>
References: <000000000000c224d005c17f7142@google.com>
 <CANpmjNOJ3Yhu77mU-8WvYFSnFgCYhctkCcTZhwpO5jrMzPejtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOJ3Yhu77mU-8WvYFSnFgCYhctkCcTZhwpO5jrMzPejtA@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, May 04, 2021 at 01:38:20PM +0200, 'Marco Elver' via syzkaller-bugs wrote:
> Hello,
> 
> On Tue, 4 May 2021 at 13:33, syzbot
> <syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com> wrote:
> > HEAD commit:    5e321ded Merge tag 'for-5.13/parisc' of git://git.kernel.o..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=111cafb9d00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a4da2ebcb6e8f526
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e4eb6db47eb0f80308c6
> > compiler:       Debian clang version 11.0.1-2
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KCSAN: data-race in assoc_array_apply_edit / search_nested_keyrings
> >
> > write to 0xffff8881065ffc10 of 8 bytes by task 30966 on cpu 1:
> >  assoc_array_apply_edit+0x3e/0x660 lib/assoc_array.c:1357
> >  __key_link+0x8a/0xc0 security/keys/keyring.c:1372
> >  __key_instantiate_and_link+0x15b/0x290 security/keys/key.c:459
> >  key_create_or_update+0x750/0x990 security/keys/key.c:941
> >  __do_sys_add_key security/keys/keyctl.c:134 [inline]
> >  __se_sys_add_key+0x26f/0x300 security/keys/keyctl.c:74
> >  __x64_sys_add_key+0x63/0x70 security/keys/keyctl.c:74
> >  do_syscall_64+0x4a/0x90 arch/x86/entry/common.c:47
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > read to 0xffff8881065ffc10 of 8 bytes by task 30971 on cpu 0:
> >  search_nested_keyrings+0x34f/0x920 security/keys/keyring.c:751
> >  keyring_search_rcu+0xf4/0x180 security/keys/keyring.c:922
> >  search_cred_keyrings_rcu+0x135/0x240 security/keys/process_keys.c:480
> >  search_process_keyrings_rcu security/keys/process_keys.c:544 [inline]
> >  lookup_user_key+0xab6/0xd40 security/keys/process_keys.c:762
> >  __do_sys_add_key security/keys/keyctl.c:126 [inline]
> >  __se_sys_add_key+0x23a/0x300 security/keys/keyctl.c:74
> >  __x64_sys_add_key+0x63/0x70 security/keys/keyctl.c:74
> >  do_syscall_64+0x4a/0x90 arch/x86/entry/common.c:47
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> I found this interesting because the code around
> security/keys/keyring.c:751 is diligent in marking concurrency
> accesses with READ_ONCE(). So on the off-chance there is unexpected
> concurrency here, I thought it'd be worth double-checking as I wasn't
> able to conclude if this is just missing a READ_ONCE().
> 
> Thank you!
> 

It looks more like the problem is missing WRITE_ONCE(), not READ_ONCE().

smp_store_release() would also handle this properly, without the need for the
explicit smp_wmb().

- Eric
