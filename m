Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9DC1A167E
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 22:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgDGUIJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 16:08:09 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54075 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726436AbgDGUII (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 16:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586290087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pN+gkxMesJKsy+L8oStv/TkSI0ntYQt3xD3UKdBvVD0=;
        b=AzmsIQiTR2h8Z0cEaMB3AGuPdtXiUiwky0A5F7bWKOugWR1cod1b3y1WOnZaVCXd7A+7Vk
        6yrI3gpnG/WRFhPs8+Iu1bRR6X5OAHVAoL6b1rTsHgdrPWdPI8+GD9yOeb+ENLxqhGaQXe
        a+/CNMOXGTiVksn12C/mCuv8PoNQM4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-6pjcTtFVMvC_rgW4P24pzQ-1; Tue, 07 Apr 2020 16:08:05 -0400
X-MC-Unique: 6pjcTtFVMvC_rgW4P24pzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0535107ACC9;
        Tue,  7 Apr 2020 20:08:03 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-180.rdu2.redhat.com [10.10.117.180])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 06F3C385;
        Tue,  7 Apr 2020 20:07:58 +0000 (UTC)
Subject: Re: [PATCH v2] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        David Rientjes <rientjes@google.com>
References: <20200406185827.22249-1-longman@redhat.com>
 <20200406200016.GJ21484@bombadil.infradead.org>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <ba77ea54-69db-2d5c-4811-78b0ac1c45d7@redhat.com>
Date:   Tue, 7 Apr 2020 16:07:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200406200016.GJ21484@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/6/20 4:00 PM, Matthew Wilcox wrote:
> On Mon, Apr 06, 2020 at 02:58:27PM -0400, Waiman Long wrote:
>> +/**
>> + * kvfree_sensitive - free a data object containing sensitive information
>> + * @addr - address of the data object to be freed
>> + * @len  - length of the data object
> Did you try building this with W=1?  I believe this is incorrect kerneldoc.
> It should be @addr: and @len:
>
> Also, it reads better in the htmldocs if you capitalise the first letter
> of each sentence and finish with a full stop.
>
You are right. I use the wrong delimiter here. I just send out a v3
patch to fix that. Thanks for noticing it.


>> @@ -914,7 +911,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>>  		 */
>>  		if (ret > key_data_len) {
>>  			if (unlikely(key_data))
>> -				__kvzfree(key_data, key_data_len);
>> +				kvfree_sensitive(key_data, key_data_len);
> I'd drop the test of key_data here.
>
I would like to keep the unlikely tag here to emphaize the fact that
this path should not be taken. I have comments up a few lines to talk
about it, though it didn't show up in the diff.

Cheers,
Longman

