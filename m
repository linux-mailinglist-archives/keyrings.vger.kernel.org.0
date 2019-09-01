Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C51A48BE
	for <lists+keyrings@lfdr.de>; Sun,  1 Sep 2019 12:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfIAKcC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 1 Sep 2019 06:32:02 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:46680 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbfIAKcB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 1 Sep 2019 06:32:01 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07487;MF=wuyihao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Tb.b80V_1567333916;
Received: from ali-186590dcce93-2.local(mailfrom:wuyihao@linux.alibaba.com fp:SMTPD_---0Tb.b80V_1567333916)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 01 Sep 2019 18:31:57 +0800
Subject: Re: [PATCH 2/2] sign-file: detect existing signature and handle it
To:     Jia Zhang <zhang.jia@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org
References: <fbc3db40-9633-9c20-1ef6-ec8cbb514e01@linux.alibaba.com>
 <33691ba1-6427-4439-5aa9-792ec8b4e7de@linux.alibaba.com>
 <baf82084-81a6-67c2-f2a3-bc6996b58013@linux.alibaba.com>
From:   Yihao Wu <wuyihao@linux.alibaba.com>
Message-ID: <3c825d6a-4dd9-cd77-5af4-9d5af1fef843@linux.alibaba.com>
Date:   Sun, 1 Sep 2019 18:31:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <baf82084-81a6-67c2-f2a3-bc6996b58013@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2019/8/31 11:10 PM, Jia Zhang wrote:
>> +	       n > 0) {
>> +		ERR(BIO_write(bm, buf, n) < 0, "%s", dest_name);
>> +		left -= n;
>> +	}
>> +	BIO_free(bo);
>> +	ERR(BIO_reset(bm) < 0, "%s", raw_module_name);
>>  
> How about not creating a temporary ~raw~ file?
> 
> You already get the unsigned module size, so you can write it to a new
> mem BIO object as following:
> 
> BIO *bm = BIO_new(BIO_s_mem());
> BIO *bf = BIO_new_file(module_name, "rb");
> 
> while (1) {
> 	int sz = BIO_read(bf, buf, sizeof(buf));
> 	if (sz <= 0)
> 		break;
> 
> 	BIO_write(bm, buf, sz);
> }
> 
> BIO_reset(bm);
> 
> and then reuse the original codes.
> 
> Jia
> 
>>  	if (!raw_sig) {
>>  		/* Read the private key and the X.509 cert the PKCS#7 message
>> @@ -415,10 +435,17 @@ int main(int argc, char **argv)


Great ideas! But there's limitation on the read end of BIO_s_mem, that data can't
be read twice. What have been read will be wiped out immediately by BIO.
So I will try some workaround to it.

Thanks,
Yihao
