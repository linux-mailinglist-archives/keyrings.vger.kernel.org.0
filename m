Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D13619FC2E
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 19:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgDFR7G (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 13:59:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60308 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726608AbgDFR7F (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 13:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586195944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kMP/HJwuG1cl3KldZk1VTYBaQUCRZ/n/2fyeOu3dz1k=;
        b=ipA2jILlNOHNOVYwI/KJTYu3RTBVZdvO2DEtAkheEcNMoM1CWp+mgUMRFPr6bHPE+Gyg2m
        LEaDAJgtRXaNmC8BsGirp+QdPXhshlFUVo5GJRSTV7Zi8Tnd7EKkRYsaQvCDrBTiT/ZSSi
        RKREGBxkfujJYg+9VzEqLpLKEoVDOlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-IIrjofGuObiNKxRVYGeJNw-1; Mon, 06 Apr 2020 13:58:58 -0400
X-MC-Unique: IIrjofGuObiNKxRVYGeJNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93AD8024E6;
        Mon,  6 Apr 2020 17:58:56 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-20.rdu2.redhat.com [10.10.115.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C763019C4F;
        Mon,  6 Apr 2020 17:58:54 +0000 (UTC)
Subject: Re: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Joe Perches <joe@perches.com>, David Howells <dhowells@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <a291cce3ff1ba978e7ad231a8e1b7d82f6164e86.camel@perches.com>
 <20200406023700.1367-1-longman@redhat.com>
 <319765.1586188840@warthog.procyon.org.uk>
 <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <19cbf3b1-2c3f-dd0f-a5c6-69ca3f77dd68@redhat.com>
Date:   Mon, 6 Apr 2020 13:58:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d509771b7e08fff0d18654b746e413e93ed62fe8.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/6/20 12:10 PM, Joe Perches wrote:
> On Mon, 2020-04-06 at 17:00 +0100, David Howells wrote:
>> Joe Perches <joe@perches.com> wrote:
>>
>>>> This patch introduces a new kvfree_sensitive() for freeing those
>>>> sensitive data objects allocated by kvmalloc(). The relevnat places
>>>> where kvfree_sensitive() can be used are modified to use it.
>>> Why isn't this called kvzfree like the existing kzfree?
>> To quote Linus:
>>
>> 	We have a function for clearing sensitive information: it's called
>> 	"memclear_explicit()", and it's about forced (explicit) clearing even
>> 	if the data might look dead afterwards.
>>
>> 	The other problem with that function is the name: "__kvzfree()" is not
>> 	a useful name for this function. We use the "__" format for internal
>> 	low-level helpers, and it generally means that it does *less* than the
>> 	full function. This does more, not less, and "__" is not following any
>> 	sane naming model.
>>
>> 	So the name should probably be something like "kvfree_sensitive()" or
>> 	similar. Or maybe it could go even further, and talk about _why_ it's
>> 	sensitive, and call it "kvfree_cleartext()" or something like that.
>>
>> 	Because the clearing is really not what even matters. It might choose
>> 	other patterns to overwrite things with, but it might do other things
>> 	too, like putting special barriers for data leakage (or flags to tell
>> 	return-to-user-mode to do so).
>>
>> 	And yes, kzfree() isn't a good name either, and had that same
>> 	memset(), but at least it doesn't do the dual-underscore mistake.
>>
>> 	Including some kzfree()/crypto people explicitly - I hope we can get
>> 	away from this incorrect and actively wrong pattern of thinking that
>> 	"sensitive data should be memset(), and then we should add a random
>> 	'z' in the name somewhere to 'document' that".
> Thanks.
>
> While I agree with Linus about the __ prefix,
> the z is pretty common and symmetric to all
> the <foo>zalloc uses.
>
> And if _sensitive is actually used, it'd be
> good to do a s/kzfree/kfree_sensitive/ one day
> sooner than later.
>
>
I have actually been thinking about that. I saw a couple of cases in the
crypto code where a memzero_explicit() is followed by kfree(). Those can
be replaced by kfree_sensitive.

Cheers,
Longman

