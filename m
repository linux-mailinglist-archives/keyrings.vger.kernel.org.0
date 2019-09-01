Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDD2A48B8
	for <lists+keyrings@lfdr.de>; Sun,  1 Sep 2019 12:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfIAKXd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 1 Sep 2019 06:23:33 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:36820 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728390AbfIAKXd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 1 Sep 2019 06:23:33 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=wuyihao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Tb.aLTc_1567333409;
Received: from ali-186590dcce93-2.local(mailfrom:wuyihao@linux.alibaba.com fp:SMTPD_---0Tb.aLTc_1567333409)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 01 Sep 2019 18:23:29 +0800
Subject: Re: [PATCH 1/2] sign-file: introduce check_module_sig
To:     Jia Zhang <zhang.jia@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org
References: <fbc3db40-9633-9c20-1ef6-ec8cbb514e01@linux.alibaba.com>
 <92f6ccea-f36e-61b9-9013-2c037ef24b14@linux.alibaba.com>
 <d02fabb7-057f-430e-4fc1-0f1cf0343334@linux.alibaba.com>
From:   Yihao Wu <wuyihao@linux.alibaba.com>
Message-ID: <3111722c-0950-58a5-d8e9-0f95b46bd15b@linux.alibaba.com>
Date:   Sun, 1 Sep 2019 18:23:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d02fabb7-057f-430e-4fc1-0f1cf0343334@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2019/8/31 10:27 PM, Jia Zhang wrote:
> 
> 
> On 2019/8/31 下午4:22, Yihao Wu wrote:
>> This method checks if there's any existing signature. And it returns the
>> actual module size, which excludes the signature.
>>
>> Signed-off-by: Yihao Wu <wuyihao@linux.alibaba.com>
>> ---
>>  scripts/sign-file.c | 70 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 70 insertions(+)
> 
> I'm assuming your patch is based on the latest upstream.
> 
Yes, it is.

Thanks,
Yihao

>>
>> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
>> index fbd34b8e8f57..8647a78368d3 100644
>> --- a/scripts/sign-file.c
>> +++ b/scripts/sign-file.c
>> @@ -62,9 +62,11 @@ struct module_signature {
>>  	uint32_t	sig_len;	/* Length of signature data */
>>  };
>>  
>> +#define SIGSIZ (sizeof(struct module_signature))
>>  #define PKEY_ID_PKCS7 2
>>  
>>  static char magic_number[] = "~Module signature appended~\n";
>> +#define MAGIC_SIZE (sizeof(magic_number) - 1)
>>  
>>  static __attribute__((noreturn))
>>  void format(void)
>> @@ -132,6 +134,74 @@ static int pem_pw_cb(char *buf, int len, int w, void *v)
>>  	return pwlen;
>>  }
>>  
>> +/*
>> + * Check if there is at least one valid PKCS#7 signature
>> + */
>> +static bool check_module_sig(char *module_name, unsigned long *module_size)
>> +{
>> +	int sig_offset, magic_offset;
>> +	unsigned long file_size, offset;
>> +	uint32_t sig_len;
>> +	char buf[4096];
>> +	uint16_t type;
>> +	BIO *bm;
>> +
>> +	bm = BIO_new_file(module_name, "rb");
>> +	ERR(!bm, "%s", module_name);
>> +
>> +	while (BIO_read(bm, buf, 4096) > 0)
> 
>> +		;
>> +	file_size = *module_size = offset = BIO_number_read(bm);
> 
> Use the combination of BIO_seek() and BIO_tell() to get file size instead.
> 

There might be no elegant way to do this I suppose, since
openssl BIOs doesn't support SEEK_END.
Maybe the best we can do is to use POSIX function lseek.
Or could you help us decide on this, David?

Thanks,
Yihao
>> +
>> +	for (;;) {
>> +		magic_offset = offset - MAGIC_SIZE;
>> +		if (magic_offset < 0)
>> +			break;
>> +
>> +		if (BIO_seek(bm, magic_offset))
>> +			break;
>> +
>> +		if (BIO_read(bm, buf, MAGIC_SIZE) != MAGIC_SIZE)
>> +			break;
>> +
>> +		if (memcmp(buf, magic_number, MAGIC_SIZE))
>> +			break;
>> +
>> +		if (magic_offset <= SIGSIZ)
>> +			break;
>> +
>> +		sig_offset = magic_offset - 4;
>> +		if (BIO_seek(bm, sig_offset))
>> +			break;
>> +
>> +		if (BIO_read(bm, &sig_len, 4) != 4)
> 
> Change all hardcoding "4" to sizeof(sig_len).
> Okay

Thanks,
Yihao
>> +			break;
>> +
>> +		sig_len = ntohl(sig_len);
>> +
>> +		offset -= MAGIC_SIZE + SIGSIZ + sig_len;
>> +		if (offset <= 0)
>> +			break;
>> +
>> +		if (BIO_seek(bm, offset))
>> +			break;
>> +
>> +		if (BIO_read(bm, &type, 2) != 2)
> 
> 
> Change all hardcoding "2" to sizeof(type).
> 
> Jia
> 
Okay

Thanks,
Yihao
>> +			break;
>> +
>> +		/* The structured type must be a sequence. And the length of the
>> +		 * content info must be at the next 2 bytes (0x82 - 0x80 = 0x2)
>> +		 */
>> +		if (type != 0x8230)
>> +			break;
>> +
>> +		*module_size = offset;
>> +	}
>> +
>> +	ERR(BIO_free(bm) < 0, "%s", module_name);
>> +	return *module_size < file_size;
>> +}
>> +
>>  static EVP_PKEY *read_private_key(const char *private_key_name)
>>  {
>>  	EVP_PKEY *private_key;
>>
