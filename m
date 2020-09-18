Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E8426FEA0
	for <lists+keyrings@lfdr.de>; Fri, 18 Sep 2020 15:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgIRNev (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Sep 2020 09:34:51 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:51263 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726768AbgIRNeu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 18 Sep 2020 09:34:50 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0U9K7wHw_1600436072;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U9K7wHw_1600436072)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 18 Sep 2020 21:34:34 +0800
Subject: Re: [PATCH v6 5/8] crypto: testmgr - support test with different
 ciphertext per encryption
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     "David S. Miller" <davem@davemloft.net>,
        David Howells <dhowells@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephan Mueller <smueller@chronox.de>,
        Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Waiman Long <longman@redhat.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Colin Ian King <colin.king@canonical.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-security-module@vger.kernel.org,
        Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
        Jia Zhang <zhang.jia@linux.alibaba.com>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
 <20200903131242.128665-6-tianjia.zhang@linux.alibaba.com>
 <20200918064721.GA9520@gondor.apana.org.au>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <861bc3cc-2119-0325-33ea-828bd7e8544d@linux.alibaba.com>
Date:   Fri, 18 Sep 2020 21:34:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200918064721.GA9520@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 9/18/20 2:47 PM, Herbert Xu wrote:
> On Thu, Sep 03, 2020 at 09:12:39PM +0800, Tianjia Zhang wrote:
>> Some asymmetric algorithms will get different ciphertext after
>> each encryption, such as SM2, and let testmgr support the testing
>> of such algorithms.
>>
>> In struct akcipher_testvec, set c and c_size to be empty, skip
>> the comparison of the ciphertext, and compare the decrypted
>> plaintext with m to achieve the test purpose.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
>> ---
>>   crypto/testmgr.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Is there supposed to be another patch that contains test vectors?
> 
> Thanks,
> 

Yes, I was negligent. It is necessary to provide a test vector and I 
will support it as soon as possible.

Thanks,
Tianjia
