Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA0219EF54
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 04:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgDFCi5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 5 Apr 2020 22:38:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56548 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726444AbgDFCi5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 5 Apr 2020 22:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586140736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wwTsvDmSdQ5Meft4xmbxc1SwPG3Ag9b3jECvcp2g35g=;
        b=i3oCFYfKSRWwsdsCTThXj2MDDuyX/DOjHQ8WzGHCrUxuSkXNN8a2MGtG2901+5ZOdGNfd8
        yVH3MNruhfJANZPTMEpLaczImcA+XyNFMZfV31wmH9q4VjhG5CiQkG6hckEILI8mje8XQ3
        1ocqKWoNVGmtIBAVNml0+VyR/RRXANE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-VIhQvFMwMsy-aY0rC9p_Zg-1; Sun, 05 Apr 2020 22:38:52 -0400
X-MC-Unique: VIhQvFMwMsy-aY0rC9p_Zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF3B885EE7A;
        Mon,  6 Apr 2020 02:38:43 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-57.rdu2.redhat.com [10.10.112.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A4AC99A260;
        Mon,  6 Apr 2020 02:38:42 +0000 (UTC)
Subject: Re: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1437197.1585570598@warthog.procyon.org.uk>
 <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
 <78ff6e5d-9643-8798-09cb-65b1415140be@redhat.com>
 <3567369.1586077430@warthog.procyon.org.uk>
 <CAHk-=wg-6906+D68VHWv_SCvWUSG8R9w=js7kExmTum90Evu4g@mail.gmail.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <7c868f6a-593d-b9aa-9c0b-a2cd9b763f83@redhat.com>
Date:   Sun, 5 Apr 2020 22:38:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg-6906+D68VHWv_SCvWUSG8R9w=js7kExmTum90Evu4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 4/5/20 1:31 PM, Linus Torvalds wrote:
> On Sun, Apr 5, 2020 at 2:04 AM David Howells <dhowells@redhat.com> wrote:
>> Should this be moved into core code, rather than being squirrelled away in
>> security/keys/?
> Yes. I do think that that __kvzfree() function makes sense in general
> (the same way that kzfree does).
>
> I just happen to despise the name, and think that the implementation
> isn't great.
>
> It also probably makes no sense to make it an inline function. It's
> not like that function is done for performance reasons, and it might
> only get worse if we then end up making it cause barriers or something
> for CPU data leakage issues or whatever.
>
>            Linus
>
I have just posted a patch that modify the API as suggested. Please let
me know if further change is needed.

Cheers,
Longman

