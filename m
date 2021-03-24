Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798273474B0
	for <lists+keyrings@lfdr.de>; Wed, 24 Mar 2021 10:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbhCXJbV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 24 Mar 2021 05:31:21 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:39240 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234914AbhCXJbR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 24 Mar 2021 05:31:17 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0UT9xWcp_1616578271;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0UT9xWcp_1616578271)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Mar 2021 17:31:12 +0800
Subject: Re: [PATCH] init/Kconfig: Support sign module with SM3 hash algorithm
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>, KP Singh <kpsingh@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vlastimil Babka <vbabka@suse.cz>, keyrings@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20210323083528.25678-1-tianjia.zhang@linux.alibaba.com>
 <CAMj1kXE5x82SZUvo9=hjjE=Z9QrzggzfvBHbjaaGExRfQ8PDxw@mail.gmail.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <5777cfde-dbfd-bc25-3936-2e964b8e85be@linux.alibaba.com>
Date:   Wed, 24 Mar 2021 17:31:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXE5x82SZUvo9=hjjE=Z9QrzggzfvBHbjaaGExRfQ8PDxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

On 3/24/21 6:14 AM, Ard Biesheuvel wrote:
> On Tue, 23 Mar 2021 at 09:36, Tianjia Zhang
> <tianjia.zhang@linux.alibaba.com> wrote:
>>
>> The kernel module signature supports the option to use the SM3
>> secure hash (OSCCA GM/T 0004-2012 SM3).
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> 
> A secure hash is not the same as a signature. Looking at the patch,
> the asymmetric algorithm that is used to sign the SM3 digest is SM2,
> is that correct? How does one create such signed modules?
> 
> In any case, please provide more context in the commit log on how this
> is intended to be used.
> 
> 

Sorry for the trouble you have caused. You are right. SM2 and SM3 always 
appear in pairs. The former is used for signatures and the latter is 
used for hashing algorithms. I will add this information in the next 
version. It seems This is more appropriate to split into two patches.

Best regards,
Tianjia
