Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA17A48F7
	for <lists+keyrings@lfdr.de>; Sun,  1 Sep 2019 13:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfIALsb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 1 Sep 2019 07:48:31 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:45903 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728353AbfIALsb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 1 Sep 2019 07:48:31 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07486;MF=zhang.jia@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Tb.q7BF_1567338508;
Received: from ali-6c96cfd98fb5.local(mailfrom:zhang.jia@linux.alibaba.com fp:SMTPD_---0Tb.q7BF_1567338508)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 01 Sep 2019 19:48:29 +0800
Subject: Re: [PATCH 2/2 v2] sign-file: detect existing signature and handle it
To:     Yihao Wu <wuyihao@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org
References: <fbc3db40-9633-9c20-1ef6-ec8cbb514e01@linux.alibaba.com>
 <a1a7ed84-972b-2630-952f-d5abe96c1d84@linux.alibaba.com>
From:   Jia Zhang <zhang.jia@linux.alibaba.com>
Message-ID: <0da907fe-ffcd-7616-6413-a6df3c7cdc4d@linux.alibaba.com>
Date:   Sun, 1 Sep 2019 19:48:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <a1a7ed84-972b-2630-952f-d5abe96c1d84@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 2019/9/1 下午6:34, Yihao Wu wrote:
> With -f option, we can delete signature of a module before signing it
> again. Without -f option, sign-file forbids us from signing again. Also,
> when -d/-p is specified, the p7s file will be the signature of just the
> kernel module itself, instead of the module plus the old signature.
> 
> Signed-off-by: Yihao Wu <wuyihao@linux.alibaba.com>
> ---
> v1->v2: Replace the assistant temp ~raw~ file to a BIO_s_mem
> 
>  scripts/sign-file.c | 42 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index bb8fff025a95..bf5d821db36b 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -20,6 +20,7 @@
>  #include <stdbool.h>
>  #include <string.h>
>  #include <getopt.h>
> +#include <unistd.h>
>  #include <err.h>
>  #include <arpa/inet.h>
>  #include <openssl/opensslv.h>
> @@ -282,11 +283,15 @@ int main(int argc, char **argv)
>  	char *hash_algo = NULL;
>  	char *private_key_name = NULL, *raw_sig_name = NULL;
>  	char *x509_name, *module_name, *dest_name;
> +	char *mem_buf;
> +	long mem_buf_len;
>  	bool save_sig = false, replace_orig;
>  	bool sign_only = false;
>  	bool raw_sig = false;
> +	bool overwrite_sig = false;
> +	bool has_sig = false;
>  	unsigned char buf[4096];
> -	unsigned long module_size, sig_size;
> +	unsigned long module_size, sig_size, left;
>  	unsigned int use_signed_attrs;
>  	const EVP_MD *digest_algo;
>  	EVP_PKEY *private_key;
> @@ -297,7 +302,7 @@ int main(int argc, char **argv)
>  	PKCS7 *pkcs7 = NULL;
>  #endif
>  	X509 *x509;
> -	BIO *bd, *bm;
> +	BIO *bd, *bm, *br;
>  	int opt, n;
>  	OpenSSL_add_all_algorithms();
>  	ERR_load_crypto_strings();
> @@ -312,7 +317,7 @@ int main(int argc, char **argv)
>  #endif
>  
>  	do {
> -		opt = getopt(argc, argv, "sdpk");
> +		opt = getopt(argc, argv, "sdpkf");
>  		switch (opt) {
>  		case 's': raw_sig = true; break;
>  		case 'p': save_sig = true; break;
> @@ -320,6 +325,7 @@ int main(int argc, char **argv)
>  #ifndef USE_PKCS7
>  		case 'k': use_keyid = CMS_USE_KEYID; break;
>  #endif
> +		case 'f': overwrite_sig = true; break;
>  		case -1: break;
>  		default: format();
>  		}
> @@ -355,11 +361,35 @@ int main(int argc, char **argv)
>  		exit(3);
>  	}
>  #endif
> +	has_sig = check_module_sig(module_name, &module_size);
>  
>  	/* Open the module file */
>  	bm = BIO_new_file(module_name, "rb");
>  	ERR(!bm, "%s", module_name);
>  
> +	/* Read the raw kernel module into a memory BIO */
> +	br = BIO_new(BIO_s_mem());
> +	ERR(!br, "%s", "BIO_s_mem");
> +
> +	left = module_size;
> +	while ((n = BIO_read(bm, buf, sizeof(buf) < left ?
> +				      sizeof(buf) : left)),
> +	       n > 0) {
> +		ERR(BIO_write(br, buf, n) < 0, "%s", dest_name);
> +		left -= n;
> +	}
> +	BIO_free(bm);
> +	ERR(n < 0, "%s", module_name);
> +
> +	/* Convert raw module BIO to a read-only one.
> +	 * So that we can read it twice from the start
> +	 */
> +	mem_buf_len = BIO_get_mem_data(br, &mem_buf);
> +	bm = BIO_new_mem_buf(mem_buf, mem_buf_len);
> +	ERR(!bm, "%s", module_name);
> +	BIO_set_close(br, BIO_NOCLOSE);
> +	BIO_free(br);
> +
>  	if (!raw_sig) {
>  		/* Read the private key and the X.509 cert the PKCS#7 message
>  		 * will point to.
> @@ -419,6 +449,11 @@ int main(int argc, char **argv)
>  		}
>  	}
>  
> +	if (has_sig && !overwrite_sig) {
> +		fprintf(stderr, "Signature exists, use -f to overwrite.\n");
> +		exit(1);
> +	}
> +

You should move this check earlier, right before opening module file.

Others look good to me.

Jia

>  	/* Open the destination file now so that we can shovel the module data
>  	 * across as we read it.
>  	 */
> @@ -433,7 +468,6 @@ int main(int argc, char **argv)
>  	}
>  	BIO_free(bm);
>  	ERR(n < 0, "%s", module_name);
> -	module_size = BIO_number_written(bd);
>  
>  	if (!raw_sig) {
>  #ifndef USE_PKCS7
> 
