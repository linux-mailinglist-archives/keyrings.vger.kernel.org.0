Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2377A1D6F06
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 04:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgERCjt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 17 May 2020 22:39:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59901 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726675AbgERCjs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 17 May 2020 22:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589769585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7BmqVj8mU9rcSdcf5+RisNrhRwO2BSlPP3QfZ4VXAm0=;
        b=BQmjIYBtTw/i6ABY9zU95QfY1qNO51PLKDg12zrgcX4SctEJyoySDg9r2PaTGyEDINAELu
        FchIgn3bS00nGGrhK186rv4ocVaYYCDRGQR3Dvd6viC3epZ82auKv4tZAZ4RCx4tZ7k9Wt
        KIttcKcR+TsJ1hvERIH3M3fA2KINnsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-ltZH9LsiM3eX2tKIFqX5iw-1; Sun, 17 May 2020 22:39:43 -0400
X-MC-Unique: ltZH9LsiM3eX2tKIFqX5iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F4711800D42;
        Mon, 18 May 2020 02:39:41 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-120.rdu2.redhat.com [10.10.112.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 260985C1B2;
        Mon, 18 May 2020 02:39:39 +0000 (UTC)
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Balbir Singh <bsingharora@gmail.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        David Rientjes <rientjes@google.com>
References: <20200407200318.11711-1-longman@redhat.com>
 <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
 <20200514120018.GA16070@bombadil.infradead.org>
 <f779dea1-3b50-e354-3914-7394b4473f5b@gmail.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <365c8e0c-5d92-f032-b9ff-f64a8d314dfe@redhat.com>
Date:   Sun, 17 May 2020 22:39:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f779dea1-3b50-e354-3914-7394b4473f5b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/16/20 8:27 PM, Balbir Singh wrote:
>
> On 14/5/20 10:00 pm, Matthew Wilcox wrote:
>> On Thu, May 14, 2020 at 09:00:40PM +1000, Balbir Singh wrote:
>>> I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.
>>>
>>> void kvfree_sensitive(const void *addr, size_t len)
>>> {
>>> 	preempt_disable();
>>> 	if (likely(!ZERO_OR_NULL_PTR(addr))) {
>>> 		memzero_explicit((void *)addr, len);
>>> 		kvfree(addr);
>>> 	}
>>> 	preempt_enable();
>>> }
>>> EXPORT_SYMBOL(kvfree_sensitive);
>> If it's _that_ sensitive then the caller should have disabled preemption.
>> Because preemption could otherwise have occurred immediately before
>> kvfree_sensitive() was called.
>>
> May be, but the callers of the API have to be explictly aware of the contract.
> I don't disagree with you on what you've said, but I was referring to the
> intent of freeing sensitive data vs the turn around time for doing so.

We can't disable preemption like that. The vfree() call may potentially 
sleep. It could be a mess to keep track of the preemption state to make 
that works.

The purpose of this API is to make sure that a newly allocated memory 
block won't contain secret left behind from another task. There is no 
guarantee on how long the freeing process will take.

Cheers,
Longman

