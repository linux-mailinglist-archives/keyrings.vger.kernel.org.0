Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F762A41EF
	for <lists+keyrings@lfdr.de>; Sat, 31 Aug 2019 05:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfHaDUl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 30 Aug 2019 23:20:41 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:47467 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726640AbfHaDUl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 30 Aug 2019 23:20:41 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=zhang.jia@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0TautY9v_1567221634;
Received: from 192.168.78.200(mailfrom:zhang.jia@linux.alibaba.com fp:SMTPD_---0TautY9v_1567221634)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 31 Aug 2019 11:20:35 +0800
Subject: Re: [PATCH RESEND] KEYS: pass expiry from X.509 cert to key structure
To:     David Howells <dhowells@redhat.com>,
        Yihao Wu <wuyihao@linux.alibaba.com>
Cc:     keyrings@vger.kernel.org
References: <5292a3bb-f974-e32b-0f1f-0f78a2801f7d@linux.alibaba.com>
 <9453.1567178718@warthog.procyon.org.uk>
From:   Jia Zhang <zhang.jia@linux.alibaba.com>
Message-ID: <c50f4cdf-a9b3-838e-70a1-17ef7bb12b26@linux.alibaba.com>
Date:   Sat, 31 Aug 2019 11:20:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9453.1567178718@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 2019/8/30 下午11:25, David Howells wrote:
> Yihao Wu <wuyihao@linux.alibaba.com> wrote:
> 
>> Signed-off-by: Yihao Wu <wuyihao@xxxxxxxxxxxxxxxxx>
> 
> xxxxxxxxxxxxxxxxx?  Can I substitute your actual domain name for that?

Yes you can. Yihao just went on vacation.

Thanks,
Jia

> 
> David
> 
