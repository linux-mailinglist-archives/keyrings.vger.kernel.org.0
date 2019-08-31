Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E27A4349
	for <lists+keyrings@lfdr.de>; Sat, 31 Aug 2019 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfHaI1H (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 31 Aug 2019 04:27:07 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:40434 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726360AbfHaI1H (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 31 Aug 2019 04:27:07 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=wuyihao@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0TawAdU5_1567240024;
Received: from ali-186590dcce93-2.local(mailfrom:wuyihao@linux.alibaba.com fp:SMTPD_---0TawAdU5_1567240024)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 31 Aug 2019 16:27:05 +0800
Subject: Re: [PATCH RESEND] KEYS: pass expiry from X.509 cert to key structure
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, Jia Zhang <zhang.jia@linux.alibaba.com>
References: <5292a3bb-f974-e32b-0f1f-0f78a2801f7d@linux.alibaba.com>
 <12206.1567180459@warthog.procyon.org.uk>
From:   Yihao Wu <wuyihao@linux.alibaba.com>
Message-ID: <959cfc7f-515a-de95-c7a1-fa785c06223a@linux.alibaba.com>
Date:   Sat, 31 Aug 2019 16:27:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12206.1567180459@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2019/8/30 11:54 PM, David Howells wrote:
> Yihao Wu <wuyihao@linux.alibaba.com> wrote:
> 
>> +    prep->expiry = cert->valid_to;
> 
> Note that this patch has whitespace breakage, but I can fix that up by hand.
> 
> David
> 

Thanks!

Yihao
