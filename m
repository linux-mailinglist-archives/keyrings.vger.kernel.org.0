Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6061C3159
	for <lists+keyrings@lfdr.de>; Mon,  4 May 2020 04:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgEDC5d (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 3 May 2020 22:57:33 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36029 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726377AbgEDC5d (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 3 May 2020 22:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588561052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gF7rcvELgQd39eUzjQBEmRMoEPlsByjPKGkWb8q9nQI=;
        b=R4djuxqbl4X70PFFn7aCBoT4Mv2HXBAhF/csEQl+eaXkoKcSyeGfJo0fhGqQ/k7C8PMXZF
        70Ptay5Zko7xuGsQj5QSHIjRmjPM+dpuAACABwU4xvLWLc8lv3HyC8oukbvWs0XDNOmMoh
        xg4RQa3M7rL4TxcSp2+AmVm3R2JCrnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-aDfPBMSwPrKk4IKjU-8VMQ-1; Sun, 03 May 2020 22:57:28 -0400
X-MC-Unique: aDfPBMSwPrKk4IKjU-8VMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC57107ACCA;
        Mon,  4 May 2020 02:57:26 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-227.rdu2.redhat.com [10.10.112.227])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EA5B860BF3;
        Mon,  4 May 2020 02:57:23 +0000 (UTC)
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
References: <20200407200318.11711-1-longman@redhat.com>
 <20200501232224.GC915@sol.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <82fbc32f-3f9e-b876-b998-7714e8597988@redhat.com>
Date:   Sun, 3 May 2020 22:57:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200501232224.GC915@sol.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/1/20 7:22 PM, Eric Biggers wrote:
> On Tue, Apr 07, 2020 at 04:03:18PM -0400, Waiman Long wrote:
>> For kvmalloc'ed data object that contains sensitive information like
>> cryptographic key, we need to make sure that the buffer is always
>> cleared before freeing it. Using memset() alone for buffer clearing may
>> not provide certainty as the compiler may compile it away. To be sure,
>> the special memzero_explicit() has to be used.
>>
>> This patch introduces a new kvfree_sensitive() for freeing those
>> sensitive data objects allocated by kvmalloc(). The relevnat places
>> where kvfree_sensitive() can be used are modified to use it.
>>
>> Fixes: 4f0882491a14 ("KEYS: Avoid false positive ENOMEM error on key read")
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Waiman Long <longman@redhat.com>
> Looks good, feel free to add:
>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
>
> (I don't really buy the argument that the compiler could compile away memset()
> before kvfree().  But I agree with using memzero_explicit() anyway to make the
> intent explicit.)
>
> I don't see this patch in linux-next yet.  Who is planning to take this patch?
> Presumably David through the keyrings tree, or Andrew through mm?
>
> - Eric
>
Andrew, would you mind taking this patch into the mm-tree?

Thanks,
Longman

