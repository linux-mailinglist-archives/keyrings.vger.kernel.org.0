Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A771C6581
	for <lists+keyrings@lfdr.de>; Wed,  6 May 2020 03:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgEFBaI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 May 2020 21:30:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32730 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgEFBaH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 May 2020 21:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588728606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ry4pmb+CcaKZ10VLlnYCO1BgZINspRaHQ7kzZcdb4LU=;
        b=DTNgLPU9AA3MK0XRpuMljIpErDyih/e0Z8gIo1XHXAYE2o32v0odvPGyW9mJzR29uwY8SO
        wfJOJcg83CAlPhfHWZUK0IPZRjSxjjcv8MSLM9GuxEFI3pB26W+u/og4ondihBQ7Pp293N
        1v/Wlil5jVbYKlL2JUScnXHMvi/Zg7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-MH1bKyHUMeGmmSWOVXDl2w-1; Tue, 05 May 2020 21:30:03 -0400
X-MC-Unique: MH1bKyHUMeGmmSWOVXDl2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BB78014D7;
        Wed,  6 May 2020 01:30:01 +0000 (UTC)
Received: from llong.remote.csb (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC8F5C1BD;
        Wed,  6 May 2020 01:29:59 +0000 (UTC)
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
References: <694135.1586290793@warthog.procyon.org.uk>
 <20200407200318.11711-1-longman@redhat.com>
 <694340.1586290917@warthog.procyon.org.uk>
 <20200505133521.eb8901d0b92e09452191ab49@linux-foundation.org>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <3be0ef1d-fe7f-6b02-d9c0-c6b750fd94f3@redhat.com>
Date:   Tue, 5 May 2020 21:29:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200505133521.eb8901d0b92e09452191ab49@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/5/20 4:35 PM, Andrew Morton wrote:
> On Tue, 07 Apr 2020 21:21:57 +0100 David Howells <dhowells@redhat.com> =
wrote:
>
>> David Howells <dhowells@redhat.com> wrote:
>>
>>>>   			if (unlikely(key_data))
>>>> -				__kvzfree(key_data, key_data_len);
>>>> +				kvfree_sensitive(key_data, key_data_len);
>>> I think the if-statement is redundant.
>> Ah - I see that you explicitly wanted to keep it.
> Why's that?

There is a comment above it:

 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /*
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * The key may change (u=
nlikely) in between 2 consecutive
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * __keyctl_read_key() c=
alls. In this case, we reallocate
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * a larger buffer and r=
edo the key read when
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * key_data_len < ret <=3D=
 buflen.
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret > key_data_len) {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if=
 (unlikely(key_data))
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 __kvzfree(key_data, key_data_len);

key_data will be defined only if the unlikely case that the key increase=20
in length between the 2 consecutive __keyctl_read_key() call and we have=20
to enlarge the buffer and read the key again. I want to keep the=20
unlikely() macro to emphasize the fact that this condition should not=20
happen.

>> There's a good chance it'll get janitored at some point.
> Indeed.  Perhaps add a few little comments to explain the reasoning and
> to keep the janitorial fingers away?
>
I can reword the comment to make it more explicit and send a v4 if you=20
think the current comment is not clear enough.

Cheers,
Longman

