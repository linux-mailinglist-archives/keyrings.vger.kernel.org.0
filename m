Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C8D441137
	for <lists+keyrings@lfdr.de>; Sun, 31 Oct 2021 23:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhJaWch (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 31 Oct 2021 18:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhJaWch (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 31 Oct 2021 18:32:37 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8FEC061714;
        Sun, 31 Oct 2021 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=BxpB33/UYztYD2qwFHBciLJVh+wt0BVXxu7eaiDjGSU=; b=i/V6FAbnUCJVHJFXOofkn/GgYH
        sjG//+Z1TgwvQjG7Mcj90yJvOVXf+bEhbccx6tYrHEvB7MiiOgR6GZM6DnosZt9Co0rVfvEncbttK
        mGYmZvj/RhoxmBlkjtogKhKlK1OQrXXKyFIcoI1FmVpvS2AKsbMgZzDVwvQHMoMu0wqPDPWSVP/H0
        3UDZZqOZLT/JpWjMJWyJDRrUfKhVZYbtnG0Xm2tB5J80PV/w2R+Dy0djSg9ViOBcfd0TXk0E/8RzO
        Dp/co8dmYmb5vUmcf8sOc+aPcSa0LobrHnXJ9oB6XvCCdcXWIgjjCG9dLKRLHW3IHhfQPIx2gdsZp
        A+RWVq8Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhJL1-00Ep3S-Ly; Sun, 31 Oct 2021 22:30:03 +0000
Subject: Re: [PATCH] certs: system_keyring.c: clean up kernel-doc
To:     Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
References: <20211025003813.5164-1-rdunlap@infradead.org>
 <2ed333a24e8a3009acd4ef406ff8c2c39e95e2cf.camel@linux.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b7936a1c-6f7a-f7ed-6d46-a5affef770a5@infradead.org>
Date:   Sun, 31 Oct 2021 15:30:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ed333a24e8a3009acd4ef406ff8c2c39e95e2cf.camel@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 10/27/21 5:12 PM, Mimi Zohar wrote:
> Hi Randy,
> 
> On Sun, 2021-10-24 at 17:38 -0700, Randy Dunlap wrote:
>> Fix some kernel-doc warnings in system_keyring.c:
>>
>> system_keyring.c:43: warning: expecting prototype for restrict_link_to_builtin_trusted(). Prototype was for restrict_link_by_builtin_trusted() instead
>> system_keyring.c:77: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>   * Allocate a struct key_restriction for the "builtin and secondary trust"
>> system_keyring.c:77: warning: missing initial short description on line:
>>   * Allocate a struct key_restriction for the "builtin and secondary trust"
>>
>> Fix the warnings above and then see & fix these:
>>
>> system_keyring.c:43: warning: No description found for return value of 'restrict_link_by_builtin_trusted'
>> system_keyring.c:62: warning: No description found for return value of 'restrict_link_by_builtin_and_secondary_trusted'
>> system_keyring.c:190: warning: No description found for return value of 'verify_pkcs7_message_sig'
>> system_keyring.c:275: warning: No description found for return value of 'verify_pkcs7_signature'
>>
>> This still leaves non-exported two functions that do not have their
>> functions parameters documented: restrict_link_by_builtin_trusted() and
>> restrict_link_by_builtin_and_secondary_trusted().
>>
>> Use '%' preceding constants in kernel-doc notation.
>>
>> Use "builtin" consistently instead of "built in" or "built-in".
>>
>> Don't use "/**" to begin a comment that is not in kernel-doc format.
>>
>> Document the use of VERIFY_USE_SECONDARY_KEYRING and
>> VERIFY_USE_PLATFORM_KEYRING.
>>
> 
> Thanks, Randy.  Even after these changes there are additional kernel
> doc warnings.   Missing are the parameter definitions for
> restrict_link_by_builtin_trusted() and
> restrict_link_by_builtin_and_secondary_trusted().   The first three are
> exactly the same as for restrict_link_by_signature().  The fourth parm
> needs to be tweaked.

Ah, thanks for the info. I'll update the patch...

-- 
~Randy
