Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E418CDC315
	for <lists+keyrings@lfdr.de>; Fri, 18 Oct 2019 12:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393097AbfJRKyY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Oct 2019 06:54:24 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:62409 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392070AbfJRKyY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 18 Oct 2019 06:54:24 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x9IAsC3W078907;
        Fri, 18 Oct 2019 19:54:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Fri, 18 Oct 2019 19:54:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126227201116.bbtec.net [126.227.201.116])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x9IAs7gO078895
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Fri, 18 Oct 2019 19:54:12 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: WARNING: refcount bug in find_key_to_update
To:     Eric Biggers <ebiggers@kernel.org>
References: <000000000000830fe50595115344@google.com>
 <00000000000071e2fc05951229ad@google.com>
 <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
 <20191017160028.GA726@sol.localdomain>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <b211005b-75de-7936-c97a-817f7100415a@I-love.SAKURA.ne.jp>
Date:   Fri, 18 Oct 2019 19:54:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017160028.GA726@sol.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2019/10/18 1:00, Eric Biggers wrote:
> The key is supposed to have refcount >= 1 since it's in a keyring.
> So some bug is causing it to have refcount 0.  Perhaps some place calling
> key_put() too many times.
> 
> Unfortunately I can't get the reproducer to work locally.
> 
> Note that there are 2 other syzbot reports that look related.
> No reproducers for them, though:
> 
> Title:              KASAN: use-after-free Read in key_put
> Last occurred:      1 day ago
> Reported:           28 days ago
> Branches:           Mainline
> Dashboard link:     https://syzkaller.appspot.com/bug?id=f13750b1124e01191250cf930086dcc40740fa30
> Original thread:    https://lore.kernel.org/lkml/0000000000008c3e590592cf4b7f@google.com/T/#u
> 
> Title:              KASAN: use-after-free Read in keyring_compare_object
> Last occurred:      49 days ago
> Reported:           84 days ago
> Branches:           Mainline
> Dashboard link:     https://syzkaller.appspot.com/bug?id=529ab6a98286c2a97c445988a62760a58d4a1d4b
> Original thread:    https://lore.kernel.org/lkml/000000000000038ef6058e6f3592@google.com/T/#u
> 

I don't know about keys, but I rather suspect lack of serialization locks between
"looking up for checking existing keys" versus "looking up for garbage collection".
Can we dump locks held by current thread when panic() is called?

