Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75063188CDB
	for <lists+keyrings@lfdr.de>; Tue, 17 Mar 2020 19:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCQSK3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 17 Mar 2020 14:10:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:33499 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbgCQSK3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 17 Mar 2020 14:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584468628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jC00Z6qh/Tdo08cJHrlqWaLr117ZyFvx6URUV4dogZI=;
        b=CKs3MyoNKOAcbNLUB3mFISrtZNeL8ZVhA8uNue0e2bQgdUkcMEwDN0yyHdmLBbL4l4nhgv
        5EDwxfX2jRPtmfPFZ280kjY6X3q9yGw7sXoXEe6YL5QIvqIG0ECBOWyDgxq77nkiq7NWeg
        3dq0OT/xJYpcQS9w+Q4q3zWAEKd+H34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-KdywSIv7MtWkzjLf9Kj5ng-1; Tue, 17 Mar 2020 14:10:26 -0400
X-MC-Unique: KdywSIv7MtWkzjLf9Kj5ng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 988C9189F762;
        Tue, 17 Mar 2020 18:10:24 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5649390808;
        Tue, 17 Mar 2020 18:10:23 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] KEYS: Don't write out to userspace while holding
 key semaphore
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Mimi Zohar <zohar@linux.ibm.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        Sumit Garg <sumit.garg@linaro.org>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Eric Biggers <ebiggers@google.com>,
        Chris von Recklinghausen <crecklin@redhat.com>
References: <20200315212706.GE224162@linux.intel.com>
 <20200313152102.1707-1-longman@redhat.com>
 <20200313152102.1707-2-longman@redhat.com>
 <20200315192104.GD224162@linux.intel.com>
 <1793253.1584357764@warthog.procyon.org.uk>
 <c1138c83619553d018970a4b2d95f38fccebc99c.camel@linux.intel.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <f07dee42-58e2-1e7a-8644-b55fae6ce8b0@redhat.com>
Date:   Tue, 17 Mar 2020 14:10:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c1138c83619553d018970a4b2d95f38fccebc99c.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 3/16/20 9:53 AM, Jarkko Sakkinen wrote:
> On Mon, 2020-03-16 at 11:22 +0000, David Howells wrote:
>> Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
>>
>>> I guess we cannot sanely define fixes tag for this one, can we?
>> Use:
>>
>> 	Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
>>
>> David
> Longmao, please include this to the next version.
>
> /Jarkko
>
Sure, will do.

Cheers,
Longman

