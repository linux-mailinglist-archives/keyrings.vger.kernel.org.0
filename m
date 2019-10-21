Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBCBDF1EC
	for <lists+keyrings@lfdr.de>; Mon, 21 Oct 2019 17:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbfJUPqZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 21 Oct 2019 11:46:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27168 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729431AbfJUPqZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 21 Oct 2019 11:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571672784;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2lkud/2TuzM7NRL3rKWrW5AaADyBWycW62jzc8xlk8I=;
        b=ZdcZ2WvkziNPTXPI48e8tX7DQFUJwnZFHWhu7+xy8VsoZBoaphCeaeEZys5L1LXtKdKV5A
        sC51eMvMWKvTTHr7+nqDyRaSIw3o+6M53NcQ/1VuSgJPwK6VotP33mQF4s4nqSeP3roAVs
        cQYcF/8o6EXH1d1QF+ThaftvRcNDAII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-bkuGxsfZNyqjQfSe_fmrHA-1; Mon, 21 Oct 2019 11:46:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 445EA47B;
        Mon, 21 Oct 2019 15:46:19 +0000 (UTC)
Received: from crecklin.bos.csb (ovpn-125-176.rdu2.redhat.com [10.10.125.176])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 932254144;
        Mon, 21 Oct 2019 15:46:16 +0000 (UTC)
Reply-To: crecklin@redhat.com
Subject: Re: [PATCH] security/keyring: avoid pagefaults in
 keyring_read_iterator
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>
References: <20191018184030.8407-1-crecklin@redhat.com>
 <30309.1571667719@warthog.procyon.org.uk>
From:   Chris von Recklinghausen <crecklin@redhat.com>
Organization: Red Hat
Message-ID: <b8aa0f7c-0a90-efae-9fb7-aa85b19a0d9a@redhat.com>
Date:   Mon, 21 Oct 2019 11:46:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <30309.1571667719@warthog.procyon.org.uk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: bkuGxsfZNyqjQfSe_fmrHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 10/21/2019 10:21 AM, David Howells wrote:
> Chris von Recklinghausen <crecklin@redhat.com> wrote:
>
>> The put_user call from keyring_read_iterator caused a page fault which
>> attempts to lock mm->mmap_sem and type->lock_class (key->sem) in the rev=
erse
>> order that keyring_read_iterator did, thus causing the circular locking
>> dependency.
>>
>> Remedy this by using access_ok and __put_user instead of put_user so we'=
ll
>> return an error instead of faulting in the page.
> I wonder if it's better to create a kernel buffer outside of the lock in
> keyctl_read_key().  Hmmm...  The reason I didn't want to do that is that
> keyrings have don't have limits on the size.  Maybe that's not actually a
> problem, since 1MiB would be able to hold a list of a quarter of a millio=
n
> keys.
>
> David
>

Hi David,

Thanks for the feedback.

I can try to prototype that, but regardless of where the kernel buffer
is allocated, the important part is causing the initial pagefault in the
read path outside the lock so __put_user won't fail due to a valid user
address but page backing the user address isn't in-core.

I'll start work on v2.

Thanks,

Chris

