Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572F631F066
	for <lists+keyrings@lfdr.de>; Thu, 18 Feb 2021 20:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhBRTs0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 18 Feb 2021 14:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbhBRTaE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 18 Feb 2021 14:30:04 -0500
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [IPv6:2001:1600:4:17::8faa])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88640C0613D6
        for <keyrings@vger.kernel.org>; Thu, 18 Feb 2021 11:29:19 -0800 (PST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DhPsP1XX8zMprs5;
        Thu, 18 Feb 2021 20:29:13 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4DhPsM6kqZzlh8TN;
        Thu, 18 Feb 2021 20:29:11 +0100 (CET)
Subject: Re: [PATCH 17/18] certs: Fix blacklist flag type confusion
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>
Cc:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
References: <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk>
 <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
 <2031808.1613665474@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <ca631011-08c2-d44d-cce9-436a6a08405f@digikod.net>
Date:   Thu, 18 Feb 2021 20:30:12 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <2031808.1613665474@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 18/02/2021 17:24, David Howells wrote:
> 
> Hi Mickaël, Jarkko,
> 
> Can I transfer your acks from:
> 
> 	https://lore.kernel.org/lkml/20210121155513.539519-5-mic@digikod.net/
> 
> to here?

No, the current thread contains an old version with an error in the
patch for ima_mok_init(). Please take the last series (fixing this
patch) that I rebased on your next branch:
https://lore.kernel.org/keyrings/20210210120410.471693-1-mic@digikod.net/

Regards,
 Mickaël
