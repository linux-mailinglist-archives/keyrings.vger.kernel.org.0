Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50119E8CE
	for <lists+keyrings@lfdr.de>; Sun,  5 Apr 2020 05:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgDEDLE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 4 Apr 2020 23:11:04 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36622 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726307AbgDEDLE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 4 Apr 2020 23:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586056263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EG5ytn3q4cjrK4N/hwUftqYJUijBPztWPiSrSQnYoRI=;
        b=OA7iB1Dm1pXRGyEi5r57zEPfUlGkNIVURBO68AK6OP9XW7XyzKh1jaQdKC/OBCqPFqvGt8
        zyhnA3XQCHgLMdsleZqr/QTVx74fTDmiY2DmFr+cHy2yVL4s/A2K7PDFlJwHPblA4K0WJm
        w/bCvGQKylxwrzONxZyhVgcX5hVFw9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-5rHQ2HdINEyC9VBzDOicDQ-1; Sat, 04 Apr 2020 23:11:01 -0400
X-MC-Unique: 5rHQ2HdINEyC9VBzDOicDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3A9A100551A;
        Sun,  5 Apr 2020 03:10:59 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-153.rdu2.redhat.com [10.10.112.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D4B2D1001B09;
        Sun,  5 Apr 2020 03:10:57 +0000 (UTC)
Subject: Re: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1437197.1585570598@warthog.procyon.org.uk>
 <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <78ff6e5d-9643-8798-09cb-65b1415140be@redhat.com>
Date:   Sat, 4 Apr 2020 23:10:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/4/20 4:00 PM, Linus Torvalds wrote:
> On Mon, Mar 30, 2020 at 5:16 AM David Howells <dhowells@redhat.com> wrote:
>>  security/keys/internal.h                  |  12 ++++
> This isn't so much about this pull (which I have taken), as about the
> fact that this code re-inforces bad behavior we already in the slub
> layer, and now extends it further to kvfree.
>
> Doing this:
>
>
>    __kvzfree(const void *addr, size_t len)
>   ..
>                 memset((void *)addr, 0, len);
>                 kvfree(addr);
>
> is wrong to begin with. It's wrong because if the compiler ever knows
> that kvfree is a freeing function (with something like
> __attribute__((free)) - I don't think gcc is smart enough today), the
> compiler might throw the memset away.
>
> Yeah, so far we've only seen that for automatic stack clearing, but
> there are very much compilers that know that alloc/free are special
> (both for warning about use-after-free issues, and for "improving"
> code generation by blindly removing dead writes).
>
> We have a function for clearing sensitive information: it's called
> "memclear_explicit()", and it's about forced (explicit) clearing even
> if the data might look dead afterwards.
>
> The other problem with that function is the name: "__kvzfree()" is not
> a useful name for this function. We use the "__" format for internal
> low-level helpers, and it generally means that it does *less* than the
> full function. This does more, not less, and "__" is not following any
> sane naming model.
>
> So the name should probably be something like "kvfree_sensitive()" or
> similar. Or maybe it could go even further, and talk about _why_ it's
> sensitive, and call it "kvfree_cleartext()" or something like that.
>
> Because the clearing is really not what even matters. It might choose
> other patterns to overwrite things with, but it might do other things
> too, like putting special barriers for data leakage (or flags to tell
> return-to-user-mode to do so).
>
> And yes, kzfree() isn't a good name either, and had that same
> memset(), but at least it doesn't do the dual-underscore mistake.
>
> Including some kzfree()/crypto people explicitly - I hope we can get
> away from this incorrect and actively wrong pattern of thinking that
> "sensitive data should be memset(), and then we should add a random
> 'z' in the name somewhere to 'document' that".
>
>                Linus
>
Thanks for the suggestion, I will post a patch to rename the function to
kvzfree_explicit() and use memzero_explicit() for clearing memory.

Cheers,
Longman

