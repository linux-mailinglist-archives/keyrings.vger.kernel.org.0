Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF0FA44F4
	for <lists+keyrings@lfdr.de>; Sat, 31 Aug 2019 17:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfHaPKe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 31 Aug 2019 11:10:34 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:51994 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727657AbfHaPKe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 31 Aug 2019 11:10:34 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07487;MF=zhang.jia@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0TaxVyC5_1567264225;
Received: from ali-6c96cfd98fb5.local(mailfrom:zhang.jia@linux.alibaba.com fp:SMTPD_---0TaxVyC5_1567264225)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 31 Aug 2019 23:10:25 +0800
Subject: Re: [PATCH 2/2] sign-file: detect existing signature and handle it
To:     Yihao Wu <wuyihao@linux.alibaba.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     keyrings@vger.kernel.org
References: <fbc3db40-9633-9c20-1ef6-ec8cbb514e01@linux.alibaba.com>
 <33691ba1-6427-4439-5aa9-792ec8b4e7de@linux.alibaba.com>
From:   Jia Zhang <zhang.jia@linux.alibaba.com>
Message-ID: <baf82084-81a6-67c2-f2a3-bc6996b58013@linux.alibaba.com>
Date:   Sat, 31 Aug 2019 23:10:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <33691ba1-6427-4439-5aa9-792ec8b4e7de@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 2019/8/31 下午4:24, Yihao Wu wrote:
> With -f option, we can delete signature of a module before signing it
> again. Without -f option, sign-file forbids us from signing again. Also,
> when -d/-p is specified, the p7s file will be the signature of just the
> kernel module itself, instead of the module plus the old signature.
> 
> Signed-off-by: Yihao Wu <wuyihao@linux.alibaba.com>
> ---
>  scripts/sign-file.c | 48 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index 8647a78368d3..b55676960fd2 100644
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
> @@ -281,12 +282,14 @@ int main(int argc, char **argv)
>  	struct module_signature sig_info = { .id_type = PKEY_ID_PKCS7 };
>  	char *hash_algo = NULL;
>  	char *private_key_name = NULL, *raw_sig_name = NULL;
> -	char *x509_name, *module_name, *dest_name;
> +	char *x509_name, *module_name, *dest_name, *raw_module_name;
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
> @@ -297,7 +300,7 @@ int main(int argc, char **argv)
>  	PKCS7 *pkcs7 = NULL;
>  #endif
>  	X509 *x509;
> -	BIO *bd, *bm;
> +	BIO *bd, *bm, *bo;
>  	int opt, n;
>  	OpenSSL_add_all_algorithms();
>  	ERR_load_crypto_strings();
> @@ -312,7 +315,7 @@ int main(int argc, char **argv)
>  #endif
>  
>  	do {
> -		opt = getopt(argc, argv, "sdpk");
> +		opt = getopt(argc, argv, "sdpkf");
>  		switch (opt) {
>  		case 's': raw_sig = true; break;
>  		case 'p': save_sig = true; break;
> @@ -320,6 +323,7 @@ int main(int argc, char **argv)
>  #ifndef USE_PKCS7
>  		case 'k': use_keyid = CMS_USE_KEYID; break;
>  #endif
> +		case 'f': overwrite_sig = true; break;
>  		case -1: break;
>  		default: format();
>  		}
> @@ -355,10 +359,26 @@ int main(int argc, char **argv)
>  		exit(3);
>  	}
>  #endif
> +	has_sig = check_module_sig(module_name, &module_size);
>  
> -	/* Open the module file */
> -	bm = BIO_new_file(module_name, "rb");
> -	ERR(!bm, "%s", module_name);
> +	/* Copy module file to ~raw~ file but leaves signature */
> +	ERR(asprintf(&raw_module_name, "%s.~raw~", module_name) < 0,
> +		"asprintf");
> +	bm = BIO_new_file(raw_module_name, "w+b");
> +	ERR(!bm, "%s", raw_module_name);
> +
> +	bo = BIO_new_file(module_name, "rb");
> +	ERR(!bo, "%s", module_name);
> +
> +	left = module_size;
> +	while ((n = BIO_read(bo, buf, sizeof(buf) < left ?
> +				      sizeof(buf) : left)),
> +	       n > 0) {
> +		ERR(BIO_write(bm, buf, n) < 0, "%s", dest_name);
> +		left -= n;
> +	}
> +	BIO_free(bo);
> +	ERR(BIO_reset(bm) < 0, "%s", raw_module_name);
>  

How about not creating a temporary ~raw~ file?

You already get the unsigned module size, so you can write it to a new
mem BIO object as following:

BIO *bm = BIO_new(BIO_s_mem());
BIO *bf = BIO_new_file(module_name, "rb");

while (1) {
	int sz = BIO_read(bf, buf, sizeof(buf));
	if (sz <= 0)
		break;

	BIO_write(bm, buf, sz);
}

BIO_reset(bm);

and then reuse the original codes.

Jia

>  	if (!raw_sig) {
>  		/* Read the private key and the X.509 cert the PKCS#7 message
> @@ -415,10 +435,17 @@ int main(int argc, char **argv)
>  
>  		if (sign_only) {
>  			BIO_free(bm);
> +			ERR(unlink(raw_module_name), "%s", raw_module_name);
>  			return 0;
>  		}
>  	}
>  
> +	if (has_sig && !overwrite_sig) {
> +		fprintf(stderr, "Signature exists, use -f to overwrite.\n");
> +		ERR(unlink(raw_module_name), "%s", raw_module_name);
> +		exit(1);
> +	}
> +
>  	/* Open the destination file now so that we can shovel the module data
>  	 * across as we read it.
>  	 */
> @@ -426,14 +453,13 @@ int main(int argc, char **argv)
>  	ERR(!bd, "%s", dest_name);
>  
>  	/* Append the marker and the PKCS#7 message to the destination file */
> -	ERR(BIO_reset(bm) < 0, "%s", module_name);
> +	ERR(BIO_reset(bm) < 0, "%s", raw_module_name);
>  	while ((n = BIO_read(bm, buf, sizeof(buf))),
>  	       n > 0) {
>  		ERR(BIO_write(bd, buf, n) < 0, "%s", dest_name);
>  	}
>  	BIO_free(bm);
> -	ERR(n < 0, "%s", module_name);
> -	module_size = BIO_number_written(bd);
> +	ERR(n < 0, "%s", raw_module_name);
>  
>  	if (!raw_sig) {
>  #ifndef USE_PKCS7
> @@ -465,5 +491,7 @@ int main(int argc, char **argv)
>  	if (replace_orig)
>  		ERR(rename(dest_name, module_name) < 0, "%s", dest_name);
>  
> +	ERR(unlink(raw_module_name), "%s", raw_module_name);
> +
>  	return 0;
>  }
> 
