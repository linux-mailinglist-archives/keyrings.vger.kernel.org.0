Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B792CF029
	for <lists+keyrings@lfdr.de>; Fri,  4 Dec 2020 15:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgLDO7Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Dec 2020 09:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730365AbgLDO7X (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 4 Dec 2020 09:59:23 -0500
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [IPv6:2001:1600:3:17::42ad])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8B2C061A55
        for <keyrings@vger.kernel.org>; Fri,  4 Dec 2020 06:58:10 -0800 (PST)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
        by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4CnbRh4YtTzlhJNx;
        Fri,  4 Dec 2020 15:58:08 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4CnbRf4P6lzlh8Ts;
        Fri,  4 Dec 2020 15:58:06 +0100 (CET)
Subject: Re: [PATCH v1 5/9] PKCS#7: Fix missing include
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
References: <20201120180426.922572-6-mic@digikod.net>
 <20201120180426.922572-1-mic@digikod.net>
 <113849.1607090807@warthog.procyon.org.uk>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <ae14f82d-2145-83aa-f8e6-5a64b117b0f6@digikod.net>
Date:   Fri, 4 Dec 2020 15:58:06 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <113849.1607090807@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 04/12/2020 15:06, David Howells wrote:
> Mickaël Salaün <mic@digikod.net> wrote:
> 
>> +#include <stddef.h>
> 
> Something like linux/types.h is probably a better choice.

Indeed.

> 
> David
> 
