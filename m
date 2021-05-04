Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498A0372999
	for <lists+keyrings@lfdr.de>; Tue,  4 May 2021 13:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhEDLj2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 4 May 2021 07:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhEDLj1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 4 May 2021 07:39:27 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E63C061574
        for <keyrings@vger.kernel.org>; Tue,  4 May 2021 04:38:32 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so7870581otf.12
        for <keyrings@vger.kernel.org>; Tue, 04 May 2021 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3IBg+3xHlp7KCtTOCeDpvgve7su0wYZJK0fbkVffQa8=;
        b=eEc4NUvhm8+zBVJUmsjvROxGHf3CKqo/L2gXvEP2CfCNR4dG/Ln/eS/+hjudLwIBKo
         Kbm42dusWsA98DpvTuKuuRBoWtuGnUeM/R3wjZKHWtsak59HeOkulo0v3phcelEabiR5
         OZLjzqO0agaGKCWYfIpmXrojGJNDEVoxODjgyj4VZUHG94odklMmJJ/BkcOmNfRlgeBu
         voQCaNlgUqwaVLf/91HIzJoknHAPmMe0F/gwc6UnlqMoyH+2kxA3xKhikjbyqCyZk3c9
         QoctFr4ZUCgoEpq8/DLdiT7sGQ1oSr+0UjdLFPNpFkXCefsWDQW4GvKBzgtC8IT7h52O
         dIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3IBg+3xHlp7KCtTOCeDpvgve7su0wYZJK0fbkVffQa8=;
        b=XxitRUPpJylkprzK59ZYjt8d2xKNqm7/v+RYtGYkwgM+qm30C3HsmRv85oeFbvGzhp
         ZB1oxMacj9pF1iP7otcV3KkLMUDKOe5wAF3tM0dZBc4hVf1eJ+J4dmnHNk/rI/2jXNEA
         +s+Ouke7/9MClRc7bN+2glmWnp1qLwPgPX4aFYUHPQeXcEi5rpO4Z9RAG51a2DwiXOGM
         EUcqzyaDCD4evsmWFuXnFQzeQ8c8OgqOxXPF/HgRtLFASCqJpvCo8KlPzWjlqDGU3ipc
         1NC2ieJwc8r4KNqIekw2QUL5JGJp62KPMjBcrAaAEeZeJpq2mqjlZ2HDc9E059Widz/6
         1xyw==
X-Gm-Message-State: AOAM532RDkpxLD00M3F38w+q3132UfUkhS0CdUKyOoYXMyG+RQRaq2zL
        I7Bpz7ydvCtgsW/8KzpQF/IU5SWtFzBkWCdm4Fl2vg==
X-Google-Smtp-Source: ABdhPJyB5cemuiOsogZzl3QtTmE/v6UC8qz33AhNswXYM+GgF5hjXJszIcBSWPbUq7EfabC1SXjizsym69NIaWFiC3E=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr19501532otn.233.1620128311976;
 Tue, 04 May 2021 04:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c224d005c17f7142@google.com>
In-Reply-To: <000000000000c224d005c17f7142@google.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 4 May 2021 13:38:20 +0200
Message-ID: <CANpmjNOJ3Yhu77mU-8WvYFSnFgCYhctkCcTZhwpO5jrMzPejtA@mail.gmail.com>
Subject: Re: [syzbot] KCSAN: data-race in assoc_array_apply_edit / search_nested_keyrings
To:     syzbot <syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com>
Cc:     David Howells <dhowells@redhat.com>, jarkko@kernel.org,
        jmorris@namei.org, keyrings@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

On Tue, 4 May 2021 at 13:33, syzbot
<syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com> wrote:
> HEAD commit:    5e321ded Merge tag 'for-5.13/parisc' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=111cafb9d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a4da2ebcb6e8f526
> dashboard link: https://syzkaller.appspot.com/bug?extid=e4eb6db47eb0f80308c6
> compiler:       Debian clang version 11.0.1-2
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e4eb6db47eb0f80308c6@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in assoc_array_apply_edit / search_nested_keyrings
>
> write to 0xffff8881065ffc10 of 8 bytes by task 30966 on cpu 1:
>  assoc_array_apply_edit+0x3e/0x660 lib/assoc_array.c:1357
>  __key_link+0x8a/0xc0 security/keys/keyring.c:1372
>  __key_instantiate_and_link+0x15b/0x290 security/keys/key.c:459
>  key_create_or_update+0x750/0x990 security/keys/key.c:941
>  __do_sys_add_key security/keys/keyctl.c:134 [inline]
>  __se_sys_add_key+0x26f/0x300 security/keys/keyctl.c:74
>  __x64_sys_add_key+0x63/0x70 security/keys/keyctl.c:74
>  do_syscall_64+0x4a/0x90 arch/x86/entry/common.c:47
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> read to 0xffff8881065ffc10 of 8 bytes by task 30971 on cpu 0:
>  search_nested_keyrings+0x34f/0x920 security/keys/keyring.c:751
>  keyring_search_rcu+0xf4/0x180 security/keys/keyring.c:922
>  search_cred_keyrings_rcu+0x135/0x240 security/keys/process_keys.c:480
>  search_process_keyrings_rcu security/keys/process_keys.c:544 [inline]
>  lookup_user_key+0xab6/0xd40 security/keys/process_keys.c:762
>  __do_sys_add_key security/keys/keyctl.c:126 [inline]
>  __se_sys_add_key+0x23a/0x300 security/keys/keyctl.c:74
>  __x64_sys_add_key+0x63/0x70 security/keys/keyctl.c:74
>  do_syscall_64+0x4a/0x90 arch/x86/entry/common.c:47
>  entry_SYSCALL_64_after_hwframe+0x44/0xae

I found this interesting because the code around
security/keys/keyring.c:751 is diligent in marking concurrency
accesses with READ_ONCE(). So on the off-chance there is unexpected
concurrency here, I thought it'd be worth double-checking as I wasn't
able to conclude if this is just missing a READ_ONCE().

Thank you!
