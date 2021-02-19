Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04EC31F6CB
	for <lists+keyrings@lfdr.de>; Fri, 19 Feb 2021 10:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBSJuU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Feb 2021 04:50:20 -0500
Received: from smtp-bc08.mail.infomaniak.ch ([45.157.188.8]:35389 "EHLO
        smtp-bc08.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230172AbhBSJuO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 19 Feb 2021 04:50:14 -0500
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Dhmxv3GCqzMq8xf;
        Fri, 19 Feb 2021 10:49:23 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Dhmxt6plYzlh8Tf;
        Fri, 19 Feb 2021 10:49:22 +0100 (CET)
Subject: Re: [PATCH 17/18] certs: Fix blacklist flag type confusion
To:     David Howells <dhowells@redhat.com>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ca631011-08c2-d44d-cce9-436a6a08405f@digikod.net>
 <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk>
 <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
 <2031808.1613665474@warthog.procyon.org.uk>
 <2152657.1613727952@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <5c158c89-e7da-6ac4-9479-3c00f9e8b912@digikod.net>
Date:   Fri, 19 Feb 2021 10:50:26 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <2152657.1613727952@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 19/02/2021 10:45, David Howells wrote:
> 
> Mickaël Salaün <mic@digikod.net> wrote:
> 
>> No, the current thread contains an old version with an error in the
>> patch for ima_mok_init(). Please take the last series (fixing this
>> patch) that I rebased on your next branch:
>> https://lore.kernel.org/keyrings/20210210120410.471693-1-mic@digikod.net/
> 
> Are you referring to the comma rather than a bar here?

Yes, it is correct now, I just replied to the previous email. :)

> 
>  				KEY_ALLOC_NOT_IN_QUOTA,
> +				KEY_ALLOC_SET_KEEP,
> 
> I fixed that in my branch:
> 
> -                               KEY_ALLOC_NOT_IN_QUOTA,
> +                               KEY_ALLOC_NOT_IN_QUOTA |
> +                               KEY_ALLOC_SET_KEEP,
> 
> I'll repost the series.

No need for that, I checked your commits, they're good:
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=keys-misc&id=508f44ffefbf879fbb82fdbc8bf1e6023b85158a

> 
> David
> 
