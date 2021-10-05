Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6FA422EA8
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 19:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhJERDL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 13:03:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234860AbhJERDI (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 5 Oct 2021 13:03:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 720D361163;
        Tue,  5 Oct 2021 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633453277;
        bh=NSeU9hatA+OgYytZUerd6FhqBr/+f6oCC1iiS3hjtyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tnkAA6c978V63SAO4/YH8gtNjniPFUNdDA7mBHyQ+m0FE0sKGA7DKUGFsHtoWGvFx
         rKwKAC9hT1IKt0mHC9L6Zf1riQrGEZgIDel+o/hrrliGkRuM4XLK9BNY43VCMIpJF6
         /mVCzW8nkKWc4C6QiOJvxQMlT2AhaBM+7zOjlUst8dRZXaM+ux6uovRQ7Y7tq5MtLd
         Vd9EcWRpMfohgZ5qzxvUoIPoAm2vsiWRsIAkGzs3c71LAyN4x76hGmpGJDN4JHQlV/
         dLgT27BM7+Rb1SkVr3y17ybYfcFa8YWuxUtKQJIhJ8Jmw0IYPHcE0b+abU0NzUQ1wM
         iekPxpiPTEl3w==
Date:   Tue, 5 Oct 2021 10:01:16 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, Adam Langley <agl@google.com>
Subject: Re: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile
 out deprecated APIs
Message-ID: <YVyE3Ax1PRtiBwf+@gmail.com>
References: <20211005161833.1522737-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005161833.1522737-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Oct 05, 2021 at 05:18:33PM +0100, Lee Jones wrote:
> OpenSSL's ENGINE API is deprecated in OpenSSL v3.0.
> 
> Use OPENSSL_NO_ENGINE to disallow its use and fall back on the BIO API.
> 
> Cc: David Howells <dhowells@redhat.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: keyrings@vger.kernel.org
> Co-developed-by: Adam Langley <agl@google.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  scripts/sign-file.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index fbd34b8e8f578..fa3fa59db6669 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -135,7 +135,9 @@ static int pem_pw_cb(char *buf, int len, int w, void *v)
>  static EVP_PKEY *read_private_key(const char *private_key_name)
>  {
>  	EVP_PKEY *private_key;
> +	BIO *b;
>  
> +#ifndef OPENSSL_NO_ENGINE
>  	if (!strncmp(private_key_name, "pkcs11:", 7)) {
>  		ENGINE *e;
>  
> @@ -153,17 +155,16 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
>  		private_key = ENGINE_load_private_key(e, private_key_name,
>  						      NULL, NULL);
>  		ERR(!private_key, "%s", private_key_name);
> -	} else {
> -		BIO *b;
> -
> -		b = BIO_new_file(private_key_name, "rb");
> -		ERR(!b, "%s", private_key_name);
> -		private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
> -						      NULL);
> -		ERR(!private_key, "%s", private_key_name);
> -		BIO_free(b);
> +		return private_key;
>  	}
> +#endif
>  
> +	b = BIO_new_file(private_key_name, "rb");
> +	ERR(!b, "%s", private_key_name);
> +	private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
> +					      NULL);
> +	ERR(!private_key, "%s", private_key_name);
> +	BIO_free(b);
>  	return private_key;
>  }

I ran into these same -Wdeprecated-declarations compiler warnings on another
project that uses the ENGINE API to access OpenSSL's support for PKCS#11 tokens.
The conclusion was that in OpenSSL 3.0, the new API for PKCS#11 support isn't
actually ready yet, so we had to keep using the ENGINE API and just add
-Wno-deprecated-declarations to the compiler flags.

Your patch just removes support for PKCS#11 in that case, which seems
undesirable.  (Unless no one is actually using it?)

- Eric
