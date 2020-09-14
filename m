Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D087268570
	for <lists+keyrings@lfdr.de>; Mon, 14 Sep 2020 09:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgINHEr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Sep 2020 03:04:47 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:39025 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726042AbgINHEp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Sep 2020 03:04:45 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0U8qdePo_1600067075;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U8qdePo_1600067075)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 14 Sep 2020 15:04:37 +0800
Subject: Re: [PATCH v6 0/8] crpyto: introduce OSCCA certificate and SM2
 asymmetric algorithm
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
 <20200911042442.GA5420@gondor.apana.org.au>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <be5f7e28-5645-3923-ceb5-d840e41ad2ed@linux.alibaba.com>
Date:   Mon, 14 Sep 2020 15:04:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200911042442.GA5420@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi，

On 9/11/20 12:24 PM, Herbert Xu wrote:
> On Thu, Sep 03, 2020 at 09:12:34PM +0800, Tianjia Zhang wrote:
>>
>> ---
>> v6 changes:
>>    1. remove mpi_sub_ui function from mpi library.
>>    2. rebase on mainline.
> 
> This series is still missing acks for patches 6-8.  Without them
> it cannot proceed.
> 
> Thanks,
> 

This series has some review suggestions for patches 6-8, but the 
maintainer of asymmetric keys David Howells <dhowells@redhat.com>, I 
can’t get in touch. The email has been sent successfully. Can you help 
ping him ?

Thanks and best,
Tianjia
