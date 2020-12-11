Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D632D7E35
	for <lists+keyrings@lfdr.de>; Fri, 11 Dec 2020 19:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405860AbgLKSgd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Dec 2020 13:36:33 -0500
Received: from smtp-bc09.mail.infomaniak.ch ([45.157.188.9]:35775 "EHLO
        smtp-bc09.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405885AbgLKSfy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Dec 2020 13:35:54 -0500
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Cszwr3JjdzlhGWC;
        Fri, 11 Dec 2020 19:35:08 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Cszwq4QFBzlh8TC;
        Fri, 11 Dec 2020 19:35:07 +0100 (CET)
Subject: Re: [PATCH v1 2/9] certs: Make blacklist_vet_description() more
 strict
To:     David Howells <dhowells@redhat.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20201120180426.922572-3-mic@digikod.net>
 <20201120180426.922572-1-mic@digikod.net>
 <113978.1607090965@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <4362ac88-7514-27d2-f937-1cd405bd2e1a@digikod.net>
Date:   Fri, 11 Dec 2020 19:35:06 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <113978.1607090965@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 04/12/2020 15:09, David Howells wrote:
> Mickaël Salaün <mic@digikod.net> wrote:
> 
>> +	if (*desc)
>> +		/* The hash is greater than MAX_HASH_LEN. */
>> +		return -EINVAL;
> 
> -ENOPKG might be better.  It's not that the string is invalid, it's just that
> it's unsupported at the moment.

Indeed, I'll use that.

> 
> David
> 
